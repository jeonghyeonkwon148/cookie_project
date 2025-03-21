package com.web.cookie.a03_yoo;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.cookie.a03_yoo.vo.CKECudVo;
import com.web.cookie.a03_yoo.vo.Cookieemp;
import com.web.cookie.a03_yoo.vo.Cookieempmsg;
import com.web.cookie.a03_yoo.vo.Cookieidcal;
import com.web.cookie.a03_yoo.vo.MNBFiles;
import com.web.cookie.a03_yoo.vo.YooPaging;

@Service
public class A02_YooService {
	@Autowired(required = false)
	private A03_YooDao dao;
	
	//로그인
	public Cookieemp cookieLogin(Cookieemp login) {
		if(login.getPwd()==null) {
			login.setPwd("");
		}
		return dao.cookieLogin(login);
	}
	// 비밀번호 변경
	public String cookieUdtPwd(Cookieemp udtPwd) {
		System.out.println(udtPwd.getEmpno());
		System.out.println(udtPwd.getEname());
		System.out.println(udtPwd.getPwd());
		System.out.println(udtPwd.getPwdupt());
		return dao.cookieUdtPwd(udtPwd)>0?"비밀번호가 변경되었습니다":"실패";
	}
	
	// 페이징처리 작업
		public YooPaging pagingProcess(YooPaging sch) {
			
		// 한번에 보일 데이터 수
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		
		// 총 페이지 수
		sch.setPageCount(((sch.getCount()-1)/sch.getPageSize())+1);
		
		if(sch.getCurPage()==0) {sch.setCurPage(1);}
		if(sch.getCurPage()>sch.getPageCount()) {sch.setCurPage(sch.getPageCount());}
		
		
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		//  DB에서 자동 처리해주나, 정확한 로직 처리를 위해
		// sch.setEnd(sch.getCurPage()*sch.getPageSize());
		int endNo = sch.getCurPage()*sch.getPageSize();
		sch.setEnd(endNo>sch.getCount()?sch.getCount():
								sch.getCurPage()*sch.getPageSize()); 
		
		// 보일 페이지번호 개수(페이지 번호들을 하나의 블럭으로 처리)
		sch.setBlockSize(5); // 내가 결정하는 수
		// 블럭의 번호
		int blockNum = ((sch.getCurPage()-1)/sch.getBlockSize())+1;
		// 블럭의 시작 페이지 번호 설정
		sch.setStartBlock((blockNum-1)*sch.getBlockSize()+1);
		// 블럭의 끝 페이지번호 설정
		int endBlock = blockNum*sch.getBlockSize();
		// 끝 페이지 번호가 실제 페이지 번호보다 클 수 있음
		sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
		
		return sch;
	}
	
	// 사원리스트검색
	public List<Cookieemp> searchCEList(YooPaging sch){
		
		searchCEListPage(sch);
		
		return dao.searchCEList(sch);
	}
	
	public YooPaging searchCEListPage(YooPaging sch) {
		
		if(sch.getEname()==null) {sch.setEname("");}
		if(sch.getDeptno()==null) {sch.setDeptno("%%");}
		sch.setEname("%"+sch.getEname()+"%");
		
		// 총 데이터 수를 count(데이터의 총 수)에 할당
		sch.setCount(dao.getEmpCount(sch));
		
		// 페이징처리 작업
		pagingProcess(sch);
		
		return sch;
	}
	
	// 사원정보검색
	public Cookieemp searchCEmp(int empno){
		return dao.searchCEmp(empno);
	}
	
	// 부서목록 호출
	public List<Cookieemp> getCookieDept() {
		return dao.getCookieDept();
	}
	
	// 사원 등록
	public String insertCookieEmp(Cookieemp ins) {
		return dao.insertCookieEmp(ins)>0?"사원 등록이 정상적으로 처리되었습니다":"사원등록실패";
	}
	
