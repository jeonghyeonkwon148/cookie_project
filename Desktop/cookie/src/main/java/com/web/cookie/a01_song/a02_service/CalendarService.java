package com.web.cookie.a01_song.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.cookie.a01_song.a03_repository.CalendarRepository;
import com.web.cookie.a01_song.a04_vo.Calendar;
import com.web.cookie.a01_song.a04_vo.CudVo;

@Service
public class CalendarService {
	@Autowired(required=false)
	private CalendarRepository dao;
	
	public List<Calendar> getCalendarList(){
		return dao.getCalendarList();
	}
	// 화면단에 등록/수정/삭제 메시지 전달, 등록/수정/삭제 후, 전체 리스트도 전달..
	public CudVo insertCalendar(Calendar ins) {
		
		return new CudVo(dao.insertCalendar(ins)>0?"등록성공":"등록실패",dao.getCalendarList());
	}
	public  CudVo updateCalendar(Calendar upt) {
		return new CudVo(dao.updateCalendar(upt)>0?"수정성공":"수정실패",dao.getCalendarList());
	}	
	public  CudVo deleteCalendar(int id) {
		return new CudVo(dao.deleteCalendar(id)>0?"삭제성공":"삭제실패",dao.getCalendarList());
	}
}
