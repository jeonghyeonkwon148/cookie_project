package com.web.cookie.a01_song.a01_controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a01_song.a02_service.CustomerService;
import com.web.cookie.a01_song.a02_service.ProductService;
import com.web.cookie.a01_song.a04_vo.Customer;
import com.web.cookie.a01_song.a04_vo.CustomerSch;
import com.web.cookie.a01_song.a04_vo.Product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {
	@Autowired(required = false)
	private CustomerService service;
	
	@Autowired(required = false)
	private ProductService productServiceservice;
	
	// http://localhost:5050/ctmrLogout
	@GetMapping("ctmrLogout")
	public String ctmrLogout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("customer");
		return "redirect:/ctmrlogin2";
	}
	// http://localhost:5050/ctmrlogin2
	@RequestMapping("ctmrlogin2")
	public String ctmrlogin2(Customer login, Model d, HttpServletRequest request) {
		String page = "WEB-INF\\a01_song\\Customer\\a04_login3.jsp";
		if (login.getManager() != null) {
			Customer customer = service.login(login);
			if (customer == null) {
				d.addAttribute("msg", "로그인실패");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("customer", customer);
				d.addAttribute("msg", "로그인 성공");
				page = "forward:/insertOrder";
			}
		}
		//System.out.println("페이지 이동:" + page);
		return page;
	}

	
	// http://localhost:5050/customerList
	@RequestMapping("customerList")
	public String customerList(@ModelAttribute("sch") CustomerSch sch, Model d) {
		  List<Customer> customers = service.getCustomerList(sch);
	        List<Customer> formattedCustomers = customers.stream().map(customer -> {//리스트를 스트림으로 변환, map 연산은 각 customer 요소를 변환하여 새로운 스트림을 생성
	            String contactNumber = customer.getContact_number();
	            if (contactNumber != null) {
	                String formattedNumber = contactNumber.replaceAll("(\\d{3})(\\d{3})(\\d+)", "$1-$2-$3");
	                customer.setContact_number(formattedNumber);
	            } else {
	                customer.setContact_number("N/A"); // null일 경우 기본값 설정 (선택 사항)
	            }
	            return customer;
	        }).collect(Collectors.toList());//스트림을 리스트로 수집

	        d.addAttribute("customerList", formattedCustomers);
	        return "WEB-INF/a01_song/Customer/a01_customerList.jsp";
	    }
	
		
	
	
	
	
	// http://localhost:5050/customerDetail
	@GetMapping("customerDetail")
	public String customerDetail(@RequestParam("num") int num, Model d) {
		d.addAttribute("customer", service.getCustomerByNum(num));
		return "WEB-INF\\a01_song\\Customer\\a02_customerDetail.jsp";
	}

	// http://localhost:5050/insertCustomer
	@RequestMapping("insertCustomer")
	public String insertCustomer(Customer ins, Model d) {
		if (ins.getCname() != null) {
			d.addAttribute("msg", service.insertCustomer(ins));
		}
		return "WEB-INF\\a01_song\\Customer\\a03_customerReg.jsp";
	}

	// http://localhost:5050/updateCustomer
	@RequestMapping("updateCustomer")
	public String updateCustomer(Customer upt, Model d) {
		d.addAttribute("msg", service.updateCustomer(upt));
		d.addAttribute("customer", service.getCustomerByNum(upt.getNum()));
		return "WEB-INF\\\\a01_song\\\\Customer\\\\a02_customerDetail.jsp";
	}

	// http://localhost:5050/deleteCustomer
	@RequestMapping("deleteCustomer")
	public String deleteCustomer(@RequestParam("num") int num, Model d) {
		d.addAttribute("msg", service.deleteCustomer(num));
		return "WEB-INF\\\\a01_song\\\\Customer\\\\a02_customerDetail.jsp";
	}
	// http://localhost:5050/buyProductList
	@RequestMapping("buyProductList")
	public String buyProductList(Product sch, Model d) {
		d.addAttribute("productList",productServiceservice.getProdtList());
		return "WEB-INF\\a01_song\\Product\\a01_buyProductList.jsp";
	}
}
