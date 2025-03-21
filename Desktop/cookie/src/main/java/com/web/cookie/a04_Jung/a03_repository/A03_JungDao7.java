package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.OrderJoin;
import com.web.cookie.a04_Jung.vo.Dfct_mngm01;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Work_order;

@Mapper
public interface A03_JungDao7 {
/*
	private int workl_id;//작업지시아이디
	private int order_no;//주문 아이디
	private Date final_schdl;//최종작업예정일
	private String final_schdlStr;//최종작업예정일
	private int day_pro;//일일생산량(목표)
	private int order_cnt;//주문수량
	private Date due_dte;//납기일
	private String due_dteStr;//납기일
	private String pname;//제품명
 */
@Select("SELECT wo.*, due_dte, PNAME, ORDER_CNT FROM WORK_ORDER wo,ORDER01 o, PRODUCT p \r\n"
		+ " where wo.ORDER_NO = o.ORDER_NO AND o.NO = p.NO AND pname LIKE #{pname} "
		+ " ORDER BY workl_id desc")
List<Work_order> getWork_orderList(Work_order sch);

@Select("SELECT p.pname,o.* FROM ORDER01 o,PRODUCT p WHERE p.NO = o.no")
List<OrderJoin> getWork_orderList2();

@Select("SELECT COUNT(*) FROM WORK_ORDER wo,ORDER01 o, PRODUCT p\r\n"
		+ "	WHERE wo.ORDER_NO = o.ORDER_NO AND o.NO = p.NO \r\n"
		+ "	AND pname LIKE #{pname}")
int getJungPageCount7(JungPageSch sch);

@Select("SELECT * FROM ("
        + "    SELECT rownum AS cnt, wo2.* FROM ("
        + "        SELECT wo.*, o.due_dte, p.PNAME, o.ORDER_CNT FROM WORK_ORDER wo"
        + "        JOIN ORDER01 o ON wo.ORDER_NO = o.ORDER_NO"
        + "        JOIN PRODUCT p ON o.NO = p.NO"
        + "        WHERE p.PNAME LIKE #{pname}"
        + "        ORDER BY wo.workl_id DESC"  // 내림차순 정렬을 내부 서브쿼리에서 먼저 적용
        + "    ) wo2"
        + ") WHERE cnt BETWEEN #{start} AND #{end}")
List<Work_order> getJungPage7List(JungPageSch sch);


@Select("SELECT * FROM WORK_ORDER wo WHERE workl_id=#{workl_id}")
Work_order getWork_order(@Param("workl_id") int workl_id);

@Insert("INSERT INTO WORK_ORDER wo values(WORK_ORDER_seq.nextval,#{order_no}, "
		+ "to_date(#{final_schdlStr},'YYYY-MM-DD'),#{day_pro})")
int insertWork_order(Work_order ins);

@Update("UPDATE WORK_ORDER SET order_no=#{order_no}, "
		+ "final_schdl=to_date(#{final_schdlStr},'YYYY-MM-DD'), "
		+ "day_pro=#{day_pro}  WHERE workl_id=#{workl_id}")
int updateWork_order(Work_order upt);

@Delete("DELETE FROM WORK_ORDER WHERE workl_id=#{workl_id}")
int deleteWork_order(@Param("workl_id") int workl_id);

@Delete("DELETE FROM prdct_mngmn WHERE workl_id=#{workl_id}")
int deletePrdct_mngmn3(@Param("workl_id") int workl_id);

}
