package com.web.cookie.a04_Jung.vo;

public class Prc01 { // 공정관리
	private int prc_id; //공정아이디
	private String prc_nm;//공정명
	private String prc_dtl;// 공정내용
	private int prc_bsln_qntt;// 기준 생산량
	private int mch_id;// 기계아이디
	private int prc_stnd_qntt;// 기준원재료량
	private int mnum;// 원재료 코드
	private int ptime; // 공정 시간
	private String mch_nm; // 기계명
	private String mname; //원재료명
	public int getPrc_id() {
		return prc_id;
	}
	public void setPrc_id(int prc_id) {
		this.prc_id = prc_id;
	}
	public String getPrc_nm() {
		return prc_nm;
	}
	public void setPrc_nm(String prc_nm) {
		this.prc_nm = prc_nm;
	}
	public String getPrc_dtl() {
		return prc_dtl;
	}
	public void setPrc_dtl(String prc_dtl) {
		this.prc_dtl = prc_dtl;
	}
	public int getPrc_bsln_qntt() {
		return prc_bsln_qntt;
	}
	public void setPrc_bsln_qntt(int prc_bsln_qntt) {
		this.prc_bsln_qntt = prc_bsln_qntt;
	}
	public int getMch_id() {
		return mch_id;
	}
	public void setMch_id(int mch_id) {
		this.mch_id = mch_id;
	}
	public int getPrc_stnd_qntt() {
		return prc_stnd_qntt;
	}
	public void setPrc_stnd_qntt(int prc_stnd_qntt) {
		this.prc_stnd_qntt = prc_stnd_qntt;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getPtime() {
		return ptime;
	}
	public void setPtime(int ptime) {
		this.ptime = ptime;
	}
	public String getMch_nm() {
		return mch_nm;
	}
	public void setMch_nm(String mch_nm) {
		this.mch_nm = mch_nm;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public Prc01(int prc_id, String prc_nm, String prc_dtl, int prc_bsln_qntt, int mch_id, int prc_stnd_qntt, int mnum,
			int ptime, String mch_nm, String mname) {
		super();
		this.prc_id = prc_id;
		this.prc_nm = prc_nm;
		this.prc_dtl = prc_dtl;
		this.prc_bsln_qntt = prc_bsln_qntt;
		this.mch_id = mch_id;
		this.prc_stnd_qntt = prc_stnd_qntt;
		this.mnum = mnum;
		this.ptime = ptime;
		this.mch_nm = mch_nm;
		this.mname = mname;
	}
	public Prc01() {
		super();
		// TODO Auto-generated constructor stub
	}
}
