DROP TABLE board;

SELECT * FROM BOARD;

CREATE TABLE board (
    NO NUMBER(5,0) PRIMARY KEY,         -- 게시글 고유 번호 (Primary Key)
    refno NUMBER(5,0),                  -- 참조 번호 (답글/댓글 기능 구현 시 사용 가능)
    subject VARCHAR2(100),              -- 게시글 제목
    content VARCHAR2(1000),             -- 게시글 내용
    writer VARCHAR2(50),                -- 작성자 이름
    category VARCHAR2(50),
    readcnt NUMBER(3,0),                -- 조회수
    isread CHAR(1) DEFAULT 'N',        			-- 읽음 여부 ('N' = 미확인, 'Y' = 확인)
    regdte DATE,                        -- 작성일
    uptdte DATE                         -- 수정일
);
create sequence board_seq;  -- 자동 numbering sequence
insert into board values(board_seq.nextval,0,'첫번째 게시판 첫번째글',
					'내용1','연습용',0,sysdate,sysdate);

ALTER TABLE board  
MODIFY content VARCHAR2(2000);

INSERT INTO board (subject, content, writer, uptdte, no)
VALUES ('새로운 주제', '내용', '작성자', sysdate, seq_board.NEXTVAL);


SELECT * FROM board;
DELETE board WHERE no = 148;
ALTER TABLE board MODIFY category varchar2(50);
SELECT * FROM board WHERE CATEGORY = '공 지';
SELECT * FROM board WHERE CATEGORY = '공지';




ALTER TABLE board ADD categoryname VARCHAR2(50);
SELECT NO, subject, isread 
FROM board 
ORDER BY NO DESC;
SELECT * FROM board;
UPDATE board 
SET isread = 'Y',
	readcnt = readcnt + 1
WHERE NO = 2;
/*
UPDATE board 
SET isread = 'Y',
	readcnt = readcnt + 1
WHERE no = #{no} 
 * */

SELECT board_seq.nextval  FROM dual;
SELECT * FROM board;

SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'BOARD';


DELETE FROM board
WHERE ROWID NOT IN (
    SELECT MIN(ROWID)
    FROM board
    GROUP BY writer
);
DELETE FROM board 

SELECT *
FROM board 
WHERE writer LIKE '%%'
AND subject LIKE '%%'
ORDER BY no desc;
/*
SELECT *
FROM board 
WHERE writer LIKE #{writer}
AND subject LIKE #{subject}
ORDER BY no desc

@Select("")
List<Board> getBoardList(Board sch);
 * */
SELECT * FROM board;
INSERT INTO board values(
	2, 0, '첫번째 연습용', '답급', '김길동', 0, sysdate, sysdate
);
INSERT INTO board (NO, refno, subject, content, writer, readcnt, regdte, uptdte, category)
VALUES (1, 0, '첫 번째 게시물', '내용입니다.', '홍길동', 0, SYSDATE, NULL, '공지');

INSERT INTO board (NO, refno, subject, content, writer, readcnt, regdte, uptdte, category)
VALUES (2, 0, '두 번째 게시물', '내용입니다.', '김철수', 0, SYSDATE, NULL, '복지');

INSERT INTO board (NO, refno, subject, content, writer, readcnt, regdte, uptdte, category)
VALUES (3, 0, '두 번째 게시물', '내용입니다.', '김철수', 0, SYSDATE, NULL, '협찬');
INSERT INTO board (NO, refno, subject, content, writer, readcnt, regdte, uptdte, category)
VALUES (4, 0, '두 번째 게시물', '내용입니다.', '김철수', 0, SYSDATE, NULL, '이벤트');
INSERT INTO board (NO, refno, subject, content, writer, readcnt, regdte, uptdte, category)
VALUES (5, 0, '두 번째 게시물', '내용입니다.', '김철수', 0, SYSDATE, NULL, '기사');
INSERT INTO board (NO, refno, subject, content, writer, readcnt, regdte, uptdte, category)
VALUES (6, 0, '두 번째 게시물', '내용입니다.', '김철수', 0, SYSDATE, NULL, '공지');
/*
no, refno, subject, content, writer, readcnt, regdte, uptdte 
 * */
