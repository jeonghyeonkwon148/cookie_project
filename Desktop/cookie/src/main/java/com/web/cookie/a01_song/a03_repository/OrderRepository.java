package com.web.cookie.a01_song.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.Order;
import com.web.cookie.a01_song.a04_vo.OrderJoin;
import com.web.cookie.a01_song.a04_vo.OrderJoinSch;

@Mapper
public interface OrderRepository {
	@Select("order_no, order01.num num,cname, order01.NO no, pname ,unit ,price, order_dte,order_cnt,tot,due_dte\r\n"
			+ "	FROM order01,product,customer\r\n"
			+ "	WHERE order01.num = customer.NUM \r\n"
			+ "	AND order01.NO = product.NO\r\n"
			+ "	ORDER BY order_no")
	List<OrderJoin> getOlist();
	@Select("SELECT COUNT(*) FROM order01,product,customer\r\n"
			+ "	WHERE order01.num = customer.NUM \r\n"
			+ "	AND order01.NO = product.NO\r\n"
			+ "	AND cname LIKE #{cname}\r\n"
			+ "	AND pname LIKE #{pname}")
	int getOrderJoinCount(OrderJoinSch sch);
	
	@Select("SELECT *\r\n"
			+ "	FROM (SELECT ROW_NUMBER() OVER (ORDER BY order_no desc) AS cnt,order_no, order01.num num,cname, order01.NO no, pname ,unit ,price, order_dte,order_cnt,tot,due_dte\r\n"
			+ "	FROM order01,product,customer\r\n"
			+ "	WHERE order01.num = customer.NUM \r\n"
			+ "	AND order01.NO = product.NO\r\n"
			+ "	AND cname LIKE #{cname}\r\n"
			+ "	AND pname LIKE #{pname} )\r\n"
			+ "	WHERE cnt BETWEEN #{start} AND #{end}")
	List<OrderJoin> getOrderJoinList(OrderJoinSch sch); 
	
	@Select("select * from order01\r\n"
			+ "			where order_no=#{order_no}")
	Order getOrder(@Param("order_no") int order_no);
	
	@Select("SELECT * FROM order01 \r\n"
			+ "	WHERE num = #{num} ")
	List<Order> findByCustomer(@Param("num") int num);
	
	@Insert("INSERT INTO order01 values(order_seq.nextval,#{no},#{num},sysdate,#{order_cnt},#{tot},#{due_dte})")
	int insertOrder(Order ins);
	
	@Update("UPDATE order01 \r\n"
			+ "	SET num = #{num},\r\n"
			+ "		no = #{no},\r\n"
			+ "		order_dte = to_date(#{order_dteS},'YYYY-MM-DD'),\r\n"
			+ "		order_cnt = #{order_cnt},\r\n"
			+ "	 	 tot = #{tot},\r\n"
			+ "	  	due_dte=#{due_dte}\r\n"
			+ "	  WHERE order_no=#{order_no}")
	int updateOrder(Order upt);
	
	@Delete("delete from order01\r\n"
			+ "		where order_no=#{order_no}")
	int deleteOrder(@Param("order_no") int order_no);
}
