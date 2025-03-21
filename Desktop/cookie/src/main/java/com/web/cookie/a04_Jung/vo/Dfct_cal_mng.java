package com.web.cookie.a04_Jung.vo;

import java.util.List;
public class Dfct_cal_mng {  // calList  mngList
	private List<Dfct_calendar> calList;
	private List<Dfct_mngm01> mngList;
	public Dfct_cal_mng() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Dfct_cal_mng(List<Dfct_calendar> calList, List<Dfct_mngm01> mngList) {
		super();
		this.calList = calList;
		this.mngList = mngList;
	}
	public List<Dfct_calendar> getCalList() {
		return calList;
	}
	public void setCalList(List<Dfct_calendar> calList) {
		this.calList = calList;
	}
	public List<Dfct_mngm01> getMngList() {
		return mngList;
	}
	public void setMngList(List<Dfct_mngm01> mngList) {
		this.mngList = mngList;
	}
	
	
}
