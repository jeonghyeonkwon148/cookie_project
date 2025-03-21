package com.web.cookie.a04_Jung.a01_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a04_Jung.a02_service.A02_JungService7;
import com.web.cookie.a04_Jung.a02_service.A02_JungService8;
import com.web.cookie.a04_Jung.a02_service.A02_JungService9;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Prd_mng_prc01;
import com.web.cookie.a04_Jung.vo.Prdct_mngmn;
import com.web.cookie.a04_Jung.vo.Work_order;

@Controller
public class A01_JungController9 {
@Autowired(required=false)
private A02_JungService9 service;

@Autowired(required=false)
private A02_JungService7 woservice;

@ModelAttribute("wolist")
public List<Work_order> getWork_orderList(){
	return woservice.getWork_orderList(new Work_order());
}
@Autowired(required=false)
private A02_JungService8 pservice;
@ModelAttribute("plist")
public List<Prd_mng_prc01> getPrd_mng_prc01List(){
	return pservice.getPrd_mng_prc01List02(new Prd_mng_prc01());
}

// 제품생산결과관리 CRUD
// http://localhost:5050/Prdct_mngmnList
@RequestMapping("Prdct_mngmnList")
public String Prdct_mngmnList(@ModelAttribute("sch") JungPageSch sch,Model d){
	d.addAttribute("pmlist", service.getJungPage9List(sch));
	return "WEB-INF\\a03_jung\\prdct_mngmn\\a01_prdct_mngmnList.jsp";      
}
// http://localhost:5050/insertPrdct_mngmn
@RequestMapping("insertPrdct_mngmn")
public String insertPrdct_mngmn(Prdct_mngmn ins,Model d) {
	if(ins.getExp_prdStr()!=null) {
		d.addAttribute("msg", service.insertPrdct_mngmn(ins));
	}	
	return "WEB-INF\\a03_jung\\prdct_mngmn\\a03_prdct_mngmnReg.jsp";
}
//http://localhost:5050/Prdct_mngmnDetail?no=1
@GetMapping("Prdct_mngmnDetail")
public String Prdct_mngmnDetail(@RequestParam("no") int no,Model d){
	d.addAttribute("pmlist", service.getPrdct_mngmn(no));
	return "WEB-INF\\a03_jung\\prdct_mngmn\\a02_prdct_mngmnDetail.jsp";
}

// http://localhost:5050/updatePrdct_mngmn
@RequestMapping("updatePrdct_mngmn")
public String updatePrdct_mngmn(Prdct_mngmn upt,Model d) {
	d.addAttribute("pmlist", service.getPrdct_mngmn(upt.getNo()));
	d.addAttribute("msg", service.updatePrdct_mngmn(upt));
	return "WEB-INF\\a03_jung\\prdct_mngmn\\a02_prdct_mngmnDetail.jsp";
}

// http://localhost:5050/deletePrdct_mngmn
@PostMapping("deletePrdct_mngmn")
public String deletePrdct_mngmn(@RequestParam("no") int no,Model d) {
	d.addAttribute("msg", service.deletePrdct_mngmn(no));
	return "WEB-INF\\a03_jung\\prdct_mngmn\\a02_prdct_mngmnDetail.jsp";
}

}
