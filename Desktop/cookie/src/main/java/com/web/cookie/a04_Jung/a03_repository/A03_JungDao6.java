package com.web.cookie.a04_Jung.a03_repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a04_Jung.vo.Defect_type;
import com.web.cookie.a04_Jung.vo.Dfc_prd01;
import com.web.cookie.a04_Jung.vo.Dfct_mngm01;
import com.web.cookie.a04_Jung.vo.JungPageSch;

@Mapper
public interface A03_JungDao6 {
/*
	private int dfct_id;//불량관리 아이디
	private int dfc_prd_id;//생산중 불량 아이디
	private String dfct_pic_nm;//담당자명
	private String dfct_hndl_type;//불량처리유형
	private String dfct_prcs_rslt;//불량처리결과
	private Date dfct_dsps_date;//불량 처리 날짜
	private String dfct_dsps_dateStr;//불량 처리 날짜
	private String prc_nm;// 공정명
 */
@Select("SELECT dm.*,prc_nm FROM DFCT_MNGM01 dm,DFC_PRD01 dp,PRC01 p \r\n"
		+ "WHERE dp.PRC_ID = p.PRC_ID AND dm.dfc_prd_id = dp.DFC_PRD_ID AND prc_nm LIKE #{prc_nm} ORDER BY dfct_id DESC")
List<Dfct_mngm01> getDfct_mngm01List(Dfct_mngm01 sch);

@Select("SELECT * FROM DFCT_MNGM01 dm WHERE dfct_id=#{dfct_id}")
Dfct_mngm01 getDfct_mngm01(@Param("dfct_id") int dfct_id);

@Select("SELECT COUNT(*) FROM DFCT_MNGM01 dm,DFC_PRD01 dp,PRC01 p\r\n"
		+ "	WHERE dp.PRC_ID = p.PRC_ID AND dm.dfc_prd_id = dp.DFC_PRD_ID \r\n"
		+ "	AND prc_nm LIKE #{prc_nm}")
int getJungPageCount6(JungPageSch sch);

@Select("SELECT * FROM ("
        + "    SELECT rownum AS cnt, dm2.* FROM ("
        + "        SELECT dm.*, p.prc_nm FROM DFCT_MNGM01 dm"
        + "        JOIN DFC_PRD01 dp ON dm.dfc_prd_id = dp.DFC_PRD_ID"
        + "        JOIN PRC01 p ON dp.PRC_ID = p.PRC_ID"
        + "        WHERE p.prc_nm LIKE #{prc_nm}"
        + "        ORDER BY dm.dfct_id DESC"  // 내림차순 정렬을 내부 서브쿼리에서 먼저 적용
        + "    ) dm2"
        + ") WHERE cnt BETWEEN #{start} AND #{end}")
List<Dfct_mngm01> getJungPage6List(JungPageSch sch);


@Insert("INSERT INTO dfct_mngm01 values(dfct_mngm01_seq.nextval,#{dfc_prd_id},#{dfct_pic_nm},#{dfct_hndl_type},"
		+ "#{dfct_prcs_rslt},to_date(#{dfct_dsps_dateStr},'YYYY-MM-DD'))")
int insertDfct_mngm01(Dfct_mngm01 ins);

@Update("UPDATE DFCT_MNGM01 SET dfc_prd_id=#{dfc_prd_id},dfct_pic_nm=#{dfct_pic_nm}\r\n"
		+ "		,dfct_hndl_type=#{dfct_hndl_type},dfct_prcs_rslt=#{dfct_prcs_rslt},\r\n"
		+ "	dfct_dsps_date=to_date(#{dfct_dsps_dateStr},'YYYY-MM-DD') WHERE dfct_id=#{dfct_id}")
int updateDfct_mngm01(Dfct_mngm01 upt);

@Delete("DELETE FROM DFCT_MNGM01 dm WHERE dfct_id=#{dfct_id}")
int deleteDfct_mngm01(@Param("dfct_id") int dfct_id);

@Delete("DELETE FROM DFCT_CALENDAR WHERE dfct_id=#{dfct_id}")
int deleteDfct_calendar2(@Param("dfct_id") int dfct_id);
}
