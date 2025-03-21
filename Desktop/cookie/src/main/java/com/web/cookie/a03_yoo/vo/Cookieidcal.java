package com.web.cookie.a03_yoo.vo;

public class Cookieidcal {
	private int id;
	private String title;
	private int empno; // 사원의 개인 일정만 표기하기 위해
	private String start; // 날짜를 ISOString형태로 처리..
	private String end;
	private String content;
	private String backgroundColor;
	private String textColor;
	private boolean allDay; // allday number(1), 1==>true, 0==>false
	private String urllink;
	private int showlevel; // 레벨에 따라 보이는 수준을 다르게
	private int deptno; // 부서별 공유하는 일정 확인 시 사용
	public Cookieidcal() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cookieidcal(int id, String title, int empno, String start, String end, String content, String backgroundColor,
			String textColor, boolean allDay, String urllink, int showlevel) {
		super();
		this.id = id;
		this.title = title;
		this.empno = empno;
		this.start = start;
		this.end = end;
		this.content = content;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.allDay = allDay;
		this.urllink = urllink;
		this.showlevel = showlevel;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	public String getUrllink() {
		return urllink;
	}
	public void setUrllink(String urllink) {
		this.urllink = urllink;
	}
	public int getShowlevel() {
		return showlevel;
	}
	public void setShowlevel(int showlevel) {
		this.showlevel = showlevel;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	
	
	
}
