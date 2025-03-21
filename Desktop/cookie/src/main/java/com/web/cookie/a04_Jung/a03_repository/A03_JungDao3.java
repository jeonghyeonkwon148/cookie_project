package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Periodic_inspection;
import com.web.cookie.a04_Jung.vo.Prc01;

@Mapper
public interface A03_JungDao3 {

/*
	material(
	mnum number(4,0),
	mname varchar2(50),--원재료명
	unit varchar2(20),--단위
	mprice number(20,0)	--가격
	private int prc_id; //공정아이디
	private String prc_nm;//공정명
	private String prc_dtl;// 공정내용
	private int prc_bsln_qntt;// 기준 생산량
	private int mch_id;// 기계아이디
	private int prc_stnd_qntt;// 기준원재료량
	private int mnum;// 원재료 코드
	private int ptime; // 공정 시간
	private String mch_nm; // 기계명
	private String mname; //원재료명
	--);*/
@Select("SELECT p.* , mm.MCH_NM,m.MNAME FROM PRC01 p,MACHINE_MANAGEMENT mm,MATERIAL m \r\n"
		+ "WHERE p.MCH_ID=mm.MCH_ID AND p.MNUM=m.MNUM \r\n"
		+ "AND mch_nm LIKE '%%' AND prc_nm LIKE #{prc_nm} order by prc_id desc")
List<Prc01> getPrc01List(Prc01 sch);

@Select("Select * from Prc01 where prc_id=#{prc_id}")
Prc01 getPrc01(@Param("prc_id") int prc_id);

@Select("SELECT COUNT(*) FROM PRC01 p,MACHINE_MANAGEMENT mm,MATERIAL m\r\n"
		+ "	WHERE p.MCH_ID=mm.MCH_ID AND p.MNUM=m.MNUM \r\n"
		+ "	AND prc_nm LIKE #{prc_nm}")
int getJungPageCount3(JungPageSch sch);

@Select("SELECT * FROM ("
        + "    SELECT rownum AS cnt, p2.* FROM ("
        + "        SELECT p.*, mm.MCH_NM, m.MNAME FROM PRC01 p"
        + "        JOIN MACHINE_MANAGEMENT mm ON p.MCH_ID = mm.MCH_ID"
        + "        JOIN MATERIAL m ON p.MNUM = m.MNUM"
        + "        WHERE prc_nm LIKE #{prc_nm}"
        + "        ORDER BY prc_id DESC"  // 내림차순 정렬을 서브쿼리에서 먼저 적용
        + "    ) p2"
        + ") WHERE cnt BETWEEN #{start} AND #{end}")
List<Prc01> getJungPage3List(JungPageSch sch);


@Insert("INSERT INTO PRC01 p values(prc0102_seq.nextVal,#{prc_nm},#{prc_dtl},#{prc_bsln_qntt},"
		+ "#{mch_id},#{prc_stnd_qntt},#{mnum},#{ptime})")
int insertPrc01(Prc01 ins);

@Update("UPDATE PRC01 SET prc_nm=#{prc_nm},prc_dtl=#{prc_dtl},prc_bsln_qntt=#{prc_bsln_qntt},"
		+ "mch_id=#{mch_id},prc_stnd_qntt=#{prc_stnd_qntt},mnum=#{mnum},"
		+ "ptime=#{ptime} WHERE PRC_ID=#{prc_id}")
int updatePrc01(Prc01 upt);

// 1. Prdct_mngmn에서 Prd_mng_prc01에 연결된 데이터 삭제
@Delete("DELETE FROM PRDCT_MNGMN WHERE prd_id_prc IN (SELECT prd_id_prc FROM PRD_MNG_PRC01 WHERE prc_id = #{prc_id})")
int deletePrdctMngmn111(@Param("prc_id") int prc_id);

// 2. Prd_mng_prc01에서 Prc01에 연결된 데이터 삭제
@Delete("DELETE FROM PRD_MNG_PRC01 WHERE prc_id = #{prc_id}")
int deletePrdMngPrc01111(@Param("prc_id") int prc_id);

@Delete("DELETE FROM prc01 WHERE prc_id=#{prc_id}")
int deletePrc01(@Param("prc_id") int prc_id);

@Delete("DELETE FROM DFC_PRD01  WHERE prc_id=#{prc_id}")
int deleteDfc_prd012(@Param("prc_id") int prc_id);
}
