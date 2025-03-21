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
import com.web.cookie.a04_Jung.a02_service.A02_JungService;
import com.web.cookie.a04_Jung.a02_service.A02_JungService4;
import com.web.cookie.a04_Jung.vo.Defect_type;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Machine_management;

@Controller
public class A01_JungController4 {
@Autowired(required=false)
private A02_JungService4 service;

// 불량유형 CRUD
// http://localhost:5050/Defect_typeList
@RequestMapping("Defect_typeList")
public String Defect_typeList(@ModelAttribute("sch") JungPageSch sch,Model d){
	d.addAttribute("dlist", service.getJungPage4List(sch));
	return "WEB-INF\\a03_jung\\defect_type\\a01_defect_typeList.jsp";
}
// http://localhost:5050/insertDefect_type
@RequestMapping("insertDefect_type")
public String insertDefect_type(Defect_type ins,Model d) {
	if(ins.getDfc_typ()!=null) {
		d.addAttribute("msg", service.insertDefect_type(ins));
	}
	return "WEB-INF\\a03_jung\\defect_type\\a03_defect_typeReg.jsp";
}
//http://localhost:5050/Defect_typeDetail?dfc_typ_id=1
@GetMapping("Defect_typeDetail")
public String Defect_typeDetail(@RequestParam("dfc_typ_id") int dfc_typ_id,Model d){
	d.addAttribute("dlist", service.getDefect_type(dfc_typ_id));
	return "WEB-INF\\a03_jung\\defect_type\\a02_defect_typeDetail.jsp";
}

// http://localhost:5050/updateDefect_type
@RequestMapping("updateDefect_type")
public String updateDefect_type(Defect_type upt,Model d) {
	d.addAttribute("dlist", service.getDefect_type(upt.getDfc_typ_id()));
	d.addAttribute("msg", service.updateDefect_type(upt));
	return "WEB-INF\\a03_jung\\defect_type\\a02_defect_typeDetail.jsp";
}
// http://localhost:5050/deleteDefect_type
@PostMapping("deleteDefect_type")
public String deleteDefect_type(@RequestParam("dfc_typ_id") int dfc_typ_id,Model d) {
	d.addAttribute("msg", service.deleteDefect_type(dfc_typ_id));
	return "WEB-INF\\a03_jung\\defect_type\\a02_defect_typeDetail.jsp";
}

}
