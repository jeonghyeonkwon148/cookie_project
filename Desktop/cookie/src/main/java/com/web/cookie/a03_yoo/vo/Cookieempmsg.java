package com.web.cookie.a03_yoo.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Cookieempmsg {
	private int mid;
	private int rmid;
	private int seid;
	private int reid;
	private String content;
	private int opauth;
	private Date senddte;
	
	private String senddteS;

	// 파일정보도 포함
	private MultipartFile[] msgfiles;
	// 파일명들의 리스트 정보
	private List<String> fnames;
	// 답글 계층처리에 필요
	private int cnt;
	private int level;
	
	// join한 정보 출력에 필요ename, empno deptno dname
	private int empno;
	private int deptno;
	private String ename;
	private String dname;
	// 발신자 정보
	private int seempno;
	private int sedeptno;
	private String seename;
	private String sedname;
	// 수신자 정보
	private int reempno;
	private int redeptno;
	private String reename;
	private String redname;
	
	public Cookieempmsg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getRmid() {
		return rmid;
	}
	public void setRmid(int rmid) {
		this.rmid = rmid;
	}
	public int getSeid() {
		return seid;
	}
	public void setSeid(int seid) {
		this.seid = seid;
	}
	public int getReid() {
		return reid;
	}
	public void setReid(int reid) {
		this.reid = reid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getOpauth() {
		return opauth;
	}
	public void setOpauth(int opauth) {
		this.opauth = opauth;
	}
	public Date getSenddte() {
		return senddte;
	}
	public void setSenddte(Date senddte) {
		this.senddte = senddte;
	}
	public String getSenddteS() {
		return senddteS;
	}
	public void setSenddteS(String senddteS) {
		this.senddteS = senddteS;
	}
	public MultipartFile[] getMsgfiles() {
		return msgfiles;
	}
	public void setMsgfiles(MultipartFile[] msgfiles) {
		this.msgfiles = msgfiles;
	}
	public List<String> getFnames() {
		return fnames;
	}
	public void setFnames(List<String> fnames) {
		this.fnames = fnames;
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
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getSeempno() {
		return seempno;
	}
	public void setSeempno(int seempno) {
		this.seempno = seempno;
	}
	public int getSedeptno() {
		return sedeptno;
	}
	public void setSedeptno(int sedeptno) {
		this.sedeptno = sedeptno;
	}
	public String getSeename() {
		return seename;
	}
	public void setSeename(String seename) {
		this.seename = seename;
	}
	public String getSedname() {
		return sedname;
	}
	public void setSedname(String sedname) {
		this.sedname = sedname;
	}
	public int getReempno() {
		return reempno;
	}
	public void setReempno(int reempno) {
		this.reempno = reempno;
	}
	public int getRedeptno() {
		return redeptno;
	}
	public void setRedeptno(int redeptno) {
		this.redeptno = redeptno;
	}
	public String getReename() {
		return reename;
	}
	public void setReename(String reename) {
		this.reename = reename;
	}
	public String getRedname() {
		return redname;
	}
	public void setRedname(String redname) {
		this.redname = redname;
	}
	
	

}
