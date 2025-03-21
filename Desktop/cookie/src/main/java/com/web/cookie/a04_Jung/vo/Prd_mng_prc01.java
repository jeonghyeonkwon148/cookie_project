package com.web.cookie.a04_Jung.vo;

import java.util.Date;

public class Prd_mng_prc01 {
	private int prd_id_prc; //공정별 생산 아이디
	private int prc_id; //공정 아이디
	private Date prdc_date; //생산 날짜
	private String prdc_dateStr;//생산 날짜
	private int prd_yld; //공정 생산량
	private int prd_rwmt_usg; //원재료 사용량
	private int prv_prd_yld; //이전 공정 생산량
	private int prvprd_id_prc; //공정별 이전 생산 아이디
	private Date prv_prd_date;
	private String prv_prd_dateStr;
	public Date getPrv_prd_date() {
		return prv_prd_date;
	}
	public void setPrv_prd_date(Date prv_prd_date) {
		this.prv_prd_date = prv_prd_date;
	}
	public String getPrv_prd_dateStr() {
		return prv_prd_dateStr;
	}
	public void setPrv_prd_dateStr(String prv_prd_dateStr) {
		this.prv_prd_dateStr = prv_prd_dateStr;
	}
	private String prc_nm;//공정명
	private String beprc_nm; // 이전공정명
	public String getBeprc_nm() {
		return beprc_nm;
	}
	public void setBeprc_nm(String beprc_nm) {
		this.beprc_nm = beprc_nm;
	}
	public int getPrd_id_prc() {
		return prd_id_prc;
	}
	public void setPrd_id_prc(int prd_id_prc) {
		this.prd_id_prc = prd_id_prc;
	}
	public int getPrc_id() {
		return prc_id;
	}
	public void setPrc_id(int prc_id) {
		this.prc_id = prc_id;
	}
	public Date getPrdc_date() {
		return prdc_date;
	}
	public void setPrdc_date(Date prdc_date) {
		this.prdc_date = prdc_date;
	}
	public String getPrdc_dateStr() {
		return prdc_dateStr;
	}
	public void setPrdc_dateStr(String prdc_dateStr) {
		this.prdc_dateStr = prdc_dateStr;
	}
	public int getPrd_yld() {
		return prd_yld;
	}
	public void setPrd_yld(int prd_yld) {
		this.prd_yld = prd_yld;
	}
	public int getPrd_rwmt_usg() {
		return prd_rwmt_usg;
	}
	public void setPrd_rwmt_usg(int prd_rwmt_usg) {
		this.prd_rwmt_usg = prd_rwmt_usg;
	}
	public int getPrv_prd_yld() {
		return prv_prd_yld;
	}
	public void setPrv_prd_yld(int prv_prd_yld) {
		this.prv_prd_yld = prv_prd_yld;
	}
	public int getPrvprd_id_prc() {
		return prvprd_id_prc;
	}
	public void setPrvprd_id_prc(int prvprd_id_prc) {
		this.prvprd_id_prc = prvprd_id_prc;
	}
	public String getPrc_nm() {
		return prc_nm;
	}
	public void setPrc_nm(String prc_nm) {
		this.prc_nm = prc_nm;
	}
	public Prd_mng_prc01(int prd_id_prc, int prc_id, Date prdc_date, String prdc_dateStr, int prd_yld, int prd_rwmt_usg,
			int prv_prd_yld, int prvprd_id_prc, String prc_nm) {
		super();
		this.prd_id_prc = prd_id_prc;
		this.prc_id = prc_id;
		this.prdc_date = prdc_date;
		this.prdc_dateStr = prdc_dateStr;
		this.prd_yld = prd_yld;
		this.prd_rwmt_usg = prd_rwmt_usg;
		this.prv_prd_yld = prv_prd_yld;
		this.prvprd_id_prc = prvprd_id_prc;
		this.prc_nm = prc_nm;
	}
	public Prd_mng_prc01() {
		super();
		// TODO Auto-generated constructor stub
	}
}
