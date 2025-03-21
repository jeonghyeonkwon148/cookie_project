package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a04_Jung.vo.Defect_type;
import com.web.cookie.a04_Jung.vo.Dfc_prd01;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Prc01;

@Mapper
public interface A03_JungDao5 {
/*
private int dfc_prd_id;//생산중 불량아이디
private int prc_id;//공정 아이디
private String dfc_prd_cnfr_name;//확인 근무자명
private Date dfc_prd_dfct_arvl;//불량이 나온시간
private String dfc_prd_dfct_arvlStr;//불량이 나온시간
private int dfc_prd_dfct_cnt;//불량갯수
private int dfc_typ_id;//불량유형 아이디
private String prc_nm;// 공정명
private String dfc_typ;// 불량유형
 */
@Select("SELECT dp.*,DFC_TYP,prc_nm FROM DFC_PRD01 dp,DEFECT_TYPE dt,PRC01 p WHERE \r\n"
		+ " dp.prc_id = p.prc_id AND dp.DFC_TYP_ID = dt.DFC_TYP_ID AND prc_nm LIKE #{prc_nm} order by dfc_prd_id desc ")
List<Dfc_prd01> getDfc_prd01List(Dfc_prd01 sch);

@Select("SELECT * FROM DFC_PRD01 dp WHERE DFC_PRD_ID = #{dfc_prd_id}")
Dfc_prd01 getDfc_prd01(@Param("dfc_prd_id") int dfc_prd_id);

@Select("SELECT COUNT(*) FROM DFC_PRD01 dp,DEFECT_TYPE dt,PRC01 p\r\n"
		+ "	WHERE dp.prc_id = p.prc_id AND dp.DFC_TYP_ID = dt.DFC_TYP_ID \r\n"
		+ "	AND prc_nm LIKE #{prc_nm}")
int getJungPageCount5(JungPageSch sch);

@Select("SELECT * FROM ("
        + "    SELECT rownum AS cnt, dp3.* FROM ("
        + "        SELECT dp.*, dt.DFC_TYP, p.prc_nm FROM DFC_PRD01 dp"
        + "        JOIN DEFECT_TYPE dt ON dp.DFC_TYP_ID = dt.DFC_TYP_ID"
        + "        JOIN PRC01 p ON dp.prc_id = p.prc_id"
        + "        WHERE p.prc_nm LIKE #{prc_nm}"
        + "        ORDER BY dp.dfc_prd_id DESC"  // 내림차순 정렬을 내부 서브쿼리에서 먼저 적용
        + "    ) dp3"
        + ") WHERE cnt BETWEEN #{start} AND #{end}")
List<Dfc_prd01> getJungPage5List(JungPageSch sch);


@Insert("INSERT INTO DFC_PRD01 dp values(dfc_prd01_seq.nextval,#{prc_id},#{dfc_prd_cnfr_name},"
		+ "to_date(#{dfc_prd_dfct_arvlStr},'YYYY-MM-DD'),#{dfc_prd_dfct_cnt},#{dfc_typ_id})")
int insertDfc_prd01(Dfc_prd01 ins);

@Update("UPDATE DFC_PRD01 SET prc_id=#{prc_id} ,dfc_prd_cnfr_name=#{dfc_prd_cnfr_name},\r\n"
		+ "dfc_prd_dfct_arvl=to_date(#{dfc_prd_dfct_arvlStr},'YYYY-MM-DD')\r\n"
		+ ",dfc_prd_dfct_cnt=#{dfc_prd_dfct_cnt},dfc_typ_id=#{dfc_typ_id} WHERE DFC_PRD_ID = #{dfc_prd_id}")
int updateDfc_prd01(Dfc_prd01 upt);

@Delete("DELETE FROM DFC_PRD01  WHERE DFC_PRD_ID=#{dfc_prd_id}")
int deleteDfc_prd01(@Param("dfc_prd_id") int dfc_prd_id);

@Delete("DELETE FROM DFCT_MNGM01 dm WHERE dfc_prd_id=#{dfc_prd_id}")
int deleteDfct_mngm012(@Param("dfc_prd_id") int dfc_prd_id);

@Delete("DELETE FROM DFCT_CALENDAR WHERE dfct_id IN (SELECT dfct_id FROM DFCT_MNGM01 WHERE dfc_prd01_id = #{dfc_prd01_id})")
int deleteDfctCalendar12(@Param("dfc_prd01_id") int dfc_prd01_id);
}
