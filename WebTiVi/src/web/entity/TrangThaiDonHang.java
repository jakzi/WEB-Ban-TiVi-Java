package web.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TrangThaiDonHang")
public class TrangThaiDonHang {
	
	@Id
	@Column(name = "MaTT")
	private Integer maTT;
	
	@Column(name = "MoTaTrangThai")
	private String moTaTT;
	
	@OneToMany(mappedBy="trangThai",fetch=FetchType.EAGER)
	private Collection<DonHang> donHang;

	public Integer getMaTT() {
		return maTT;
	}

	public void setMaTT(Integer maTT) {
		this.maTT = maTT;
	}

	public String getMoTaTT() {
		return moTaTT;
	}

	public void setMoTaTT(String moTaTT) {
		this.moTaTT = moTaTT;
	}

	public Collection<DonHang> getDonHang() {
		return donHang;
	}

	public void setDonHang(Collection<DonHang> donHang) {
		this.donHang = donHang;
	}


}
