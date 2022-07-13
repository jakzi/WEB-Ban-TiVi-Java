package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.bean.GioHang;
import web.entity.DanhMucSanPham;
import web.entity.SanPham;


@Transactional
@Controller
public class GioHangController {
	@Autowired
	SessionFactory factory;
	//danh mục sản phẩm
	@ModelAttribute("dsDM")
	public List<DanhMucSanPham> getDSDM() {
		Session session = factory.getCurrentSession();
		String hql = "FROM DanhMucSanPham";
		Query query = session.createQuery(hql);
		List<DanhMucSanPham> list = query.list();
		return list;
	}
	//tim sp
	public SanPham timSPbangID(int maSP) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham p WHERE p.maSP LIKE :maSP";
		Query query = session.createQuery(hql);
		query.setParameter("maSP", maSP);
		SanPham obj = (SanPham) query.uniqueResult();
		return obj;
	}
	
	@RequestMapping(value = "gio-hang")
	public String gio(ModelMap model, HttpSession session, HttpServletRequest rq) {
		HashMap<Integer, GioHang> spGio = new HashMap<>();
		spGio = (HashMap<Integer, GioHang>) session.getAttribute("cnSpGio");
		if (spGio == null) {
			model.addAttribute("msgGio", "Giỏ hàng đang rỗng!");
			spGio = new HashMap<>();
		}
		session.setAttribute("cnSpGio", spGio);
		session.setAttribute("cnGioTong", tongGia(spGio));
		session.setAttribute("cnGioSL", spGio.size());
		return "client/giohang";
	}
	public int tongGia(HashMap<Integer, GioHang> spGio) {
		int count = 0;
		for (Map.Entry<Integer, GioHang> list : spGio.entrySet()) {
			int gia=list.getValue().getSanPham().getGia();
			int gg=list.getValue().getSanPham().getGiamGia();
			int gg2=list.getValue().getSanPham().getGiamGia2();
			int sl=list.getValue().getSlSP();
			count += gia/100*(100-gg)-gg2;
		}
		System.out.print("Tong gia :");
		System.out.print(count);
		return count;
	}
	//them
	@RequestMapping(value = "gio-hang/them/{maSP}", method = RequestMethod.GET)
	public String xemThem(ModelMap model, HttpSession session, @PathVariable("maSP") int maSP) {
		HashMap<Integer, GioHang> spGio = new HashMap<>();
		spGio = (HashMap<Integer, GioHang>) session.getAttribute("cnSpGio");
		if (spGio == null) {
			spGio = new HashMap<>();
		}

		SanPham sanPham = timSPbangID(maSP);
		if (sanPham != null) {
			if (spGio.containsKey(maSP)) {
				GioHang item = spGio.get(maSP);
				item.setSanPham(sanPham);
				item.setSlSP(item.getSlSP() + 1);
				spGio.put(maSP, item);
			} else {
				GioHang item = new GioHang();
				item.setSanPham(sanPham);
				item.setSlSP(1);
				spGio.put(maSP, item);
			}
		}
		session.setAttribute("cnSpGio", spGio);
		session.setAttribute("cnGioTong", tongGia(spGio));
		session.setAttribute("cnGioSL", spGio.size());
		return "client/giohang";
	}
	@RequestMapping(value = "gio-hang/themsp/{maSP}", method = RequestMethod.POST)
	public String xemThemSP(ModelMap model, HttpSession session, @PathVariable("maSP") int maSP,
			@RequestParam(value = "slsp", defaultValue = "0", required = true) Integer slsp) {
		HashMap<Integer, GioHang> spGio = new HashMap<>();
		spGio = (HashMap<Integer, GioHang>) session.getAttribute("cnSpGio");
		if (spGio == null) {
			spGio = new HashMap<>();
		}
		if (slsp == 0) {
			SanPham sanPham = timSPbangID(maSP);
			if (sanPham != null) {
				if (spGio.containsKey(maSP)) {
					GioHang item = spGio.get(maSP);
					item.setSanPham(sanPham);
					item.setSlSP(item.getSlSP() + slsp);
					spGio.put(maSP, item);
				} else {
					GioHang item = new GioHang();
					item.setSanPham(sanPham);
					item.setSlSP(slsp);
					spGio.put(maSP, item);
				}
			}
		} else {
			SanPham sanPham = timSPbangID(maSP);
			if (sanPham != null) {
				if (spGio.containsKey(maSP)) {
					GioHang item = spGio.get(maSP);
					item.setSanPham(sanPham);
					item.setSlSP(item.getSlSP() + slsp);
					spGio.put(maSP, item);
				} else {
					GioHang item = new GioHang();
					item.setSanPham(sanPham);
					item.setSlSP(slsp);
					spGio.put(maSP, item);
				}
			}
		}
		session.setAttribute("cnSpGio", spGio);
		session.setAttribute("cnGioTong", tongGia(spGio));
		session.setAttribute("cnGioSL", spGio.size());
		return "redirect:/gio-hang.htm";
	}
	@RequestMapping(value = "gio-hang/xoa/{maSP}", method = RequestMethod.GET)
	public String xoaGio(ModelMap model, HttpSession session, @PathVariable("maSP") int maSP) {
		HashMap<Integer, GioHang> spGio = (HashMap<Integer, GioHang>) session.getAttribute("cnSpGio");
		if (spGio == null) {
			spGio = new HashMap<>();
		}
		if (spGio.containsKey(maSP)) {
			spGio.remove(maSP);
		}
		session.setAttribute("cnSpGio", spGio);
		session.setAttribute("cnGioTong", tongGia(spGio));
		session.setAttribute("cnGioSL", spGio.size());
		return "redirect:/gio-hang.htm";
	}
}
