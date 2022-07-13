package web.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.entity.DanhMucSanPham;
import web.entity.SanPham;
import web.entity.ThuongHieu;
@Controller
@Transactional
@RequestMapping("ad-san-pham")
public class SanPhamController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	//Lấy danh sách sản phẩm xếp theo mã loại sản phẩm
	public List<SanPham> getDSSanPham() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham p ORDER BY p.loaiSP.maLoaiSP";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		return list;
	}
	@ModelAttribute("tongSP")
	public int tongsoSP() {
		Session sessionn = factory.getCurrentSession();
		String hql = "SELECT COUNT(p) FROM SanPham p";
		Query query = sessionn.createQuery(hql);
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}
	public SanPham timSPbangID(int maSP) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SanPham p WHERE p.maSP LIKE :maSP";
		Query query = session.createQuery(hql);
		query.setParameter("maSP", maSP);
		SanPham obj = (SanPham) query.uniqueResult();
		return obj;
	}
	//Danh sách danh mục để chọn
	@ModelAttribute("dsDM")
	public List<DanhMucSanPham> getDSDM() {
		Session session = factory.getCurrentSession();
		String hql = "FROM DanhMucSanPham";
		Query query = session.createQuery(hql);
		List<DanhMucSanPham> list = query.list();
		return list;
	}
	public List<DanhMucSanPham> dsDM() {

		Session sessionn = factory.getCurrentSession();
		String hql = "FROM DanhMucSanPham";
		Query query = sessionn.createQuery(hql);
		List<DanhMucSanPham> dsDM = query.list();
		return dsDM;
	}
	//Danh sách thương hiệu để chọn
	@ModelAttribute("dsTH")
	public List<ThuongHieu> getDSTH() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ThuongHieu";
		Query query = session.createQuery(hql);
		List<ThuongHieu> list = query.list();
		return list;
	}
	public List<ThuongHieu> dsTH() {

		Session sessionn = factory.getCurrentSession();
		String hql = "FROM ThuongHieu";
		Query query = sessionn.createQuery(hql);
		List<ThuongHieu> dsTH = query.list();
		return dsTH;
	}
	//Vào danh sánh
	@RequestMapping( method = RequestMethod.GET)
	public String dsSP(ModelMap model) {
		model.addAttribute("dsSP", getDSSanPham());
		return "admin/sanpham";
	}

	//thêm
	@RequestMapping(value = "them", method = RequestMethod.GET)
	public String themSP(ModelMap model, HttpSession session) {
		model.addAttribute("sanPham", new SanPham());
		model.addAttribute("dsDM", dsDM());
		model.addAttribute("dsTH", dsTH());
		return "admin/themsanpham";
	}
	public static String doiTenFile(String tenFile){
		String[] arrImg =  tenFile.split("\\.");
		String duoiFileImg = arrImg[arrImg.length - 1];
		String nameFile = "";
		/*lấy tên
		for (int i  = 0;i< (arrImg.length - 1) ; i++) {
			if(i == 0){
				nameFile = arrImg[i];
			}else{
				nameFile += "-"+arrImg[i];
			}
		}*/
		nameFile = System.nanoTime() +"."+duoiFileImg;
		return nameFile;
	}
	@RequestMapping(value = "them", method = RequestMethod.POST)
	public String themSP(ModelMap model,@RequestParam("attachment") MultipartFile photo,
			@ModelAttribute("sanPham") SanPham sanPham,HttpServletRequest request) throws IllegalStateException, IOException {
		sanPham.setNgayTao(new Date());
		String tenFile= doiTenFile(photo.getOriginalFilename());
		try {
			String root=request.getSession().getServletContext().getRealPath("/");
			photo.transferTo(new File(root+"resources/images/sanpham/" + tenFile));
			System.out.print(root+"resources/images/sanpham/" + tenFile);
		}
		catch (Exception ex) {
			model.addAttribute("loiThem", "Không thể lưu ảnh!");
			return "admin/themsanpham";
		}
		Session session1 = factory.openSession();
		Transaction t = session1.beginTransaction();
		try {
			sanPham.setAnh(tenFile);
			session1.save(sanPham);
			t.commit();
			
			model.addAttribute("thongbaoThem", "Tạo thành công.");
			model.addAttribute("sanPham", new SanPham());
			model.addAttribute("dsDM", dsDM());
			model.addAttribute("dsTH", dsTH());
			
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			model.addAttribute("loiThem", "Tạo thất bại, vui lòng điền đầy đủ thông tin");
			
		}finally {
			session1.close();
		}
		return "admin/themsanpham";
	}
	//Xóa
	@RequestMapping("xoa/{IdSP}")
	public String xoaSP(ModelMap model, @PathVariable("IdSP") int IdSP) {
		SanPham pp = new SanPham();
		SanPham p = timSPbangID(IdSP);
		if (p != null) {

			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				pp.setMaSP(IdSP);
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
			model.addAttribute("loiXoa", "Sản phẩm này không tồn tại! :(");
			model.addAttribute("dsSP", getDSSanPham());
			return "admin/sanpham";
		}
		model.addAttribute("dsSP", getDSSanPham());
		return "admin/sanpham";
	}
	// hàm chỉnh sửa
	@RequestMapping(value = "sua/{IdSP}", method = RequestMethod.GET)
	public String suaSP(ModelMap model, @PathVariable("IdSP") String IdSP) {
		SanPham p;
		p = timSPbangID(Integer.parseInt(IdSP));
		model.addAttribute("p", p);
		model.addAttribute("sanPham", new SanPham());
		model.addAttribute("IdSP", IdSP);
		model.addAttribute("dsDM", dsDM());
		model.addAttribute("dsTH", dsTH());
		return "admin/suasanpham";
	}

	@RequestMapping(value = "sua/{IdSP}", method = RequestMethod.POST)
	public String suaSP(ModelMap model,@RequestParam("photo") MultipartFile photo,@PathVariable("IdSP") String IdSP,
			@ModelAttribute("sanPham") SanPham sanPham,HttpServletRequest request) throws IllegalStateException, IOException {
		String tenFile= doiTenFile(photo.getOriginalFilename());
		String root=request.getSession().getServletContext().getRealPath("/");
		try {
			
			photo.transferTo(new File(root+"resources/images/sanpham/" + tenFile));
			System.out.print(root+"resources/images/sanpham/" + tenFile);
		}
		catch (Exception ex) {
			model.addAttribute("loiSua", "Không thể lưu ảnh!");
			return "admin/suasanpham";
		}
		Date ngayTao=timSPbangID(Integer.parseInt(IdSP)).getNgayTao();
		String d=timSPbangID(Integer.parseInt(IdSP)).getAnh();
		Session session1 = factory.openSession();
		Transaction t = session1.beginTransaction();
		try {
			sanPham.setAnh(tenFile);
			sanPham.setNgayTao(ngayTao);
			session1.update(sanPham);
			t.commit();
			if(!sanPham.getAnh().equals(d)) {
				 File file = new File(root+"resources/images/sanpham/" + d);
				 if (file.delete()) {
		                System.out.println(file.getName() + " is deleted!");
		            } else {
		                System.out.println("Delete operation is failed.");
		            }
			}
			model.addAttribute("sanPham", new SanPham());
			model.addAttribute("p", sanPham);
			model.addAttribute("dsDM", dsDM());
			model.addAttribute("dsTH", dsTH());
			model.addAttribute("loibaoSua", "Sửa thành công!");
			
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			model.addAttribute("loiSua", "Sửa thất bại, vui lòng điền đầy đủ thông tin");
			
		}finally {
			session1.close();
		}
		return "admin/suasanpham";
	}
}
