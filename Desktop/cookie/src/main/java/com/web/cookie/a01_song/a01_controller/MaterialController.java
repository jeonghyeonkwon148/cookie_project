package com.web.cookie.a01_song.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a01_song.a02_service.MaterialService;
import com.web.cookie.a01_song.a04_vo.Material;

@Controller
public class MaterialController {
	@Autowired(required = false)
	private MaterialService service;
	
	// http://localhost:5050/materialList
	@RequestMapping("materialList")
	public String materialList(Material sch, Model d) {
		d.addAttribute("materialList", service.getMaterialList(sch));
		return "WEB-INF\\a01_song\\Material\\a01_materialList.jsp";
	}
	// http://localhost:5050/materialDetail
	@GetMapping("materialDetail")
	public String materialDetail(@RequestParam("mnum") int mnum, Model d) {
		d.addAttribute("material", service.getMaterial(mnum));
		return "WEB-INF\\a01_song\\Material\\a02_materialDetail.jsp";		
	}
	// http://localhost:5050/insertMaterial
	@RequestMapping("insertMaterial")
	public String insertMaterial(Material ins,Model d) {
		if(ins.getMname() !=null) {
			d.addAttribute("msg", service.insertMaterial(ins));
		}
		return "WEB-INF\\a01_song\\Material\\a03_materialReg.jsp";
	}
	
	// http://localhost:5050/updateMaterial
	@RequestMapping("updateMaterial")
	public String updateMaterial(Material upt,Model d) {
		d.addAttribute("msg", service.updateMaterial(upt));
		d.addAttribute("material", service.getMaterial(upt.getMnum()));
		return "WEB-INF\\a01_song\\Material\\a02_materialDetail.jsp";
	}
	// http://localhost:5050/deleteMaterial
	@RequestMapping("deleteMaterial")
	public String deleteMaterial(@RequestParam("mnum") int mnum,Model d) {
		d.addAttribute("msg", service.deleteMaterial(mnum));
		return "WEB-INF\\a01_song\\Material\\a02_materialDetail.jsp";
	}
}
