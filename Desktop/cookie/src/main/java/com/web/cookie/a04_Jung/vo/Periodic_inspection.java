package com.web.cookie.a04_Jung.vo;

import java.util.Date;

public class Periodic_inspection {
	private int prd_ins_id; // 정기검사 아이디
	private int mch_id; //기계아이디
	private String prd_ins_itm; //검사항목
	private String prd_unc; //합/불합여부
	private Date prd_ins_dt; //검사날짜
	private String prd_ins_dtStr; //검사날짜
	private String mch_nm; // 기계명
	public String getMch_nm() {
		return mch_nm;
	}
	public void setMch_nm(String mch_nm) {
		this.mch_nm = mch_nm;
	}
	public int getPrd_ins_id() {
		return prd_ins_id;
	}
	public void setPrd_ins_id(int prd_ins_id) {
		this.prd_ins_id = prd_ins_id;
	}
	public int getMch_id() {
		return mch_id;
	}
	public void setMch_id(int mch_id) {
		this.mch_id = mch_id;
	}
	public String getPrd_ins_itm() {
		return prd_ins_itm;
	}
	public void setPrd_ins_itm(String prd_ins_itm) {
		this.prd_ins_itm = prd_ins_itm;
	}
	public String getPrd_unc() {
		return prd_unc;
	}
	public void setPrd_unc(String prd_unc) {
		this.prd_unc = prd_unc;
	}
	public Date getPrd_ins_dt() {
		return prd_ins_dt;
	}
	public void setPrd_ins_dt(Date prd_ins_dt) {
		this.prd_ins_dt = prd_ins_dt;
	}
	public String getPrd_ins_dtStr() {
		return prd_ins_dtStr;
	}
	public void setPrd_ins_dtStr(String prd_ins_dtStr) {
		this.prd_ins_dtStr = prd_ins_dtStr;
	}
	public Periodic_inspection(String prd_ins_dtStr) {
		super();
		this.prd_ins_dtStr = prd_ins_dtStr;
	}
	public Periodic_inspection() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
