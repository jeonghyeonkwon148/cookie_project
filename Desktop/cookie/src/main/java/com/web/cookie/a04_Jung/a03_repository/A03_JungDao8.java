package com.web.cookie.a04_Jung.a03_repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.OrderJoin;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Prd_mng_prc01;
import com.web.cookie.a04_Jung.vo.Work_order;

@Mapper
public interface A03_JungDao8 {
/*
	private int prd_id_prc; //공정별 생산 아이디
	private int prc_id; //공정 아이디
	private Date prdc_date; //생산 날짜
	private String prdc_dateStr;//생산 날짜
	private int prd_yld; //공정 생산량
	private int prd_rwmt_usg; //원재료 사용량
	private int prv_prd_yld; //이전 공정 생산량
	private int prvprd_id_prc; //공정별 이전 생산 아이디
	private String prc_nm;//공정명
	private String beprc_nm; // 이전공정명
 */
@Select("SELECT pmp.*,PRC_NM FROM PRD_MNG_PRC01 pmp,PRC01 p "
		+ "WHERE pmp.PRC_ID = p.PRC_ID AND PRC_NM LIKE #{prc_nm}")
List<Prd_mng_prc01> getPrd_mng_prc01List(Prd_mng_prc01 sch);

@Select("SELECT * FROM PRD_MNG_PRC01 pmp WHERE PRD_ID_PRC = #{prd_id_prc}")
Prd_mng_prc01 getPrd_mng_prc01(@Param("prd_id_prc") int prd_id_prc);

@Select("SELECT pmp.*,p.PRC_NM FROM PRD_MNG_PRC01 pmp,PRC01 p WHERE p.PRC_ID = pmp.PRC_ID \r\n"
		+ "AND p.PRC_NM LIKE '포장마무리'")
List<Prd_mng_prc01> getPrd_mng_prc01List02(Prd_mng_prc01 sch);

@Select("SELECT COUNT(*) FROM PRD_MNG_PRC01 pmp,PRC01 p\r\n"
		+ "	WHERE pmp.PRC_ID = p.PRC_ID \r\n"
		+ "	AND PRC_NM LIKE #{prc_nm}")
int getJungPageCount8(JungPageSch sch);

@Select("SELECT * FROM ("
        + "    SELECT rownum AS cnt, pmp2.* FROM ("
        + "        SELECT pmp.*, p.PRC_NM FROM PRD_MNG_PRC01 pmp"
        + "        JOIN PRC01 p ON pmp.PRC_ID = p.PRC_ID"
        + "        WHERE p.PRC_NM LIKE #{prc_nm}"
        + "        ORDER BY pmp.prd_id_prc DESC"  // 내림차순 정렬을 내부 서브쿼리에서 먼저 적용
        + "    ) pmp2"
        + ") WHERE cnt BETWEEN #{start} AND #{end}")
List<Prd_mng_prc01> getJungPage8List(JungPageSch sch);


@Insert("INSERT INTO PRD_MNG_PRC01 pmp "
		+ "values(prd_mng_prc01_seq.nextval,#{prc_id}, "
		+ "to_date(#{prdc_dateStr},'YYYY-MM-DD'),#{prd_yld} "
		+ " ,#{prd_rwmt_usg},#{prv_prd_yld},#{prvprd_id_prc})")
int insertPrd_mng_prc01(Prd_mng_prc01 ins);

@Update("UPDATE PRD_MNG_PRC01 SET prc_id=#{prc_id}, "
		+ "prdc_date=to_date(#{prdc_dateStr},'YYYY-MM-DD'),\r\n"
		+ "prd_yld=#{prd_yld},prd_rwmt_usg=#{prd_rwmt_usg} WHERE prd_id_prc=#{prd_id_prc} ")
int updatePrd_mng_prc01(Prd_mng_prc01 upt);

@Delete("DELETE FROM PRD_MNG_PRC01 WHERE prd_id_prc = #{prd_id_prc}")
int deletePrd_mng_prc01(@Param("prd_id_prc") int prd_id_prc);

@Delete("DELETE FROM prdct_mngmn WHERE prd_id_prc=#{prd_id_prc}")
int deletePrdct_mngmn4(@Param("prd_id_prc") int prd_id_prc);
}
