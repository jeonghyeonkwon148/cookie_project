package com.web.cookie.a01_song.a04_vo;

import java.sql.Date;

public class Order {
	private int order_no;
	private int num;//고객테이블 참조
	private int no;//제품테이블 참조
	private Date order_dte;//주문날짜
	private int order_cnt;//주문수량
	private int tot;//주문금액총계
	private String due_dte;//납기일
	private String order_dteS;
	public Order() {
		// TODO Auto-generated constructor stub
	}
	public Order(int order_no, int num, int no, Date order_dte, int order_cnt, int tot, String due_dte) {
		super();
		this.order_no = order_no;
		this.num = num;
		this.no = no;
		this.order_dte = order_dte;
		this.order_cnt = order_cnt;
		this.tot = tot;
		this.due_dte = due_dte;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getOrder_dte() {
		return order_dte;
	}
	public void setOrder_dte(Date order_dte) {
		this.order_dte = order_dte;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public String getDue_dte() {
		return due_dte;
	}
	public void setDue_dte(String due_dte) {
		this.due_dte = due_dte;
	}
	public String getOrder_dteS() {
		return order_dteS;
	}
	public void setOrder_dteS(String order_dteS) {
		this.order_dteS = order_dteS;
	}
}
