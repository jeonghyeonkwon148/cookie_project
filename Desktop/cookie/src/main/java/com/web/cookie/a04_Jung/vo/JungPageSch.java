package com.web.cookie.a04_Jung.vo;

public class JungPageSch {
	private int count; // 전체게시물건수
	private int pageSize; // 한번에 보일 데이터 건수
	private int curPage; // 클릭한 현재 페이지 번호
	private int pageCount; // 전체 페이지 수 
	private int start; // 해당 페이지의 시작번호
	private int end; //해당 페이지의 마지막번호
	private int blockSize; // 페이지 블럭의 크기
	private int startBlock; //페이지블럭의 시작번호
	private int endBlock; // 페이지 블럭의 끝번호
	// 검색할 이름 목록
	private String mch_nm;  //기계명
	private String dfc_typ;//불량유형
	private String prc_nm;//공정명
	private String pname;//제품명
	private String ename;// 사원명
	private String mname;// 원재료명
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	// 추가 필요 변수
	private double wtime;
	private double extrawtime;
	private int mnum;
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public double getWtime() {
		return wtime;
	}
	public void setWtime(double wtime) {
		this.wtime = wtime;
	}
	public double getExtrawtime() {
		return extrawtime;
	}
	public void setExtrawtime(double extrawtime) {
		this.extrawtime = extrawtime;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public JungPageSch() {
		super();
		// TODO Auto-generated constructor stub
	}
	public JungPageSch(int count, int pageSize, int curPage, int pageCount, int start, int end, int blockSize,
			int startBlock, int endBlock, String mch_nm, String dfc_typ, String prc_nm, String pname) {
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
		this.mch_nm = mch_nm;
		this.dfc_typ = dfc_typ;
		this.prc_nm = prc_nm;
		this.pname = pname;
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
	public String getMch_nm() {
		return mch_nm;
	}
	public void setMch_nm(String mch_nm) {
		this.mch_nm = mch_nm;
	}
	public String getDfc_typ() {
		return dfc_typ;
	}
	public void setDfc_typ(String dfc_typ) {
		this.dfc_typ = dfc_typ;
	}
	public String getPrc_nm() {
		return prc_nm;
	}
	public void setPrc_nm(String prc_nm) {
		this.prc_nm = prc_nm;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	
}
