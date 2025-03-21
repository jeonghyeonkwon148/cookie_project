package com.web.cookie.a01_song.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.cookie.a01_song.a03_repository.Material_mngRepository;
import com.web.cookie.a01_song.a04_vo.Material_mng;
import com.web.cookie.a01_song.a04_vo.Material_mngSch;

@Service
public class Material_mngService {
	@Autowired(required = false)
	private Material_mngRepository dao;
	
	public List<Material_mng> getM_mngList(){
		return dao.getM_mngList();
	}
	
	public List<Material_mng>  getMaterial_mngList(Material_mngSch sch){
		if(sch.getMnum()==null) sch.setMnum("");
		sch.setMnum("%"+sch.getMnum()+"%");
		
		// 1. 총데이터 건수 설정.
		sch.setCount(dao.getMaterial_mngCount(sch));
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
	
		return dao.getMaterial_mngList(sch);
	}
	public Material_mng getMaterial_mng(int mng_no) {
		return dao.getMaterial_mng(mng_no);
	}
	public String insertMaterial_mng(Material_mng ins) {
		return dao.insertMaterial_mng(ins)>0?"등록성공":"등록실패";
	}
	public String updateMaterial_mng(Material_mng upt) {
		return dao.updateMaterial_mng(upt)>0?"수정성공":"수정실패";
		
	}
	public String deleteMaterial_mng(int mng_no) {
		return dao.deleteMaterial_mng(mng_no)>0?"삭제성공":"삭제실패";
	}
}
