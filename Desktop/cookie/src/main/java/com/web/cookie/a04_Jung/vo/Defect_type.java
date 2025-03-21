package com.web.cookie.a04_Jung.vo;

public class Defect_type {
	public int getDfc_typ_id() {
		return dfc_typ_id;
	}
	public void setDfc_typ_id(int dfc_typ_id) {
		this.dfc_typ_id = dfc_typ_id;
	}
	public String getDfc_typ() {
		return dfc_typ;
	}
	public void setDfc_typ(String dfc_typ) {
		this.dfc_typ = dfc_typ;
	}
	public Defect_type(int dfc_typ_id, String dfc_typ) {
		super();
		this.dfc_typ_id = dfc_typ_id;
		this.dfc_typ = dfc_typ;
	}
	public Defect_type() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int dfc_typ_id;//불량유형아이디
	private String dfc_typ;//불량유형
}
