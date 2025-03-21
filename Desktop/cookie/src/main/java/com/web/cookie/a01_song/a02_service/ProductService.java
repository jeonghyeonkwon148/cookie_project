package com.web.cookie.a01_song.a02_service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.cookie.a01_song.a03_repository.ProductRepository;
import com.web.cookie.a01_song.a04_vo.CookieFile;
import com.web.cookie.a01_song.a04_vo.Product;
import com.web.cookie.a01_song.a04_vo.ProductSch;

@Service
public class ProductService {
	@Autowired(required = false)
	private ProductRepository dao;
			
	public List<Product> getProdtList(){
		return dao.getProdtList();
	}
	
	public List<Product> getProductList(ProductSch sch){
		if(sch.getPname()==null) sch.setPname("");
		sch.setPname("%"+sch.getPname()+"%");
		
		// 1. 총데이터 건수 설정.
		sch.setCount(dao.getProductCount(sch));
		// 2. 한번에 보일 페이지의 데이터 건수
				if(sch.getPageSize()==0) {
					sch.setPageSize(3);
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
				
		
		return dao.getProductList(sch);		
	}
	@Value("${user.upload}")
	private String path; // 해당 파일 경로 위치가 path에 할당
	
	public String insertProdt(Product ins) {
		String msg = dao.insertProdt(ins)>0?"등록 성공\\n":"등록 실패\\n";
		// 물리적 파일업로드
				//if (ins.getReports() != null && ins.getReports().length > 0) {
					try {
						int cnt=0;
						for (MultipartFile mpf : ins.getReports()) {
							if(	!mpf.getOriginalFilename().equals("") ) {
								String fname = mpf.getOriginalFilename();
								File file = new File(path, fname);
								mpf.transferTo(file);
								cnt += dao.insertCookieFile(new CookieFile(ins.getNo(),fname,
										"제품이미지파일업로드:"+ins.getPname()));
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

				//}
				// DB 등록

				return msg;
			}
	
	// 수정후, 다시 로딩시..
	public Product getProduct(int no) {
		Product b = dao.getProduct(no);// 기본 정보..
		b.setFlist(dao.getCookieFile(no));// 파일 리스트 정보 할당..
		return b;	
	}
	public Product getProductDetail(int no) {
		return getProduct(no);
	}
	
	public String updateProdt(Product upt) {
		
		return dao.updateProdt(upt)>0?"수정성공":"수정실패";
	}
	public String deleteProdt(int no) {
		return dao.deleteProdt(no)>0?"삭제성공":"삭제실패";
	}
		
}
