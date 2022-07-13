package web.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
public class QuanLyController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	@RequestMapping("quan-ly")
	public String quanly(ModelMap model) {
		model.addAttribute("tongSP", tongSP());
		model.addAttribute("tongTK", tongKH());
		model.addAttribute("tongDHcxn", tongDHcxn());
		banChay(model);
		return "admin/quanly";
	}
	public int tongSP() {
		// TODO Auto-generated method stub
		Session sessionn = factory.getCurrentSession();
		String hql = "SELECT COUNT(p) FROM SanPham p";
		Query query = sessionn.createQuery(hql);
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}

	public int tongKH() {
		// TODO Auto-generated method stub
		Session sessionn = factory.getCurrentSession();
		String hql = "SELECT COUNT(u) FROM TaiKhoan u WHERE u.phanQuyen.maQ LIKE 'eu' ";
		Query query = sessionn.createQuery(hql);
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}

	public int tongDHcxn() {
		// TODO Auto-generated method stub
		Session sessionn = factory.getCurrentSession();
		String hql = "SELECT COUNT(o) FROM DonHang o WHERE o.trangThai.maTT = 1 ";
		Query query = sessionn.createQuery(hql);
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}
	public void banChay(ModelMap model) {
		// TODO Auto-generated method stub
		Session sessionn = factory.getCurrentSession();
		String hql = "SELECT d.sanPhamCT.tenSP,d.sanPhamCT.loaiSP.tenLoaiSP, SUM(d.soLuong) "
				+ "FROM ChiTietDonHang d "
				+ "WHERE d.donHangCT.trangThai.maTT !=0 "
				+ "GROUP BY d.sanPhamCT.tenSP,d.sanPhamCT.loaiSP.tenLoaiSP "
				+ "ORDER BY SUM(d.soLuong) DESC ";
		Query query = sessionn.createQuery(hql);
		List<Object[]> list=query.list();
		model.addAttribute("top", list);
	}
}