	// 사원 정보 수정
	public String updateCookieEmp(Cookieemp udt) {
		return dao.updateCookieEmp(udt)>0?"사원 정보 수정이 정상적으로 처리되었습니다":"사원수정실패";
	}
	
	// 사원 정보 삭제
	public String deleteCookieEmp(Cookieemp del) {
		try {
			return dao.deleteCookieEmp(del)>0?
					"사원 정보 삭제가 정상적으로 처리되었습니다":"사원삭제실패 : 수정된 값이 0";
		} catch (Exception e) {
			System.out.println("에러 발생"+e.getMessage());
			return "사원삭제실패 : 삭제할 수 없는 사원입니다\n원인 예 : 일정 기록이 남아있음";
		}
	}
	
	// 부서별 사원 리스트
	public List<Cookieemp> getCookieEmpsByDept(){
		return dao.getCookieEmpsByDept();
	}
	
	// 부서 등록
	public String insertCookieDept(Cookieemp ins) {
		String msg = "중복된 부서번호가 있습니다\n다른 부서번호를 입력하세요";
		if(dao.chkSameDeptno(ins)==0) {
			msg = dao.insertCookieDept(ins)>0?"부서 등록이 정상적으로 처리되었습니다":"부서등록실패";
		}
		return msg;
	}
	
	// 부서 정보 수정
	public String updateCookieDept(Cookieemp udt) {
		return dao.updateCookieDept(udt)>0?"부서 정보 수정이 정상적으로 처리되었습니다":"부서수정실패";
	}
	
	// 부서 정보 삭제
	public String deleteCookieDept(int deptno) {
		String msg = "부서에 등록된 사원이 있습니다\n사원이 없는 부서만 삭제 가능합니다";
		if(dao.chkDeptEmp(deptno)==0) {
			msg = dao.deleteCookieDept(deptno)>0?
					"부서 정보 삭제가 정상적으로 처리되었습니다":"부서삭제실패";
		}
		return msg;
	}
	
	// 부서번호별 사원목록
	public List<Cookieemp> getCookieEmpsByDeptno(int deptno) {
		return dao.getCookieEmpsByDeptno(deptno);
	}

	// 부서 직급 수정
	public String updateDeptNAuth(Cookieemp udt) {
		return dao.updateDeptNAuth(udt)>0?"사원 정보 수정이 정상적으로 처리되었습니다":"수정실패";
	}
	
	// 메세지검색
	public List<Cookieempmsg> searchMsgList(YooPaging sch){
		
		List<Cookieempmsg> mList = new ArrayList<>();
		
		searchMsgListPage(sch);
		
		if(sch.getSendOrRecieve()==1){
			//모든
			mList = dao.getCookieEmpAMsg(sch);
		}else if(sch.getSendOrRecieve()==2){
			//보낸
			mList = dao.getCookieEmpSMsg(sch);
		}else if(sch.getSendOrRecieve()==3){
			//받은
			mList = dao.getCookieEmpRMsg(sch);
		}
		
		return mList;
	}
	
	public YooPaging searchMsgListPage(YooPaging sch) {
		
		if (sch.getSendOrRecieve()==0){sch.setSendOrRecieve(1);}
		
		if(sch.getEname()==null) {sch.setEname("");}
		sch.setEname("%"+sch.getEname()+"%");
		
		if(sch.getSendOrRecieve()==1){
			//모든
			sch.setCount(dao.getAMessageCount(sch));
		}else if(sch.getSendOrRecieve()==2){
			//보낸
			sch.setCount(dao.getSMessageCount(sch));
		}else if(sch.getSendOrRecieve()==3){
			//받은 메세지 총 수
			sch.setCount(dao.getRMessageCount(sch));
		}
		
		// 페이징처리 작업
		pagingProcess(sch);
		
		return sch;
	}
	
	// 사원 간단하게 검색
	public List<Cookieemp> getCookieEmpSimple(String ename) {
		ename = "%"+ename+"%";
		if(ename.equals("%%")) {
			ename = "";
		}
		return dao.getCookieEmpSimple(ename);
	}
	
