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

import com.web.cookie.a04_Jung.a02_service.A02_JungService;
import com.web.cookie.a04_Jung.a02_service.A02_JungService2;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Machine_management;
import com.web.cookie.a04_Jung.vo.Periodic_inspection;

@Controller
public class A01_JungController2 {
@Autowired(required=false)
private A02_JungService2 service;

@Autowired(required=false)
private A02_JungService dservice;

@ModelAttribute("mlist")
public List<Machine_management> getMachine_managementList(){
	return dservice.getMachine_managementList(new Machine_management());
}

// 정기검사 CRUD
// http://localhost:5050/Periodic_inspectionList
@RequestMapping("Periodic_inspectionList")
public String Periodic_inspectionList(@ModelAttribute("sch") JungPageSch sch,Model d){
	d.addAttribute("plist", service.getJungPage2List(sch));
	return "WEB-INF\\a03_jung\\periodic_inspection\\a01_periodic_inspectionList.jsp";
}
// http://localhost:5050/insertPeriodic_inspection
@RequestMapping("insertPeriodic_inspection")
public String insertPeriodic_inspection(Periodic_inspection ins,Model d) {
	if(ins.getPrd_ins_itm()!=null) {
		d.addAttribute("msg", service.insertPeriodic_inspection(ins));
	}
	return "WEB-INF\\a03_jung\\periodic_inspection\\a03_periodic_inspectionReg.jsp";
}
//http://localhost:5050/Periodic_inspectionDetail?prd_ins_id=1
@GetMapping("Periodic_inspectionDetail")
public String Periodic_inspectionDetail(@RequestParam("prd_ins_id") int prd_ins_id,Model d){
	d.addAttribute("plist", service.getPeriodic_inspection(prd_ins_id));
	return "WEB-INF\\a03_jung\\periodic_inspection\\a02_periodic_inspectionDetail.jsp";
}

// http://localhost:5050/updatePeriodic_inspection
@RequestMapping("updatePeriodic_inspection")
public String updatePeriodic_inspection(Periodic_inspection upt,Model d) {
	d.addAttribute("plist", service.getPeriodic_inspection(upt.getMch_id()));
	d.addAttribute("msg", service.updatePeriodic_inspection(upt));
	return "WEB-INF\\a03_jung\\periodic_inspection\\a02_periodic_inspectionDetail.jsp";
}
// http://localhost:5050/deletePeriodic_inspection
@PostMapping("deletePeriodic_inspection")
public String deletePeriodic_inspection(@RequestParam("prd_ins_id") int prd_ins_id,Model d) {
	d.addAttribute("msg", service.deletePeriodic_inspection(prd_ins_id));
	return "WEB-INF\\a03_jung\\periodic_inspection\\a02_periodic_inspectionDetail.jsp";
}

}
