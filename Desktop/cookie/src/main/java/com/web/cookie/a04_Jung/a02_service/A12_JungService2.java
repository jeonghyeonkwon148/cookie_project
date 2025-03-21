package com.web.cookie.a04_Jung.a02_service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.web.cookie.a03_yoo.vo.Cookieemp;
import com.web.cookie.a04_Jung.a03_repository.A13_JungDao2;
import com.web.cookie.a04_Jung.vo.AtnMng;
import com.web.cookie.a04_Jung.vo.JungPageSch;

@Service
public class A12_JungService2 {
@Autowired(required=false)
private A13_JungDao2 dao;
private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    // 매일 00 시마다 등록 처리, 지역 아시아 서울
    @Scheduled(cron = "0 0 0 * * ?", zone="Asia/Seoul")
    public void executeTask() {
    	 System.out.println("Scheduled Task 실행 시간: " + LocalDateTime.now().format(formatter));
    	// sql 실행	
         dao.insertAtnMng2();
    	 
    }
    // 매일 00 시마다 등록 처리, 지역 아시아 서울
    @Scheduled(cron = "0 59 23 * * ?", zone="Asia/Seoul")
    public void executeTask3() {
    	System.out.println("Scheduled Task 실행 시간: " + LocalDateTime.now().format(formatter));
    	// sql 실행	
    	dao.updateAtnMng5();
    }
  /*  
    @Scheduled(fixedRate = 500000)
    public void executeTask2() {
        System.out.println("Scheduled Task 실행 시간(5초마다 실행): " + LocalDateTime.now().format(formatter));
        dao.updateAtnMng5();
    }
    */
    public List<Cookieemp> getTJCookieeempList(){
    	return dao.getTJCookieeempList();
    }
    public List<AtnMng> getJungPage12List(JungPageSch sch){
    	if(sch.getEname()==null) sch.setEname("");;
    	sch.setEname("%"+sch.getEname()+"%");
    	
    	sch.setWtime(sch.getWtime()>=8.0?8.0:sch.getWtime());
    	sch.setExtrawtime(sch.getExtrawtime()>=2.5?2.5:sch.getExtrawtime());
    	// 1. 총데이터 건수 설정.
    	sch.setCount(dao.getJungPageCount12(sch));
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

    	sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
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
    	sch.setStartBlock((blockNum-1)*sch.getBlockSize()+1);
    	// 4. 마지막블럭(예외처리-기본적으로 블럭번호는 블럭번호*블럭의크기로 하는데 정확하게 
    	//    페이지크기 보다 클수 있다.)
    	int endBlock = blockNum * sch.getBlockSize();
    	sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
    	return dao.getJungPage12List(sch);
    }
    public List<AtnMng> getAtnMngList(AtnMng sch){
    	if(sch.getEname()==null) sch.setEname("");;
    	sch.setEname("%"+sch.getEname()+"%");
    	return dao.getAtnMngList(sch);
    }

    public AtnMng getAtnMng(int no) {
    	return dao.getAtnMng(no);
    }
    public String insertAtnMng(AtnMng ins) {
    	return dao.insertAtnMng(ins)>0?"등록성공":"등록실패";
    }
    public String updateAtnMng(AtnMng upt) {
    	return dao.updateAtnMng(upt)>0?"수정성공":"수정실패";
    }
    public String updateAtnMng2(AtnMng upt) {
    	return dao.updateAtnMng2(upt)>0?"출근처리 되었습니다.":"출근처리가 실패했습니다.";
    }
    public String updateAtnMng3(AtnMng upt) {
    	return dao.updateAtnMng3(upt)>0?"퇴근처리 완료되었습니다.":"퇴근처리가 실패하였습니다.";
    }
    public String deleteAtnMng(int no) {
    	return dao.deleteAtnMng(no)>0?"삭제성공":"삭제실패";
    }
    
    
}
