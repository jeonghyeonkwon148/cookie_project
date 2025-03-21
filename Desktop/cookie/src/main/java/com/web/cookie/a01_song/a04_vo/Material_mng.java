package com.web.cookie.a01_song.a04_vo;

import java.util.Date;

public class Material_mng {
	private int mng_no;
	private String mnum;//원재료코드
	private int inc_rels_cnt;//입출고절대수량
	private int inc_rels_sort;//입출고구분 입고1 /출고2
	private int curr_tot_stock;//현재재고량
	private Date inc_rels_dte;//입출고날짜
	private String inc_rels_dteS;//입출고날짜 문자열
	private int empno; //사원번호
	public Material_mng() {
		// TODO Auto-generated constructor stub
	}
	public Material_mng(int mng_no, String mnum, int inc_rels_cnt, int inc_rels_sort, int curr_tot_stock,
			Date inc_rels_dte, String inc_rels_dteS, int empno) {
		super();
		this.mng_no = mng_no;
		this.mnum = mnum;
		this.inc_rels_cnt = inc_rels_cnt;
		this.inc_rels_sort = inc_rels_sort;
		this.curr_tot_stock = curr_tot_stock;
		this.inc_rels_dte = inc_rels_dte;
		this.inc_rels_dteS = inc_rels_dteS;
		this.empno = empno;
	}
	public int getMng_no() {
		return mng_no;
	}
	public void setMng_no(int mng_no) {
		this.mng_no = mng_no;
	}
	public String getMnum() {
		return mnum;
	}
	public void setMnum(String mnum) {
		this.mnum = mnum;
	}
	public int getInc_rels_cnt() {
		return inc_rels_cnt;
	}
	public void setInc_rels_cnt(int inc_rels_cnt) {
		this.inc_rels_cnt = inc_rels_cnt;
	}
	public int getInc_rels_sort() {
		return inc_rels_sort;
	}
	public void setInc_rels_sort(int inc_rels_sort) {
		this.inc_rels_sort = inc_rels_sort;
	}
	public int getCurr_tot_stock() {
		return curr_tot_stock;
	}
	public void setCurr_tot_stock(int curr_tot_stock) {
		this.curr_tot_stock = curr_tot_stock;
	}
	public Date getInc_rels_dte() {
		return inc_rels_dte;
	}
	public void setInc_rels_dte(Date inc_rels_dte) {
		this.inc_rels_dte = inc_rels_dte;
	}
	public String getInc_rels_dteS() {
		return inc_rels_dteS;
	}
	public void setInc_rels_dteS(String inc_rels_dteS) {
		this.inc_rels_dteS = inc_rels_dteS;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	
	
}
