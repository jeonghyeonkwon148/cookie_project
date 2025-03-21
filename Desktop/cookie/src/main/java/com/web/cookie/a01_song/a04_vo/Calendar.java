package com.web.cookie.a01_song.a04_vo;

public class Calendar {
	private int id;
	private String title;
	private String writer;
	private String start; // 날짜를 ISOString형태로 처리..
	private String end;
	private String content;
	private String backgroundColor;
	private String textColor; 
	private boolean allDay; // allday number(1), 1==>true, 0==>false
	private String urllink;
	public Calendar() {
		// TODO Auto-generated constructor stub
	}
	public Calendar(int id, String title, String writer, String start, String end, String content,
			String backgroundColor, String textColor, boolean allDay, String urllink) {
		super();
		this.id = id;
		this.title = title;
		this.writer = writer;
		this.start = start;
		this.end = end;
		this.content = content;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.allDay = allDay;
		this.urllink = urllink;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	
}
