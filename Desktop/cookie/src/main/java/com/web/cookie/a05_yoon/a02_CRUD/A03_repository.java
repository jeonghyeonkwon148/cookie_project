package com.web.cookie.a05_yoon.a02_CRUD;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a05_yoon.a01_vo.Cust_board;
import com.web.cookie.a05_yoon.a01_vo.Cust_boardfile;
import com.web.cookie.a05_yoon.a01_vo.Cust_boardsch;

@Mapper
public interface A03_repository {

	@Select("SELECT * from(\r\n"
			+ "	SELECT rownum cnt, LEVEL, b.* \r\n"
			+ "	FROM cust_board b\r\n"
			+ "	WHERE subject LIKE #{subject}\r\n"
			+ "	AND writer LIKE #{writer}\r\n"
			+ "	START WITH refno = 0		 	\r\n"
			+ "	CONNECT BY PRIOR NO = refno \r\n"
			+ "	ORDER siblings BY  NO desc\r\n"
			+ ") \r\n"
			+ "WHERE cnt BETWEEN #{start} AND #{end} ")
	List<Cust_board> getBoardList(Cust_boardsch sch);
	
	@Select("SELECT count(*)\r\n"
			+ "	FROM cust_board b\r\n"
			+ "	WHERE subject LIKE #{subject}\r\n"
			+ "	AND writer LIKE #{writer}\r\n"
			+ "	START WITH refno = 0		 	\r\n"
			+ "	CONNECT BY PRIOR NO = refno")
	int getBoardCount(Cust_boardsch sch);
	
	@Select("SELECT * FROM cust_board WHERE NO = #{no}")
	Cust_board getBoard(@Param("no") int no);
	
	@Select("SELECT fname FROM cust_boardfile WHERE NO = #{no}")
	List<String> getBoardFile(@Param("no") int no);	
	
	@Insert("INSERT INTO cust_board values(#{no}, #{refno}, #{subject},#{content},\r\n"
			+ "						#{writer},0, sysdate, sysdate)")
	@SelectKey(statement="SELECT cust_board_seq.nextval  FROM dual", 
		keyProperty = "no", before=true, resultType=int.class)
	int insertBoard(Cust_board ins);

	@Insert("INSERT INTO cust_boardfile values(#{no}, "
			+ "#{fname},#{etc},sysdate, sysdate)")
	int insertBoardFile(Cust_boardfile ins);	
	
	@Update("UPDATE board\r\n"
			+ "	SET readcnt = readcnt+1\r\n"
			+ "WHERE NO = #{no}")
	int readCntUpdate(@Param("no") int no);

   	@Update("UPDATE cust_board\r\n"
   			+ "   SET subject = #{subject},\r\n"
   			+ "   	   content = #{content},\r\n"
   			+ "   	   writer = #{writer},\r\n"
   			+ "   	   uptdte = sysdate\r\n"
   			+ "   	 WHERE NO = #{no}")
   	int updateBoard(Cust_board upt);
	
	@Delete("DELETE FROM cust_board\r\n"
			+ "    WHERE NO = #{no} ")
	int deleteBoard(@Param("no") int no);

}
