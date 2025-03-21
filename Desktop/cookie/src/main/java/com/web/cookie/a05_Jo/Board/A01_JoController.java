package com.web.cookie.a05_Jo.Board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a05_Jo.vo.Board;
import com.web.cookie.a05_Jo.vo.BoardSch;
import com.web.cookie.a05_Jo.vo.Reply;



@Controller	
public class A01_JoController {
	@Autowired(required = false)
	private A02_JoService service;
	
	// http://localhost:5050/joboardList
	@RequestMapping("/joboardList")
	public String joboardList(@ModelAttribute("sch") BoardSch sch, Model d) {
		d.addAttribute("joboardList", service.getBoardList(sch));
		
		return "WEB-INF\\a04_Jo\\a01_boardList.jsp";
	}
	// http://localhost:5050/joboardReply
	@PostMapping("joboardReply")
	public String joreplyForm(@ModelAttribute("re") Board ins, Model d) {
		ins.setRefno(ins.getNo()); // 이전글 번호
		ins.setSubject(ins.getSubject());
		ins.setContent(ins.getContent());
		return "WEB-INF\\a04_Jo\\a03_boardDetail.jsp";
	}
	
	// 댓글 등록
	// http://localhost:5050/joboardReInsert
	@PostMapping("/joboardReInsert")

    public String joboardReInsert(@ModelAttribute("re1") Reply ins1, Model d) {
		
		d.addAttribute("msg", service.insertReply(ins1));
		
		d.addAttribute("board", service.getBoardDetail(ins1.getBoard_no()));
		d.addAttribute("replyList", service.getReplyList(ins1.getBoard_no())); 
		
        return "WEB-INF\\a04_Jo\\a03_boardDetail.jsp";
	}

	// http://localhost:5050/joboardDetail?no=1
	@GetMapping("joboardDetail")
	public String joboardDetail1(@RequestParam("no") int no, Model d) {
		// 게시글 조회 후 조회수 업데이트
		service.updateReadCount(no);
		
		// 게시글 상세 정보 조회
		d.addAttribute("board", service.getBoardDetail(no));
		
		// 해당 게시글의 댓글 리스트 조회
		d.addAttribute("replyList", service.getReplyList(no)); 
		
		// 해당 게시글의 댓글 등록
		//d.addAttribute("insertReply", service.insertReply(no));
		 
		
		return "WEB-INF\\a04_Jo\\a03_boardDetail.jsp";
	}
	
	
	// http://localhost:5050/joboardInsert
	@RequestMapping("joboardInsert")
	public String joboardInsert(Board ins, Model d) {
		if(ins.getSubject()!=null) {
			d.addAttribute("msg", service.insertBoard(ins));
		}
		
		return "WEB-INF\\a04_Jo\\a02_boardInsert.jsp";
	}

	
	// http://localhost:5050/joboardUpdate
	@PostMapping("joboardUpdate")
	public String joboardUpdate(Board upt, Model d) {
		d.addAttribute("msg", service.updateBoard(upt));
		d.addAttribute("board", service.getBoard(upt.getNo()));
		d.addAttribute("replyList", service.getReplyList(upt.getNo()));
		return "WEB-INF\\a04_Jo\\a03_boardDetail.jsp";
	}
	
	// http://localhost:5050/joboardDelete
	@PostMapping("joboardDelete")
	public String joboardDelete(@RequestParam("no") int no, Model d) {
		d.addAttribute("msg", service.deleteBoard(no));
		return "WEB-INF\\a04_Jo\\a03_boardDetail.jsp";
	}
	// http://localhost:5050/joupdateReadCount
	@RequestMapping("/joreadBoard")
	public String joreadBoard(@RequestParam("no") int no, Model d) {
		d.addAttribute("msg", service.updateReadCount(no));
		return "WEB-INF\\a04_Jo\\a01_boardList.jsp";
	}
	// http://localhost:5050/joupdateRead
	@RequestMapping("/joupdateRead")
	public String joupdateRead(@RequestParam("no") int no, Model d) {
		d.addAttribute("msg", service.updateReadCount(no));
		return "success";
	}
	
	// 댓글 수정
	// http://localhost:5050/joReplyUpdate
	@PostMapping("joReplyUpdate")
	public String joReplyUpdate(Reply upt1, Model d) {
		d.addAttribute("msg", service.upReply(upt1));

		d.addAttribute("replyList", service.getReplyList(upt1.getNo()));

		
		return "WEB-INF\\a04_Jo\\a03_boardDetail.jsp";
	}

	// 댓글 삭제
	// http://localhost:5050/joReplyDelete
	@PostMapping("joReplyDelete")
	public String joReplyDelete(@RequestParam("no") int no, Model d) {
		d.addAttribute("msg", service.DeleteReply(no));
		
		
		
		return "WEB-INF\\a04_Jo\\a03_boardDetail.jsp";
	}	
	


	
	/*
	// http://localhost:3030/ajaxDeptList 
	@RequestMapping("ajaxDeptList")
	public ResponseEntity<?> ajaxDeptList(Dept sch){
		return ResponseEntity.ok(service.getDeptList(sch));
	} 
	 * */
	
	
}
