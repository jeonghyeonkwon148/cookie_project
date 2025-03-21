package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.web.cookie.a04_Jung.vo.Invn_prdc;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Prdct_mngmn;

@Mapper
public interface A13_JungDao3 {
/*
	private int mnum;// 원재료번호
	private String mname; // 원재료명
	private int mtot; // 현재 재고량
	private Date mdate; // 업데이트날짜
	private String mdateStr;
 */
@Select("SELECT \r\n"
		+ "    m.mname ,\r\n"
		+ "    NVL(SUM(si.curr_tot_stock), 0) - NVL(SUM(pr.prd_rwmt_usg), 0) mtot,\r\n"
		+ "    GREATEST(\r\n"
		+ "        NVL(MAX(si.inc_rels_dte), TO_DATE('1900-01-01', 'YYYY-MM-DD')),\r\n"
		+ "        NVL(MAX(pr.prdc_date), TO_DATE('1900-01-01', 'YYYY-MM-DD'))\r\n"
		+ "    ) mdate\r\n"
		+ "FROM material m\r\n"
		+ "LEFT JOIN material_mng si ON m.mnum = si.mnum\r\n"
		+ "LEFT JOIN prc01 so ON m.mnum = so.mnum\r\n"
		+ "LEFT JOIN prd_mng_prc01 pr ON pr.prc_id = so.prc_id\r\n"
		+ "WHERE MNAME LIKE #{mname}\r\n"
		+ "GROUP BY m.mnum, m.mname")
List<Invn_prdc> getInvn_prdcList(Invn_prdc sch);

@Select("SELECT COUNT(DISTINCT m.mnum) FROM material m "
        + "LEFT JOIN material_mng si ON m.mnum = si.mnum "
        + "LEFT JOIN prc01 so ON m.mnum = so.mnum "
        + "LEFT JOIN prd_mng_prc01 pr ON pr.prc_id = so.prc_id "
        + "WHERE m.mname LIKE #{mname}")
int getJungPageCount13(JungPageSch sch);


@Select("WITH material_data AS ("
		+ "    SELECT "
		+ "        ROW_NUMBER() OVER (ORDER BY m.mname) AS cnt, "
		+ "        m.mname, "
		+ "        GREATEST(0, NVL(SUM(si.curr_tot_stock), 0) - NVL(SUM(pr.prd_rwmt_usg), 0)) AS mtot, " 
		+ "        GREATEST("
		+ "            NVL(MAX(si.inc_rels_dte), TO_DATE('1900-01-01', 'YYYY-MM-DD')), "
		+ "            NVL(MAX(pr.prdc_date), TO_DATE('1900-01-01', 'YYYY-MM-DD'))"
		+ "        ) AS mdate "
		+ "    FROM material m "
		+ "    LEFT JOIN material_mng si ON m.mnum = si.mnum "
		+ "    LEFT JOIN prc01 so ON m.mnum = so.mnum "
		+ "    LEFT JOIN prd_mng_prc01 pr ON pr.prc_id = so.prc_id "
		+ "    WHERE m.mname LIKE #{mname} "
		+ "    GROUP BY m.mnum, m.mname "
		+ ") "
		+ "SELECT * "
		+ "FROM material_data "
		+ "WHERE cnt BETWEEN #{start} AND #{end}")
List<Invn_prdc> getJungPage13List(JungPageSch sch);

}
