package com.web.cookie.a01_song.a01_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a01_song.a02_service.Prodt_mngService;
import com.web.cookie.a01_song.a02_service.ProductService;
import com.web.cookie.a01_song.a04_vo.Prodt_mng;
import com.web.cookie.a01_song.a04_vo.Prodt_mngSch;
import com.web.cookie.a01_song.a04_vo.Prodt_mngSch;
import com.web.cookie.a01_song.a04_vo.Product;
import com.web.cookie.a03_yoo.A02_YooService;
import com.web.cookie.a03_yoo.vo.Cookieemp;
import com.web.cookie.a03_yoo.vo.YooPaging;
import com.web.cookie.a04_Jung.a02_service.A02_JungService3;
import com.web.cookie.a04_Jung.vo.Prc01;

@Controller
public class Prodt_mngController {
	@Autowired(required = false)
	private Prodt_mngService service;
	
	@Autowired(required=false)
	private ProductService prodcutservice;
	
	@Autowired(required=false)
	private A02_YooService yooService; //사원정보 데이터 가져오기 위한 자동주입
	
	@Autowired(required=false)
	private A02_JungService3 jungService3; //생산 공정 데이터 가져오기 위한 자동주입
	
	@ModelAttribute("plist")
	public List<Product> getProdtList(){
		return prodcutservice.getProdtList();
	}
	@ModelAttribute("elist")
	public List<Cookieemp> getEmpList(){
		return yooService.searchCEList(new YooPaging());
	}
	@ModelAttribute("prclist")
	public List<Prc01> getPrcList(){
		return jungService3.getPrc01List(new Prc01());
	}
	// http://localhost:5050/prodt_mngList
	@RequestMapping("prodt_mngList")
	public String prodt_mngList(@ModelAttribute("sch") Prodt_mngSch sch,Model d) {
		d.addAttribute("prodt_mngList", service.getProdt_mngList(sch));
		return "WEB-INF\\a01_song\\Prodt_mng\\a01_prodt_mngList.jsp";
	}
	
	// http://localhost:5050/prodt_mngDetail
	@GetMapping("prodt_mngDetail")
	public String prodt_mngDetail(@RequestParam("pmng_no") int pmng_no, Model d) {
		d.addAttribute("prodt_mng", service.getProdt_mng(pmng_no));
		return "WEB-INF\\a01_song\\Prodt_mng\\a02_prodt_mngDetail.jsp";
	}
	// http://localhost:5050/insertProdt_mng
	@RequestMapping("insertProdt_mng")
	public String insertProdt_mng(Prodt_mng ins,Model d) {
		if(ins.getInc_rels_dteS()!=null) {
			d.addAttribute("msg", service.insertProdt_mng(ins));
		}
		return "WEB-INF\\a01_song\\Prodt_mng\\a03_prodt_mngReg.jsp";
	}
	// http://localhost:5050/updateProdt_mng
	@RequestMapping("updateProdt_mng")
	public String updateProdt_mng(Prodt_mng upt,Model d) {
		d.addAttribute("msg", service.updateProdt_mng(upt));
		d.addAttribute("prodt_mng", service.getProdt_mng(upt.getPmng_no()));
		return "WEB-INF\\a01_song\\Prodt_mng\\a02_prodt_mngDetail.jsp";
	}
	// http://localhost:5050/deleteProdt_mng
	@RequestMapping("deleteProdt_mng")
	public String deleteProdt_mng(@RequestParam("pmng_no") int pmng_no, Model d) {
		d.addAttribute("msg", service.deleteProdt_mng(pmng_no));
		return "WEB-INF\\a01_song\\Prodt_mng\\a02_prodt_mngDetail.jsp";
	}
}