	// 메세지 읽기
	public Cookieempmsg getCookieEmpMsgDt(int mid, int readid) {
		Cookieempmsg msgInfo = dao.getCookieEmpMsgDt(mid);
		if(readid==msgInfo.getReid()) {
			dao.readMessage(mid); // 읽은 사람과 받은 사람이 같으면 '읽음'처리
		}
		msgInfo.setContent(msgInfo.getContent().replace("\\n", "\n"));
		// 줄바꿈 정상처리
		//System.out.println(msgInfo.getContent());
		// 파일들의 이름정보 저장
		msgInfo.setFnames(dao.getMessageFiles(mid));
		return msgInfo;
	}

	@Value("${user.upload}")
	private String path;
	
	// 메세지 보내기
	public String sendMessage(Cookieempmsg send) {
		send.setContent(send.getContent().replace("\n", "\\n"));
		// 줄바꿈 부분 수정하여 처리
		String msg = dao.sendMessage(send)>0?"메세지가 전송되었습니다":"전송실패";
		//System.out.println(send.getContent());
		//if (send.getMsgfles() != null && send.getMsgfles().length > 0) {
			try {
				int cnt=0;
				for (MultipartFile mpf : send.getMsgfiles()) {
					if(	!mpf.getOriginalFilename().equals("") ) {
						String fname = mpf.getOriginalFilename();
						File file = new File(path, fname);
						mpf.transferTo(file);
						cnt += dao.insertMessageFile(new MNBFiles(send.getMid(),fname,
								send.getSeid()+"가 보내는 메세지 파일"));
					}
				}
				System.out.println(cnt+"건 파일 등록 성공");
			} catch (IllegalStateException e) {
				System.out.println("[파일 상태예외]"+e.getMessage());	
			} catch (IOException e) {
				System.out.println("[파일 DB연동예외]"+e.getMessage());
			} catch (Exception e) {
				System.out.println("[파일 기타예외]"+e.getMessage());
			}
		//}
		return msg;
	}
	
	// 메세지 읽기
	public int readMessageCnt(int reid) {
		return dao.readMessageCnt(reid);
	}
	
	// 비밀번호 변경요청
	public String sendAskMessage(String ckEname,int ckEmpno) {
		String msg = "해당 사원번호는 존재하지 않습니다";
		
		if(dao.getEmpCountByEmpno(ckEmpno)>0) {
			String content = "비밀번호 변경 요청 알림\\n이름 : "+ckEname+"\\n사원번호 : "+ckEmpno;
			dao.cookieAskChgPwd(ckEmpno);
			msg = dao.sendAskMessage(content)>0?"요청이 전송되었습니다":"전송실패";
		}
		return msg;
	}

	// 켈린더 호출
	public List<Cookieidcal> getCookieidcalList(int empno, int deptno){
		return dao.getCookieidcalList(empno,deptno);
	}
	
	// 켈린더 등록
	public CKECudVo insCookieidcal(Cookieidcal ins) {
		int empno = ins.getEmpno();
		int deptno = ins.getDeptno();
		
		return new CKECudVo(dao.insCookieidcal(ins)>0?"등록성공":"등록실패"
			,dao.getCookieidcalList(empno,deptno));
	}
	
	// 켈린더 수정
	public  CKECudVo udtCookieidcal(Cookieidcal upt) {
		int empno = upt.getEmpno();
		int deptno = upt.getDeptno();
		return new CKECudVo(dao.udtCookieidcal(upt)>0?"수정성공":"수정실패"
			,dao.getCookieidcalList(empno,deptno));
	}
	
	// 켈린더 삭제
	public  CKECudVo delCookieidcal(Cookieidcal del) {
		int empno = del.getEmpno();
		int deptno = del.getDeptno();
		return new CKECudVo(dao.delCookieidcal(del.getId())>0?"삭제성공":"삭제실패"
			,dao.getCookieidcalList(empno,deptno));
	}
	 
}
