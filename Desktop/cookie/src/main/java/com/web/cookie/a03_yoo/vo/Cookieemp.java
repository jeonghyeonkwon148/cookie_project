package com.web.cookie.a03_yoo.vo;

public class Cookieemp {
	private int empno;
	private String ename;
	private String pwd;
	private int deptno;

	private String dname;
	private int auth;
	private int sal;
	private int pwdupt;
	
	public Cookieemp() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cookieemp(int empno, String ename, String pwd, int deptno, String dname, int auth, int sal, int pwdupt) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.pwd = pwd;
		this.deptno = deptno;
		this.dname = dname;
		this.auth = auth;
		this.sal = sal;
		this.pwdupt = pwdupt;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public int getPwdupt() {
		return pwdupt;
	}
	public void setPwdupt(int pwdupt) {
		this.pwdupt = pwdupt;
	}

	

}
