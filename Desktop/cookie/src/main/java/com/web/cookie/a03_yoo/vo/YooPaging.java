package com.web.cookie.a03_yoo.vo;

public class YooPaging {
	// 페이징 처리 속성
	private int count;		// 데이터의 총 수
	private int pageSize;	// 한 페이지 당 데이터 수
	private int curPage;	// 현재 페이지 번호
	private int pageCount;	// 전체 페이지 수
	private int start;		// 페이지 시작번호
	private int end;		// 페이지 마지막번호
	private int blockSize;	// 페이지 블럭 크기
	private int startBlock;	// 페이지 블럭 시작번호
	private int endBlock;	// 페이지 블럭 마지막번호
	// 사원검색에 사용
	private String ename;
	private String deptno;
	// 메세지 검색에 사용
	private int empno;
	private int sendOrRecieve;
	
	public YooPaging() {
		super();
		// TODO Auto-generated constructor stub
	}
	public YooPaging(int count, int pageSize, int curPage, int pageCount, int start, int end, int blockSize,
			int startBlock, int endBlock, String ename, String deptno) {
		super();
		this.count = count;
		this.pageSize = pageSize;
		this.curPage = curPage;
		this.pageCount = pageCount;
		this.start = start;
		this.end = end;
		this.blockSize = blockSize;
		this.startBlock = startBlock;
		this.endBlock = endBlock;
		this.ename = ename;
		this.deptno = deptno;
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
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getSendOrRecieve() {
		return sendOrRecieve;
	}
	public void setSendOrRecieve(int sendOrRecieve) {
		this.sendOrRecieve = sendOrRecieve;
	}
	
	
}
