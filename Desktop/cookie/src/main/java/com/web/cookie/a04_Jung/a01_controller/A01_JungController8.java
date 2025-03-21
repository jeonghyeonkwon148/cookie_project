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
import com.web.cookie.a04_Jung.a02_service.A02_JungService8;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Prc01;
import com.web.cookie.a04_Jung.vo.Prd_mng_prc01;


@Controller
public class A01_JungController8 {
@Autowired(required=false)
private A02_JungService8 service;


@Autowired(required=false)
private A02_JungService3 pservice;

@ModelAttribute("plist")
public List<Prc01> getPrc01List(){
	return pservice.getPrc01List(new Prc01());
}
// insertPrd_mng_prc01
// 공정별 생산관리 CRUD
// http://localhost:5050/Prd_mng_prc01List
@RequestMapping("Prd_mng_prc01List")
public String Prd_mng_prc01List(@ModelAttribute("sch") JungPageSch sch,Model d){
	d.addAttribute("mlist", service.getJungPage8List(sch));
	return "WEB-INF\\a03_jung\\prd_mng_prc01\\a01_prd_mng_prc01List.jsp";
}
// http://localhost:5050/insertPrd_mng_prc01
@RequestMapping("insertPrd_mng_prc01")
public String insertPrd_mng_prc01(Prd_mng_prc01 ins,Model d) {
	System.out.println("#등록처리#");
	
	if(ins.getPrc_id()!=0) {
		d.addAttribute("msg", service.insertPrd_mng_prc01(ins));
	}	
	return "WEB-INF\\a03_jung\\prd_mng_prc01\\a03_prd_mng_prc01Reg.jsp";
}
// http://localhost:5050/insertPrd_mng_prc01_02
@PostMapping("insertPrd_mng_prc01_02")
public String insertPrd_mng_prc01_02(@ModelAttribute("re") Prd_mng_prc01 ins, Model d) {
	ins.setBeprc_nm(ins.getPrc_nm()); // 이전 공정명
	ins.setPrvprd_id_prc(ins.getPrd_id_prc()); // 이전 공정 번호
	ins.setPrv_prd_yld(ins.getPrd_yld()); // 이전 공정 생산량
	ins.setPrv_prd_dateStr(ins.getPrdc_dateStr());// 이전 날짜
	return "WEB-INF\\a03_jung\\prd_mng_prc01\\a03_prd_mng_prc01Reg.jsp";
}
//http://localhost:5050/Prd_mng_prc01Detail?prd_id_prc=1
@GetMapping("Prd_mng_prc01Detail")
public String Prd_mng_prc01Detail(@RequestParam("prd_id_prc") int prd_id_prc,Model d){
	d.addAttribute("mlist", service.getPrd_mng_prc01(prd_id_prc));
	return "WEB-INF\\a03_jung\\prd_mng_prc01\\a02_prd_mng_prc01Detail.jsp";
}

// http://localhost:5050/updatePrd_mng_prc01
@RequestMapping("updatePrd_mng_prc01")
public String updatePrd_mng_prc01(Prd_mng_prc01 upt,Model d) {
	d.addAttribute("mlist", service.getPrd_mng_prc01(upt.getPrd_id_prc()));
	d.addAttribute("msg", service.updatePrd_mng_prc01(upt));
	return "WEB-INF\\a03_jung\\prd_mng_prc01\\a02_prd_mng_prc01Detail.jsp";
}

// http://localhost:5050/deletePrd_mng_prc01
@PostMapping("deletePrd_mng_prc01")
public String deletePrd_mng_prc01(@RequestParam("prd_id_prc") int prd_id_prc,Model d) {
	d.addAttribute("msg", service.deletePrd_mng_prc01(prd_id_prc));
	return "WEB-INF\\a03_jung\\prd_mng_prc01\\a02_prd_mng_prc01Detail.jsp";
}

}
