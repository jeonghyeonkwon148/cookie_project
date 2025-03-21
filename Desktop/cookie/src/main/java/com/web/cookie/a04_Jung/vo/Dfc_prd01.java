package com.web.cookie.a04_Jung.vo;

import java.util.Date;

public class Dfc_prd01 {
public int getDfc_prd_id() {
		return dfc_prd_id;
	}
	public void setDfc_prd_id(int dfc_prd_id) {
		this.dfc_prd_id = dfc_prd_id;
	}
	public int getPrc_id() {
		return prc_id;
	}
	public void setPrc_id(int prc_id) {
		this.prc_id = prc_id;
	}
	public String getDfc_prd_cnfr_name() {
		return dfc_prd_cnfr_name;
	}
	public void setDfc_prd_cnfr_name(String dfc_prd_cnfr_name) {
		this.dfc_prd_cnfr_name = dfc_prd_cnfr_name;
	}
	public Date getDfc_prd_dfct_arvl() {
		return dfc_prd_dfct_arvl;
	}
	public void setDfc_prd_dfct_arvl(Date dfc_prd_dfct_arvl) {
		this.dfc_prd_dfct_arvl = dfc_prd_dfct_arvl;
	}
	public String getDfc_prd_dfct_arvlStr() {
		return dfc_prd_dfct_arvlStr;
	}
	public void setDfc_prd_dfct_arvlStr(String dfc_prd_dfct_arvlStr) {
		this.dfc_prd_dfct_arvlStr = dfc_prd_dfct_arvlStr;
	}
	public int getDfc_prd_dfct_cnt() {
		return dfc_prd_dfct_cnt;
	}
	public void setDfc_prd_dfct_cnt(int dfc_prd_dfct_cnt) {
		this.dfc_prd_dfct_cnt = dfc_prd_dfct_cnt;
	}
	public int getDfc_typ_id() {
		return dfc_typ_id;
	}
	public void setDfc_typ_id(int dfc_typ_id) {
		this.dfc_typ_id = dfc_typ_id;
	}
	public String getPrc_nm() {
		return prc_nm;
	}
	public void setPrc_nm(String prc_nm) {
		this.prc_nm = prc_nm;
	}
	public String getDfc_typ() {
		return dfc_typ;
	}
	public void setDfc_typ(String dfc_typ) {
		this.dfc_typ = dfc_typ;
	}
public Dfc_prd01(int dfc_prd_id, int prc_id, String dfc_prd_cnfr_name, Date dfc_prd_dfct_arvl,
			String dfc_prd_dfct_arvlStr, int dfc_prd_dfct_cnt, int dfc_typ_id, String prc_nm, String dfc_typ) {
		super();
		this.dfc_prd_id = dfc_prd_id;
		this.prc_id = prc_id;
		this.dfc_prd_cnfr_name = dfc_prd_cnfr_name;
		this.dfc_prd_dfct_arvl = dfc_prd_dfct_arvl;
		this.dfc_prd_dfct_arvlStr = dfc_prd_dfct_arvlStr;
		this.dfc_prd_dfct_cnt = dfc_prd_dfct_cnt;
		this.dfc_typ_id = dfc_typ_id;
		this.prc_nm = prc_nm;
		this.dfc_typ = dfc_typ;
	}
public Dfc_prd01() {
		super();
		// TODO Auto-generated constructor stub
	}
private int dfc_prd_id;//생산중 불량아이디
private int prc_id;//공정 아이디
private String dfc_prd_cnfr_name;//확인 근무자명
private Date dfc_prd_dfct_arvl;//불량이 나온시간
private String dfc_prd_dfct_arvlStr;//불량이 나온시간
private int dfc_prd_dfct_cnt;//불량갯수
private int dfc_typ_id;//불량유형 아이디
private String prc_nm;// 공정명
private String dfc_typ;// 불량유형
}
