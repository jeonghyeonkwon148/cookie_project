package com.web.cookie.a04_Jung.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.cookie.a01_song.a04_vo.OrderJoin;
import com.web.cookie.a04_Jung.a03_repository.A03_JungDao7;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Work_order;



@Service
public class A02_JungService7 {
@Autowired(required=false)
private A03_JungDao7 dao;

//작업지시서 CRUD
public List<Work_order> getJungPage7List(JungPageSch sch){
	if(sch.getPname()==null) sch.setPname("");;
	sch.setPname("%"+sch.getPname()+"%");
	
	// 1. 총데이터 건수 설정.
	sch.setCount(dao.getJungPageCount7(sch));
	// 2. 한번에 보일 페이지의 데이터 건수
	if(sch.getPageSize()==0) {
		sch.setPageSize(5);
	}
	// 3. 총페이지 수..(총데이터건수/한번에 보일 데이터 건수)
	sch.setPageCount((int)Math.ceil(  sch.getCount()/(double)sch.getPageSize() ));
	
	if(sch.getCurPage()==0)
		sch.setCurPage(1);
	if(sch.getCurPage()>sch.getPageCount())
		sch.setCurPage(sch.getPageCount()); //예를 들어, 총 10페이지의 데이터가 있고 현재 페이지가 11인 경우를 생각해봅시다
	//따라서, 페이지 번호가 11인 경우, 코드는 sch.setCurPage(10);을 실행하여 현재 페이지를 10으로 설정합니다.

	sch.setStart(Math.max(0,(sch.getCurPage()-1)*sch.getPageSize()+1));
	/// 마지막페이지 : 현재클릭한페이지번호 * 선택한페이지의크기
	//  DB에서 자동 처리해주나, 정확한 로직 처리를 위해
	int endNo = sch.getCurPage()*sch.getPageSize(); //현재페이지의 끝 번호를 계산
	sch.setEnd(endNo>sch.getCount()?sch.getCount():
							sch.getCurPage()*sch.getPageSize()); 
	// 페이지 블럭 처리
	// 1. 블럭 크기 설정.
	sch.setBlockSize(5);
	// 2. 블럭 번호 = 올림(현재페이지번호/블럭의크기)
	int blockNum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
	// 3. 시작 블럭
	sch.setStartBlock(Math.max(0,(blockNum-1)*sch.getBlockSize()+1));
	// 4. 마지막블럭(예외처리-기본적으로 블럭번호는 블럭번호*블럭의크기로 하는데 정확하게 
	//    페이지크기 보다 클수 있다.)
	int endBlock = blockNum * sch.getBlockSize();
	sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
	
	return dao.getJungPage7List(sch);
}
public List<Work_order> getWork_orderList(Work_order sch){
	if(sch.getPname()==null) sch.setPname("");;
	sch.setPname("%"+sch.getPname()+"%");
	return dao.getWork_orderList(sch);
}

public List<OrderJoin> getWork_orderList2(){
	return dao.getWork_orderList2();
}


public Work_order getWork_order(int workl_id) {
	return dao.getWork_order(workl_id);
}
public String insertWork_order(Work_order ins) {
	return dao.insertWork_order(ins)>0?"등록성공":"등록실패";
}
public String updateWork_order(Work_order upt) {
	return dao.updateWork_order(upt)>0?"수정성공":"수정실패";
}
@Transactional
public String deleteWork_order(int workl_id) {
	dao.deletePrdct_mngmn3(workl_id);
	return dao.deleteWork_order(workl_id)>0?"삭제성공":"삭제실패";
}


}
