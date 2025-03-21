package com.web.cookie.a01_song.a04_vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Chat {
	private int chat_id;
	private String sender;//보낸자
	private String receiver;//받는자
	private String content;//내용
	private int readcnt;//읾음여부 표시
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date send_date;//보낸날짜	
	private String send_dateS;//보낸날짜문자열
	public Chat() {
		// TODO Auto-generated constructor stub
	}

	
	public Chat(int chat_id, String sender, String receiver, String content, int readcnt, Date send_date,
			String send_dateS) {
		super();
		this.chat_id = chat_id;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.readcnt = readcnt;
		this.send_date = send_date;
		this.send_dateS = send_dateS;
	}


	public int getChat_id() {
		return chat_id;
	}
	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	public String getSend_dateS() {
		return send_dateS;
	}
	public void setSend_dateS(String send_dateS) {
		this.send_dateS = send_dateS;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	
}
