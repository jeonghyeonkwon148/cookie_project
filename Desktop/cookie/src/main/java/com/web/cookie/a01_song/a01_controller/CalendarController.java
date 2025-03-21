package com.web.cookie.a01_song.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a01_song.a02_service.CalendarService;
import com.web.cookie.a01_song.a04_vo.Calendar;
@Controller
public class CalendarController {
	@Autowired(required=false)
	private CalendarService service;
	
	// http://192.168.0.39:5050/calendar
		// http://localhost:5050/calendar  a04_calendar\\calendarView.html
		@GetMapping("calendar")
		public String getCalendar() {
			return "WEB-INF\\a01_song\\A01_Calendar\\Calendar.jsp";
		}
		// List<Calendar> ==> 객체 ==> json
		// http://localhost:5050/calListAjax
		@RequestMapping("calListAjax")
		public ResponseEntity<?> calListAjax(){
			return ResponseEntity.ok(service.getCalendarList());
		}
		// http://localhost:5050/insertCalendarAjax
		@RequestMapping("insertCalendarAjax")
		public ResponseEntity<?> insertCalendarAjax(Calendar ins){
			return ResponseEntity.ok(service.insertCalendar(ins));
		}	
		// http://localhost:5050/updateCalendarAjax
		@RequestMapping("updateCalendarAjax")
		public ResponseEntity<?> updateCalendarAjax(Calendar upt){
			return ResponseEntity.ok(service.updateCalendar(upt));
		}		
		// html에서 수정 처리 ajax 완료... 
		@RequestMapping("deleteCalendarAjax")
		public ResponseEntity<?> deleteCalendarAjax(@RequestParam("id") int id){
			return ResponseEntity.ok(service.deleteCalendar(id));
		}	
}