SELECT * FROM board WHERE subject = '삭제연습중';
SELECT * FROM board;
/*
SELECT * FROM board WHERE NO = #{no};

	@Select("SELECT * FROM joboard WHERE NO = #{no}")
	Board getBoard(@Param("no") int no);
 * */
SELECT * FROM board;

UPDATE board 
	SET subject = '첫번째 수정용',
		content = '몰라여	',
		writer = '홍길동',
		category = '공지',
		uptdte = sysdate
	WHERE NO = 86;
SELECT * FROM cookieemp;
UPDATE board 
	SET subject = '2번째 수정',
		content = '수정 테스트',
		writer = '홍길동',
		category = '공지',
		uptdte = sysdate 
	WHERE NO = 86;
SELECT 
/*
UPDATE board 
	SET subject = #{subject},
		content = #{content},
		writer = #{writer},
		category = #{category},
		uptdte = sysdate 
	WHERE NO = #{no}
	
	
SQL: UPDATE board SET subject = ?, content = ?, writer = ?, 
category = ?, uptdte = sysdate WHERE NO = ? ### 
 * */


DESC board;
SELECT cols.column_name
FROM all_constraints cons, all_cons_columns cols
WHERE cons.constraint_type = 'U'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner
AND cols.table_name = 'BOARD'
/*
UPDATE board 
	SET subject = #{subject},
		content = #{content},
		writer = #{writer},
		category = #{category},
		uptdte = sysdate
	WHERE NO = #{no}; 
 * */
/*

	@Update("UPDATE board \r\n"
			+ "	SET subject = #{subject},\r\n"
			+ "		content = #{content},\r\n"
			+ "		writer = #{writer},\r\n"
			+ "		uptdte = sysdate\r\n"
			+ "	WHERE NO = #{no}")
	int updateBoard(Board upt); 
 * */

/*
읽지 않은 게시물에 '미확인 게시물' 표시 
 * */
SELECT 
    NO,
    CASE 	 
        WHEN isread = 'N' THEN '*미확인 게시물* ' || subject 
        ELSE subject 
    END AS subject,
    writer,
    readcnt,
    regdte
FROM board;

/*
게시물을 확인했을 때 해당 게시물의 'is_read' 값을 'Y'로 업데이트 합니다. 
 * */
UPDATE board
SET isread = 'Y',
    readcnt = readcnt + 1  -- 조회수 증가
WHERE NO = 1;
/*
@Update("UPDATE board SET readcnt = readcnt + 1, isChecked = 1 WHERE no = #{no}")
    void updateReadCount(int no)
 * */
SELECT * FROM board;
/*
INSERT INTO board values(
	#{no},#{refno},#{subject},#{content},#{writer}, 0,
	sysdate,sysdate,#{is_read}
)
*/
UPDATE board 
	SET isread = 'Y',
	readcnt = readcnt + 1
WHERE NO = 1;

SELECT * FROM board ORDER BY NO DESC;

INSERT INTO board (no, refno, subject, content, writer, readcnt, isread, regdte) 
VALUES (102, 3, '공지사항(답글)', '공지 내용', '홍길동', 5, 'Y', SYSDATE);

INSERT INTO board (no, refno, subject, content, writer, readcnt, isread, regdte) 
VALUES (2, 0, '질문 있습니다', '질문 내용', '김철수', 3, 'N', SYSDATE);

INSERT INTO board (no, refno, subject, content, writer, readcnt, isread, regdte) 
VALUES (3, 2, '답변 드립니다.', '답변 내용', '박영희', 2, 'N', SYSDATE);

