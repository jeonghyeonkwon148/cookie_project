package com.web.cookie.a01_song.a01_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a01_song.a02_service.MaterialService;
import com.web.cookie.a01_song.a02_service.Material_mngService;
import com.web.cookie.a01_song.a04_vo.Material;
import com.web.cookie.a01_song.a04_vo.Material_mng;
import com.web.cookie.a01_song.a04_vo.Material_mngSch;
import com.web.cookie.a03_yoo.A02_YooService;
import com.web.cookie.a03_yoo.vo.Cookieemp;
import com.web.cookie.a03_yoo.vo.YooPaging;
@Controller
public class Material_mngController {
	@Autowired(required = false)
	private Material_mngService service;
	
	@Autowired(required = false)
	private MaterialService materialService;
	
	@Autowired(required=false)
	private A02_YooService yooService; //사원정보 데이터 가져오기 위한 자동주입
	
	@ModelAttribute("mlist")
	public List<Material> getProdtList(){
		return materialService.getMaterialList(new Material());
	}
	@ModelAttribute("elist")
	public List<Cookieemp> getEmpList(){
		return yooService.searchCEList(new YooPaging());
	}
	
	// http://localhost:5050/material_mngList
	@RequestMapping("material_mngList")
	public String material_mngList(@ModelAttribute("sch") Material_mngSch sch, Model d) {
		d.addAttribute("material_mngList", service.getMaterial_mngList(sch));
		return "WEB-INF\\a01_song\\Material_mng\\a01_material_mngList.jsp";
	}
	// http://localhost:5050/material_mngDetail
	@GetMapping("material_mngDetail")
	public String material_mngDetail(@RequestParam("mng_no") int mng_no,Model d ) {
		d.addAttribute("material_mng", service.getMaterial_mng(mng_no));
		return "WEB-INF\\a01_song\\Material_mng\\a02_material_mngDetail.jsp";
	}
	// http://localhost:5050/insertMaterial_mng
	@RequestMapping("insertMaterial_mng")
	public String insertMaterial_mng(Material_mng ins,Model d) {
		System.out.println(ins.getMnum());
		if(ins.getMnum()!=null) {	
		d.addAttribute("msg", service.insertMaterial_mng(ins));
		}
		return "WEB-INF\\a01_song\\Material_mng\\a03_material_mngReg.jsp";
	}
	// http://localhost:5050/updateMaterial_mng
	@RequestMapping("updateMaterial_mng")
	public String updateMaterial_mng(Material_mng upt,Model d){
		d.addAttribute("msg", service.updateMaterial_mng(upt));
		d.addAttribute("material_mng", service.getMaterial_mng(upt.getMng_no()));
		return "WEB-INF\\a01_song\\Material_mng\\a02_material_mngDetail.jsp";
	}
	// http://localhost:5050/deleteMaterial_mng
	@RequestMapping("deleteMaterial_mng")
	public String deleteMaterial_mng(@RequestParam("mng_no") int mng_no , Model d){
		d.addAttribute("msg", service.deleteMaterial_mng(mng_no));
		return "WEB-INF\\a01_song\\Material_mng\\a02_material_mngDetail.jsp";
	}
}
