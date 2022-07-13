package web.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "SanPham")
public class SanPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaSP")
	private Integer maSP;
	
	@Column(name = "TenSP")
	@NotNull(message="Không được trống tên!")
	private String tenSP;
	
	@Column(name = "Gia")
	@NotNull(message="Không được trống mục giá !")
	private int gia;
	
	@Column(name = "Anh")
	private String anh;
	
	@Column(name = "MoTa")
	@NotNull(message="Không được trống mục mô tả !")
	private String moTa;
	
	@Column(name = "GiamGia")
	private int giamGia;
	
	@Column(name = "GiamGia2")
	private int giamGia2;
	
	@Column(name = "SoLuong")
	@NotNull(message="Không được trống số lượng!")
	private Integer soLuong;
	
	@Column(name = "NgayTao")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date ngayTao;
	
	@ManyToOne
	@JoinColumn(name = "LoaiSP")
	private DanhMucSanPham loaiSP;
	
	@ManyToOne
	@JoinColumn(name = "ThuongHieu")
	private ThuongHieu thuongHieu;
	
	@OneToMany(mappedBy="sanPhamCT",fetch=FetchType.EAGER)
	private Collection<ChiTietDonHang> ctdh;

	public Integer getMaSP() {
		return maSP;
	}

	public void setMaSP(Integer maSP) {
		this.maSP = maSP;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public int getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(int giamGia) {
		this.giamGia = giamGia;
	}

	public int getGiamGia2() {
		return giamGia2;
	}

	public void setGiamGia2(int giamGia2) {
		this.giamGia2 = giamGia2;
	}

	public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	public Date getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}

	public DanhMucSanPham getLoaiSP() {
		return loaiSP;
	}

	public void setLoaiSP(DanhMucSanPham loaiSP) {
		this.loaiSP = loaiSP;
	}

	public ThuongHieu getThuongHieu() {
		return thuongHieu;
	}

	public void setThuongHieu(ThuongHieu thuongHieu) {
		this.thuongHieu = thuongHieu;
	}

	public Collection<ChiTietDonHang> getCtdh() {
		return ctdh;
	}

	public void setCtdh(Collection<ChiTietDonHang> ctdh) {
		this.ctdh = ctdh;
	}


}
