package com.web.cookie.a01_song.a04_vo;

public class Material {
	private int mnum;
	private String mname;
	private String unit;
	private int mprice;
	public Material() {
		// TODO Auto-generated constructor stub
	}
	public Material(int mnum, String mname, String unit, int mprice) {
		super();
		this.mnum = mnum;
		this.mname = mname;
		this.unit = unit;
		this.mprice = mprice;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getMprice() {
		return mprice;
	}
	public void setMprice(int mprice) {
		this.mprice = mprice;
	}
	
}
