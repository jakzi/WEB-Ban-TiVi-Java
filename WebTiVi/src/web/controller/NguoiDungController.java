package web.controller;

import java.util.Date;
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
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.entity.TaiKhoan;


@Controller
@Transactional
@RequestMapping(value = "nguoi-dung")
public class NguoiDungController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	public List<TaiKhoan> getDSTaiKhoan(int i, int j) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoan p ORDER BY p.phanQuyen.maQ,p.ngayTaoTK desc";
		Query query = session.createQuery(hql);
		query.setFirstResult(i);
		query.setMaxResults(j);
		List<TaiKhoan> list = query.list();
		return list;
	}
	@RequestMapping( method = RequestMethod.GET)
	public String dsTK(ModelMap model) {
		model.addAttribute("dsTK", getDSTaiKhoan(0,10));
		return "admin/nguoidung";
	}
	@RequestMapping(value = "/{page}", method = RequestMethod.GET)
	public String dsTK(ModelMap model, HttpSession session, @PathVariable("page") int page) {
		model.addAttribute("dsTK", getDSTaiKhoan((page - 1) * 10, 10));
		return "admin/nguoidung";
	}
	@ModelAttribute("soLuongTK")
	public int tongTK() {
		Session sessionn = factory.getCurrentSession();
		String hql = "SELECT COUNT(p) FROM TaiKhoan p";
		Query query = sessionn.createQuery(hql);
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}
	public TaiKhoan timTKbangID(int IdTK) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoan p WHERE p.idTK LIKE :idTK ";
		Query query = session.createQuery(hql);
		query.setParameter("idTK", IdTK);
		TaiKhoan obj = (TaiKhoan) query.uniqueResult();
		return obj;
	}
	// hàm xóa User
	@RequestMapping("/xoa/{IdTK}")
	public String xoaTK(ModelMap model, @PathVariable("IdTK") int IdTK) {
		TaiKhoan pp = new TaiKhoan();
		TaiKhoan p = timTKbangID(IdTK);
		if (p != null) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				pp.setIdTK(IdTK);
				session.delete(pp);
				model.addAttribute("thongbaoXoa", "Đã xóa thành công!");
				t.commit();

			} catch (Exception e) {
				model.addAttribute("loiXoa", "Xóa thất bại!");
				t.rollback();

			} finally {
				session.close();
			}

		} else {
			model.addAttribute("loiXoa", "Người dùng này không tồn tại! :(");
			model.addAttribute("dsTK", getDSTaiKhoan(0,10));
			return "admin/nguoidung";
		}
		model.addAttribute("dsTK", getDSTaiKhoan(0,10));
		return "admin/nguoidung";
	}
	//hàm thêm user
	@RequestMapping(value = "them", method = RequestMethod.GET)
	public String themTK(ModelMap model) {
		model.addAttribute("taiKhoan2", new TaiKhoan());
		return "admin/themTK";
	}

	@RequestMapping(value = "them", method = RequestMethod.POST)
	public String themTK(HttpServletRequest req, ModelMap model,
			@Validated @ModelAttribute("taiKhoan2") TaiKhoan taiKhoan2,BindingResult errors) {
		String pass=req.getParameter("repassword");

		Session sessionn = factory.getCurrentSession();
		String hql = "FROM TaiKhoan";
		Query query = sessionn.createQuery(hql);
		List<TaiKhoan> listAcc = query.list();
		
		for (TaiKhoan ktra : listAcc) {
			if (taiKhoan2.getTenTK().equals(ktra.getTenTK())) {
				model.addAttribute("loiThem", "Tài khoản đã tồn tại!");
				return "admin/themTK";
			}
		}
		if(!taiKhoan2.getMatKhau().equals(pass))
		{
			model.addAttribute("loiThem", "Mật khẩu không trùng khớp!");
			return "admin/themTK";
		}
		if(errors.hasErrors()){
			model.addAttribute("loiThem", "Vui lòng sửa các lỗi sau đây !");
			return "admin/themTK";
			}
			else{
			model.addAttribute("thongbaoThem", "Chúc mừng, bạn đã nhập đúng !");
			}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			taiKhoan2.setNgayTaoTK(new Date());
			session.save(taiKhoan2);
			model.addAttribute("thongbaoThem", "Tạo thành công.");
			t.commit();

		} catch (Exception e) {
			model.addAttribute("loiThem", "Tạo thất bại. Vui lòng kiểm tra lại thông tin!");
			t.rollback();
		} finally {
			session.close();
		}
		model.addAttribute("taiKhoan2", new TaiKhoan());
		return "admin/themTK";
	}

}
