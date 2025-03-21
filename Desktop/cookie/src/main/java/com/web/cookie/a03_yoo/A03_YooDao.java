package com.web.cookie.a03_yoo;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a03_yoo.vo.Cookieemp;
import com.web.cookie.a03_yoo.vo.Cookieempmsg;
import com.web.cookie.a03_yoo.vo.Cookieidcal;
import com.web.cookie.a03_yoo.vo.MNBFiles;
import com.web.cookie.a03_yoo.vo.YooPaging;

@Mapper
public interface A03_YooDao {
	// 로그인
	@Select("SELECT e.*, d.dname FROM cookieemp e, cookiedept d "
			+ "WHERE empno=#{empno} AND pwd=#{pwd} AND e.deptno=d.deptno")
	Cookieemp cookieLogin(Cookieemp login);
	// 비밀번호 변경
	@Update("UPDATE cookieemp SET pwdupt=2, pwd=#{pwd} WHERE empno=#{empno}")
	int cookieUdtPwd(Cookieemp udtPwd);
	
	// 사원목록 검색
	@Select("SELECT * FROM (\r\n"
			+ "SELECT ROW_NUMBER() OVER (ORDER BY e.deptno,auth DESC,empno) AS cnt, \r\n"
			+ "e.*, d.dname FROM cookieemp e, cookiedept d\r\n"
			+ "WHERE e.deptno=d.deptno AND ename LIKE #{ename} AND d.deptno LIKE #{deptno} AND d.deptno<90\r\n"
			+ "ORDER BY cnt)\r\n"
			+ "WHERE cnt BETWEEN #{start} AND #{end}")
	List<Cookieemp> searchCEList(YooPaging sch);
	
	// 사원정보 검색
	@Select("SELECT e.*, d.dname FROM cookieemp e, cookiedept d\r\n"
			+ "WHERE empno = #{empno} AND e.deptno=d.deptno")
	Cookieemp searchCEmp(@Param("empno") int empno);
	
	// 사원 수 검색
	@Select("SELECT COUNT(*) FROM cookieemp e\r\n"
			+ "WHERE ename LIKE #{ename} AND deptno LIKE #{deptno}")
	int getEmpCount(YooPaging sch);
	
	// 사원번호로 사원 수 검색
	@Select("SELECT COUNT(*) FROM cookieemp\r\n"
			+ "WHERE empno=#{ckEmpno}")
	int getEmpCountByEmpno(@Param("ckEmpno") int ckEmpno);
	
	// 부서 목록 출력
	@Select("SELECT * FROM cookiedept\r\n"
			+ "WHERE deptno<99\r\n"
			+ "ORDER BY deptno")
	List<Cookieemp> getCookieDept();
	
	// 사원 등록
	@Insert("INSERT INTO cookieemp VALUES (cookieempseq.nextval,#{ename},#{pwd},#{deptno},#{auth},#{sal},1)")
	int insertCookieEmp(Cookieemp ins);
	
	// 사원정보 수정
	@Update("UPDATE cookieemp SET ename=#{ename}, pwd=#{pwd}, sal=#{sal}\r\n"
			+ "WHERE empno=#{empno}")
	int updateCookieEmp(Cookieemp udt);
	
	// 사원정보 삭제
	@Delete("DELETE cookieemp WHERE empno=#{empno}")
	int deleteCookieEmp(Cookieemp del);
	
	// 부서별 사원정보
	@Select("SELECT d.*, ename FROM cookieemp e, cookiedept d\r\n"
			+ "WHERE d.deptno=e.deptno AND auth=2 AND d.deptno<90\r\n"
			+ "ORDER BY d.deptno,auth DESC,empno")
	List<Cookieemp> getCookieEmpsByDept();
	
	// 부서등록
	@Insert("INSERT INTO cookiedept VALUES (#{deptno},#{dname})")
	int insertCookieDept(Cookieemp ins);
	
	// 부서번호 중복 확인
	@Select("SELECT COUNT(*) FROM cookiedept WHERE deptno=#{deptno}")
	int chkSameDeptno(Cookieemp ins);
	
	// 부서정보 수정
	@Update("UPDATE cookiedept SET dname=#{dname}\r\n"
			+ "WHERE deptno=#{deptno}")
	int updateCookieDept(Cookieemp udt);

	// 부서내 사원인원 확인
	@Select("SELECT COUNT(*) FROM cookieemp WHERE deptno=#{deptno}")
	int chkDeptEmp(@Param("deptno") int deptno);
	
