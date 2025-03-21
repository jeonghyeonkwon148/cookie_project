package com.web.cookie.include;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class IncludeController {
	@Autowired(required=false)
	private LocaleResolver localeResolver;
	// footer
	// http://localhost:5050/footer
	@RequestMapping("footer")
	public String footer() {
		return "WEB-INF\\include\\footer.jsp";
	}
	// header
	// http://localhost:5050/header
	@RequestMapping("header")
	public String header(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session= request.getSession();
		String lang = "en";
		if(session.getAttribute("lang")!=null) {
	        lang = (String) session.getAttribute("lang");
		}
		Locale locale = new Locale(lang);
		localeResolver.setLocale(request, response, locale);
		return "WEB-INF\\include\\header.jsp";
	}
	// sidebar
	// http://localhost:5050/sidebar
	@RequestMapping("sidebar")
	public String sidebar(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session= request.getSession();
		String lang = "en";
		if(session.getAttribute("lang")!=null) {
	        lang = (String) session.getAttribute("lang");
		}
		Locale locale = new Locale(lang);
		localeResolver.setLocale(request, response, locale);
		return "WEB-INF\\include\\sidebar.jsp";
	}
	
}
