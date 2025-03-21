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
import com.web.cookie.a04_Jung.a02_service.A02_JungService4;
import com.web.cookie.a04_Jung.a02_service.A02_JungService5;
import com.web.cookie.a04_Jung.vo.Defect_type;
import com.web.cookie.a04_Jung.vo.Dfc_prd01;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Prc01;

@Controller
public class A01_JungController5 {
@Autowired(required=false)
private A02_JungService5 service;

@Autowired(required=false)
private A02_JungService3 pservice;

@ModelAttribute("plist")
public List<Prc01> getPrc01List(){
	return pservice.getPrc01List(new Prc01());
}

@Autowired(required=false)
private A02_JungService4 dservice;

@ModelAttribute("dlist")
public List<Defect_type> getDefect_typeList(){
	return dservice.getDefect_typeList(new Defect_type());
}

// 실시간 불량리스트 CRUD
// http://localhost:5050/Dfc_prd01List
@RequestMapping("Dfc_prd01List")
public String Dfc_prd01List(@ModelAttribute("sch") JungPageSch sch,Model d){
	d.addAttribute("flist", service.getJungPage5List(sch));
	return "WEB-INF\\a03_jung\\dfc_prd01\\a01_dfc_prd01List.jsp";
}
// http://localhost:5050/insertDfc_prd01
@RequestMapping("insertDfc_prd01")
public String insertDfc_prd01(Dfc_prd01 ins,Model d) {
	if(ins.getDfc_prd_cnfr_name()!=null) {
		d.addAttribute("msg", service.insertDfc_prd01(ins));
	}
	return "WEB-INF\\a03_jung\\dfc_prd01\\a03_dfc_prd01Reg.jsp";
}
//http://localhost:5050/Dfc_prd01Detail?dfc_prd_id=1
@GetMapping("Dfc_prd01Detail")
public String Dfc_prd01Detail(@RequestParam("dfc_prd_id") int dfc_prd_id,Model d){
	d.addAttribute("flist", service.getDfc_prd01(dfc_prd_id));
	return "WEB-INF\\a03_jung\\dfc_prd01\\a02_dfc_prd01Detail.jsp";
}

// http://localhost:5050/updateDfc_prd01
@RequestMapping("updateDfc_prd01")
public String updateDfc_prd01(Dfc_prd01 upt,Model d) {
	d.addAttribute("flist", service.getDfc_prd01(upt.getDfc_prd_id()));
	d.addAttribute("msg", service.updateDfc_prd01(upt));
	return "WEB-INF\\a03_jung\\dfc_prd01\\a02_dfc_prd01Detail.jsp";
}
// http://localhost:5050/deleteDfc_prd01
@PostMapping("deleteDfc_prd01")
public String deleteDfc_prd01(@RequestParam("dfc_prd_id") int dfc_prd_id,Model d) {
	d.addAttribute("msg", service.deleteDfc_prd01(dfc_prd_id));
	return "WEB-INF\\a03_jung\\dfc_prd01\\a02_dfc_prd01Detail.jsp";
}

}
