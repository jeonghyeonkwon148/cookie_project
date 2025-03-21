package com.web.cookie.a04_Jung.vo;

import java.util.Date;

public class Invn_prdc {
	private int mnum;// 원재료번호
	private String mname; // 원재료명
	private int mtot; // 현재 재고량
	private Date mdate; // 업데이트날짜
	private String mdateStr;
	public Invn_prdc() {
		super();
		// TODO Auto-generated constructor stub
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
	public int getMtot() {
		return mtot;
	}
	public void setMtot(int mtot) {
		this.mtot = mtot;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public String getMdateStr() {
		return mdateStr;
	}
	public void setMdateStr(String mdateStr) {
		this.mdateStr = mdateStr;
	}
	public Invn_prdc(int mnum, String mname, int mtot, Date mdate, String mdateStr) {
		super();
		this.mnum = mnum;
		this.mname = mname;
		this.mtot = mtot;
		this.mdate = mdate;
		this.mdateStr = mdateStr;
	}
}
