package web.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
@Entity
@Table(name = "DanhMucSanPham")
public class DanhMucSanPham {
	@Id
	@Column(name="MaLoaiSP")
	@NotBlank(message="Không được để trống tên!")
	@NotNull(message="Không được để trống tên!")
	private String maLoaiSP;
	
	@Column(name="TenLoaiSP")
	@NotBlank(message="Không được để trống tên!")
	@NotNull(message="Không được để trống tên!")
	private String tenLoaiSP;
	
	@OneToMany(mappedBy="loaiSP",fetch=FetchType.EAGER)
	private Collection<SanPham> sanPham;

	public String getMaLoaiSP() {
		return maLoaiSP;
	}

	public void setMaLoaiSP(String maLoaiSP) {
		this.maLoaiSP = maLoaiSP;
	}

	public String getTenLoaiSP() {
		return tenLoaiSP;
	}

	public void setTenLoaiSP(String tenLoaiSP) {
		this.tenLoaiSP = tenLoaiSP;
	}

	public Collection<SanPham> getSanPham() {
		return sanPham;
	}

	public void setSanPham(Collection<SanPham> sanPham) {
		this.sanPham = sanPham;
	}

	
}
