package com.web.cookie.a01_song.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a01_song.a02_service.ProductService;
import com.web.cookie.a01_song.a04_vo.Product;
import com.web.cookie.a01_song.a04_vo.ProductSch;

@Controller
public class ProductController {
	@Autowired(required = false)
	private ProductService service;
	
	
	// http://localhost:5050/productList
	@RequestMapping("productList")
	public String productList(@ModelAttribute("sch") ProductSch sch, Model d) {
		d.addAttribute("productList", service.getProductList(sch));
		return "WEB-INF\\a01_song\\Product\\a01_productList.jsp";
	}

	// http://localhost:5050/productDetail
	@GetMapping("productDetail")
	public String productDetail(@RequestParam("no") int no, Model d) {
		d.addAttribute("product", service.getProductDetail(no));
		return "WEB-INF\\a01_song\\Product\\a02_productDetail.jsp";
	}

	// http://localhost:5050/insertProdt
	@RequestMapping("insertProdt")
	public String insertProdt(Product ins, Model d) {
		if (ins.getPname() != null) {
			d.addAttribute("msg", service.insertProdt(ins));
		}
		return "WEB-INF\\a01_song\\Product\\a03_productReg.jsp";
	}

	// http://localhost:5050/updateProdt
	@RequestMapping("updateProdt")
	public String updateProdt(Product upt, Model d) {
		d.addAttribute("msg", service.updateProdt(upt));
		d.addAttribute("product", service.getProduct(upt.getNo()));

		return "WEB-INF\\\\a01_song\\\\Product\\\\a02_productDetail.jsp";
	}

	// http://localhost:5050/deleteProdt
	@RequestMapping("deleteProdt")
	public String deleteProdt(@RequestParam("no") int no, Model d) {
		d.addAttribute("msg", service.deleteProdt(no));
		return "WEB-INF\\\\\\\\a01_song\\\\\\\\Product\\\\\\\\a02_productDetail.jsp";

	}
}
