package com.web.cookie.a04_Jung.vo;

import java.util.Date;

public class Machine_management {
	
	public int getMch_id() {
		return mch_id;
	}
	public void setMch_id(int mch_id) {
		this.mch_id = mch_id;
	}
	public String getMch_nm() {
		return mch_nm;
	}
	public void setMch_nm(String mch_nm) {
		this.mch_nm = mch_nm;
	}
	public Date getMchn_date() {
		return mchn_date;
	}
	public void setMchn_date(Date mchn_date) {
		this.mchn_date = mchn_date;
	}
	public String getMchn_dateStr() {
		return mchn_dateStr;
	}
	public void setMchn_dateStr(String mchn_dateStr) {
		this.mchn_dateStr = mchn_dateStr;
	}
	public Date getMchn_mntn() {
		return mchn_mntn;
	}
	public void setMchn_mntn(Date mchn_mntn) {
		this.mchn_mntn = mchn_mntn;
	}
	public String getMchn_mntnStr() {
		return mchn_mntnStr;
	}
	public void setMchn_mntnStr(String mchn_mntnStr) {
		this.mchn_mntnStr = mchn_mntnStr;
	}
	public int getMchn_usg_prd() {
		return mchn_usg_prd;
	}
	public void setMchn_usg_prd(int mchn_usg_prd) {
		this.mchn_usg_prd = mchn_usg_prd;
	}
	public int getMchn_nmb_mlf() {
		return mchn_nmb_mlf;
	}
	public void setMchn_nmb_mlf(int mchn_nmb_mlf) {
		this.mchn_nmb_mlf = mchn_nmb_mlf;
	}
	public String getMchn_cndt() {
		return mchn_cndt;
	}
	public void setMchn_cndt(String mchn_cndt) {
		this.mchn_cndt = mchn_cndt;
	}
	public Machine_management(int mch_id, String mch_nm, Date mchn_date, String mchn_dateStr, Date mchn_mntn,
			String mchn_mntnStr, int mchn_usg_prd, int mchn_nmb_mlf, String mchn_cndt) {
		super();
		this.mch_id = mch_id;
		this.mch_nm = mch_nm;
		this.mchn_date = mchn_date;
		this.mchn_dateStr = mchn_dateStr;
		this.mchn_mntn = mchn_mntn;
		this.mchn_mntnStr = mchn_mntnStr;
		this.mchn_usg_prd = mchn_usg_prd;
		this.mchn_nmb_mlf = mchn_nmb_mlf;
		this.mchn_cndt = mchn_cndt;
	}
	public Machine_management() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int mch_id;  //기계아이디
	private String mch_nm;  //기계명
	private Date mchn_date;  //기계입고일
	private String mchn_dateStr;  //기계입고일
	private Date mchn_mntn; //기계 최종 보수일
	private String mchn_mntnStr; //기계 최종 보수일
	private int mchn_usg_prd;  //기계 사용기간(달단위)
	private int mchn_nmb_mlf; //오작동 횟수
	private String mchn_cndt;  //기계상태
	
}
