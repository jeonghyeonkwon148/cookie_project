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

import com.web.cookie.a01_song.a02_service.OrderService;
import com.web.cookie.a01_song.a04_vo.OrderJoin;
import com.web.cookie.a01_song.a04_vo.OrderJoinSch;
import com.web.cookie.a04_Jung.a02_service.A02_JungService7;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Work_order;

@Controller
public class A01_JungController7 {
@Autowired(required=false)
private A02_JungService7 service;

@ModelAttribute("wolist")
public List<OrderJoin> getWork_orderList2(){
	return service.getWork_orderList2();
}

@Autowired(required=false)
private OrderService oservice;

@ModelAttribute("olist")
public List<OrderJoin> getOrderJoinList(){
	return oservice.getOrderJoinList(new OrderJoinSch());
}

// 작업지시서 CRUD
// http://localhost:5050/Work_orderList
@RequestMapping("Work_orderList")
public String Work_orderList(@ModelAttribute("sch") JungPageSch sch,Model d){
	d.addAttribute("wlist", service.getJungPage7List(sch));
	return "WEB-INF\\a03_jung\\work_order\\a01_work_orderList.jsp";
}
// http://localhost:5050/insertWork_order
@RequestMapping("insertWork_order")
public String insertWork_order(Work_order ins,Model d) {
	if(ins.getFinal_schdlStr()!=null) {
		d.addAttribute("msg", service.insertWork_order(ins));
	}	
	return "WEB-INF\\a03_jung\\work_order\\a03_work_orderReg.jsp";
}
//http://localhost:5050/Work_orderDetail?workl_id=1
@GetMapping("Work_orderDetail")
public String Work_orderDetail(@RequestParam("workl_id") int workl_id,Model d){
	d.addAttribute("wlist", service.getWork_order(workl_id));
	return "WEB-INF\\a03_jung\\work_order\\a02_work_orderDetail.jsp";
}

// http://localhost:5050/updateWork_order
@RequestMapping("updateWork_order")
public String updateWork_order(Work_order upt,Model d) {
	d.addAttribute("wlist", service.getWork_order(upt.getWorkl_id()));
	d.addAttribute("msg", service.updateWork_order(upt));
	return "WEB-INF\\a03_jung\\work_order\\a02_work_orderDetail.jsp";
}

// http://localhost:5050/deleteWork_order
@PostMapping("deleteWork_order")
public String deleteWork_order(@RequestParam("workl_id") int workl_id,Model d) {
	d.addAttribute("msg", service.deleteWork_order(workl_id));
	return "WEB-INF\\a03_jung\\work_order\\a02_work_orderDetail.jsp";
}

}
