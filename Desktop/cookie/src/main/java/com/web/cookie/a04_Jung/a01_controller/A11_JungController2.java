package com.web.cookie.a04_Jung.a01_controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a04_Jung.a02_service.A12_JungService2;
import com.web.cookie.a04_Jung.vo.AtnMng;

import jakarta.servlet.http.HttpSession;

@Controller
	public class A11_JungController2 {
	@Autowired(required=false)
	private A12_JungService2 service;

	// ✅ 세션 값 가져오는 API 추가
    // http://localhost:5050/JunggetSessionInfo
    @GetMapping("JunggetSessionInfo")
    public ResponseEntity<?> JunggetSessionInfo(HttpSession session) {
        Map<String, Object> sessionData = new HashMap<>();

        sessionData.put("empno", session.getAttribute("empno") != null ? session.getAttribute("empno") : "0");
        sessionData.put("deptno", session.getAttribute("deptno") != null ? session.getAttribute("deptno") : "0");
        sessionData.put("auth", session.getAttribute("auth") != null ? session.getAttribute("auth") : "0");

        return ResponseEntity.ok(sessionData);
    }
	// 근태관리 CRUD
	//http://localhost:5050/atnmngListVue
		@GetMapping("atnmngListVue")
		public String atnmngListVue(){
			return "a04_jung\\atnmngVue.html";
		}
		
		

		// http://localhost:5050/ajaxTJCookieeempListVue
		@GetMapping("ajaxTJCookieeempListVue")
		public ResponseEntity<?>  ajaxTJCookieeempListVue(){
			return ResponseEntity.ok(service.getTJCookieeempList());
					
		}		
		
		
		// http://localhost:5050/ajaxJungListVue
		@RequestMapping("ajaxJungListVue")
		public ResponseEntity<?> ajaxJungListVue(AtnMng sch){
			return ResponseEntity.ok(service.getAtnMngList(sch));
		}	
		
		
		
		
		// http://localhost:5050/AtnMngVue?no=1
		@GetMapping("AtnMngVue")
		public ResponseEntity<?> AtnMngVue(@RequestParam("no") int no, 
							 Model d) {
			return ResponseEntity.ok(service.getAtnMng(no));
		}	
		
		// http://localhost:5050/insAtnMngVue
		@PostMapping("insAtnMngVue")
		public ResponseEntity<?> insAtnMngVue(@RequestBody AtnMng ins, Model d) {
			
			return ResponseEntity.ok(service.insertAtnMng(ins));
		}
		
		// http://localhost:5050/updateAtnMngVue
		@PutMapping("updateAtnMngVue")
		public ResponseEntity<?> updateAtnMngVue(@RequestBody AtnMng upt, Model d) {
			
			return ResponseEntity.ok( service.updateAtnMng(upt));
		}		
		// 출근버튼
		// http://localhost:5050/updateAtnMng2Vue
		@RequestMapping("updateAtnMng2Vue")
		public ResponseEntity<?> updateAtnMng2Vue(@RequestBody AtnMng upt, Model d) {		
			return ResponseEntity.ok( service.updateAtnMng2(upt));
		}
		// 퇴근버튼
		// http://localhost:5050/updateAtnMng3Vue
		@RequestMapping("updateAtnMng3Vue")
		public ResponseEntity<?> updateAtnMng3Vue(@RequestBody AtnMng upt, Model d) {	
			return ResponseEntity.ok( service.updateAtnMng3(upt));
		}		
		
		// http://localhost:5050/deleteAtnMngVue
		@DeleteMapping("deleteAtnMngVue")
		public ResponseEntity<?> deleteAtnMngVue(@RequestParam("no") int no, Model d) {
			
			return ResponseEntity.ok(service.deleteAtnMng(no));
		}

	}


