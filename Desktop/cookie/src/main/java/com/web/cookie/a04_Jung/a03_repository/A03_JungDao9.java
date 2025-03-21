package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Prd_mng_prc01;
import com.web.cookie.a04_Jung.vo.Prdct_mngmn;
import com.web.cookie.a04_Jung.vo.Prdct_mngmn;

@Mapper
public interface A03_JungDao9 {
/*
	private int no // 최종 결과 번호
	private int prd_id_prc;//제품 생산 아이디
	private int workl_id;//작업 지시 아이디
	private Date prdct_date;//생산완료일
	private String prdct_dateStr;//생산완료일
	private Date exp_prd;//유통기간
	private String exp_prdStr;//유통기간
	private int dfct_drng;//공정중 불량 갯수
	private int ttlp_time;//총 공정 시간(시간)
	private int prd_yld;// 생산 갯수
	private String pname;// 제품명
 */
@Select("SELECT pm.*,p.PNAME, pmp.PRD_YLD  \r\n"
		+ "FROM PRDCT_MNGMN pm,WORK_ORDER wo,PRODUCT p, PRD_MNG_PRC01 pmp,ORDER01 o \r\n"
		+ "WHERE pm.WORKL_ID = wo.WORKL_ID AND wo.ORDER_NO = o.ORDER_NO AND\r\n"
		+ "o.NO = p.NO AND pmp.PRD_ID_PRC = pm.PRD_ID_PRC AND pname LIKE #{pname}")
List<Prdct_mngmn> getPrdct_mngmnList(Prdct_mngmn sch);

@Select("SELECT * FROM PRDCT_MNGMN pm WHERE no =#{no}")
Prdct_mngmn getPrdct_mngmn(@Param("no") int no);

@Select("SELECT COUNT(*) FROM PRDCT_MNGMN pm,WORK_ORDER wo,PRODUCT p, PRD_MNG_PRC01 pmp,ORDER01 o\r\n"
		+ "	WHERE pm.WORKL_ID = wo.WORKL_ID AND wo.ORDER_NO = o.ORDER_NO and o.NO = p.NO AND pmp.PRD_ID_PRC = pm.PRD_ID_PRC \r\n"
		+ "	AND pname LIKE #{pname}")
int getJungPageCount9(JungPageSch sch);

@Select("SELECT * FROM ("
        + "    SELECT rownum AS cnt, pm2.* FROM ("
        + "        SELECT pm.*, p.PNAME, pmp.PRD_YLD FROM PRDCT_MNGMN pm"
        + "        JOIN WORK_ORDER wo ON pm.WORKL_ID = wo.WORKL_ID"
        + "        JOIN ORDER01 o ON wo.ORDER_NO = o.ORDER_NO"
        + "        JOIN PRODUCT p ON o.NO = p.NO"
        + "        JOIN PRD_MNG_PRC01 pmp ON pmp.PRD_ID_PRC = pm.PRD_ID_PRC"
        + "        WHERE p.PNAME LIKE #{pname}"
        + "        ORDER BY pmp.prd_id_prc DESC"  // 내림차순 정렬을 내부 서브쿼리에서 먼저 적용
        + "    ) pm2"
        + ") WHERE cnt BETWEEN #{start} AND #{end}")
List<Prdct_mngmn> getJungPage9List(JungPageSch sch);


@Insert("INSERT INTO prdct_mngmn VALUES(prdct_mngmnno_seq.nextVal,#{prd_id_prc},#{workl_id},"
		+ "to_date(#{prdct_dateStr},'YYYY-MM-DD')\r\n"
		+ ",to_date(#{exp_prdStr},'YYYY-MM-DD'), #{dfct_drng},#{ttlp_time})")
int insertPrdct_mngmn(Prdct_mngmn ins);

@Update("UPDATE PRDCT_MNGMN SET prd_id_prc=#{prd_id_prc},workl_id=#{workl_id}, "
		+ " prdct_date= to_date(#{prdct_dateStr},'YYYY-MM-DD'),\r\n"
		+ " exp_prd=to_date(#{exp_prdStr},'YYYY-MM-DD'), dfct_drng=#{dfct_drng}, ttlp_time=#{ttlp_time} \r\n"
		+ " WHERE no=#{no}")
int updatePrdct_mngmn(Prdct_mngmn upt);

@Delete("DELETE FROM prdct_mngmn WHERE no=#{no}")
int deletePrdct_mngmn(@Param("no") int no);
}
