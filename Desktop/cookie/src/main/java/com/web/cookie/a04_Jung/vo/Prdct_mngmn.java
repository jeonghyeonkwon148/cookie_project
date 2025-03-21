package com.web.cookie.a04_Jung.vo;

import java.util.Date;

public class Prdct_mngmn {

	public int getPrd_id_prc() {
		return prd_id_prc;
	}
	public void setPrd_id_prc(int prd_id_prc) {
		this.prd_id_prc = prd_id_prc;
	}
	public int getWorkl_id() {
		return workl_id;
	}
	public void setWorkl_id(int workl_id) {
		this.workl_id = workl_id;
	}
	public Date getPrdct_date() {
		return prdct_date;
	}
	public void setPrdct_date(Date prdct_date) {
		this.prdct_date = prdct_date;
	}
	public String getPrdct_dateStr() {
		return prdct_dateStr;
	}
	public void setPrdct_dateStr(String prdct_dateStr) {
		this.prdct_dateStr = prdct_dateStr;
	}
	public Date getExp_prd() {
		return exp_prd;
	}
	public void setExp_prd(Date exp_prd) {
		this.exp_prd = exp_prd;
	}
	public String getExp_prdStr() {
		return exp_prdStr;
	}
	public void setExp_prdStr(String exp_prdStr) {
		this.exp_prdStr = exp_prdStr;
	}
	public int getDfct_drng() {
		return dfct_drng;
	}
	public void setDfct_drng(int dfct_drng) {
		this.dfct_drng = dfct_drng;
	}
	public int getTtlp_time() {
		return ttlp_time;
	}
	public void setTtlp_time(int ttlp_time) {
		this.ttlp_time = ttlp_time;
	}
	public int getPrd_yld() {
		return prd_yld;
	}
	public void setPrd_yld(int prd_yld) {
		this.prd_yld = prd_yld;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Prdct_mngmn(int prd_id_prc, int workl_id, Date prdct_date, String prdct_dateStr, Date exp_prd,
			String exp_prdStr, int dfct_drng, int ttlp_time, int prd_yld, String pname) {
		super();
		this.prd_id_prc = prd_id_prc;
		this.workl_id = workl_id;
		this.prdct_date = prdct_date;
		this.prdct_dateStr = prdct_dateStr;
		this.exp_prd = exp_prd;
		this.exp_prdStr = exp_prdStr;
		this.dfct_drng = dfct_drng;
		this.ttlp_time = ttlp_time;
		this.prd_yld = prd_yld;
		this.pname = pname;
	}
	public Prdct_mngmn() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int no; // 최종 결과 번호
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	private int prd_id_prc;//제품 생산 아이디
	private int workl_id;//작업 지시 아이디
	private Date prdct_date;//생산완료일
	private String prdct_dateStr;//생산완료일
	private Date exp_prd;//유통기간
	private String exp_prdStr;//유통기간
	private int dfct_drng;//공정중 불량 갯수
	private int ttlp_time;//총 공정 시간(시간)
	private int prd_yld;// 생산 갯수
	private String pname;// 제품명
}
