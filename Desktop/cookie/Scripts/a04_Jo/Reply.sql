SELECT * FROM reply;
ALTER TABLE reply ADD auth NUMBER(1,0);

CREATE TABLE reply (
    no NUMBER PRIMARY KEY,
    board_no NUMBER,
    content VARCHAR2(4000),
    writer VARCHAR2(50),
    auth NUMBER(1,0),
    regdte DATE,
    CONSTRAINT fk_board_no FOREIGN KEY (board_no) REFERENCES board(no)
);
CREATE SEQUENCE SEQ_REPLY
START WITH 1
INCREMENT BY 1
NOCACHE;
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, LAST_NUMBER
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_REPLY';

CREATE sequence reply_no;
INSERT INTO reply VALUES(
	reply_no.nextval, 4, '내용', '홍길동', sysdate
);
CREATE SEQUENCE reply_no
START WITH 1
INCREMENT BY 1;

/*
INSERT INTO reply VALUES(
	#{no}, #{board_no}, #{content}, #{writer}, sysdate
) 
 * */
DROP SEQUENCE reply_no;
CREATE SEQUENCE reply_no
START WITH 1
INCREMENT BY 1;

SELECT * FROM reply;
DELETE FROM reply WHERE no = 53;
/*
DELETE FROM reply WHERE no = #{no}
@Delete("DELETE FROM reply WHERE no = #{no}")
int DeleteReply(@Param("no") int no); 
	@Update("UPDATE board \r\n"
			+ "	SET subject = #{subject},\r\n"
			+ "		content = #{content},\r\n"
			+ "		writer = #{writer},\r\n"
			+ "		uptdte = sysdate \r\n"
			+ "	WHERE NO = #{no}")
	int updateBoard(Board upt); 
 * */
DELETE FROM reply WHERE NO= 104;
SELECT * FROM reply;
UPDATE reply 
	SET board_no = 165,
		content = 'ㄴㅇㄴ',
		writer = '오길동',
		regdte = sysdate
	WHERE NO = 52;

/*
UPDATE reply 
	SET board_no = #{board_no}
		content = #{content}
		writer = #{writer}
		regdte = sysdate
	WHERE no = #{no}
 @Update("")
 int upReply(Reply upt1);
 * */

SELECT * FROM reply;


