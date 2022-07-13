package web.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name = "PhanQuyen")
public class PhanQuyen {
	@Id
	@Column(name="MaQuyen")
	private String maQ;
	
	@Column(name="MoTaQuyen")
	private String moTaQ;
	
	@OneToMany(mappedBy="phanQuyen",fetch=FetchType.EAGER)
	private Collection<TaiKhoan> taiKhoan;

	public String getMaQ() {
		return maQ;
	}

	public void setMaQ(String maQ) {
		this.maQ = maQ;
	}

	public String getMoTaQ() {
		return moTaQ;
	}

	public void setMoTaQ(String moTaQ) {
		this.moTaQ = moTaQ;
	}

	public Collection<TaiKhoan> getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(Collection<TaiKhoan> taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

}
