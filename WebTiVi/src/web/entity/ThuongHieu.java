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
@Table(name = "ThuongHieu")
public class ThuongHieu {
	@Id
	@Column(name="MaTH")
	@NotBlank(message="Không được để trống tên!")
	@NotNull(message="Không được để trống tên!")
	private String maTH;
	
	@Column(name="TenTH")
	@NotBlank(message="Không được để trống tên!")
	@NotNull(message="Không được để trống tên!")
	private String tenTH;
	
	@OneToMany(mappedBy="thuongHieu",fetch=FetchType.EAGER)
	private Collection<SanPham> sanPham;

	public String getMaTH() {
		return maTH;
	}

	public void setMaTH(String maTH) {
		this.maTH = maTH;
	}

	public String getTenTH() {
		return tenTH;
	}

	public void setTenTH(String tenTH) {
		this.tenTH = tenTH;
	}

	public Collection<SanPham> getSanPham() {
		return sanPham;
	}

	public void setSanPham(Collection<SanPham> sanPham) {
		this.sanPham = sanPham;
	}

}
