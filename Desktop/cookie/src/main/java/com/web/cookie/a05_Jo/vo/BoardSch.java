package com.web.cookie.a05_Jo.vo;

import java.sql.Date;

public class BoardSch {
	// 기본 검색
	private String subject;		// 게시글 제목
	private String writer;		// 작성자
	// 조인 후 검색
	private String category;		// 카테고리
	private int deptno;			// 부서정보
	// 날짜 검색 기능
	private Date startDate;		// 검색시 시작 날짜
	private Date endDate;		// 검색시 끝 날짜
	// 페이징 처리를 위한 속성
	private int count; 			// 전체 건수
	private int pageSize; 		// 한번에 보일 데이터 건수
	private int curPage; 		// 클릭한 현재 페이지 번호
	private int pageCount;		// 전체 페이지 수
	
	private int start; 			// 해당 페이지의 시작번호
	private int end; 			// 해당 페이지의 마지막 번호
	
	private int blockSize; 		// 페이지 블럭의 크기
	private int startBlock; 	// 페이지 블럭의 시작번호
	private int endBlock; 		// 페이지 블럭의 마지막번호
	public BoardSch() {
		// TODO Auto-generated constructor stub
	}
	public BoardSch(String subject, String writer, String category, int deptno, Date startDate, Date endDate, int count,
			int pageSize, int curPage, int pageCount, int start, int end, int blockSize, int startBlock, int endBlock) {
		super();
		this.subject = subject;
		this.writer = writer;
		this.category = category;
		this.deptno = deptno;
		this.startDate = startDate;
		this.endDate = endDate;
		this.count = count;
		this.pageSize = pageSize;
		this.curPage = curPage;
		this.pageCount = pageCount;
		this.start = start;
		this.end = end;
		this.blockSize = blockSize;
		this.startBlock = startBlock;
		this.endBlock = endBlock;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}


	
}
