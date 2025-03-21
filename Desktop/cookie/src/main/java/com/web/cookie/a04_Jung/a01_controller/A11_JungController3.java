package com.web.cookie.a04_Jung.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.cookie.a04_Jung.a02_service.A12_JungService3;
import com.web.cookie.a04_Jung.vo.JungPageSch;

@Controller
public class A11_JungController3 {
@Autowired(required=false)
private A12_JungService3 service;

// 자재관리 조회
// http://localhost:5050/Invn_prdcList
@RequestMapping("Invn_prdcList")
public String Invn_prdcList(@ModelAttribute("sch") JungPageSch sch,Model d){
	d.addAttribute("ilist", service.getJungPage13List(sch));
	return "WEB-INF\\a03_jung\\invn_prdc\\a01_invn_prdcList.jsp";
}


}
