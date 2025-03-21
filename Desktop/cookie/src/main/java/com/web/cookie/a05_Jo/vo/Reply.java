package com.web.cookie.a05_Jo.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Reply {
	private int no;
    private int board_no;
    private String content;
    private String writer;
    private Date regdte;
	private MultipartFile[] reports;
	private List<String> flist;
	private int auth;
	public Reply() {
		// TODO Auto-generated constructor stub
	}
	public Reply(int no, int board_no, String content, String writer, Date regdte, MultipartFile[] reports,
			List<String> flist, int auth) {
		super();
		this.no = no;
		this.board_no = board_no;
		this.content = content;
		this.writer = writer;
		this.regdte = regdte;
		this.reports = reports;
		this.flist = flist;
		this.auth = auth;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
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
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	

}
