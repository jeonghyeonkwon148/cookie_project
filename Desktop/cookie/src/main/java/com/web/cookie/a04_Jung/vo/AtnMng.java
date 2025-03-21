package com.web.cookie.a04_Jung.vo;

import java.util.Date;

public class AtnMng {
	private int no;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
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
	public Date getWorkingDate() {
		return workingDate;
	}
	public void setWorkingDate(Date workingDate) {
		this.workingDate = workingDate;
	}
	public String getWorkingDateStr() {
		return workingDateStr;
	}
	public void setWorkingDateStr(String workingDateStr) {
		this.workingDateStr = workingDateStr;
	}
	public Date getWorkingTime() {
		return workingTime;
	}
	public void setWorkingTime(Date workingTime) {
		this.workingTime = workingTime;
	}
	public String getWorkingTimeStr() {
		return workingTimeStr;
	}
	public void setWorkingTimeStr(String workingTimeStr) {
		this.workingTimeStr = workingTimeStr;
	}
	public Date getClockTime() {
		return clockTime;
	}
	public void setClockTime(Date clockTime) {
		this.clockTime = clockTime;
	}
	public String getClockTimeStr() {
		return clockTimeStr;
	}
	public void setClockTimeStr(String clockTimeStr) {
		this.clockTimeStr = clockTimeStr;
	}
	public AtnMng(int no, int empno, double wtime, double extrawtime, Date workingDate, String workingDateStr,
			Date workingTime, String workingTimeStr, Date clockTime, String clockTimeStr) {
		super();
		this.no = no;
		this.empno = empno;
		this.wtime = wtime;
		this.extrawtime = extrawtime;
		this.workingDate = workingDate;
		this.workingDateStr = workingDateStr;
		this.workingTime = workingTime;
		this.workingTimeStr = workingTimeStr;
		this.clockTime = clockTime;
		this.clockTimeStr = clockTimeStr;
	}
	public AtnMng() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int empno;
	private double wtime;
	private double extrawtime;
	private Date workingDate;
	private String workingDateStr;
	private Date workingTime;
	private String workingTimeStr;
	private Date clockTime;
	private String clockTimeStr;
	private String ename;
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
}
