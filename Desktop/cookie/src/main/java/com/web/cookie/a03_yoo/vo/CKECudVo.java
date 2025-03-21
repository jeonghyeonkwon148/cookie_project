package com.web.cookie.a03_yoo.vo;

import java.util.List;
public class CKECudVo {
	// 등록/수정/삭제 시, 메시지도 보이고, 리스트된 내용을 받는 VO
	// List<?> list; 유동성 있게 여러가지 리스트도 받을 수 있게 선언.
	private String msg;
	private List<?> list;
	public CKECudVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CKECudVo(String msg, List<?> list) {
		super();
		this.msg = msg;
		this.list = list;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<?> getList() {
		return list;
	}
	public void setList(List<?> list) {
		this.list = list;
	}
	
	
}
