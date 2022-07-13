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

@Controller
@Transactional
public class SearchController {
	@Autowired
	SessionFactory factory;

	@RequestMapping(value="tim-kiem")
	public String dsTim(ModelMap model,HttpServletRequest request) {
		String search=request.getParameter("search");
		Session session = factory.getCurrentSession();
			String hql = "from SanPham p where p.tenSP like :searchField ";
			
			Query query = session.createQuery(hql);
			query.setString("searchField","%"+search+"%");
			List<SanPham> dsTim = query.list();
			model.addAttribute("dsTim", dsTim);
		return "client/timkiem";
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
}
