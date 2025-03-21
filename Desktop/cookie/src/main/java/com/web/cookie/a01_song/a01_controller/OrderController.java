package com.web.cookie.a01_song.a01_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a01_song.a02_service.CustomerService;
import com.web.cookie.a01_song.a02_service.OrderService;
import com.web.cookie.a01_song.a02_service.ProductService;
import com.web.cookie.a01_song.a04_vo.Customer;
import com.web.cookie.a01_song.a04_vo.Order;
import com.web.cookie.a01_song.a04_vo.OrderJoinSch;
import com.web.cookie.a01_song.a04_vo.Product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
	@Autowired(required = false)
	private OrderService service;
	
	@Autowired(required=false)
	private ProductService prodcutservice;
	
	@Autowired(required=false)
	private CustomerService customerservice;
	
	@ModelAttribute("plist")
	public List<Product> getProdtList(){
		return prodcutservice.getProdtList();
	}
	@ModelAttribute("clist")
	public List<Customer> getCustomerList(){
		return customerservice.getClist();
	}
	
	// http://localhost:5050/orderList
	@RequestMapping("orderList")
	public String orderList(@ModelAttribute("sch") OrderJoinSch sch,Model d) {
		d.addAttribute("orderList", service.getOrderJoinList(sch));
		return "forward:/WEB-INF\\a01_song\\Order\\a01_orderList.jsp";
	}
	// http://localhost:5050/myOrder
	@RequestMapping("myOrder")
	public String myOrder(HttpSession session, Model d) {
		//session.setAttribute("customer", customer);로 저장해둠
		  Customer customer = (Customer)session.getAttribute("customer"); 
		  if(customer== null) { 
			  return "redirect:/ctmrlogin2"; 
			  }		  
		  d.addAttribute("orderList", service.findByCustomer(customer.getNum()));
		  System.out.println(service.findByCustomer(customer.getNum()));
		  //d.addAttribute("customer", customer.getManager());	 
		return "WEB-INF\\a01_song\\Order\\a04_myOrderList.jsp";
	}
	
	// http://localhost:5050/orderDetail
	@GetMapping("orderDetail")
	public String orderDetail(@RequestParam("order_no") int order_no,Model d) {
		d.addAttribute("order", service.getOrder(order_no));
		return "WEB-INF\\a01_song\\Order\\a02_orderDetail.jsp";
	}
	// http://localhost:5050/insertOrder
	@RequestMapping("insertOrder")
	public String insertOrder(Order ins,Model d) {
		if(ins.getDue_dte()!=null) {
			d.addAttribute("msg", service.insertOrder(ins));
		}		
		return "WEB-INF\\a01_song\\Order\\a03_orderReg.jsp";
	}
	// http://localhost:5050/updateOrder
	@RequestMapping("updateOrder")
	public String updateOrder(Order upt, Model d) {
		d.addAttribute("msg", service.updateOrder(upt));
		d.addAttribute("order", service.getOrder(upt.getOrder_no()));
		return "WEB-INF\\a01_song\\Order\\a02_orderDetail.jsp";
	}
	// http://localhost:5050/deleteOrder
	@RequestMapping("deleteOrder")
	public String deleteOrder(@RequestParam("order_no") int order_no,Model d) {
		d.addAttribute("msg", service.deleteOrder(order_no));
		return "WEB-INF\\a01_song\\Order\\a02_orderDetail.jsp";
	}
	
}
