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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.entity.ChiTietDonHang;
import web.entity.DonHang;
import web.entity.TrangThaiDonHang;

@Controller
@Transactional
@RequestMapping("/ad-don-hang")
public class DonHangController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;

	@RequestMapping(method = RequestMethod.GET)
	public String donhang(ModelMap model) {
		dsDonHang(model);
		return "admin/donhang";
	}

	public void dsDonHang(ModelMap model) {
		Session sessionn = factory.getCurrentSession();
		String hql = "SELECT ct.donHangCT.maDH,t.tenTK,t.hoTen,tt.moTaTT,d.diaChiG,d.emailG,d.sdtG,d.ngayDatDon, "
				+ "SUM(ct.gia*ct.soLuong)" + " FROM ChiTietDonHang ct,DonHang d,TaiKhoan t,TrangThaiDonHang tt "
				+ " Where ct.donHangCT.maDH=d.maDH and t.idTK=d.taiKhoan.idTK and d.trangThai.maTT=tt.maTT "
				+ " GROUP BY ct.donHangCT.maDH,t.tenTK,t.hoTen,tt.moTaTT,d.diaChiG,d.emailG,d.sdtG,d.ngayDatDon"
				+ " ORDER by  d.ngayDatDon DESC";
		Query query = sessionn.createQuery(hql);
		List<Object[]> dsCTDonHang = query.list();
		model.addAttribute("dsCTDonHang", dsCTDonHang);
	}

	public DonHang timDHbangID(int maDH) {
		Session session = factory.getCurrentSession();
		String hql = "FROM DonHang p WHERE p.maDH = :maDH ";
		Query query = session.createQuery(hql);
		query.setParameter("maDH", maDH);
		DonHang obj = (DonHang) query.uniqueResult();
		return obj;
	}

	@RequestMapping(value = "chitiet/{maDH}")
	public String ctDonHang(ModelMap model, @PathVariable("maDH") int maDH) {
		model.addAttribute("maDH", maDH);
		model.addAttribute("dsCTDH", dsCTDonHang(maDH));
		return "admin/ctdonhang";
	}

	public List<ChiTietDonHang> dsCTDonHang(int maDH) {

		Session sessionn = factory.getCurrentSession();
		String hql = "FROM ChiTietDonHang d WHERE d.donHangCT.maDH = :maDH";
		Query query = sessionn.createQuery(hql);
		query.setParameter("maDH", maDH);
		return query.list();
	}

	// xoa
	@RequestMapping("xoa/{maDH}")
	public String xoaDH(ModelMap model, @PathVariable("maDH") int maDH) {
		DonHang pp = new DonHang();
		DonHang p = timDHbangID(maDH);
		if (p != null) {
			if(p.getTrangThai().getMaTT()!=0) {
				model.addAttribute("loiXoa", "Không thể xóa đơn hàng chưa hủy");
				dsDonHang(model);
				return "admin/donhang";
			}
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				pp.setMaDH(maDH);
				//Xoá pp với các liên kết trong CTDH
				session.load(pp, maDH);
				session.delete(pp);
				t.commit();
				model.addAttribute("thongbaoXoa", "Đã xóa thành công!");

			} catch (Exception e) {
				// TODO: handle exception
				model.addAttribute("loiXoa", "Xóa thất bại!");
				t.rollback();

			} finally {
				session.close();
			}

		} else {
			model.addAttribute("loiXoa", "Hóa đơn này không tồn tại! :(");
			dsDonHang(model);
			return "admin/donhang";
		}
		dsDonHang(model);
		return "admin/donhang";
	}

	public List<TrangThaiDonHang> dsTrangThai() {

		Session sessionn = factory.getCurrentSession();
		String hql = "FROM TrangThaiDonHang";
		Query query = sessionn.createQuery(hql);
		List<TrangThaiDonHang> dsTrangThai = query.list();
		return dsTrangThai;
	}

	// chinh sua
	@RequestMapping(value = "sua/{maDH}", method = RequestMethod.GET)
	public String suaDH(ModelMap model, @PathVariable("maDH") int maDH) {
		DonHang o = new DonHang();
		o = timDHbangID(maDH);
		model.addAttribute("oid", maDH);
		model.addAttribute("o", o);
		model.addAttribute("donHang", new DonHang());
		model.addAttribute("dsTrangThai", dsTrangThai());
		return "admin/suadonhang";
	}

	@RequestMapping(value = "sua/{maDH}", method = RequestMethod.POST)
	public String suaDH(ModelMap model, @ModelAttribute("donHang") DonHang o, @PathVariable("maDH") int maDH) {


		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			o.setNgayDatDon(timDHbangID(maDH).getNgayDatDon());
			o.setDiaChiG(timDHbangID(maDH).getDiaChiG());
			o.setEmailG(timDHbangID(maDH).getEmailG());
			o.setSdtG(timDHbangID(maDH).getSdtG());
			o.setTaiKhoan(timDHbangID(maDH).getTaiKhoan());
			session.update(o);
			t.commit();
			model.addAttribute("thongbaoSua", "Chỉnh sửa đơn hàng thành công!");

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("loiSua", "Chỉnh sửa đơn hàng thất bại! Vui lòng kiểm tra lại thông tin!");
			dsDonHang(model);
			return "admin/donhang";
		} finally {
			session.close();
		}
		dsDonHang(model);
		return "admin/donhang";
	}
}
