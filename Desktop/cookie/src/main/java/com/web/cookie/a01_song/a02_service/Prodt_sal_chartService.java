package com.web.cookie.a01_song.a02_service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.cookie.a01_song.a03_repository.Prodt_sal_chartRepository;
import com.web.cookie.a01_song.a04_vo.Prodt_sal_chart;

@Service
public class Prodt_sal_chartService {
	
	@Autowired(required = false)
	private Prodt_sal_chartRepository dao;
	
	public List<Prodt_sal_chart> getProdt_sal_chartList(Prodt_sal_chart sch){
		if(sch.getSal_month()==null) sch.setSal_month("");
		sch.setSal_month("%"+sch.getSal_month()+"%");
		return dao.getProdt_sal_chartList(sch);
	}
	public Prodt_sal_chart getChart(int num) {
		return dao.getChart(num);
	}
	public String ckNum(int num) {
		return dao.ckNum(num)>0?"등록된 번호가 있습니다!":"";
	}
	public String insertChart(Prodt_sal_chart ins) {
		return dao.insertChart(ins)>0?"등록성공":"등록실패";
	}
	public String updateChart(Prodt_sal_chart upt) {
		return dao.updateChart(upt)>0?"수정성공":"수정실패";
	}
	public String deleteChart(int num) {
		return dao.deleteChart(num)>0?"삭제성공":"삭제실패";
	}
}
