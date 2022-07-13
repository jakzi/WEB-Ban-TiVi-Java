package web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ChiTietDonHang")
public class ChiTietDonHang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private Integer id;
	
	@Column(name = "SoLuong")
	private Integer soLuong;
	
	@Column(name = "Gia")
	private float gia;
	
	@ManyToOne
	@JoinColumn(name = "MaSP")
	private SanPham sanPhamCT;
	
	@ManyToOne
	@JoinColumn(name = "MaDH")
	private DonHang donHangCT;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	public float getGia() {
		return gia;
	}

	public void setGia(float gia) {
		this.gia = gia;
	}

	public SanPham getSanPhamCT() {
		return sanPhamCT;
	}

	public void setSanPhamCT(SanPham sanPhamCT) {
		this.sanPhamCT = sanPhamCT;
	}

	public DonHang getDonHangCT() {
		return donHangCT;
	}

	public void setDonHangCT(DonHang donHangCT) {
		this.donHangCT = donHangCT;
	}

}
