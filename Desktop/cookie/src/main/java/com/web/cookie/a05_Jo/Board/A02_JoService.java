package com.web.cookie.a05_Jo.Board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.cookie.a05_Jo.vo.Board;
import com.web.cookie.a05_Jo.vo.BoardFile;
import com.web.cookie.a05_Jo.vo.BoardSch;
import com.web.cookie.a05_Jo.vo.Reply;


@Service
public class A02_JoService {
	@Autowired(required = false)
	private A03_JoDao dao;
	
	@Value("${user.upload}")
	private String path;
	
	
	public List<Board> getBoardList(BoardSch sch){
		if(sch.getSubject()==null) sch.setSubject("");
		if(sch.getWriter()==null) sch.setWriter("");
		sch.setSubject("%"+sch.getSubject()+"%");
		sch.setWriter("%"+sch.getWriter()+"%");
		if(sch.getCategory()==null) sch.setCategory("");
		sch.setCategory("%"+sch.getCategory()+"%");		
		
		
		sch.setCount(dao.getBoardCount(sch));
		if(sch.getPageSize()==0) {
			// 초기값이면 5로 설정
			sch.setPageSize(5);
		}
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		
		if(sch.getCurPage()==0) sch.setCurPage(1);
		
		if(sch.getCurPage()>sch.getPageCount()) sch.setCurPage(sch.getPageCount());
		
		sch.setStart(Math.max(0,(sch.getCurPage()-1)*sch.getPageSize()+1));
		
		int endNo = sch.getCurPage()*sch.getPageSize();	
		
		sch.setEnd(endNo>sch.getCount()?sch.getCount():
		
			sch.getCurPage()*sch.getPageSize());
		
		sch.setBlockSize(5);
		
		int blockNum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		
		sch.setStartBlock(Math.max(0,(blockNum-1)*sch.getBlockSize()+1));
		
		
		int endBlock = blockNum * sch.getBlockSize();
		
		sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
		
		return dao.getBoardList(sch);
	}
	
	public String insertBoard(Board ins) {
		String msg = dao.insertBoard(ins)>0?"게시물 등록 성공\\n":"게시물 등록 실패\\n";
		try {
			int cnt = 0;
			for(MultipartFile mpf : ins.getReports()) {
				if( !mpf.getOriginalFilename().equals("")) {
					String fname = mpf.getOriginalFilename();
					File file = new File(path, fname);
					mpf.transferTo(file);
					cnt += dao.insertBoardFile(new BoardFile(ins.getNo(), fname,
							"게시판파일업로드:"+ins.getSubject()));
				}
			}
			msg += cnt+"건 파일 등록 성공";
		} catch (IllegalStateException e) {
			msg += "[파일 상태예외]"+e.getMessage();	
		} catch (IOException e) {
			msg += "[파일 DB연동예외]"+e.getMessage();
		} catch (Exception e) {
			msg += "[파일 기타예외]"+e.getMessage();
		}

		return msg;
	}
	
	// 댓글 등록
	public Board getBoard(int no) {
		Board b = dao.getBoard(no);
		b.setFlist(dao.getBoardFile(no)); // 파일 리스트 정보 할당..
		return b;
	}
	
	// 댓글 등록
	public Reply getReply(int no) {
		Reply r = dao.getReply(no);
		r.setFlist(dao.getBoardFile(no)); // 파일 리스트 정보 할당..
		return r;
	}	
	
	// 게시글 상세 조회
	public Board getBoardDetail(int no) {
		dao.readCntUpdate(no);
		dao.getBoard(no);
		return getBoard(no);
		
	}
	public String updateBoard(Board upt) {
		
		return dao.updateBoard(upt)>0?"수정 성공":"수정 실패";
	}
	
	public String deleteBoard(int no) {
		
		return dao.deleteBoard(no)>0?"삭제 성공":"삭제 실패";
	}
	// 조회수 증가
	public int updateReadCount(int no) {

		return dao.updateReadCount(no);
	}
	
    // 댓글 리스트 조회
	public List<Reply> getReplyList(int board_no){
		
		return dao.getReplyList(board_no);
	}
	
	/*
    // 댓글 리스트 조회
	public List<Reply> getReplyList(Reply sch){
		
		return dao.getReplyList(sch);
	}
	*/
	// 댓글 등록
	public String insertReply(Reply ins1) {
		
		return dao.insertReply(ins1)>0?"댓글이 성공적으로 등록되었습니다.":"댓글 등록에 실패했습니다.";
	}
	// 댓글 삭제
	public String DeleteReply(int no) {
		
		return dao.DeleteReply(no)>0?"댓글 삭제 성공":"댓글 삭제 실패";
	}
	// 댓글 수정
	public String upReply(Reply upt1) {
		
		return dao.upReply(upt1)>0?"댓글 수정 성공":"댓글 수정 실패";
	}

}
