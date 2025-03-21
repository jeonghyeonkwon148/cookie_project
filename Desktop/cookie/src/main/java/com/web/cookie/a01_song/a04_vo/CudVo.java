package com.web.cookie.a01_song.a04_vo;

import java.util.List;

public class CudVo {
	private String msg;
	private List<?> list;
	public CudVo() {
		// TODO Auto-generated constructor stub
	}
	public CudVo(String msg, List<?> list) {
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
