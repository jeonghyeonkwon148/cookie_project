--게시판 정보 테이블
CREATE TABLE cust_board(
	no number(5,0),
	refno number(5,0),
	subject varchar2(100),
	content varchar2(1500),
	writer varchar2(50),
	readcnt number(4,0),
	regdte DATE,
	uptdte date
);
ALTER TABLE cust_board
MODIFY subject varchar2(2000);

--첨부파일 정보 테이블
CREATE TABLE cust_boardfile(
	no number(5,0),
	fname varchar2(100),
	etc varchar2(100),
	regdte DATE,
	uptdte date
);
--페이징 처리 테이블
CREATE TABLE cust_boardsch(
	subject varchar2(100),
	writer varchar2(50),
	count number(4,0),
	pagesize number(2,0),
	curpage number(4,0),
	pagecount number(4,0),
	starting number(4,0),
	ending number(4,0),
	blocksize number(2,0),
	startblock number(4,0),
	endblock number(4,0)
);
CREATE SEQUENCE cust_board_seq;
SELECT cust_board_seq.nextval  FROM dual;

INSERT INTO cust_board values(1,0,'첫번째 글','첫번째 글입니다','홍길동',0,sysdate,sysdate);
SELECT *FROM cust_board;

DROP TABLE cust_board;
DROP TABLE cust_boardfile;
COMMIT;

