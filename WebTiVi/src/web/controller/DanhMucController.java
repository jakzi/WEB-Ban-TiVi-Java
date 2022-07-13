package web.controller;

import java.util.List;

import javax.servlet.ServletContext;
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

@Controller
@Transactional
@RequestMapping("/danh-muc")
public class DanhMucController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;

	public DanhMucSanPham timDMbangID(String maLoaiSP) {
		Session session = factory.getCurrentSession();
		String hql = "FROM DanhMucSanPham p WHERE p.maLoaiSP LIKE :maLoaiSP ";
		Query query = session.createQuery(hql);
		query.setParameter("maLoaiSP", maLoaiSP);
		DanhMucSanPham obj = (DanhMucSanPham) query.uniqueResult();
		return obj;
	}

	@ModelAttribute("dsDM")
	public List<DanhMucSanPham> getDSDM() {
		Session session = factory.getCurrentSession();
		String hql = "FROM DanhMucSanPham";
		Query query = session.createQuery(hql);
		List<DanhMucSanPham> list = query.list();
		return list;
	}

	public void dsDM(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM DanhMucSanPham";
		Query query = session.createQuery(hql);
		List<DanhMucSanPham> list = query.list();
		model.addAttribute("dsDM", list);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String xemdsDM(ModelMap model) {
		//
		return "admin/danhmuc";
	}
//thêm
	@RequestMapping(value = "them", method = RequestMethod.GET)
	public String themDM(ModelMap model) {
		model.addAttribute("danhMuc", new DanhMucSanPham());
		return "admin/themdanhmuc";
	}

	@RequestMapping(value = "them", method = RequestMethod.POST)
	public String themDM(ModelMap model, 
			@Validated @ModelAttribute("danhMuc") DanhMucSanPham danhMuc,BindingResult errors) {
		
		if(errors.hasErrors()){
			model.addAttribute("loiThem", "Vui lòng sửa các lỗi sau đây !");
			return "admin/themdanhmuc";
			}
			else{
			model.addAttribute("thongbaoThem", "Chúc mừng, bạn đã nhập đúng !");
			}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(danhMuc);
			t.commit();
			model.addAttribute("thongbaoThem", "Tạo thành công.");
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("loiThem", "Tạo thất bại!");
			t.rollback();
		} finally {
			session.close();
		}
		model.addAttribute("danhMuc", new DanhMucSanPham());
		return "admin/themdanhmuc";
	}
	// hàm xóa Loại hàng

	@RequestMapping("xoa/{IdDM}")
	public String xoaDM(ModelMap model, @PathVariable("IdDM") String IdDM) {
		DanhMucSanPham pp = new DanhMucSanPham();
		DanhMucSanPham p = timDMbangID(IdDM);
		if (p != null) {

			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				pp.setMaLoaiSP(IdDM);
				session.delete(pp);
				model.addAttribute("thongbaoXoa", "Đã xóa thành công!");
				t.commit();

			} catch (Exception e) {
				// TODO: handle exception
				model.addAttribute("loiXoa", "Xóa thất bại!");
				t.rollback();

			} finally {
				session.close();
			}

		} else {
			model.addAttribute("loiXoa", "Loại hàng này không tồn tại! :(");
			dsDM(model);
			return "admin/danhmuc";
		}
		dsDM(model);
		return "admin/danhmuc";
	}



	// hàm chỉnh sửa
	@RequestMapping(value = "sua/{IdDM}", method = RequestMethod.GET)
	public String suaDM(ModelMap model, @PathVariable("IdDM") String IdDM) {

		model.addAttribute("IdDM", IdDM);
		model.addAttribute("danhMuc", new DanhMucSanPham());
		return "admin/suadanhmuc";
	}

	@RequestMapping(value = "sua/{IdDM}", method = RequestMethod.POST)
	public String suaDM(ModelMap model, @PathVariable("IdDM") String IdDM,
			@ModelAttribute("danhMuc") DanhMucSanPham danhMuc) {
		if(danhMuc.getTenLoaiSP().trim().length() == 0){
			model.addAttribute("loiSua", "Không được để trống !");
			model.addAttribute("IdDM", IdDM);
			model.addAttribute("danhMuc", new DanhMucSanPham());
			return "admin/suadanhmuc";
			}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(danhMuc);
			model.addAttribute("thongbaoSua", "Chỉnh sửa thành công!");
			t.commit();

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("loiSua", "Chỉnh sửa thất bại! Vui lòng kiểm tra lại thông tin!");
		} finally {
			session.close();
		}
		dsDM(model);
		return "admin/danhmuc";
	}
}
