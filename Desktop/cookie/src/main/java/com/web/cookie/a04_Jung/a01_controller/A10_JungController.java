package com.web.cookie.a04_Jung.a01_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a04_Jung.a02_service.A02_JungService6;
import com.web.cookie.a04_Jung.a02_service.A12_JungService;
import com.web.cookie.a04_Jung.vo.Dfct_cal_mng;
import com.web.cookie.a04_Jung.vo.Dfct_calendar;
import com.web.cookie.a04_Jung.vo.Dfct_mngm01;

import jakarta.servlet.http.HttpSession;


@Controller
public class A10_JungController {	
@Autowired(required=false)
private A12_JungService service;

@Autowired(required=false)
private A02_JungService6 dservice;

@ModelAttribute("dlist")
public List<Dfct_mngm01> getDfct_mngm01List(){
	return dservice.getDfct_mngm01List(new Dfct_mngm01());
}
String msg = "";

// ✅ 세션 값 가져오는 API 추가
// http://localhost:5050/JunggetSessionInfo2
@GetMapping("JunggetSessionInfo2")
public ResponseEntity<?> JunggetSessionInfo2(HttpSession session) {
    Map<String, Object> sessionData = new HashMap<>();

    sessionData.put("empno", session.getAttribute("empno") != null ? session.getAttribute("empno") : "0");
    sessionData.put("deptno", session.getAttribute("deptno") != null ? session.getAttribute("deptno") : "0");
    sessionData.put("auth", session.getAttribute("auth") != null ? session.getAttribute("auth") : "0");

    return ResponseEntity.ok(sessionData);
}

// 월간불량관리캘린더 CRUD
// http://localhost:5050/Dfct_calendar  a04_Dfct_calendar\\Dfct_calendarView.html
@GetMapping("Dfct_calendar")
public String getDfct_calendar() {
	return "a04_jung\\dfct_calendar.html";
}
// List<Dfct_calendar> ==> 객체 ==> json
// http://localhost:5050/Dfct_calendarListAjax
@RequestMapping("Dfct_calendarListAjax")
public ResponseEntity<?> Dfct_calendarListAjax(Model d){
	return  ResponseEntity.ok(new Dfct_cal_mng(service.getDfct_calendarList(),getDfct_mngm01List()));
}

// http://localhost:5050/insertDfct_calendarAjax
@RequestMapping("insertDfct_calendarAjax")
public ResponseEntity<?> insertDfct_calendarAjax(Dfct_calendar ins){
	return ResponseEntity.ok(service.insertDfct_calendar(ins));
}	
// http://localhost:5050/updateDfct_calendarAjax
@RequestMapping("updateDfct_calendarAjax")
public ResponseEntity<?> updateDfct_calendarAjax(Dfct_calendar upt){
	return ResponseEntity.ok(service.updateDfct_calendar(upt));
}		
// html에서 수정 처리 ajax 완료... 
@RequestMapping("deleteDfct_calendarAjax")
public ResponseEntity<?> deleteDfct_calendarAjax(@RequestParam("id") int id){
	return ResponseEntity.ok(service.deleteDfct_calendar(id));
}

}
