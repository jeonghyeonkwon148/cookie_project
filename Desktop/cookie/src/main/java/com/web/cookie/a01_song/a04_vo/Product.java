package com.web.cookie.a01_song.a04_vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product {
 private int no;
 private String pname;
 private int price;
 private String unit;
 private MultipartFile[] reports;
 private List<String> flist; // 상세화면에서 첨부된 파일 리스트
 private int cnt;
	public Product() {
		// TODO Auto-generated constructor stub
	}
	public Product(int no, String pname, int price, String unit) {
		super();
		this.no = no;
		this.pname = pname;
		this.price = price;
		this.unit = unit;
	}
	
	public Product(int no, String pname, int price, String unit, MultipartFile[] reports, List<String> flist) {
		super();
		this.no = no;
		this.pname = pname;
		this.price = price;
		this.unit = unit;
		this.reports = reports;
		this.flist = flist;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public MultipartFile[] getReports() {
		return reports;
	}
	public void setReports(MultipartFile[] reports) {
		this.reports = reports;
	}
	public List<String> getFlist() {
		return flist;
	}
	public void setFlist(List<String> flist) {
		this.flist = flist;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
 
}
