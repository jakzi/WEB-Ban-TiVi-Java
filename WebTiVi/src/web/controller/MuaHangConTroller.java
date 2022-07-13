package web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.text.NumberFormat;

import javax.servlet.ServletContext;
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

import web.entity.ChiTietDonHang;
import web.entity.DanhMucSanPham;
import web.entity.DonHang;
import web.entity.SanPham;
import web.entity.TaiKhoan;
import web.entity.TrangThaiDonHang;
import web.bean.GioHang;
import web.bean.Mailer;

@Transactional
@Controller
public class MuaHangConTroller {
	@Autowired
	SessionFactory factory;
	@Autowired
	Mailer mailer;
	@Autowired
	ServletContext application;
	@RequestMapping("/don-hang")
	public String donhang(ModelMap model, HttpSession session) {
		TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("taiKhoan");
		if (taiKhoan == null) {
			model.addAttribute("taiKhoan", new TaiKhoan());
			return "client/dangnhap";
		}
		dsDonHang(session, model);
		return "client/donhang";
	}
	//Danh sách Don hang được lọc theo id của Don
	public void dsDonHang(HttpSession session,ModelMap model)
	{
		dsDonHangTong(model, session);
		Session sessionn = factory.getCurrentSession();
		String hql = "SELECT d.donHangCT.maDH, " + " SUM(d.gia*d.soLuong)," + " SUM(d.soLuong)" + " FROM ChiTietDonHang d "
				+ " GROUP BY d.donHangCT.maDH";
		Query query = sessionn.createQuery(hql);
		List<Object[]> dsCTDH = query.list();
		model.addAttribute("dsCTDH", dsCTDH);
	}
	public void dsDonHangTong(ModelMap model, HttpSession session) {
		TaiKhoan taiKhoan = new TaiKhoan();
		taiKhoan = (TaiKhoan) session.getAttribute("taiKhoan");
		Session sessionn = factory.getCurrentSession();
		String hql = "FROM DonHang o WHERE o.taiKhoan.idTK = :id";
		Query query = sessionn.createQuery(hql);
		query.setParameter("id", taiKhoan.getIdTK());
		List<DonHang> dsDHang = query.list();
		model.addAttribute("dsDHang", dsDHang);
	}
	//
	@RequestMapping("/mua-hang")
	public String muahang(ModelMap model, HttpSession session) {
		TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("taiKhoan");
		if (taiKhoan == null) {
			model.addAttribute("taiKhoan", new TaiKhoan());
			return "client/dangnhap";
		}
		dsDonHang(session, model);
		return "client/dathang";
	}
	@RequestMapping("/thanh-toan")
	public String thanhtoan(ModelMap model, HttpSession session,@ModelAttribute("donHang") DonHang donHang) {
		float price=0;

		TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("taiKhoan");
		if (taiKhoan == null) {
			model.addAttribute("taiKhoan", new TaiKhoan());
			return "client/dangnhap";
		}

		HashMap<Integer, GioHang> spGio = new HashMap<>();
		spGio = (HashMap<Integer, GioHang>) session.getAttribute("cnSpGio");
		if (spGio == null) {
			spGio = new HashMap<>();
			model.addAttribute("loi", "Bạn chưa có món hàng nào trong giỏ hàng!");
			return "client/dathang";
		}
		
		TrangThaiDonHang status = new TrangThaiDonHang();
		status.setMaTT(1);
		donHang.setNgayDatDon(new Date());
		donHang.setTrangThai(status);
		donHang.setTaiKhoan(taiKhoan);
		boolean a = themDonHang(donHang);
		if (a) {
			for (Map.Entry<Integer, GioHang> entry : spGio.entrySet()) {
				ChiTietDonHang detail = new ChiTietDonHang();
				detail.setDonHangCT(donHang);
				detail.setSanPhamCT(entry.getValue().getSanPham());
				int x=entry.getValue().getSanPham().getGia()/100*(100-entry.getValue().getSanPham().getGiamGia()) - entry.getValue().getSanPham().getGiamGia2();
				detail.setGia(x);
				detail.setSoLuong(entry.getValue().getSlSP());
				price=price+detail.getGia();

				if (themCTDH(detail)) {
					capnhatsl(detail);
					spGio = new HashMap<>();
					session.setAttribute("cnSpGio", spGio);
					session.setAttribute("cnGioTong", 0);
					session.setAttribute("cnGioSL", 0);
					
				} else {
					model.addAttribute("loi", "Đặt hàng thất bại!");
					return "client/dathang";
				}
			}
		} else {
			model.addAttribute("loi", "Đặt hàng thất bại!");
			return "client/dathang";

		}
		dsDonHang(session, model);
		
		try {
		    Locale localeVN = new Locale("vi", "VN");
		    NumberFormat VN = NumberFormat.getInstance(localeVN);
		    String str = VN.format(price);
			mailer.send("TrumDienMay", donHang.getEmailG(), "Đặt hàng thành công",		
					"Cảm ơn bạn đã đặt hàng <br>Tổng số tiền bạn phải trả là: "+str+" VND.<br>Món hàng của bạn đang được chuẩn bị. Chúng tôi sẽ liên hệ với bạn sớm nhất!<br><br> Chân thành cảm ơn quý khách.");
		} catch (Exception e) {
			model.addAttribute("msgMail", "Gửi mail thất bại!");
			// TODO: handle exception
		}
		model.addAttribute("thongbao", " Đã đặt hàng thành công. Bên dưới là đơn hàng của bạn.");
		return "client/donhang";
	}
	//cập nhật số lượng hàng tồn khi mua
	public void capnhatsl(ChiTietDonHang detail) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		SanPham sanPham=timSPbangID(detail.getSanPhamCT().getMaSP());
		try {
			sanPham.setSoLuong(sanPham.getSoLuong()-detail.getSoLuong());
			session.update(sanPham);
			t.commit();
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
		} finally {
			session.close();
		}
	}
	public boolean themCTDH(ChiTietDonHang detail) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		boolean a = true;
		try {
			session.save(detail);
			t.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			a = false;
		} finally {
			session.close();
		}
		return a;
	}
	public boolean themDonHang(DonHang donHang) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		boolean a = true;
		try {
			session.save(donHang);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			a = false;
		} finally {
			session.close();
		}
		return a;
	}
	// huy don hang
	public DonHang timDHbangID(int maDH) {
		Session session = factory.getCurrentSession();
		String hql = "FROM DonHang p WHERE p.maDH = :maDH ";
		Query query = session.createQuery(hql);
		query.setParameter("maDH", maDH);
		DonHang obj = (DonHang) query.uniqueResult();
		return obj;
	}
	@RequestMapping("/don-hang/huy/{maDH}")
	public String huyDonHang(ModelMap model,@PathVariable("maDH") int maDH) {
		DonHang donHang=timDHbangID(maDH);
		if(donHang.getTrangThai().getMaTT() == 0) {
			model.addAttribute("loi", "Đơn hàng đã hủy!");
			return "client/donhang";
		}
		if(donHang.getTrangThai().getMaTT() == 2 || donHang.getTrangThai().getMaTT()==3) {
			model.addAttribute("loi", "Không thể hủy!");
			return "client/donhang";
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		TrangThaiDonHang status = new TrangThaiDonHang();
		status.setMaTT(0);
		try {
			donHang.setTrangThai(status);
			session.update(donHang);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		model.addAttribute("thongbao", "Hủy thành công!");
		return "client/donhang";
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
	public SanPham timSPbangID(int maSP) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham p WHERE p.maSP LIKE :maSP";
		Query query = session.createQuery(hql);
		query.setParameter("maSP", maSP);
		SanPham obj = (SanPham) query.uniqueResult();
		return obj;
	}
	//chi tiet don hang
	@RequestMapping(value = "don-hang/chi-tiet/{maDH}")
	public String getProductList(ModelMap model, @PathVariable("maDH") int maDH) {
		model.addAttribute("maDH", maDH);
		model.addAttribute("dsCTDHcn", dsCTDHcn(maDH));
		return "client/chitietDH";
	}
	//Lấy OrderDetail trả về listOrderDetail
	public List<ChiTietDonHang> dsCTDHcn(int maDH) {
		Session sessionn = factory.getCurrentSession();
		String hql = "FROM ChiTietDonHang d WHERE d.donHangCT.maDH = :maDH";
		Query query = sessionn.createQuery(hql);
		query.setParameter("maDH", maDH);
		return query.list();
	}
}
