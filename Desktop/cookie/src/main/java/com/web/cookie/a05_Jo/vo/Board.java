package com.web.cookie.a05_Jo.vo;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class Board {
	private LocalDateTime createdAt = LocalDateTime.now();
	private LocalDateTime readAt;  
	private int replies;
	public int getReplies() {
		return replies;
	}
	// 기본 속성선언
	private int cnt;
	private int level;	
	private int no;		// 게시글 고유 번호
	private int refno;	// 참조 번호 (답글/댓글 기능 구현 시 사용 가능)
	private String subject; // 게시글 제목
	private String content; // 게시글 내용
	private String writer; // 작성자 이름
	private String category; // 카테고리
	private int readcnt;	// 조회수
	private Date regdte;	// 작성일
	private Date uptdte;	// 수정일
	private String isread;  // 'N' = 미확인, 'Y' = 확인
	private MultipartFile[] reports;
	private List<String> flist;
	private int empno;
	private int board_deptno;
	public Board() {
		// TODO Auto-generated constructor stub
	}
	public Board(LocalDateTime createdAt, LocalDateTime readAt, int replies, int cnt, int level, int no, int refno,
			String subject, String content, String writer, String category, int readcnt, Date regdte, Date uptdte,
			String isread, MultipartFile[] reports, List<String> flist, int empno, int board_deptno) {
		super();
		this.createdAt = createdAt;
		this.readAt = readAt;
		this.replies = replies;
		this.cnt = cnt;
		this.level = level;
		this.no = no;
		this.refno = refno;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.category = category;
		this.readcnt = readcnt;
		this.regdte = regdte;
		this.uptdte = uptdte;
		this.isread = isread;
		this.reports = reports;
		this.flist = flist;
		this.empno = empno;
		this.board_deptno = board_deptno;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public LocalDateTime getReadAt() {
		return readAt;
	}
	public void setReadAt(LocalDateTime readAt) {
		this.readAt = readAt;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public Date getUptdte() {
		return uptdte;
	}
	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}
	public String getIsread() {
		return isread;
	}
	public void setIsread(String isread) {
		this.isread = isread;
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
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getboard_deptno() {
		return board_deptno;
	}
	public void setboard_deptno(int board_deptno) {
		this.board_deptno = board_deptno;
	}
	public void setReplies(int replies) {
		this.replies = replies;
	}


}