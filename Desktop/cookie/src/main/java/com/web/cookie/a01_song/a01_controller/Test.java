package com.web.cookie.a01_song.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {
	// http://localhost:5050/test1
	@GetMapping("test1")
	public String test1() {
		return "a01_song\\a01_show.html";
	}
	// http://localhost:5050/test2
	@GetMapping("test2")
	public String test2() {
		return "a01_song\\a01_show2.html";
	}
	// http://localhost:5050/test3
	@GetMapping("test3")
	public String test3() {
		return "WEB-INF\\include\\sidebar.jsp";
	}
	// http://localhost:5050/test4
	@GetMapping("test4")
	public String test4() {
		return "WEB-INF\\a01_song\\test\\NewFile.jsp";
	}

	
}
