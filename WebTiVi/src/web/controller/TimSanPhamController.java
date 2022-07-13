package web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import web.entity.DanhMucSanPham;
import web.entity.SanPham;
import web.entity.ThuongHieu;

@Transactional
@Controller
public class TimSanPhamController {
	@Autowired
	SessionFactory factory;
	@RequestMapping("/san-pham")
	public String sanpham(ModelMap model)
	{
			Session session = factory.getCurrentSession();
			String hql = "FROM SanPham";
			Query query = session.createQuery(hql);
			List<SanPham> dsSanPham = query.list();
			model.addAttribute("dsSanPham", dsSanPham);
			return "client/sanpham";
		}
	@RequestMapping("/san-pham/{id}")
	public String sanphamDM(ModelMap model,@PathVariable("id") String id)
	{
			Session session = factory.getCurrentSession();
			String hql = "FROM SanPham p WHERE p.loaiSP.maLoaiSP LIKE :id";
			Query query = session.createQuery(hql);
			query.setParameter("id", id);
			List<SanPham> dsSanPham = query.list();
			model.addAttribute("dsSanPham", dsSanPham);
			return "client/sanpham";
		}
	@RequestMapping("/san-pham/sap-xep")
	public String sanphamSX(ModelMap model,HttpServletRequest request)
	{
		
		String maDMx=request.getParameter("maDM");
		String maTHx=request.getParameter("maTH");
		String mucgia=request.getParameter("mucgia");
		String loaisx=request.getParameter("loaisx");
			Session session = factory.getCurrentSession();
			String hql = "FROM SanPham p WHERE ";
			System.out.print("------------------------\n");
			System.out.print(maDMx);
			System.out.print("\n");
			if(!maDMx.isEmpty()) {
				hql=hql+" p.loaiSP.maLoaiSP LIKE :maDMy and";}
			if(!maTHx.isEmpty()) {
				hql=hql+" p.thuongHieu.maTH LIKE :maTHy and";}
			
				hql=hql+" p.gia between "+mucgia;
			if(loaisx.isEmpty()) {
				hql=hql+" and (p.giamGia not like 0 or p.giamGia2 not like 0)";}
			else {
				hql=hql+" ORDER BY "+loaisx;}
			System.out.print(hql);
			Query query = session.createQuery(hql);
			if(!maDMx.isEmpty()) {
			query.setString("maDMy",maDMx);}
			if(!maTHx.isEmpty()) {
			query.setString("maTHy",maTHx);}
			List<SanPham> dsSanPham = query.list();
			model.addAttribute("dsSanPham", dsSanPham);
			return "client/sanpham";
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

}
