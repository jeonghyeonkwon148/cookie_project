package com.web.cookie.a05_yoon.a02_CRUD;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a05_yoon.a01_vo.Cust_board;
import com.web.cookie.a05_yoon.a01_vo.Cust_boardsch;

@Controller
public class A01_controller {

	@Autowired(required=false)
	private A02_service service;
	
	// http://localhost:5050/yoon_boardList
	@RequestMapping("/yoon_boardList")
	public String yoon_boardList(@ModelAttribute("sch") Cust_boardsch sch, Model d) {
		d.addAttribute("boardList", service.getBoardList(sch));
		return "WEB-INF\\a04_yoon\\a01_boardList.jsp";
	}
	// http://localhost:5050/yoon_boardInsert
	@RequestMapping("yoon_boardInsert")
	public String yoon_boardInsert(Cust_board ins, Model d) {
		if(ins.getSubject()!=null ) {
			d.addAttribute("msg", service.insertBoard(ins));
		}
		return "WEB-INF\\a04_yoon\\a02_boardInsert.jsp";
	}
	// http://localhost:5050/yoon_boardReply
	@PostMapping("yoon_boardReply")
	public String yoon_replyForm(@ModelAttribute("re") Cust_board ins, Model d) {
		ins.setRefno(ins.getNo()); // 이전글 번호
		ins.setSubject("RE:"+ins.getSubject());
		ins.setContent("\n\n\n\n\n==== 이전글 ===\n"+ins.getContent());
		// ${board.refno}  ${board.subject}  ${board.content}
		return "WEB-INF\\a04_yoon\\a02_boardInsert.jsp";
	}
	// http://localhost:5050/yoon_boardDetail?no=1
	@GetMapping("yoon_boardDetail")
	public String yoon_boardDetail(@RequestParam("no") int no, Model d) {
		d.addAttribute("board", service.getBoardDetail(no));
		return "WEB-INF\\a04_yoon\\a03_boardDetail.jsp";
	}
	// http://localhost:5050/yoon_boardUpdate
	@PostMapping("yoon_boardUpdate")
	public String yoon_boardUpdate(Cust_board upt, Model d) {
		d.addAttribute("msg", service.updateBoard(upt));
		// 수정이후에 데이터를 상세회면에서 데이터를 확인해야되기 때문에 필요..
		d.addAttribute("board", service.getBoard(upt.getNo()));
		return "WEB-INF\\a04_yoon\\a03_boardDetail.jsp";
	}	
	// http://localhost:5050/yoon_boardDelete
	@PostMapping("yoon_boardDelete")
	public String yoon_boardDelete(@RequestParam("no") int no, Model d) {
		d.addAttribute("msg", service.deleteBoard(no));
		return "WEB-INF\\a04_yoon\\a03_boardDetail.jsp";
	}
}