	// 부서정보 삭제
	@Delete("DELETE cookiedept WHERE deptno=#{deptno}")
	int deleteCookieDept(@Param("deptno") int deptno);
	
	// 부서번호로 사원목록 출력
	@Select("SELECT d.*, ename, auth, empno FROM cookieemp e, cookiedept d\r\n"
			+ "WHERE d.deptno=e.deptno AND d.deptno<90 AND d.deptno=#{deptno}\r\n"
			+ "ORDER BY auth DESC,empno")
	List<Cookieemp> getCookieEmpsByDeptno(@Param("deptno") int deptno);
	
	// 부서와 직급 변경
	@Update("UPDATE cookieemp SET deptno=#{deptno}, auth=#{auth} WHERE empno=#{empno}")
	int updateDeptNAuth(Cookieemp udt);
	
	// 받은 메세지 목록
	@Select("SELECT * FROM (\r\n"
			+ "	SELECT rownum cnt, LEVEL, m.*, ename, empno, d.* FROM cookieempmsg m, cookieemp e, cookiedept d\r\n"
			+ "	WHERE ename LIKE #{ename} AND seid = empno AND d.deptno=e.deptno AND reid = #{empno}\r\n"
			+ "	START WITH rmid=0\r\n"
			+ "	CONNECT BY PRIOR mid = rmid\r\n"
			+ "	ORDER siblings BY mid DESC\r\n"
			+ ") WHERE cnt BETWEEN #{start} AND #{end}")
	List<Cookieempmsg> getCookieEmpRMsg(YooPaging sch);
	
	// 받은 메세지 수 검색
	@Select("SELECT COUNT(*) FROM cookieempmsg, cookieemp\r\n"
			+ "WHERE ename LIKE #{ename} AND reid=#{empno} AND seid = empno")
	int getRMessageCount(YooPaging sch);

	// 보낸 메세지 목록
	@Select("SELECT * FROM (\r\n"
			+ "	SELECT rownum cnt, LEVEL, m.*, ename, empno, d.* FROM cookieempmsg m, cookieemp e, cookiedept d\r\n"
			+ "	WHERE ename LIKE #{ename} AND reid = empno AND d.deptno=e.deptno AND seid = #{empno}\r\n"
			+ "	START WITH rmid=0\r\n"
			+ "	CONNECT BY PRIOR mid = rmid\r\n"
			+ "	ORDER siblings BY mid DESC\r\n"
			+ ") WHERE cnt BETWEEN #{start} AND #{end}")
	List<Cookieempmsg> getCookieEmpSMsg(YooPaging sch);
	
	// 보낸 메세지 수 검색
	@Select("SELECT COUNT(*) FROM cookieempmsg, cookieemp\r\n"
			+ "WHERE ename LIKE #{ename} AND seid = #{empno} AND reid = empno")
	int getSMessageCount(YooPaging sch);

	// 모든 메세지 목록
	@Select("SELECT * FROM (\r\n"
			+ "	SELECT rownum cnt, LEVEL, m.*,\r\n"
			+ "	e1.ename seename, e1.empno seempno, d1.deptno sedeptno, d1.dname sedname,\r\n"
			+ "	e2.ename reename, e2.empno reempno, d2.deptno redeptno, d2.dname redname \r\n"
			+ "	FROM cookieempmsg m, cookieemp e1, cookieemp e2, cookiedept d1, cookiedept d2\r\n"
			+ "	WHERE (e1.ename LIKE #{ename} OR e2.ename LIKE #{ename})\r\n"
			+ "	AND seid = e1.empno AND reid = e2.empno\r\n"
			+ "	AND d1.deptno=e1.deptno AND d2.deptno=e2.deptno AND (seid=#{empno} OR reid=#{empno})\r\n"
			+ "	START WITH rmid=0 CONNECT BY PRIOR mid = rmid\r\n"
			+ "	ORDER siblings BY mid DESC\r\n"
			+ ") WHERE cnt BETWEEN #{start} AND #{end}")
	List<Cookieempmsg> getCookieEmpAMsg(YooPaging sch);

	// 모든 메세지 수 검색
	@Select("SELECT COUNT(*) FROM cookieempmsg, cookieemp e1, cookieemp e2\r\n"
			+ "WHERE (e1.ename LIKE #{ename} OR e2.ename LIKE #{ename}) AND (seid=#{empno} OR reid=#{empno})\r\n"
			+ "AND seid = e1.empno AND reid = e2.empno")
	int getAMessageCount(YooPaging sch);
	
