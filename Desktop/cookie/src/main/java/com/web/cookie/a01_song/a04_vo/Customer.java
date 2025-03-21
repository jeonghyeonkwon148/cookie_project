package com.web.cookie.a01_song.a04_vo;

public class Customer {
	private int num;
	private String cname;
	private String manager;
	private String contact_number;
	private String email;
	public Customer() {
		// TODO Auto-generated constructor stub
	}
	public Customer(int num, String cname, String manager, String contact_number, String email) {
		super();
		this.num = num;
		this.cname = cname;
		this.manager = manager;
		this.contact_number = contact_number;
		this.email = email;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getContact_number() {
		return contact_number;
	}
	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
