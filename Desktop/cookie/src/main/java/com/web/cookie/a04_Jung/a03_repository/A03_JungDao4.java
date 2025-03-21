package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a04_Jung.vo.Defect_type;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Prc01;

@Mapper
public interface A03_JungDao4 {

@Select("SELECT * FROM defect_type where dfc_typ like #{dfc_typ}")
List<Defect_type> getDefect_typeList(Defect_type sch);

@Select("SELECT * FROM defect_type where dfc_typ_id = #{dfc_typ_id}")
Defect_type getDefect_type(@Param("dfc_typ_id") int dfc_typ_id);

@Select("SELECT COUNT(*) FROM defect_type d \r\n"
		+ "	WHERE dfc_typ like #{dfc_typ} \r\n")
int getJungPageCount4(JungPageSch sch);

@Select("SELECT * FROM ("
        + "    SELECT rownum AS cnt, d.* FROM ("
        + "        SELECT * FROM defect_type"
        + "        WHERE dfc_typ LIKE #{dfc_typ}"
        + "        ORDER BY dfc_typ_id DESC"  // 내림차순 정렬을 내부 서브쿼리에서 먼저 적용
        + "    ) d"
        + ") WHERE cnt BETWEEN #{start} AND #{end}")
List<Defect_type> getJungPage4List(JungPageSch sch);


@Insert("INSERT INTO DEFECT_TYPE dt values(defect_type_seq.nextVal,#{dfc_typ})")
int insertDefect_type(Defect_type ins);

@Update("UPDATE DEFECT_TYPE SET DFC_TYP=#{dfc_typ} WHERE DFC_TYP_ID =#{dfc_typ_id}")
int updateDefect_type(Defect_type upt);

@Delete("DELETE FROM DEFECT_TYPE dt WHERE dfc_typ_id=#{dfc_typ_id}")
int deleteDefect_type(@Param("dfc_typ_id") int dfc_typ_id);

@Delete("DELETE FROM DFC_PRD01  WHERE dfc_typ_id=#{dfc_typ_id}")
int deleteDfc_prd017(@Param("dfc_typ_id") int dfc_typ_id);

// 1. Dfct_calendar에서 Dfct_mngm01에 연결된 데이터 삭제
@Delete("DELETE FROM DFCT_CALENDAR WHERE dfct_id IN (SELECT dfct_id FROM DFCT_MNGM01 WHERE dfc_prd01_id IN (SELECT dfc_prd01_id FROM DFC_PRD01 WHERE dfc_typ_id = #{dfc_typ_id}))")
int deleteDfctCalendar88(@Param("dfc_typ_id") int dfc_typ_id);

// 2. Dfct_mngm01에서 Dfc_prd01에 연결된 데이터 삭제
@Delete("DELETE FROM DFCT_MNGM01 WHERE dfc_prd01_id IN (SELECT dfc_prd01_id FROM DFC_PRD01 WHERE dfc_typ_id = #{dfc_typ_id})")
int deleteDfctMngm0188(@Param("dfc_typ_id") int dfc_typ_id);
}
