package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a03_yoo.vo.Cookieemp;
import com.web.cookie.a04_Jung.vo.AtnMng;
import com.web.cookie.a04_Jung.vo.JungPageSch;

@Mapper
public interface A13_JungDao2 {

/*
	-- 근태관리
private int no;번호
private int empno;사원번호
private double wtime;
private double extrawtime;
private Date workingDate;
private String workingDateStr;
private Date workingTime;
private String workingTimeStr;
private Date clockTime;
private String clockTimeStr;
	--);*/

@Select("SELECT * FROM COOKIEEMP order by empno")
List<Cookieemp> getTJCookieeempList();

@Select("SELECT a.*, c.ename, "
        + "CASE "
        + "   WHEN round(a.CLOCKTIME - a.WORKINGTIME - 1/24, 2) * 24 >= 8 THEN 8 "
        + "   WHEN round(a.CLOCKTIME - a.WORKINGTIME, 2) * 24 <= 0 THEN 0 "
        + "   WHEN round(a.CLOCKTIME - a.WORKINGTIME, 2) * 24 BETWEEN 3 AND 4 THEN 3 "
        + "   WHEN round(a.CLOCKTIME - a.WORKINGTIME, 2) * 24 > 4 THEN round(a.CLOCKTIME - a.WORKINGTIME - 1/24, 2) * 24 "
        + "   ELSE round(a.CLOCKTIME - a.WORKINGTIME, 2) * 24 "
        + "END AS wtime, "
        + "CASE "
        + "   WHEN round(a.CLOCKTIME - a.WORKINGTIME - 9.5/24, 2) * 24 >= 2.5 THEN 2.5 "
        + "   WHEN round(a.CLOCKTIME - a.WORKINGTIME - 8/24, 2) * 24 <= 0 THEN 0 "
        + "   ELSE round(a.CLOCKTIME - a.WORKINGTIME - 8/24, 2) * 24 "
        + "END AS extrawtime "
        + "FROM ATNMNG a, COOKIEEMP c "
        + "WHERE a.EMPNO = c.EMPNO AND c.ename LIKE #{ename} "
        + "ORDER BY a.NO DESC")  // NO에 따라 내림차순 정렬
List<AtnMng> getAtnMngList(AtnMng sch);


@Select("Select * from ATNMNG where NO=#{no}")
AtnMng getAtnMng(@Param("no") int no);

@Select("SELECT COUNT(*) FROM ATNMNG a,COOKIEEMP c\r\n"
		+ "	WHERE a.EMPNO = c.EMPNO \r\n"
		+ "	AND ename LIKE #{ename}")
int getJungPageCount12(JungPageSch sch);

@Select("SELECT * FROM (SELECT rownum AS cnt, a.*,c.ename,CASE\r\n"
		+ "				WHEN round(a.CLOCKTIME - a.WORKINGTIME,2)*24 >= 8 THEN 8\r\n"
		+ "				WHEN round(a.CLOCKTIME - a.WORKINGTIME,2)*24 <=0 THEN 0\r\n"
		+ "				ELSE round(a.CLOCKTIME - a.WORKINGTIME,2)*24\r\n"
		+ "			END\r\n"
		+ "				wtime,\r\n"
		+ "			CASE\r\n"
		+ "				WHEN round(a.CLOCKTIME - a.WORKINGTIME - 8,2)*24 >= 2.25 THEN 2.25\r\n"
		+ "				WHEN round(a.CLOCKTIME - a.WORKINGTIME - 8,2)*24 <=0 THEN 0\r\n"
		+ "				ELSE round(a.CLOCKTIME - a.WORKINGTIME - 8,2)*24\r\n"
		+ "			END\r\n"
		+ "				extrawtime "		
		+ "			FROM ATNMNG a, COOKIEEMP c \r\n"
		+ "			WHERE a.EMPNO = c.EMPNO \r\n"
		+ "			AND ename LIKE #{ename} )\r\n"
		+ "			WHERE cnt BETWEEN #{start} AND #{end}\r\n"
		+ "			ORDER BY NO ")
List<AtnMng> getJungPage12List(JungPageSch sch); 

@Insert("INSERT INTO atnMng(NO,empno,workingDate,workingTime,clockTime) "
		+ "SELECT atnMng_seq.nextval,empno,trunc(sysdate),trunc(sysdate),trunc(sysdate) FROM ATNMNG a \r\n"
		+ "WHERE a.WORKINGDATE = trunc(sysdate)-1")
void insertAtnMng2();

@Update("UPDATE ATNMNG SET workingDate = TRUNC(workingDate)")
void updateAtnMng5();

@Insert("INSERT INTO ATNMNG values(atnMng_seq.nextval,#{empno},"
		+ "#{workingTime},#{clockTime},#{workingDate})")
int insertAtnMng(AtnMng ins);

@Update("UPDATE ATNMNG SET empno=#{empno},\r\n"
		+ "		workingTime=#{workingTime},	\r\n"
		+ "		clockTime=#{clockTime},workingDate=#{workingDate} WHERE NO = #{no}")
int updateAtnMng(AtnMng upt);

@Update("UPDATE atnMng SET workingTime = sysdate WHERE no = #{no}")
int updateAtnMng2(AtnMng upt);

@Update("UPDATE atnMng SET clockTime = sysdate WHERE no = #{no} ")
int updateAtnMng3(AtnMng upt);

@Delete("DELETE FROM ATNMNG a WHERE NO = #{no}")
int deleteAtnMng(@Param("no") int no);
}
