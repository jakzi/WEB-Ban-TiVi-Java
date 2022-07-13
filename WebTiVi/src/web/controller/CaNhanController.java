package web.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.entity.DanhMucSanPham;
import web.entity.TaiKhoan;
import web.bean.Mailer;

@Transactional
@Controller
public class CaNhanController {
	TaiKhoan taiKhoan = new TaiKhoan();
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	@Autowired
	Mailer mailer;
	@RequestMapping(value ="tai-khoan", method = RequestMethod.GET)
	public String taikhoan(ModelMap model, HttpSession session) {
		taiKhoan = (TaiKhoan) session.getAttribute("taiKhoan");
		return "client/taikhoan";
	}
	//danh mục sản phẩm
	@ModelAttribute("dsDM")
	public List<DanhMucSanPham> getDSDM() {
		Session session = factory.getCurrentSession();
		String hql = "FROM DanhMucSanPham";
		Query query = session.createQuery(hql);
		List<DanhMucSanPham> list = query.list();
		return list;
	}
	public TaiKhoan timTKbangID(int IdTK) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoan p WHERE p.idTK LIKE :idTK ";
		Query query = session.createQuery(hql);
		query.setParameter("idTK", IdTK);
		TaiKhoan obj = (TaiKhoan) query.uniqueResult();
		return obj;
	}
	//doi thong tin
	@RequestMapping(value = "doi-thong-tin/{uId}")
	public String suaTT(ModelMap model, @ModelAttribute("u") TaiKhoan o, @PathVariable("uId") int uId,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		TaiKhoan us = timTKbangID(uId);

		Session sessionn = factory.openSession();
		Transaction t = sessionn.beginTransaction();
		try {
			o.setNgayTaoTK(us.getNgayTaoTK());
			o.setIdTK(uId);
			o.setTenTK(us.getTenTK());
			o.setMatKhau(us.getMatKhau());
			sessionn.update(o);
			t.commit();
			session.setAttribute("taiKhoan", o);
			model.addAttribute("thongbaoSua", "Thông tin của bạn đã được lưu lại!");

		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("loiSua",
					"Chỉnh sửa thất bại! Vui lòng kiểm tra lại thông tin hoặc liên hệ với chúng tôi!");
		} finally {
			sessionn.close();
		}
		return "client/taikhoan";
	}
	// hàm đổi mật khẩu

	@RequestMapping(value = "doi-mat-khau", method = RequestMethod.GET)
	public String doiMK(ModelMap model) {
		return "client/doimatkhau";
	}

	@RequestMapping(value = "doi-mat-khau", method = RequestMethod.POST)
	public String doiMK(HttpServletRequest req, ModelMap model) {

		String passOld = req.getParameter("passOld");
		String pass = req.getParameter("pass");
		String confirm = req.getParameter("confirm");
		System.out.print("\nbat dau\n");
		System.out.print(passOld+"\n");
		System.out.print(pass+"\n");
		System.out.print(confirm+"\n");
		System.out.print("\nket thuc\n");
		HttpSession session = req.getSession();
		TaiKhoan us = (TaiKhoan) session.getAttribute("taiKhoan");
		if (!passOld.equals(us.getMatKhau())) {
			model.addAttribute("loiDoi", "Mật khẩu cũ không đúng!");
			return "client/doimatkhau";
		}
		if (!pass.equals(confirm)) {
			model.addAttribute("loiDoi", "Mật khẩu không trùng khớp!");
			return "client/doimatkhau";
		}
		Session sessionn = factory.openSession();
		Transaction t = sessionn.beginTransaction();
		try {
			us.setMatKhau(pass);
			sessionn.update(us);
			t.commit();
			session.setAttribute("taiKhoan", us);
			model.addAttribute("thongbaoDoi", "Đã đổi mật khẩu thành công!");
			System.out.print("\ndoi Password thanh cong\n");
		} catch (Exception e) {
			t.rollback();
			System.out.print("\ndoi Password thất bại\n");
			model.addAttribute("loiDoi", "Đổi mật khẩu thất bại!");
			TaiKhoan a=(TaiKhoan)session.getAttribute("taiKhoan");
			//xử lý cho trường hợp nhập khoảng trắng vào 2 pass
			a.setMatKhau(passOld);
			session.setAttribute("taiKhoan", a);	
		} finally {
			sessionn.close();
		}
		return "client/doimatkhau";
	}
	@RequestMapping(value = "quenMK", method = RequestMethod.GET)
	public String forgotPassword(ModelMap model) {
		model.addAttribute("us", new TaiKhoan());
		return "client/quenMK";
	}
	public TaiKhoan timTKbangTen(String uname) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoan o WHERE o.tenTK = :id ";
		Query query = session.createQuery(hql);
		query.setParameter("id", uname);
		TaiKhoan obj = (TaiKhoan) query.uniqueResult();
		return obj;

	}
	@RequestMapping(value = "quenMK", method = RequestMethod.POST)
	public String forget(ModelMap model, @ModelAttribute("us") TaiKhoan u) {
		Session sessionn = factory.getCurrentSession();
		String hql = "FROM TaiKhoan";
		Query query = sessionn.createQuery(hql);
		List<TaiKhoan> listAcc = query.list();
		for (TaiKhoan ktra : listAcc) {
			if (u.getTenTK().equals(ktra.getTenTK()) && u.getEmail().equals(ktra.getEmail())) {
				TaiKhoan userP = timTKbangTen(u.getTenTK());
				String kq = userP.getMatKhau();
				try {
					mailer.send("TrumDienMay", userP.getEmail(), "Mật khẩu của bạn",
							"Cảm ơn bạn đã sử dụng dịch vụ <br> Mật khẩu là: "  + kq
									+ " .<br>Chân thành cảm ơn quý khách.");
					System.out.print("Gửi email thanh công!");
					model.addAttribute("thongbao", "Vui lòng xem thư trong email của bạn!");
				} catch (Exception e) {
					model.addAttribute("loi", "Lỗi gửi email thất bại!!");
					System.out.print("gửi email không thành công");
				}
				
				return "client/quenMK";
			}
		}
		model.addAttribute("loi", "Sai thông tin!!");
		return "client/quenMK";
	}
}
