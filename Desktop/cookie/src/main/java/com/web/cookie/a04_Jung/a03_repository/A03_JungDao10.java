package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a04_Jung.vo.Prdct_mngmn;
import com.web.cookie.a04_Jung.vo.Prdct_mngmn;

@Mapper
public interface A03_JungDao10 {
// 생산재고 테이블
/*
inv_id_prd NUMBER PRIMARY KEY,-- 생산재고 아이디
exst_stck NUMBER,-- 기존 재고 갯수
prdct_cnfrm DATE,-- 생산 재고 확인 날짜
prd_id_prc NUMBER,-- 공정별 생산 아이디
mng_no NUMBER,-- 자재 입고 아이디
 */
@Select("SELECT pm.*,p.PNAME, pmp.PRD_YLD  \r\n"
		+ "FROM PRDCT_MNGMN pm,WORK_ORDER wo,PRODUCT p, PRD_MNG_PRC01 pmp,ORDER01 o \r\n"
		+ "WHERE pm.WORKL_ID = wo.WORKL_ID AND wo.ORDER_NO = o.ORDER_NO AND\r\n"
		+ "o.NO = p.NO AND pmp.PRD_ID_PRC = pm.PRD_ID_PRC AND pname LIKE #{pname}")
List<Prdct_mngmn> getPrdct_mngmnList(Prdct_mngmn sch);

@Select("SELECT * FROM PRDCT_MNGMN pm WHERE PRD_ID_PRC =#{prd_id_prc}")
Prdct_mngmn getPrdct_mngmn(@Param("prd_id_prc") int prd_id_prc);

@Insert("INSERT INTO prdct_mngmn VALUES(#{prd_id_prc},#{workl_id},"
		+ "to_date(#{prdct_dateStr},'YYYY-MM-DD')\r\n"
		+ ",to_date(#{exp_prdStr},'YYYY-MM-DD'), #{dfct_drng},#{ttlp_time})")
int insertPrdct_mngmn(Prdct_mngmn ins);

@Update("UPDATE PRDCT_MNGMN SET workl_id=#{workl_id}, prdct_date= to_date(#{prdct_dateStr},'YYYY-MM-DD'),\r\n"
		+ "exp_prd=to_date(#{exp_prdStr},'YYYY-MM-DD'),dfct_drng=#{dfct_drng},ttlp_time=#{ttlp_time} \r\n"
		+ "WHERE prd_id_prc=#{prd_id_prc}")
int updatePrdct_mngmn(Prdct_mngmn upt);

@Delete("DELETE FROM prdct_mngmn WHERE prd_id_prc=#{prd_id_prc}")
int deletePrdct_mngmn(@Param("prd_id_prc") int prd_id_prc);
}
