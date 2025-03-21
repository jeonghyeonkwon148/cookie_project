package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Machine_management;
import com.web.cookie.a04_Jung.vo.Periodic_inspection;

@Mapper
public interface A03_JungDao2 {

/*
	-- 정기검사
	private int prd_ins_id; //정기검사 아이디
	private int mch_id;//기계아이디
	private int prd_ins_itm;//검사항목
	private int prd_unc;//합/불합여부
	private int prd_ins_dt;//검사날짜
	--);*/
@Select("SELECT PI2.*,MCH_NM FROM MACHINE_MANAGEMENT mm,PERIODIC_INSPECTION pi2 WHERE pi2.MCH_ID=mm.MCH_ID\r\n"
		+ "	AND MCH_NM LIKE #{mch_nm}")
List<Periodic_inspection> getPeriodic_inspectionList(Periodic_inspection sch);

@Select("Select * from Periodic_inspection where prd_ins_id=#{prd_ins_id}")
Periodic_inspection getPeriodic_inspection(@Param("prd_ins_id") int prd_ins_id);

@Select("SELECT COUNT(*) FROM Periodic_inspection pi2,MACHINE_MANAGEMENT mm\r\n"
		+ "	WHERE pi2.MCH_ID = mm.MCH_ID \r\n"
		+ "	AND mch_nm LIKE #{mch_nm}")
int getJungPageCount2(JungPageSch sch);

@Select("SELECT * FROM ("
        + "    SELECT rownum AS cnt, pi3.* FROM ("
        + "        SELECT pi2.*, mm.mch_nm FROM Periodic_inspection pi2"
        + "        JOIN MACHINE_MANAGEMENT mm ON pi2.MCH_ID = mm.MCH_ID"
        + "        WHERE mm.mch_nm LIKE #{mch_nm}"
        + "        ORDER BY prd_ins_id DESC"  // 내림차순 정렬 적용
        + "    ) pi3"
        + ") WHERE cnt BETWEEN #{start} AND #{end}")
List<Periodic_inspection> getJungPage2List(JungPageSch sch);


@Insert("Insert into Periodic_inspection values(PERIODIC_INSPECTION_seq.nextval , #{mch_id},#{prd_ins_itm} , #{prd_unc} , "
		+ " to_date(#{prd_ins_dtStr},'YYYY-MM-DD'))")
int insertPeriodic_inspection(Periodic_inspection ins);

@Update("Update Periodic_inspection set mch_id = #{mch_id}, prd_ins_itm = #{prd_ins_itm}, prd_unc = #{prd_unc}, "
		+ " prd_ins_dt = to_date(#{prd_ins_dtStr},'YYYY-MM-DD') where prd_ins_id = #{prd_ins_id}")
int updatePeriodic_inspection(Periodic_inspection upt);

@Delete("Delete from Periodic_inspection where prd_ins_id = #{prd_ins_id}")
int deletePeriodic_inspection(@Param("prd_ins_id") int prd_ins_id);
}
