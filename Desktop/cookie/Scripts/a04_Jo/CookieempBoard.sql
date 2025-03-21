SELECT * FROM cookieemp;
SELECT ename FROM cookieemp = '박길동';
SELECT * FROM cookiedept;
CREATE TABLE cookieemp(
	empno NUMBER(4) PRIMARY KEY,
	ename varchar2(50),
	pwd varchar2(20),
	deptno NUMBER(2),
	CONSTRAINT cookieemp_deptno_fk
	FOREIGN KEY(deptno) REFERENCES cookiedept(deptno),
	auth NUMBER(1),
	sal NUMBER(8),
	pwdupt NUMBER(1)
);

SELECT * FROM board;
CREATE TABLE board (
    NO NUMBER(5,0) PRIMARY KEY,         -- 게시글 고유 번호 (Primary Key)
    refno NUMBER(5,0),                  -- 참조 번호 (답글/댓글 기능 구현 시 사용 가능)
    subject VARCHAR2(100),              -- 게시글 제목
    content VARCHAR2(1000),             -- 게시글 내용
    writer VARCHAR2(50),                -- 작성자 이름
    readcnt NUMBER(3,0),                -- 조회수
    isread CHAR(1) DEFAULT 'N',        			-- 읽음 여부 ('N' = 미확인, 'Y' = 확인)
    regdte DATE,                        -- 작성일
    uptdte DATE                         -- 수정일
);
/*
cookieempList 와 board 테이블을 조인한다.
empno pk키

no pk키

cookieemp c*
board b*

결과물 : 
0. 게시글 검색시 부서번호, 제목
1. 게시글 작성시 사원명, 부서번호, b*
2. 게시글 답글시 로그인한 세션으로 사원정보 받고, 
board에서는 제목(subject), 내용(content), ename=writer(작성자), regdte(등록날짜)
3. 게시글 수정시 로그인한 세션으로 사원정보 받고, 
board에서는 제목(subject), 내용(content), ename=writer(작성자), uptdte(수정날짜)
4. 게시글 삭제시 삭제
5. 
 * */

SELECT * FROM (
    SELECT rownum cnt, LEVEL, b.*
    FROM board b
    JOIN cookieemp e ON b.writer = e.ename 	
    WHERE b.subject LIKE #{subject}			
    AND b.writer LIKE #{writer}
    AND e.deptno = #{deptno}
    AND TRUNC(b.regdte) = TRUNC(SYSDATE)
    START WITH b.refno = 0
    CONNECT BY PRIOR b.no = b.refno
    ORDER SIBLINGS BY b.no DESC
)
WHERE cnt BETWEEN #{start} AND #{end};
	
SELECT * FROM board WHERE TRUNC(regdte) = TRUNC(SYSDATE);
	
	
SELECT * FROM board;
SELECT * FROM COOKIEEMP;
SELECT * FROM cookiedept;
SELECT * FROM cookieemp WHERE ename = '홍길동' AND deptno = 99;

SELECT * FROM cookiedept;

