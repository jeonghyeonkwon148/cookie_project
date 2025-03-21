package com.web.cookie.a01_song.a04_vo;

public class Prodt_sal_chart {
	private int num;
	private String sal_month;//상품판매월
	private int original_cookie_tot; //오리지날쿠키 총수익
	private int cocho_cookie_tot;//초코쿠키 총수익
	private int nut_cookie_tot;//견과류쿠키 총수익
	public Prodt_sal_chart() {
		// TODO Auto-generated constructor stub
	}
	public Prodt_sal_chart(int num, String sal_month, int original_cookie_tot, int cocho_cookie_tot,
			int nut_cookie_tot) {
		super();
		this.num = num;
		this.sal_month = sal_month;
		this.original_cookie_tot = original_cookie_tot;
		this.cocho_cookie_tot = cocho_cookie_tot;
		this.nut_cookie_tot = nut_cookie_tot;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSal_month() {
		return sal_month;
	}
	public void setSal_month(String sal_month) {
		this.sal_month = sal_month;
	}
	public int getOriginal_cookie_tot() {
		return original_cookie_tot;
	}
	public void setOriginal_cookie_tot(int original_cookie_tot) {
		this.original_cookie_tot = original_cookie_tot;
	}
	public int getCocho_cookie_tot() {
		return cocho_cookie_tot;
	}
	public void setCocho_cookie_tot(int cocho_cookie_tot) {
		this.cocho_cookie_tot = cocho_cookie_tot;
	}
	public int getNut_cookie_tot() {
		return nut_cookie_tot;
	}
	public void setNut_cookie_tot(int nut_cookie_tot) {
		this.nut_cookie_tot = nut_cookie_tot;
	}
	
	
	
}
