package com.web.cookie.a03_yoo.vo;

public class MNBFiles {
	private int idNo;
	private String fname;
	private String finfo;
	public MNBFiles() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MNBFiles(int idNo, String fname, String finfo) {
		super();
		this.idNo = idNo;
		this.fname = fname;
		this.finfo = finfo;
	}

	public int getIdNo() {
		return idNo;
	}
	public void setIdNo(int idNo) {
		this.idNo = idNo;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFinfo() {
		return finfo;
	}
	public void setFinfo(String finfo) {
		this.finfo = finfo;
	}
	

}
