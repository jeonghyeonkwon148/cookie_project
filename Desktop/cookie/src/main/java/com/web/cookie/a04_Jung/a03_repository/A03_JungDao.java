package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.OrderJoin;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Machine_management;

@Mapper
public interface A03_JungDao {

/*
	-- 정기검사
	private int prd_ins_id; //정기검사 아이디
	private int mch_id;//기계아이디
	private int prd_ins_itm;//검사항목
	private int prd_unc;//합/불합여부
	private int prd_ins_dt;//검사날짜
	--);*/
@Select("select * from machine_management where mch_id=#{mch_id}")
Machine_management getMachine_management(@Param("mch_id") int mch_id); // 기계관리 전체 리스트

@Select("select * from machine_management where mch_nm like #{mch_nm}")
List<Machine_management> getMachine_managementList2(Machine_management sch); // 기계명에 따른 리스트 출력

@Select("SELECT COUNT(*) FROM machine_management\r\n"
		+ "	WHERE mch_nm LIKE #{mch_nm}")
int getJungPageCount1(JungPageSch sch);

@Select("SELECT * FROM ("
        + "    SELECT rownum AS cnt, m.* FROM ("
        + "        SELECT * FROM machine_management"
        + "        WHERE mch_nm LIKE #{mch_nm}"
        + "        ORDER BY mch_id DESC"  // 내림차순 정렬을 서브쿼리에서 먼저 적용
        + "    ) m"
        + ") WHERE cnt BETWEEN #{start} AND #{end}")
List<Machine_management> getJungPage1List(JungPageSch sch);

@Insert("INSERT INTO MACHINE_MANAGEMENT values(MACHINE_MANAGEMENT_seq.nextval,#{mch_nm},"
		+ "to_date(#{mchn_dateStr},'YYYY-MM-DD'),to_date(#{mchn_mntnStr},'YYYY-MM-DD'), #{mchn_usg_prd},#{mchn_nmb_mlf},#{mchn_cndt})")
int insertMachine_management(Machine_management ins);

@Update("UPDATE MACHINE_MANAGEMENT SET mch_nm=#{mch_nm},\r\n "
		+ "							 mchn_date=to_date(#{mchn_dateStr},'YYYY-MM-DD'),\r\n "
		+ "							 mchn_mntn=to_date(#{mchn_mntnStr},'YYYY-MM-DD'),\r\n "
		+ "							 mchn_usg_prd=#{mchn_usg_prd},\r\n "
		+ "							 mchn_nmb_mlf=#{mchn_nmb_mlf},\r\n "
		+ "							 mchn_cndt=#{mchn_cndt}\r\n "
		+ "							 WHERE mch_id=#{mch_id} ")
int updateMachine_management(Machine_management upt);

@Delete("DELETE FROM MACHINE_MANAGEMENT WHERE mch_id=#{mch_id}")
int deleteMachine_management(@Param("mch_id") int mch_id);

@Delete("Delete from Periodic_inspection where mch_id = #{mch_id}")
int deletePeriodic_inspection2(@Param("mch_id") int mch_id);

@Delete("DELETE FROM prc01 WHERE mch_id=#{mch_id}")
int deletePrc01666(@Param("mch_id") int mch_id);

//1. Prdct_mngmn에서 Prd_mng_prc01에 연결된 데이터 삭제
@Delete("DELETE FROM PRDCT_MNGMN WHERE prd_id_prc IN (SELECT prd_id_prc FROM PRD_MNG_PRC01 WHERE prc_id IN (SELECT prc_id FROM PRC01 WHERE mch_id = #{mch_id}))")
int deletePrdctMngmn66688(@Param("mch_id") int mch_id);

// 2. Prd_mng_prc01에서 Prc01에 연결된 데이터 삭제
@Delete("DELETE FROM PRD_MNG_PRC01 WHERE prc_id IN (SELECT prc_id FROM PRC01 WHERE mch_id = #{mch_id})")
int deletePrdMngPrc0166688(@Param("mch_id") int mch_id);

}
