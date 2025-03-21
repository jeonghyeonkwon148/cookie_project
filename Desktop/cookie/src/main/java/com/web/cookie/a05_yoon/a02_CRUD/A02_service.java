package com.web.cookie.a05_yoon.a02_CRUD;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.cookie.a05_yoon.a01_vo.Cust_board;
import com.web.cookie.a05_yoon.a01_vo.Cust_boardfile;
import com.web.cookie.a05_yoon.a01_vo.Cust_boardsch;

@Service
public class A02_service {

	@Autowired(required=false)
	private A03_repository dao;
	
	public List<Cust_board> getBoardList(Cust_boardsch sch) {
		if (sch.getSubject() == null)
			sch.setSubject("");
		if (sch.getWriter() == null)
			sch.setWriter("");
		sch.setSubject("%" + sch.getSubject() + "%");
		sch.setWriter("%" + sch.getWriter() + "%");
		sch.setCount(dao.getBoardCount(sch));
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
		}
		sch.setPageCount((int)Math.ceil(  sch.getCount()/(double)sch.getPageSize() ));
		if(sch.getCurPage()==0)
			sch.setCurPage(1);
		if(sch.getCurPage()>sch.getPageCount())
			sch.setCurPage(sch.getPageCount());
		sch.setStart(Math.max(0,(sch.getCurPage()-1)*sch.getPageSize()+1));
		int endNo = sch.getCurPage()*sch.getPageSize();
		sch.setEnd(endNo>sch.getCount()?sch.getCount():
								sch.getCurPage()*sch.getPageSize()); 
		sch.setBlockSize(10);
		int blockNum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		sch.setStartBlock(Math.max(0,(blockNum-1)*sch.getBlockSize()+1));
		int endBlock = blockNum * sch.getBlockSize();
		sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
		return dao.getBoardList(sch);
	}
	@Value("${user.upload}")
	private String path;

	public String insertBoard(Cust_board ins) {
		String msg = dao.insertBoard(ins)>0?"게시물 등록 성공\\n":"게시물 등록 실패\\n";
			try {
				int cnt=0;
				for (MultipartFile mpf : ins.getReports()) {
					if(	!mpf.getOriginalFilename().equals("") ) {
						String fname = mpf.getOriginalFilename();
						File file = new File(path, fname);
						mpf.transferTo(file);
						cnt += dao.insertBoardFile(new Cust_boardfile(ins.getNo(),fname,
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
	// 수정후, 다시 로딩시..
	public 	Cust_board getBoard(int no) {
		Cust_board b = dao.getBoard(no); // 기본 정보..
		b.setFlist(dao.getBoardFile(no)); // 파일 리스트 정보 할당..
		return b;
	}
	// list에서 상세 조회시..
	public 	Cust_board getBoardDetail(int no) {
		// 상세 조회시 조회 카운트 업..
		dao.readCntUpdate(no);
		return getBoard(no);
	}	
	public String updateBoard(Cust_board upt) {
		return dao.updateBoard(upt)>0?"수정성공":"수정실패";
	}	
	public String deleteBoard(int no) {
		return dao.deleteBoard(no)>0?"삭제성공":"삭제실패";
	} 
}
