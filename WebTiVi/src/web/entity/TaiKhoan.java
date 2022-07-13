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
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "TaiKhoan")
public class TaiKhoan {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "IDTaiKhoan")
	private Integer idTK;
	
	@Column(name = "TenTK")
	@NotBlank(message="Không được để trống tên tài khoản!")
	@NotNull(message="Không được để trống tên tài khoản!")
	private String tenTK;
	
	@Column(name = "GioiTinh")
	@NotNull(message="Không được để trống tên giới tính!")
	private Boolean gioiTinh;
	
	@Column(name = "MatKhau")
	@NotBlank(message="Không được để trống mật khẩu!")
	@NotNull(message="Không được để trống mật khẩu!")
	private String matKhau;
	
	@Column(name = "HoTen")
	@NotBlank(message="Không được để trống tên!")
	@NotNull(message="Không được để trống tên!")
	private String hoTen;
	
	@Column(name = "Email")
	@NotBlank(message="Không được để trống email!")
	@NotNull(message="Không được để trống email!")
	@Email(message="Sai định dạng email!")
	private String email;
	
	@Column(name = "SDT")
	@NotBlank(message="Không được để trống số điện thoại!")
	@Pattern(regexp="[0-9]{10,11}", message="Sai định dạng số điện thoại!")
	private String sdt;
	
	@Column(name = "DiaChiMacDinh")
	@NotBlank(message="Không được để trống địa chỉ!")
	private String diaChiMD;
	
	@Column(name = "NgayTaoTK")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date ngayTaoTK;
	
	@OneToMany(mappedBy="taiKhoan",fetch=FetchType.EAGER)
	private Collection<DonHang> donHang;
	
	@ManyToOne
	@JoinColumn(name="QuyenTK")
	private PhanQuyen phanQuyen;

	public Integer getIdTK() {
		return idTK;
	}

	public void setIdTK(Integer idTK) {
		this.idTK = idTK;
	}

	public String getTenTK() {
		return tenTK;
	}

	public void setTenTK(String tenTK) {
		this.tenTK = tenTK;
	}

	public Boolean getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(Boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getDiaChiMD() {
		return diaChiMD;
	}

	public void setDiaChiMD(String diaChiMD) {
		this.diaChiMD = diaChiMD;
	}

	public Collection<DonHang> getDonHang() {
		return donHang;
	}

	public void setDonHang(Collection<DonHang> donHang) {
		this.donHang = donHang;
	}

	public PhanQuyen getPhanQuyen() {
		return phanQuyen;
	}

	public void setPhanQuyen(PhanQuyen phanQuyen) {
		this.phanQuyen = phanQuyen;
	}

	public Date getNgayTaoTK() {
		return ngayTaoTK;
	}

	public void setNgayTaoTK(Date ngayTaoTK) {
		this.ngayTaoTK = ngayTaoTK;
	}

	
}
