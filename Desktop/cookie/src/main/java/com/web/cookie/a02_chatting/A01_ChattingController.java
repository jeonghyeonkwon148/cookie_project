package com.web.cookie.a02_chatting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a01_song.a02_service.ChatService;
import com.web.cookie.a01_song.a02_service.CustomerService;
import com.web.cookie.a01_song.a04_vo.Chat;
import com.web.cookie.a01_song.a04_vo.Customer;
import com.web.cookie.a03_yoo.A02_YooService;
import com.web.cookie.a03_yoo.vo.Cookieemp;
import com.web.cookie.a03_yoo.vo.YooPaging;

@Controller
public class A01_ChattingController {
	
	@Value("${socketServer}")
	private String socketServer;
	
	@Autowired(required = false)
	private ChatService service;
	
	@Autowired(required = false)
	private CustomerService customerService;
	
	@Autowired(required = false)
	private A02_YooService yooService;
	
	//http://localhost:5050/chatting
	@GetMapping("chatting")
	public String chatting(Model d) {
		d.addAttribute("socketServer", socketServer);
		return "WEB-INF\\a01_song\\Chatting\\a01_chatting.jsp";
	}
	//http://localhost:5050/customerlist
	@ModelAttribute("customerlist")
	public List<Customer> getcustomerlist(){
		return customerService.getClist();
	}
	@ModelAttribute("elist")
	public List<Cookieemp> getEmpList(){
		return yooService.searchCEList(new YooPaging());
	}
	
	// http://localhost:5050/chat2
	@RequestMapping("chat2")
	public String chat() {
		return "WEB-INF\\a01_song\\Chatting\\a01_chatList.jsp";
	}
	// return "WEB-INF\\a01_song\\Chatting\\a01_chatting.jsp";
	// http://localhost:5050/chatList
	@RequestMapping("chatList")
	public ResponseEntity<?> getChatList(Chat sch){		
		return ResponseEntity.ok(service.getChatList(sch));
	}
	
	
	// http://localhost:5050/chatBySender
	@GetMapping("chatBySender")
	public ResponseEntity<?> chatBySender(@RequestParam("sender") String sender, 
			 Model d){
		
		return ResponseEntity.ok(service.getChatBySender(sender));
	}
	// http://localhost:5050/chatByReceiver
	@GetMapping("chatByReceiver")
	public ResponseEntity<?> chatByReceiver(@RequestParam("receiver") String receiver, 
			 Model d){
		
		return ResponseEntity.ok(service.getChatByReceiver(receiver));
	}
	// http://localhost:3030/chatByChatId
	@GetMapping("chatByChatId")
	public ResponseEntity<?> chatByChatId(@RequestParam("chat_id") int chat_id, Model d){
		return ResponseEntity.ok(service.getChatById(chat_id));
	}
	
	
	
	@RequestMapping("insertChat")
	public ResponseEntity<?> insertChat(Chat ins,Model d){
		return ResponseEntity.ok(service.insertChat(ins));
	}
	
	// http://localhost:3030/deleteChat
	@DeleteMapping("deleteChat")
	public ResponseEntity<?> deleteChat(@RequestParam("chat_id") int chat_id, Model d){
		return ResponseEntity.ok(service.deleteChat(chat_id));
	}
}
