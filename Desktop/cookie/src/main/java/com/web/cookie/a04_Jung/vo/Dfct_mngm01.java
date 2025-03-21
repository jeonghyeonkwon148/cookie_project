package com.web.cookie.a04_Jung.vo;

import java.util.Date;

public class Dfct_mngm01 {
	public int getDfct_id() {
		return dfct_id;
	}
	public void setDfct_id(int dfct_id) {
		this.dfct_id = dfct_id;
	}
	public int getDfc_prd_id() {
		return dfc_prd_id;
	}
	public void setDfc_prd_id(int dfc_prd_id) {
		this.dfc_prd_id = dfc_prd_id;
	}
	public String getDfct_pic_nm() {
		return dfct_pic_nm;
	}
	public void setDfct_pic_nm(String dfct_pic_nm) {
		this.dfct_pic_nm = dfct_pic_nm;
	}
	public String getDfct_hndl_type() {
		return dfct_hndl_type;
	}
	public void setDfct_hndl_type(String dfct_hndl_type) {
		this.dfct_hndl_type = dfct_hndl_type;
	}
	public String getDfct_prcs_rslt() {
		return dfct_prcs_rslt;
	}
	public void setDfct_prcs_rslt(String dfct_prcs_rslt) {
		this.dfct_prcs_rslt = dfct_prcs_rslt;
	}
	public Date getDfct_dsps_date() {
		return dfct_dsps_date;
	}
	public void setDfct_dsps_date(Date dfct_dsps_date) {
		this.dfct_dsps_date = dfct_dsps_date;
	}
	public String getDfct_dsps_dateStr() {
		return dfct_dsps_dateStr;
	}
	public void setDfct_dsps_dateStr(String dfct_dsps_dateStr) {
		this.dfct_dsps_dateStr = dfct_dsps_dateStr;
	}
	public String getPrc_nm() {
		return prc_nm;
	}
	public void setPrc_nm(String prc_nm) {
		this.prc_nm = prc_nm;
	}
	public Dfct_mngm01(int dfct_id, int dfc_prd_id, String dfct_pic_nm, String dfct_hndl_type, String dfct_prcs_rslt,
			Date dfct_dsps_date, String dfct_dsps_dateStr, String prc_nm) {
		super();
		this.dfct_id = dfct_id;
		this.dfc_prd_id = dfc_prd_id;
		this.dfct_pic_nm = dfct_pic_nm;
		this.dfct_hndl_type = dfct_hndl_type;
		this.dfct_prcs_rslt = dfct_prcs_rslt;
		this.dfct_dsps_date = dfct_dsps_date;
		this.dfct_dsps_dateStr = dfct_dsps_dateStr;
		this.prc_nm = prc_nm;
	}
	public Dfct_mngm01() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int dfct_id;//불량관리 아이디
	private int dfc_prd_id;//생산중 불량 아이디
	private String dfct_pic_nm;//담당자명
	private String dfct_hndl_type;//불량처리유형
	private String dfct_prcs_rslt;//불량처리결과
	private Date dfct_dsps_date;//불량 처리 날짜
	private String dfct_dsps_dateStr;//불량 처리 날짜
	private String prc_nm;// 공정명
}
