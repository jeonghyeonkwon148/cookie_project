package com.web.cookie.a04_Jung.vo;

import java.util.Date;

public class Work_order {
	private int workl_id;//작업지시아이디
	private int order_no;//주문 아이디
	private Date final_schdl;//최종작업예정일
	private String final_schdlStr;//최종작업예정일
	private int day_pro;//일일생산량(목표)
	private int order_cnt;//주문수량
	private String due_dte;//납기일
	private String pname;//제품명
	public int getWorkl_id() {
		return workl_id;
	}
	public void setWorkl_id(int workl_id) {
		this.workl_id = workl_id;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public Date getFinal_schdl() {
		return final_schdl;
	}
	public void setFinal_schdl(Date final_schdl) {
		this.final_schdl = final_schdl;
	}
	public String getFinal_schdlStr() {
		return final_schdlStr;
	}
	public void setFinal_schdlStr(String final_schdlStr) {
		this.final_schdlStr = final_schdlStr;
	}
	public int getDay_pro() {
		return day_pro;
	}
	public void setDay_pro(int day_pro) {
		this.day_pro = day_pro;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public String getDue_dte() {
		return due_dte;
	}
	public void setDue_dte(String due_dte) {
		this.due_dte = due_dte;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Work_order(int workl_id, int order_no, Date final_schdl, String final_schdlStr, int day_pro, int order_cnt,
			String due_dte, String pname) {
		super();
		this.workl_id = workl_id;
		this.order_no = order_no;
		this.final_schdl = final_schdl;
		this.final_schdlStr = final_schdlStr;
		this.day_pro = day_pro;
		this.order_cnt = order_cnt;
		this.due_dte = due_dte;
		this.pname = pname;
	}
	public Work_order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
