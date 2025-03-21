package com.web.cookie.a04_Jung.a01_controller;

import java.util.Locale;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class A11_MultiLanguageController {
	// 컨테이너에서 선언한 지역 언어선택 객체 호출
	@Autowired(required=false)
	private LocaleResolver localeResolver;
	// multilang.do?lang=en
	// 화면호출
	// http://localhost:5050/multilang
	// http://localhost:5050/multilang?lang=ko
	// http://localhost:5050/multilang?lang=
	//
	@GetMapping("multilang")
	public String multilang(@RequestParam(value="lang",defaultValue="ko") String lang,
							HttpServletRequest request,
							HttpServletResponse response){
		System.out.println("언어선택"+lang);
		// 화면에 선택한 언어에 따라 출력할 처리 내용
		Locale locale = new Locale(lang);
		localeResolver.setLocale(request, response, locale);
		return "WEB-INF\\a02_yoo\\cookiemain.jsp";						
	}

}
