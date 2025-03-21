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

import com.web.cookie.a04_Jung.a02_service.A02_JungService3;
import com.web.cookie.a04_Jung.a02_service.A02_JungService5;
import com.web.cookie.a04_Jung.a02_service.A02_JungService6;
import com.web.cookie.a04_Jung.vo.Dfc_prd01;
import com.web.cookie.a04_Jung.vo.Dfct_calendar;
import com.web.cookie.a04_Jung.vo.Dfct_mngm01;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Prc01;

@Controller
public class A01_JungController6 {
@Autowired(required=false)
private A02_JungService6 service;

@Autowired(required=false)
private A02_JungService3 pservice;

@ModelAttribute("plist")
public List<Prc01> getPrc01List(){
	return pservice.getPrc01List(new Prc01());
}

@Autowired(required=false)
private A02_JungService5 dservice;

@ModelAttribute("dlist")
public List<Dfc_prd01> getDfc_prd01List(){
	return dservice.getDfc_prd01List(new Dfc_prd01());
}

// 불량관리 CRUD
// http://localhost:5050/Dfct_mngm01List
@RequestMapping("Dfct_mngm01List")
public String Dfct_mngm01List(@ModelAttribute("sch") JungPageSch sch,Model d){
	d.addAttribute("flist", service.getJungPage6List(sch));
	return "WEB-INF\\a03_jung\\dfct_mngm01\\a01_dfct_mngm01List.jsp";
}
// http://localhost:5050/insertDfct_mngm01
@RequestMapping("insertDfct_mngm01")
public String insertDfct_mngm01(Dfct_mngm01 ins,Model d) {
	if(ins.getDfct_pic_nm()!=null) {
		d.addAttribute("msg", service.insertDfct_mngm01(ins));
	}
	return "WEB-INF\\a03_jung\\dfct_mngm01\\a03_dfct_mngm01Reg.jsp";
}
// http://localhost:5050/insertDfct_mngm01_2
@RequestMapping("insertDfct_mngm01_2")
public String insertDfct_mngm01_2(Dfct_calendar ins,Model d) {
	if(ins.getDfct_dsps_dateStr()!=null) {
		d.addAttribute("msg", service.insertDfct_mngm01_2(ins));
	}
	return "WEB-INF\\a03_jung\\dfct_mngm01\\a02_dfct_mngm01Detail.jsp";
}
//http://localhost:5050/Dfct_mngm01Detail?dfct_id=1
@GetMapping("Dfct_mngm01Detail")
public String Dfct_mngm01Detail(@RequestParam("dfct_id") int dfct_id,Model d){
	d.addAttribute("flist", service.getDfct_mngm01(dfct_id));
	return "WEB-INF\\a03_jung\\dfct_mngm01\\a02_dfct_mngm01Detail.jsp";
}

// http://localhost:5050/updateDfct_mngm01
@RequestMapping("updateDfct_mngm01")
public String updateDfct_mngm01(Dfct_mngm01 upt,Model d) {
	d.addAttribute("flist", service.getDfct_mngm01(upt.getDfct_id()));
	d.addAttribute("msg", service.updateDfct_mngm01(upt));
	return "WEB-INF\\a03_jung\\dfct_mngm01\\a02_dfct_mngm01Detail.jsp";
}

// http://localhost:5050/deleteDfct_mngm01
@PostMapping("deleteDfct_mngm01")
public String deleteDfct_mngm01(@RequestParam("dfct_id") int dfct_id,Model d) {
	d.addAttribute("msg", service.deleteDfct_mngm01(dfct_id));
	return "WEB-INF\\a03_jung\\dfct_mngm01\\a02_dfct_mngm01Detail.jsp";
}

}
