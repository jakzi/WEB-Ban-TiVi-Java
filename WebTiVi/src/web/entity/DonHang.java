package web.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
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

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "DonHang")
public class DonHang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaDonhang")
	private Integer maDH;
	
	@ManyToOne
	@JoinColumn(name="MaTK")
	private TaiKhoan taiKhoan;
	
	@ManyToOne
	@JoinColumn(name="TrangThai")
	private TrangThaiDonHang trangThai;
	
	@Column(name = "NgayDatDon")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date ngayDatDon;
	
	@Column(name = "EmailGiao")
	private String emailG;
	
	@Column(name = "SDTGiao")
	private String sdtG;
	
	@Column(name = "DiaChiGiao")
	private String diaChiG;
	
	@OneToMany(mappedBy="donHangCT",fetch=FetchType.EAGER,cascade = CascadeType.ALL)
	private Collection<ChiTietDonHang> ctdh;

	public Integer getMaDH() {
		return maDH;
	}

	public void setMaDH(Integer maDH) {
		this.maDH = maDH;
	}

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public TrangThaiDonHang getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(TrangThaiDonHang trangThai) {
		this.trangThai = trangThai;
	}

	public Date getNgayDatDon() {
		return ngayDatDon;
	}

	public void setNgayDatDon(Date ngayDatDon) {
		this.ngayDatDon = ngayDatDon;
	}

	public String getEmailG() {
		return emailG;
	}

	public void setEmailG(String emailG) {
		this.emailG = emailG;
	}

	public String getSdtG() {
		return sdtG;
	}

	public void setSdtG(String sdtG) {
		this.sdtG = sdtG;
	}

	public String getDiaChiG() {
		return diaChiG;
	}

	public void setDiaChiG(String diaChiG) {
		this.diaChiG = diaChiG;
	}

	public Collection<ChiTietDonHang> getCtdh() {
		return ctdh;
	}

	public void setCtdh(Collection<ChiTietDonHang> ctdh) {
		this.ctdh = ctdh;
	}

}