SELECT LEVEL, b.* FROM board b
START WITH refno = 52
CONNECT BY PRIOR no = refno
ORDER SIBLINGS BY no DESC;
/*
SELECT LEVEL, b.* FROM board b
START WITH refno = #{refno}
CONNECT BY PRIOR no = refno
ORDER SIBLINGS BY no DESC 

@Select("")
int get

 * */
SELECT * FROM board;

/*
	@Select("SELECT * from(\r\n"
			+ "	SELECT rownum cnt, LEVEL, b.* \r\n"
			+ "	FROM board b\r\n"
			+ "	WHERE subject LIKE #{subject}\r\n"
			+ "	AND writer LIKE #{writer}\r\n"
			+ "	START WITH refno = 0		 	\r\n"
			+ "	CONNECT BY PRIOR NO = refno \r\n"
			+ "	ORDER siblings BY  NO desc\r\n"
			+ ") \r\n"
			+ "WHERE cnt BETWEEN #{start} AND #{end} ")
	List<Board> getBoardList(BoardSch sch); 
 * */
SELECT * from(
SELECT rownum cnt, LEVEL, b.*, e.deptno
FROM board b
JOIN cookieemp e ON b.writer = e.ename
WHERE subject LIKE '%%'
AND writer LIKE '홍길동'
START WITH refno = 0	
	CONNECT BY PRIOR NO = 0 
	ORDER siblings BY  NO desc
) 
WHERE cnt BETWEEN 1 AND 5;

/*
	@Update("UPDATE board \r\n"
			+ "	SET subject = #{subject},\r\n"
			+ "		content = #{content},\r\n"
			+ "		writer = #{writer},\r\n"
			+ "		uptdte = sysdate\r\n"
			+ "	WHERE NO = #{no}")
	int updateBoard(Board upt); 
 * 
 * */
DELETE from board WHERE NO =83;
SELECT * FROM board;
ALTER TABLE reply DROP CONSTRAINT FK_BOARD_NO;
SELECT * FROM (
    SELECT rownum AS cnt, LEVEL, b.*, e.deptno
    FROM board b
    JOIN cookieemp e ON b.writer = e.ename
    WHERE b.subject LIKE '%%'
    AND b.writer LIKE '%%'
    AND b.category LIKE '%%'
    AND b.refno = 0 -- 댓글 제외 조건 추가
    START WITH b.refno = 0
    CONNECT BY PRIOR b.no = b.refno
    ORDER SIBLINGS BY b.regdte DESC
)
ALTER TABLE board ADD (empno NUMBER(4));

WHERE cnt BETWEEN 1 AND 5;

INSERT INTO board (no, refno, subject, content, writer, readcnt, isread, regdte, uptdte, empno)
SELECT ?, ?, ?, ?, ?, 0, 'N', SYSDATE, SYSDATE, e.empno
FROM cookieemp e
WHERE e.ename = ?;

INSERT INTO board (no, refno, subject, content, writer, readcnt, isread, regdte, uptdte)
SELECT #{no}, #{refno}, #{subject}, #{content}, #{writer}, 0, 'N', SYSDATE, SYSDATE, e.empno
FROM cookieemp e
WHERE e.ename = #{writer};

ALTER TABLE board
ADD empno NUMBER(4);
ALTER TABLE board
DROP COLUMN deptno;

SELECT * FROM board WHERE empno = '9999'; -- 실제 사원번호로 대체

SELECT *
from board b
	WHERE subject LIKE '%%'
	AND writer LIKE '%%'
 AND category LIKE '%%'
START WITH refno = 0	
	CONNECT BY PRIOR NO = refno;

SELECT * FROM board WHERE category = '공지';

ALTER TABLE board DROP CONSTRAINT BOARD_CATEGORY_UNIQUE;

SELECT constraint_name 
FROM user_constraints 
WHERE table_name = 'BOARD';
