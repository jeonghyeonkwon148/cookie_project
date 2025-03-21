package com.web.cookie.a04_Jung.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a04_Jung.a02_service.A02_JungService;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Machine_management;

@Controller
public class A01_JungController {
@Autowired(required=false)
private A02_JungService service;
// 기계관리 CRUD
// http://localhost:5050/Machine_managementList
@RequestMapping("Machine_managementList")
public String Machine_managementList(@ModelAttribute("sch") JungPageSch sch,Model d){
	d.addAttribute("mlist", service.getJungPage1List(sch));
	return "WEB-INF\\a03_jung\\machine_management\\a01_machine_managementList.jsp";
}
// http://localhost:5050/insertMachine_management
@RequestMapping("insertMachine_management")
public String insertMachine_management(Machine_management ins,Model d) {
	if(ins.getMch_nm()!=null) {
	d.addAttribute("msg", service.insertMachine_management(ins));
	}
	return "WEB-INF\\a03_jung\\machine_management\\a03_machine_managementReg.jsp";
}
//http://localhost:5050/Machine_managementDetail?mch_id=1
@GetMapping("Machine_managementDetail")
public String Machine_managementDetail(@RequestParam("mch_id") int mch_id,Model d){
	d.addAttribute("mlist", service.getMachine_management(mch_id));
	return "WEB-INF\\a03_jung\\machine_management\\a02_machine_managementDetail.jsp";
}

// http://localhost:5050/updateMachine_management
@RequestMapping("updateMachine_management")
public String updateMachine_management(Machine_management upt,Model d) {
	d.addAttribute("mlist", service.getMachine_management(upt.getMch_id()));
	d.addAttribute("msg", service.updateMachine_management(upt));
	return "WEB-INF\\a03_jung\\machine_management\\a02_machine_managementDetail.jsp";
}
// http://localhost:5050/deleteMachine_management
@PostMapping("deleteMachine_management")
public String deleteMachine_management(@RequestParam("mch_id") int mch_id,Model d) {
	d.addAttribute("msg", service.deleteMachine_management(mch_id));
	return "WEB-INF\\a03_jung\\machine_management\\a02_machine_managementDetail.jsp";
}


}
