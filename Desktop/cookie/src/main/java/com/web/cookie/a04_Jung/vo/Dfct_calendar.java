package com.web.cookie.a04_Jung.vo;

public class Dfct_calendar {
	private int id; // 번호
	private int dfct_id; //불량 관리 아이디
	private String title;// 제목
	private String start;//시작일
	private String end;//마지막일
	private String backgroundColor;//배경색
	private String textColor;//색상
	private boolean allday;//종일여부
	private String dfc_typ;//불량유형
	private String dfct_pic_nm;//담당자명
	private String dfc_prd_cnfr_name;//확인근무자명
	private String dfct_prcs_rslt;//불량처리결과
	private String dfct_dsps_dateStr;//불량 처리 날짜
	public String getDfct_dsps_dateStr() {
		return dfct_dsps_dateStr;
	}
	public void setDfct_dsps_dateStr(String dfct_dsps_dateStr) {
		this.dfct_dsps_dateStr = dfct_dsps_dateStr;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDfct_id() {
		return dfct_id;
	}
	public void setDfct_id(int dfct_id) {
		this.dfct_id = dfct_id;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public boolean isAllday() {
		return allday;
	}
	public void setAllday(boolean allday) {
		this.allday = allday;
	}
	public String getDfc_typ() {
		return dfc_typ;
	}
	public void setDfc_typ(String dfc_typ) {
		this.dfc_typ = dfc_typ;
	}
	public String getDfct_pic_nm() {
		return dfct_pic_nm;
	}
	public void setDfct_pic_nm(String dfct_pic_nm) {
		this.dfct_pic_nm = dfct_pic_nm;
	}
	public String getDfc_prd_cnfr_name() {
		return dfc_prd_cnfr_name;
	}
	public void setDfc_prd_cnfr_name(String dfc_prd_cnfr_name) {
		this.dfc_prd_cnfr_name = dfc_prd_cnfr_name;
	}
	public String getDfct_prcs_rslt() {
		return dfct_prcs_rslt;
	}
	public void setDfct_prcs_rslt(String dfct_prcs_rslt) {
		this.dfct_prcs_rslt = dfct_prcs_rslt;
	}
	public Dfct_calendar(int id, int dfct_id, String start, String end, String backgroundColor, String textColor,
			boolean allday, String dfc_typ, String dfct_pic_nm, String dfc_prd_cnfr_name, String dfct_prcs_rslt) {
		super();
		this.id = id;
		this.dfct_id = dfct_id;
		this.start = start;
		this.end = end;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.allday = allday;
		this.dfc_typ = dfc_typ;
		this.dfct_pic_nm = dfct_pic_nm;
		this.dfc_prd_cnfr_name = dfc_prd_cnfr_name;
		this.dfct_prcs_rslt = dfct_prcs_rslt;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public Dfct_calendar() {
		super();
		// TODO Auto-generated constructor stub
	}
}
