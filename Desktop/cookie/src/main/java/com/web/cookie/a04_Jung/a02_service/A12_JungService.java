package com.web.cookie.a04_Jung.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.cookie.a04_Jung.a03_repository.A13_JungDao;
import com.web.cookie.a04_Jung.vo.CudVo;
import com.web.cookie.a04_Jung.vo.Dfct_calendar;

@Service
public class A12_JungService {
@Autowired(required=false)
private A13_JungDao dao;

public List<Dfct_calendar> getDfct_calendarList(){
	return dao.getDfct_calendarList();
}
// 화면단에 등록/수정/삭제 메시지 전달, 등록/수정/삭제 후, 전체 리스트도 전달..
public CudVo insertDfct_calendar(Dfct_calendar ins) {
	return new CudVo(dao.insertDfct_calendar(ins)>0?"등록성공":"등록실패",dao.getDfct_calendarList());
}
public  CudVo updateDfct_calendar(Dfct_calendar upt) {
	return new CudVo(dao.updateDfct_calendar(upt)>0?"수정성공":"수정실패",dao.getDfct_calendarList());
}	
public  CudVo deleteDfct_calendar(int id) {
	return new CudVo(dao.deleteDfct_calendar(id)>0?"삭제성공":"삭제실패",dao.getDfct_calendarList());
}


}
