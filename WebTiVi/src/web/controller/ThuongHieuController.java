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

import web.entity.ThuongHieu;

@Controller
@Transactional
@RequestMapping("/thuong-hieu")
public class ThuongHieuController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;

	public ThuongHieu timTHbangID(String maTH) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ThuongHieu p WHERE p.maTH LIKE :maTH ";
		Query query = session.createQuery(hql);
		query.setParameter("maTH", maTH);
		ThuongHieu obj = (ThuongHieu) query.uniqueResult();
		return obj;
	}

	@ModelAttribute("dsTH")
	public List<ThuongHieu> getDSTH() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ThuongHieu";
		Query query = session.createQuery(hql);
		List<ThuongHieu> list = query.list();
		return list;
	}

	public void dsTH(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ThuongHieu";
		Query query = session.createQuery(hql);
		List<ThuongHieu> list = query.list();
		model.addAttribute("dsTH", list);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String xemdsTH(ModelMap model) {
		//
		return "admin/thuonghieu";
	}
//thêm
	@RequestMapping(value = "them", method = RequestMethod.GET)
	public String themTH(ModelMap model) {
		model.addAttribute("thuongHieu", new ThuongHieu());
		return "admin/themthuonghieu";
	}

	@RequestMapping(value = "them", method = RequestMethod.POST)
	public String themTH(ModelMap model, 
			@Validated @ModelAttribute("thuongHieu") ThuongHieu thuongHieu,BindingResult errors) {
		
		if(errors.hasErrors()){
			model.addAttribute("loiThem", "Vui lòng sửa các lỗi sau đây !");
			return "admin/themthuonghieu";
			}
			else{
			model.addAttribute("thongbaoThem", "Chúc mừng, bạn đã nhập đúng !");
			}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(thuongHieu);
			t.commit();
			model.addAttribute("thongbaoThem", "Tạo thành công.");
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("loiThem", "Tạo thất bại!");
			t.rollback();
		} finally {
			session.close();
		}
		model.addAttribute("thuongHieu", new ThuongHieu());
		return "admin/themthuonghieu";
	}
	// hàm xóa Loại hàng

	@RequestMapping("xoa/{IdTH}")
	public String xoaDM(ModelMap model, @PathVariable("IdTH") String IdTH) {
		ThuongHieu pp = new ThuongHieu();
		ThuongHieu p = timTHbangID(IdTH);
		if (p != null) {

			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				pp.setMaTH(IdTH);
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
			dsTH(model);
			return "admin/thuonghieu";
		}
		dsTH(model);
		return "admin/thuonghieu";
	}



	// hàm chỉnh sửa
	@RequestMapping(value = "sua/{IdTH}", method = RequestMethod.GET)
	public String editPro(ModelMap model, @PathVariable("IdTH") String IdTH) {

		model.addAttribute("IdTH", IdTH);
		model.addAttribute("thuongHieu", new ThuongHieu());
		return "admin/suathuonghieu";
	}

	@RequestMapping(value = "sua/{IdTH}", method = RequestMethod.POST)
	public String editPro(ModelMap model, @PathVariable("IdTH") String IdTH,
			@ModelAttribute("thuongHieu") ThuongHieu thuongHieu) {
		if(thuongHieu.getTenTH().trim().length() == 0){
			model.addAttribute("loiSua", "Không được để trống !");
			model.addAttribute("IdTH", IdTH);
			model.addAttribute("thuongHieu", new ThuongHieu());
			return "admin/suathuonghieu";
			}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(thuongHieu);
			model.addAttribute("thongbaoSua", "Chỉnh sửa thành công!");
			t.commit();

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("loiSua", "Chỉnh sửa thất bại! Vui lòng kiểm tra lại thông tin!");
		} finally {
			session.close();
		}
		dsTH(model);
		return "admin/thuonghieu";
	}
}