	// 간단한 사원검색
	@Select("SELECT empno, ename, auth, d.* FROM cookieemp e, cookiedept d\r\n"
			+ "WHERE e.deptno=d.deptno AND ename LIKE #{ename} AND d.deptno<=90\r\n"
			+ "ORDER BY e.deptno,auth DESC,empno")
	List<Cookieemp> getCookieEmpSimple(@Param("ename") String ename);
	
	// 메세지 전송
	@Insert("INSERT INTO cookieempmsg VALUES (#{mid},#{rmid},#{seid},#{reid},"
			+ "#{content},1,sysdate)")
	@SelectKey(statement="SELECT cookieempmsgseq.nextval  FROM dual", 
	keyProperty = "mid", before=true, resultType=int.class)
	int sendMessage(Cookieempmsg send);
	
	// 파일 업로드 데이터 저장
	@Insert("INSERT INTO cookiemsgfile values(#{idNo}, "
			+ "#{fname},#{finfo})")
	int insertMessageFile(MNBFiles send);
	
	// 비밀번호 변경 요청 메세지 전송
	@Insert("INSERT INTO cookieempmsg VALUES (cookieempmsgseq.nextval,0"
			+ ",1003,1003,#{content},1,sysdate)")
	int sendAskMessage(@Param("content") String content);

	// 비밀번호 변경요청 확인
	@Update("UPDATE cookieemp SET pwdupt=1 WHERE empno=#{ckEmpno}")
	void cookieAskChgPwd(@Param("ckEmpno") int ckEmpno);
	
	// 업로드 파일 조회
	@Select("SELECT fname FROM cookiemsgfile WHERE mid = #{mid}")
	List<String> getMessageFiles(@Param("mid") int mid);
	
	// 메세지 상세 내용
	@Select("SELECT m.*, d1.dname sedname, e1.ename seename, d2.dname redname, e2.ename reename\r\n"
			+ "FROM cookieempmsg m, cookieemp e1, cookieemp e2, cookiedept d1, cookiedept d2\r\n"
			+ "WHERE seid = e1.empno AND reid = e2.empno\r\n"
			+ "AND d1.deptno=e1.deptno AND d2.deptno=e2.deptno AND mid=#{mid}")
	Cookieempmsg getCookieEmpMsgDt(@Param("mid") int mid);
	
	// 메세지 읽음 처리
	@Update("UPDATE cookieempmsg SET opauth=2 WHERE mid=#{mid}")
	void readMessage(@Param("mid") int mid);
	
	// 읽지 않은 메세지 수
	@Select("SELECT COUNT(*) FROM cookieempmsg WHERE reid=#{reid} AND opauth=1")
	int readMessageCnt(@Param("reid") int reid);
	
	// 켈린더 내용 호출
	@Select("SELECT cno \"id\", title, empno, start1 \"start\", end1 \"end\",\r\n"
			+ "		content, backgroundcolor, textcolor,\r\n"
			+ "		allday, urllink, showlevel FROM cookieidcal\r\n"
			+ "		WHERE showlevel>=3\r\n"
			+ "		OR (showlevel=2 AND deptno=#{deptno})\r\n"
			+ "		OR (showlevel=1 AND empno=#{empno})")
	List<Cookieidcal> getCookieidcalList(@Param("empno") int empno,
			@Param("deptno") int deptno);

	// 일정 저장
	@Insert("INSERT INTO cookieidcal VALUES (cookieidcalseq.nextval,#{title},#{empno},\r\n"
			+ "#{start},#{end},#{content},#{backgroundColor},#{textColor},#{allDay},#{urllink},#{showlevel},#{deptno})")
	int insCookieidcal(Cookieidcal ins);
	
	// 일정 수정
	@Update("UPDATE cookieidcal\r\n"
			+ "	SET title = #{title},\r\n"
			+ "		content = #{content},\r\n"
			+ "		backgroundColor = #{backgroundColor},\r\n"
			+ "		textColor = #{textColor},\r\n"
			+ "		allDay = #{allDay},\r\n"
			+ "		urllink =#{urllink},\r\n"
			+ "		showlevel =#{showlevel}\r\n"
			+ "WHERE cno = #{id}")
	int udtCookieidcal(Cookieidcal upt);	
	
	// 일정 삭제
	@Delete("DELETE FROM cookieidcal WHERE cno= #{id}")
	int delCookieidcal(@Param("id") int id);

}
