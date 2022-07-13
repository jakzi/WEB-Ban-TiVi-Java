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

import web.entity.DanhMucSanPham;
import web.entity.SanPham;
import web.entity.TaiKhoan;
import web.entity.ThuongHieu;

@Transactional
@Controller
public class TrangChuController {
	TaiKhoan taiKhoan = new TaiKhoan();
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	@RequestMapping("trang-chu")
	public String trangchu(ModelMap model, HttpSession session) {
		Session sessionn = factory.getCurrentSession();
		String hql = "FROM SanPham";
		Query query = sessionn.createQuery(hql);
		List<SanPham> dsSP = query.list();
		model.addAttribute("dsSP", dsSP);
		model.addAttribute("dsSanPham", getdsSP(0, 8));
		model.addAttribute("tongSP", tongSP() / 8);
		banChay(model);
		khuyenMai(model);
		return "client/trangchu";
	}
	@RequestMapping(value = "{page}", method = RequestMethod.GET)
	public String xemDStheoTrang(ModelMap model, HttpSession session, @PathVariable("page") int page) {
		model.addAttribute("dsSanPham", getdsSP((page - 1) * 8, 8));
		model.addAttribute("tongSP", tongSP() / 8);
		banChay(model);
		khuyenMai(model);
		return "client/trangchu";
	}
	//chi tiet san pham
	public SanPham timSPbangID(int maSP) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham p WHERE p.maSP LIKE :maSP ";
		Query query = session.createQuery(hql);
		query.setParameter("maSP", maSP);
		SanPham obj = (SanPham) query.uniqueResult();
		return obj;
	}
	public List<SanPham> timSPtuongtu(int maSP) {
		SanPham p=timSPbangID(maSP);
		
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham p WHERE ((p.loaiSP.maLoaiSP LIKE :maloaisp) or "
				+ "(p.thuongHieu.maTH LIKE :mathuonghieu))"
				+ " and p.maSP NOT LIKE :maSP";
		Query query = session.createQuery(hql);
		query.setString("maloaisp",p.getLoaiSP().getMaLoaiSP());
		query.setString("mathuonghieu",p.getThuongHieu().getMaTH());
		query.setParameter("maSP", maSP);
		query.setFirstResult(0);
		query.setMaxResults(4);
		List<SanPham> dsTT = query.list();
		return dsTT;
	}
	@RequestMapping(value = "chi-tiet/{maSP}")
	public String chitietSP(ModelMap model, @PathVariable("maSP") int maSP) {
		
		model.addAttribute("sanPham", timSPbangID(maSP));
		model.addAttribute("dsSPTT", timSPtuongtu(maSP));
		return "client/chitietsanpham";
	}
	@RequestMapping(value = "404")
	public String trang404() {
		return "client/404";
	}
	@RequestMapping(value = "lien-he")
	public String lienhe() {
		return "client/lienhe";
	}
	@RequestMapping(value = "gioi-thieu")
	public String gioithieu() {
		return "client/gioithieu";
	}
	@RequestMapping(value = "chinh-sach")
	public String chinhsach() {
		return "client/chinhsach";
	}
	// phân trang

	public int tongSP() {
		// TODO Auto-generated method stub
		Session sessionn = factory.getCurrentSession();
		String hql = "SELECT COUNT(p) FROM SanPham p";
		Query query = sessionn.createQuery(hql);
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}

	public List<SanPham> getdsSP(int i, int j) {

		Session sessionn = factory.getCurrentSession();
		String hql = "FROM SanPham";
		Query query = sessionn.createQuery(hql);
		query.setFirstResult(i);
		query.setMaxResults(j);
		List<SanPham> dsSP = query.list();
		return dsSP;
	}
	//Đăng nhập
	@RequestMapping(value = "dang-nhap", method = RequestMethod.GET)
	public String dangnhap(ModelMap model, HttpSession session) {
		taiKhoan = (TaiKhoan) session.getAttribute("taiKhoan");
		if (taiKhoan == null) {
			model.addAttribute("taiKhoan", new TaiKhoan());
			return "client/dangnhap";
		}
		return "redirect:tai-khoan.htm";
	}
	
	@RequestMapping(value = "dang-nhap", method = RequestMethod.POST)
	public String dangnhap(ModelMap model, HttpSession session, @ModelAttribute("taiKhoan") TaiKhoan taiKhoan) {

		Session sessionn = factory.getCurrentSession();
		String hql = "FROM TaiKhoan";
		Query query = sessionn.createQuery(hql);
		List<TaiKhoan> listAcc = query.list();
		if(taiKhoan.getTenTK().equals("") || taiKhoan.getMatKhau().equals("")) {
			model.addAttribute("loiDangNhap", "Không được để trống!");
			return "client/dangnhap";
		}
		for (TaiKhoan ktra : listAcc) {
			if (taiKhoan.getTenTK().equals(ktra.getTenTK()) && taiKhoan.getMatKhau().equals(ktra.getMatKhau())) {
				this.taiKhoan = ktra;
				if (this.taiKhoan.getPhanQuyen().getMaQ().equals("ad")) {
					session.setAttribute("taiKhoan", this.taiKhoan);
					return "redirect:/quan-ly.htm";
				} else {
					session.setAttribute("taiKhoan", this.taiKhoan);
					return "redirect:/trang-chu.htm";
				}
			}
		}
		model.addAttribute("loiDangNhap", "Tài khoản hoặc mật khẩu không đúng!");
		return "client/dangnhap";
	}
	//đăng xuât
	@RequestMapping("dang-xuat")
	public String dangxuat(HttpSession session, HttpServletRequest rq) {
		session = rq.getSession();
		TaiKhoan u = new TaiKhoan();
		u = (TaiKhoan) session.getAttribute("taiKhoan");
		session.removeAttribute("taiKhoan");
		return "redirect:/trang-chu.htm";
	}
	//đăng ký
	@RequestMapping(value = "dang-ky", method = RequestMethod.GET)
	public String dangky(ModelMap model, HttpSession session) {
		taiKhoan = (TaiKhoan) session.getAttribute("taiKhoan");
		if (taiKhoan == null) {
		model.addAttribute("taiKhoan2", new TaiKhoan());
		return "client/dangky";
		}
		return "redirect:tai-khoan.htm";
	}

	@RequestMapping(value = "dang-ky", method = RequestMethod.POST)
	public String dangky(HttpServletRequest req, ModelMap model,
			@Validated @ModelAttribute("taiKhoan2") TaiKhoan taiKhoan2,BindingResult errors) {
		String pass=req.getParameter("repassword");

		Session sessionn = factory.getCurrentSession();
		String hql = "FROM TaiKhoan";
		Query query = sessionn.createQuery(hql);
		List<TaiKhoan> listAcc = query.list();
		
		for (TaiKhoan ktra : listAcc) {
			if (taiKhoan2.getTenTK().equals(ktra.getTenTK())) {
				model.addAttribute("loiThem", "Tài khoản đã tồn tại!");
				return "client/dangky";
			}
		}
		if(!taiKhoan2.getMatKhau().equals(pass))
		{
			model.addAttribute("loiThem", "Mật khẩu không trùng khớp!");
			return "client/dangky";
		}
		if(errors.hasErrors()){
			model.addAttribute("loiThem", "Vui lòng sửa các lỗi sau đây !");
			return "client/dangky";
			}
			else{
			model.addAttribute("thongbaoThem", "Chúc mừng, bạn đã nhập đúng !");
			}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			taiKhoan2.setNgayTaoTK(new Date());
			session.save(taiKhoan2);
			model.addAttribute("thongbaoThem", "Đăng ký thành công.");
			t.commit();

		} catch (Exception e) {
			model.addAttribute("loiThem", "Đăng ký thất bại. Vui lòng kiểm tra lại thông tin!");
			t.rollback();
		} finally {
			session.close();
		}
		model.addAttribute("taiKhoan2", new TaiKhoan());
		return "client/dangnhap";
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
	//danh sách thương hiệu
	@ModelAttribute("dsTH")
	public List<ThuongHieu> getDSTH() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ThuongHieu";
		Query query = session.createQuery(hql);
		List<ThuongHieu> list = query.list();
		return list;
	}
	//
	public void khuyenMai(ModelMap model) {
		// TODO Auto-generated method stub
		Session sessionn = factory.getCurrentSession();
		String hql = "FROM SanPham p WHERE p.giamGia not like 0 or p.giamGia2 not like 0"
				+ "ORDER BY p.giamGia DESC, giamGia2 DESC ";
		Query query = sessionn.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(4);
		List<Object[]> list=query.list();
		model.addAttribute("km", list);
	}
	public void banChay(ModelMap model) {
		// TODO Auto-generated method stub
		Session sessionn = factory.getCurrentSession();
		String hql = "SELECT d.sanPhamCT.maSP,d.sanPhamCT.tenSP,d.sanPhamCT.anh,d.sanPhamCT.soLuong,d.sanPhamCT.gia,d.sanPhamCT.giamGia,d.sanPhamCT.giamGia2, SUM(d.soLuong) "
				+ " FROM ChiTietDonHang d "
				+ " WHERE d.donHangCT.trangThai.maTT !=0 "
				+ " GROUP BY d.sanPhamCT.maSP,d.sanPhamCT.tenSP,d.sanPhamCT.anh,d.sanPhamCT.soLuong,d.sanPhamCT.gia,d.sanPhamCT.giamGia,d.sanPhamCT.giamGia2"
				+ " ORDER BY SUM(d.soLuong) DESC ";
		Query query = sessionn.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(4);
		List<Object[]> list=query.list();
		model.addAttribute("top", list);
	}
}
