package com.web.cookie.a01_song.a02_service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.cookie.a01_song.a03_repository.MaterialRepository;
import com.web.cookie.a01_song.a04_vo.Material;

@Service
public class MaterialService {
	@Autowired(required = false)
	private MaterialRepository dao;
	
	public List<Material> getMaterialList(Material sch){
		if(sch.getMname()==null) sch.setMname("");
		sch.setMname("%"+sch.getMname()+"%");
		return dao.getMaterialList(sch);		
	}
	
	public Material getMaterial(int mnum) {
		return dao.getMaterial(mnum);	
	}
	
	public String insertMaterial(Material ins) {
		return dao.insertMaterial(ins)>0?"등록성공":"등록실패";	
	}
	
	public String updateMaterial(Material upt) {
		return dao.updateMaterial(upt)>0?"수정성공":"수정실패";	
	}
	
	public String deleteMaterial(int mnum) {
		return dao.deleteMaterial(mnum)>0?"삭제성공":"삭제실패";		
	}
	
	
}
