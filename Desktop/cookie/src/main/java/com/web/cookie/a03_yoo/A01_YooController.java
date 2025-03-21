package com.web.cookie.a03_yoo;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import com.web.cookie.a03_yoo.vo.Cookieemp;
import com.web.cookie.a03_yoo.vo.Cookieempmsg;
import com.web.cookie.a03_yoo.vo.Cookieidcal;
import com.web.cookie.a03_yoo.vo.YooPaging;
import com.web.cookie.a05_Jo.Board.A02_JoService;
import com.web.cookie.a05_Jo.vo.BoardSch;
import com.web.cookie.a05_Jo.vo.Board;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class A01_YooController {
	@Autowired(required = false)
	private A02_YooService service;

	@Autowired(required=false)
	private LocaleResolver localeResolver;
	
	// 로그인
	// http://localhost:5050/cookielogin		  
	@RequestMapping("cookielogin")
	public String cookielogin(Cookieemp login, Model d, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session= request.getSession();
		
		if(login.getEmpno()!=0&&login.getPwd()!=null) {
			Cookieemp emp = service.cookieLogin(login);
			if(emp==null) {
				// 데이터가 없으면 로그인 실패
				d.addAttribute("msg", "사원번호 혹은 비밀번호가 틀렸습니다");	
			}else {
				// 있으면 로그인 성공
				System.out.println(emp.getEmpno());
				//session.setAttribute("sesEmp", emp);
				String empJson = "{\"empno\":"+emp.getEmpno()+",\"ename\":\""+emp.getEname()+
						"\",\"pwd\":\""+emp.getPwd()+"\",\"deptno\":"+emp.getDeptno()+
						",\"dname\":\""+emp.getDname()+"\",\"auth\":"+emp.getAuth()+
						",\"sal\":"+emp.getSal()+",\"pwdupt\":"+emp.getPwdupt()+"}";
				//System.out.println(empJson);
				session.setAttribute("sesEmp", empJson);
				session.setAttribute("empno", emp.getEmpno());
				session.setAttribute("deptno", emp.getDeptno());
				session.setAttribute("auth", emp.getAuth());
				session.setAttribute("ename", emp.getEname());
				session.setAttribute("dname", emp.getDname());
				System.out.println("저장된 json : "+session.getAttribute("sesEmp"));
				System.out.println("저장된 사원번호 : "+session.getAttribute("empno"));
				System.out.println("저장된 부서번호 : "+session.getAttribute("deptno"));
				System.out.println("저장된 권한등급 : "+session.getAttribute("auth"));
				System.out.println("저장된 사원이름 : "+session.getAttribute("ename"));
				System.out.println("저장된 부서이름 : "+session.getAttribute("dname"));
				//session.setAttribute("sesEmpno", emp.getEmpno());
				//session.setAttribute("sesEname", emp.getEname());
				//세션에 사원 정보를 설정
				d.addAttribute("msg", "어서오세요 "+emp.getEname()+"님");
				d.addAttribute("pwdupt", emp.getPwdupt());
			}
		}


		String lang = "en";
		if(session.getAttribute("lang")!=null) {
	        lang = (String) session.getAttribute("lang");
		}
		Locale locale = new Locale(lang);
		localeResolver.setLocale(request, response, locale);
		
		return "WEB-INF\\a02_yoo\\login.jsp";
	}
	//비밀번호 변경
	// http://localhost:5050/yoochangePwd		  
	@RequestMapping("yoochangePwd")
	public String yoochangePwd(Cookieemp udtPwd, Model d,
			@RequestParam(value="chgPwd",defaultValue="") String chgPwd) {
		d.addAttribute("msg", "");
		if(!chgPwd.equals("")) {
			System.out.println("chgPwd:"+chgPwd);
			udtPwd.setPwd(chgPwd);
			d.addAttribute("msg", service.cookieUdtPwd(udtPwd));
		}
		return "WEB-INF\\a02_yoo\\change.jsp";
	}
	// 세션데이터(로그인 한 사원 정보) 호출 ajax
	// http://localhost:5050/ajaxcookieempData
	@RequestMapping("ajaxcookieempData")
	public ResponseEntity<?> ajaxcookieempData(HttpServletRequest request){
        HttpSession session = request.getSession();
        String empJson = (String) session.getAttribute("sesEmp");
        if(empJson==""||empJson==null) {
        	empJson="{\"empno\":0,\"ename\":\"\",\"pwd\":\"\",\"deptno\":0"
        			+ ",\"dname\":\"\",\"auth\":0,\"sal\":0,\"pwdupt\":0}";
        }
		return ResponseEntity.ok(empJson);
	}
	// 세션데이터(로그인 한 사원 정보) 삭제 ajax
	// http://localhost:5050/ajaxcookieempData
	@RequestMapping("ajaxcookieempDataDel")
	public ResponseEntity<?> ajaxcookieempDataDel(HttpServletRequest request){
        HttpSession session = request.getSession();
        String empJson = "로그아웃 성공";
        session.removeAttribute("sesEmp");
        session.removeAttribute("empno");
        session.removeAttribute("deptno");
        session.removeAttribute("auth");
        session.removeAttribute("ename");
        session.removeAttribute("dname");
		return ResponseEntity.ok(empJson);
	}
	// 언어설정 세션등록 ajax
	// http://localhost:5050/ajaxcookieselectLang
	@RequestMapping("ajaxcookieselectLang")
	public ResponseEntity<?> ajaxcookieselectLang(
			@RequestParam(value="lang",defaultValue="en") String lang,
			HttpServletRequest request){
        HttpSession session = request.getSession();
		session.setAttribute("lang", lang);
        String msg = "언어설정 : "+(String)session.getAttribute("lang");
		return ResponseEntity.ok(msg);
	}
	

	@Autowired(required = false)
	private A02_JoService jservice;
	//메인
	// http://localhost:5050/cookiemain		  
	@RequestMapping("cookiemain")
	public String cookiemain(
			@ModelAttribute("sch") BoardSch sch, Model d) {
		d.addAttribute("joboardList", jservice.getBoardList(sch));

		return "WEB-INF\\a02_yoo\\cookiemain.jsp";
	}
	
	//메인화면 테스트
	// http://localhost:5050/cookietest		  
	@RequestMapping("cookietest")
	public String cookietest() {
		return "WEB-INF\\a02_yoo\\cookietest.jsp";
	}
	
	// header
	// http://localhost:5050/headerCookie	  
	@RequestMapping("headerCookie")
	public String headerCookie() {
		return "WEB-INF\\include\\header.jsp";
	}
	// footer
	// http://localhost:5050/yoofooterCookie	  
	@RequestMapping("yoofooterCookie")
	public String footerCookie() {
		return "WEB-INF\\a02_yoo\\footer2.jsp";
	}
	// sidebar
	// http://localhost:5050/yoosidebarCookie	  
	@RequestMapping("yoosidebarCookie")
	public String sidebarCookie() {
		return "WEB-INF\\a02_yoo\\sidebar2.jsp";
	}

	// 사원리스트
	// http://localhost:5050/cookieempList	  
	@RequestMapping("cookieempList")
	public String cookieempList() {
		return "WEB-INF\\a02_yoo\\cookieempList.jsp";
	}
	
	// 사원리스트 검색 ajax
	// http://localhost:5050/ajaxsearchCEList?pageSize=5&curPage=3
	@RequestMapping("ajaxsearchCEList")
	public ResponseEntity<?> ajaxsearchCEList(YooPaging sch){
		return ResponseEntity.ok(service.searchCEList(sch));
	}
	
	// 부서리스트 호출 ajax
	// http://localhost:5050/ajaxgetCookieDept
	@RequestMapping("ajaxgetCookieDept")
	public ResponseEntity<?> ajaxgetCookieDept(){
		return ResponseEntity.ok(service.getCookieDept());
	}
	
	// 사원리스트 페이지값 ajax
	// http://localhost:5050/ajaxsearchCEListPage?pageSize=5&curPage=2
	@RequestMapping("ajaxsearchCEListPage")
	public ResponseEntity<?> ajaxsearchCEListPage(YooPaging sch){
		return ResponseEntity.ok(service.searchCEListPage(sch));
	}
	
	// 사원 검색 ajax
	// http://localhost:5050/ajaxsearchCEmp?empno=1002
	@RequestMapping("ajaxsearchCEmp")
	public ResponseEntity<?> ajaxsearchCEmp(@RequestParam(value="empno",defaultValue="0") int empno){
		return ResponseEntity.ok(service.searchCEmp(empno));
	}
	
	// 사원 등록 ajax
	// http://localhost:5050/ajaxinsertCookieEmp
	@PostMapping("ajaxinsertCookieEmp")
	public ResponseEntity<?> ajaxinsertCookieEmp(Cookieemp ins){
		return ResponseEntity.ok(service.insertCookieEmp(ins));
	}
	
	// 사원 정보 수정 ajax
	// http://localhost:5050/ajaxupdateCookieEmp
	@PostMapping("ajaxupdateCookieEmp")
	public ResponseEntity<?> ajaxupdateCookieEmp(Cookieemp udt){
		return ResponseEntity.ok(service.updateCookieEmp(udt));
	}
	
	// 사원 정보 삭제 ajax
	// http://localhost:5050/ajaxdeleteCookieEmp
	@PostMapping("ajaxdeleteCookieEmp")
	public ResponseEntity<?> ajaxdeleteCookieEmp(Cookieemp del){
		return ResponseEntity.ok(service.deleteCookieEmp(del));
	}
	
	// 부서정보 리스트
	// http://localhost:5050/yoocookiedeptList	  
	@RequestMapping("yoocookiedeptList")
	public String yoocookiedeptList(Model d) {
		d.addAttribute("dList",service.getCookieDept());
		d.addAttribute("eList",service.getCookieEmpsByDept());
		return "WEB-INF\\a02_yoo\\cookiedeptList.jsp";
	}
	
	// 부서 등록 ajax
	// http://localhost:5050/ajaxinsertCookieDept
	@PostMapping("ajaxinsertCookieDept")
	public ResponseEntity<?> ajaxinsertCookieDept(Cookieemp ins){
		return ResponseEntity.ok(service.insertCookieDept(ins));
	}
	
	// 부서 정보 수정 ajax
	// http://localhost:5050/ajaxupdateCookieDept
	@PostMapping("ajaxupdateCookieDept")
	public ResponseEntity<?> ajaxupdateCookieDept(Cookieemp udt){
		return ResponseEntity.ok(service.updateCookieDept(udt));
	}
	
	// 부서 정보 삭제 ajax
	// http://localhost:5050/ajaxdeleteCookieDept
	@PostMapping("ajaxdeleteCookieDept")
	public ResponseEntity<?> ajaxdeleteCookieDept(
			@RequestParam(value="deptno",defaultValue="0") int deptno){
		return ResponseEntity.ok(service.deleteCookieDept(deptno));
	}

	// 사원 등록 페이지
	// http://localhost:5050/cookieempListInsert  
	@RequestMapping("cookieempListInsert")
	public String cookieempListInsert() {
		return "WEB-INF\\a02_yoo\\cookieempList.jsp";
	}
	
	// 부서 등록 페이지
	// http://localhost:5050/yoocookiedeptListInsert	  
	@RequestMapping("yoocookiedeptListInsert")
	public String yoocookiedeptListInsert(Model d) {
		d.addAttribute("dList",service.getCookieDept());
		d.addAttribute("eList",service.getCookieEmpsByDept());
		return "WEB-INF\\a02_yoo\\cookiedeptList.jsp";
	}
	
	// 부서 변경 페이지
	// http://localhost:5050/yoocookiedeptMove	  
	@RequestMapping("yoocookiedeptMove")
	public String yoocookiedeptMove(Model d) {
		d.addAttribute("dList",service.getCookieDept());
		d.addAttribute("eList",service.getCookieEmpsByDept());
		return "WEB-INF\\a02_yoo\\cookiedeptMove.jsp";
	}
	
	// 부서번호별 사원목록 호출 ajax
	// http://localhost:5050/ajaxgetCookieEmpsByDeptno
	@PostMapping("ajaxgetCookieEmpsByDeptno")
	public ResponseEntity<?> ajaxgetCookieEmpsByDeptno(
			@RequestParam(value="deptno",defaultValue="0") int deptno){
		return ResponseEntity.ok(service.getCookieEmpsByDeptno(deptno));
	}
	
	// 부서 직급 수정 ajax 
	// http://localhost:5050/ajaxupdateDeptNAuth
	@PostMapping("ajaxupdateDeptNAuth")
	public ResponseEntity<?> ajaxupdateDeptNAuth(Cookieemp udt){
		return ResponseEntity.ok(service.updateDeptNAuth(udt));
	}
	
	// 메세지 목록 페이지
	// http://localhost:5050/yoocookiemessage	  
	@RequestMapping("yoocookiemessage")
	public String yoocookiemessage() {
		return "WEB-INF\\a02_yoo\\cookiemessage.jsp";
	}
	
	// 메세지리스트 검색 ajax
	// http://localhost:5050/ajaxsearchMsgList?pageSize=5&curPage=1&empno=1000&ename=홍&sendOrRecieve=3
	@RequestMapping("ajaxsearchMsgList")
	public ResponseEntity<?> ajaxsearchMsgList(YooPaging sch){
		return ResponseEntity.ok(service.searchMsgList(sch));
	}
	
	// 메세지리스트 페이지값 ajax
	// http://localhost:5050/ajaxsearchMsgListPage?pageSize=5&curPage=1&empno=1000
	@RequestMapping("ajaxsearchMsgListPage")
	public ResponseEntity<?> ajaxsearchMsgListPage(YooPaging sch){
		return ResponseEntity.ok(service.searchMsgListPage(sch));
	}
	
	// 사원 간단하게 검색 ajax
	// http://localhost:5050/ajaxgetCookieEmpSimple?ename=김
	@RequestMapping("ajaxgetCookieEmpSimple")
	public ResponseEntity<?> ajaxgetCookieEmpSimple(
			@RequestParam(value="ename",defaultValue="") String ename){
		return ResponseEntity.ok(service.getCookieEmpSimple(ename));
	}
	
	// 메세지 상세정보 ajax
	// http://localhost:5050/ajaxgetCookieEmpMsgDt?mid=5
	@RequestMapping("ajaxgetCookieEmpMsgDt")
	public ResponseEntity<?> ajaxgetCookieEmpMsgDt(
			@RequestParam(value="mid",defaultValue="0") int mid,
			@RequestParam(value="readid",defaultValue="0") int readid){
		return ResponseEntity.ok(service.getCookieEmpMsgDt(mid,readid));
	}
	
	// 메세지 전송 ajax 
	// http://localhost:5050/ajaxsendMessage
	@PostMapping("ajaxsendMessage")
	public ResponseEntity<?> ajaxsendMessage(Cookieempmsg send){
		return ResponseEntity.ok(service.sendMessage(send));
	}
	
	// 읽지 않은 메세지 수 확인 ajax
	// http://localhost:5050/ajaxreadMessageCnt
	@PostMapping("ajaxreadMessageCnt")
	public ResponseEntity<?> ajaxreadMessageCnt(
			@RequestParam(value="reid",defaultValue="0") int reid){
		return ResponseEntity.ok(service.readMessageCnt(reid));
	}
	
	// 메세지 전송 ajax 
	// http://localhost:5050/ajaxsendAskMessage
	@PostMapping("ajaxsendAskMessage")
	public ResponseEntity<?> ajaxsendAskMessage(
			@RequestParam(value="ckEname",defaultValue="") String ckEname,
			@RequestParam(value="ckEmpno",defaultValue="0") int ckEmpno){
		return ResponseEntity.ok(service.sendAskMessage(ckEname,ckEmpno));
	}
	
	// 사원 개인정보 페이지
	// http://localhost:5050/yoocookieempMyInfo	  
	@RequestMapping("yoocookieempMyInfo")
	public String yoocookieempMyInfo() {
		return "WEB-INF\\a02_yoo\\cookieempMyInfo.jsp";
	}
	
	// 비밀번호 확인 ajax
	// http://localhost:5050/ajaxCheckCEPassword
	@PostMapping("ajaxCheckCEPassword")
	public ResponseEntity<?> ajaxCheckCEPassword(Cookieemp login){
		return ResponseEntity.ok(service.cookieLogin(login));
	}
	
	// 사원 켈린더 페이지
	// http://localhost:5050/yoocookieempMyCalendar	  
	@RequestMapping("yoocookieempMyCalendar")
	public String yoocookieempMyCalendar() {
		return "WEB-INF\\a02_yoo\\cookieempMyCalendar.jsp";
	}
	
	// 켈린더 일정 호출
	// http://localhost:5050/getCookieidcalListAjax
	@RequestMapping("getCookieidcalListAjax")
	public ResponseEntity<?> getCookieidcalListAjax(
			@RequestParam(value="empno",defaultValue="0") int empno,
			@RequestParam(value="deptno",defaultValue="0") int deptno){
		return ResponseEntity.ok(service.getCookieidcalList(empno,deptno));
	}
	
	// 일정 저장
	// http://localhost:5050/insCookieidcalAjax
	@RequestMapping("insCookieidcalAjax")
	public ResponseEntity<?> insCookieidcalAjax(Cookieidcal ins){
		return ResponseEntity.ok(service.insCookieidcal(ins));
	}	
	
	// 일정 수정 
	// http://localhost:5050/udtCookieidcalAjax
	@RequestMapping("udtCookieidcalAjax")
	public ResponseEntity<?> udtCookieidcalAjax(Cookieidcal upt){
		return ResponseEntity.ok(service.udtCookieidcal(upt));
	}		
	
	// 일정 삭제
	@RequestMapping("delCookieidcalAjax")
	public ResponseEntity<?> delCookieidcalAjax(Cookieidcal del){
		return ResponseEntity.ok(service.delCookieidcal(del));
	}	
	
	
	
	
	
}
