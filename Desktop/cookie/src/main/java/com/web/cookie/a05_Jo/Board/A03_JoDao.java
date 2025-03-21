package com.web.cookie.a05_Jo.Board;

import java.util.List;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a05_Jo.vo.Board;
import com.web.cookie.a05_Jo.vo.BoardFile;
import com.web.cookie.a05_Jo.vo.BoardSch;
import com.web.cookie.a05_Jo.vo.Reply;


@Mapper
public interface A03_JoDao {
	// 게시물 카운트
	@Select(" 	SELECT count(*)\r\n"
			+ "	from board b\r\n"
			+ "	WHERE subject LIKE #{subject}\r\n"
			+ "	AND writer LIKE #{writer}\r\n"
		    + " AND category LIKE #{category}\r\n"
			+ "	START WITH refno = 0	\r\n"
			+ "	CONNECT BY PRIOR NO = refno")
	int getBoardCount(BoardSch sch);	
	
	// 게시물 리스트, 검색
	@Select("SELECT * FROM ("
		      + "    SELECT rownum cnt, LEVEL, b.no, b.refno, b.subject, b.content, b.writer, b.readcnt, b.isread, b.regdte, b.uptdte, b.empno, b.category, b.deptno AS board_deptno, e.deptno AS emp_deptno"
		      + "    FROM board b"
		      + "    JOIN cookieemp e ON b.writer = e.ename"
		      + "    WHERE b.subject LIKE #{subject}"
		      + "    AND b.writer LIKE #{writer}"
		      + "    AND b.category LIKE #{category}"
		      + "    AND b.refno = 0" // 댓글 제외 조건 추가
		      + "    START WITH b.refno = 0"
		      + "    CONNECT BY PRIOR b.no = b.refno"
		      + "    ORDER SIBLINGS BY b.regdte DESC"
		      + ")"
		      + "WHERE cnt BETWEEN #{start} AND #{end}")
		List<Board> getBoardList(BoardSch sch);


	// 게시판 등록
	@Insert("INSERT INTO board (no, refno, subject, content, writer, readcnt, isread, regdte, uptdte, category, empno, deptno) \r\n"
	        + "SELECT #{no}, #{refno}, #{subject}, #{content}, e.ename, 0, 'N', SYSDATE, SYSDATE, #{category}, e.empno, e.deptno \r\n"
	        + "FROM cookieemp e \r\n"
	        + "WHERE e.ename = #{writer}")
	@SelectKey(statement="SELECT board_seq.nextval FROM dual", 
	    keyProperty = "no", before = true, resultType = int.class)
	int insertBoard(Board ins);

	@Insert("INSERT INTO boardfile values(#{no}, "
			+ "#{fname},#{etc},sysdate, sysdate)")
	int insertBoardFile(BoardFile ins);	
	
	@Select("SELECT * FROM board WHERE NO = #{no}")
	Board getBoard(@Param("no") int no);
	
	@Select("SELECT fname FROM boardfile WHERE NO = #{no}")
	List<String> getBoardFile(@Param("no") int no);
	
	@Update("UPDATE board\r\n"
			+ "	SET readcnt = readcnt+1\r\n"
			+ "WHERE NO = #{no}")
	int readCntUpdate(@Param("no") int no);
	
	@Update("UPDATE board \r\n"
			+ "	SET subject = #{subject},\r\n"
			+ "		content = #{content},\r\n"
			+ "		writer = #{writer},\r\n"
			+ "		uptdte = sysdate \r\n"
			+ "	WHERE NO = #{no}")
	int updateBoard(Board upt); 
	
	
	@Delete("DELETE FROM board WHERE no = #{no}")
	int deleteBoard(@Param("no") int no);
	
	@Update("UPDATE board \r\n"
			+ "SET isread = 'Y',\r\n"
			+ "	readcnt = readcnt + 1\r\n"
			+ "WHERE no = #{no} ")
    int updateReadCount(int no);

	// 댓글 리스트 조회
	@Select("SELECT r.no, r.board_no, r.content, r.writer, r.regdte, e.auth\r\n"
			+ "FROM reply r\r\n"
			+ "JOIN cookieemp e ON r.writer = e.ename\r\n"
			+ "WHERE r.board_no = #{board_no}\r\n"
			+ "ORDER BY regdte DESC")
	List<Reply> getReplyList(int board_no);
/*
	// 댓글 리스트 조회1
	@Select("SELECT * FROM reply "
			+ "WHERE board_no = #{board_no} "
			+ "ORDER BY regdte DESC")
	List<Reply> getReplyList(Reply sch);
	*/
	
	@Insert("INSERT INTO reply (no, board_no, content, writer, auth, regdte)\r\n"
			+ "SELECT SEQ_REPLY.NEXTVAL, #{board_no}, #{content}, #{writer}, e.auth, SYSDATE\r\n"
			+ "FROM cookieemp e \r\n"
			+ "WHERE e.ename = #{writer} \r\n")
	@SelectKey(statement="SELECT reply_no.nextval FROM dual", 
	        keyProperty = "no", before = true, resultType = int.class)
	int insertReply(Reply ins1);

	// 댓글 삭제
	@Delete("DELETE FROM reply WHERE no = #{no}")
	int DeleteReply(@Param("no") int no);
	
	// 댓글 수정
	 @Update("UPDATE reply\r\n"
	 		+ "SET content = #{content},\r\n"
	 		+ "    writer = #{writer},\r\n"
	 		+ "    auth = (SELECT e.auth FROM cookieemp e WHERE e.ename = #{writer}),\r\n"
	 		+ "    regdte = SYSDATE\r\n"
	 		+ "WHERE no = #{no}\r\n")
	 int upReply(Reply upt1);
	 
	@Select("SELECT * FROM Reply WHERE NO = #{no}")
	Reply getReply(@Param("no") int no);    
	 
	// 대_댓글 등록
	
}
