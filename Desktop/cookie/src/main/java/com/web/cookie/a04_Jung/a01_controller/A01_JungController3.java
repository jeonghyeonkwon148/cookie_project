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

import com.web.cookie.a01_song.a02_service.MaterialService;
import com.web.cookie.a01_song.a04_vo.Material;
import com.web.cookie.a04_Jung.a02_service.A02_JungService;
import com.web.cookie.a04_Jung.a02_service.A02_JungService3;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Machine_management;
import com.web.cookie.a04_Jung.vo.Prc01;

@Controller
public class A01_JungController3 {
@Autowired(required=false)
private A02_JungService3 service;

@Autowired(required=false)
private A02_JungService dservice;

@Autowired(required=false)
private MaterialService mservice;

@ModelAttribute("mclist")
public List<Machine_management> getMachine_managementList(){
	return dservice.getMachine_managementList(new Machine_management());
}

@ModelAttribute("mlist")
public List<Material> getMaterialList(){
	return mservice.getMaterialList(new Material());
}


// 생산공정 CRUD
// http://localhost:5050/Prc01List
@RequestMapping("Prc01List")
public String Prc01List(@ModelAttribute("sch") JungPageSch sch,Model d){
	d.addAttribute("plist", service.getJungPage3List(sch));
	return "WEB-INF\\a03_jung\\prc01\\a01_prc01List.jsp";
}
// http://localhost:5050/insertPrc01
@RequestMapping("insertPrc01")
public String insertPrc01(Prc01 ins,Model d) {
	if(ins.getPrc_nm()!=null) {
		d.addAttribute("msg", service.insertPrc01(ins));
	}
	return "WEB-INF\\a03_jung\\prc01\\a03_prc01Reg.jsp";
}
//http://localhost:5050/Prc01Detail?prc_id=1
@GetMapping("Prc01Detail")
public String Prc01Detail(@RequestParam("prc_id") int prc_id,Model d){
	d.addAttribute("plist", service.getPrc01(prc_id));
	return "WEB-INF\\a03_jung\\prc01\\a02_prc01Detail.jsp";
}

// http://localhost:5050/updatePrc01
@RequestMapping("updatePrc01")
public String updatePrc01(Prc01 upt,Model d) {
	d.addAttribute("plist", service.getPrc01(upt.getPrc_id()));
	d.addAttribute("msg", service.updatePrc01(upt));
	return "WEB-INF\\a03_jung\\prc01\\a02_prc01Detail.jsp";
}
// http://localhost:5050/deletePrc01
@PostMapping("deletePrc01")
public String deletePrc01(@RequestParam("prc_id") int prc_id,Model d) {
	d.addAttribute("msg", service.deletePrc01(prc_id));
	return "WEB-INF\\a03_jung\\prc01\\a02_prc01Detail.jsp";
}

}
