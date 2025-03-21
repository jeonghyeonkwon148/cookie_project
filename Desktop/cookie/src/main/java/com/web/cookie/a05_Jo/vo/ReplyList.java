package com.web.cookie.a05_Jo.vo;

import java.util.List;

public class ReplyList {

	private Reply Reply;
	private List<?> List;
	public ReplyList() {
		// TODO Auto-generated constructor stub
	}
	public ReplyList(com.web.cookie.a05_Jo.vo.Reply reply, java.util.List<?> list) {
		super();
		Reply = reply;
		List = list;
	}
	public Reply getReply() {
		return Reply;
	}
	public void setReply(Reply reply) {
		Reply = reply;
	}
	public List<?> getList() {
		return List;
	}
	public void setList(List<?> list) {
		List = list;
	}

}
