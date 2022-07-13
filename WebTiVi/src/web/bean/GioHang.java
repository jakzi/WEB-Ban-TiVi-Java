package web.bean;

import web.entity.SanPham;

public class GioHang {
	private SanPham sanPham;
	private int slSP;
	public SanPham getSanPham() {
		return sanPham;
	}
	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
	public int getSlSP() {
		return slSP;
	}
	public void setSlSP(int slSP) {
		this.slSP = slSP;
	}
	public GioHang() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GioHang(SanPham sanPham, int slSP) {
		super();
		this.sanPham = sanPham;
		this.slSP = slSP;
	}
	
}
