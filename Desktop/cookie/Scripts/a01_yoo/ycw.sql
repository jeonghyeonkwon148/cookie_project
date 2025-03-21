-- 사원정보 테이블
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

CREATE SEQUENCE cookieempseq
START WITH 1000;
INSERT INTO cookieemp VALUES (9999,'홍길동','1234',99,9,1,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'김길동','1234',10,1,10000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'이길동','1234',10,1,20000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'박길동','1234',10,2,30000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'최길동','1234',10,2,40000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'김철수','1234',20,1,10000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'이철수','1234',20,1,20000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'박철수','1234',20,2,30000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'최철수','1234',20,2,40000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'김영희','1234',30,1,10000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'이영희','1234',30,1,20000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'박영희','1234',30,2,30000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'최영희','1234',30,2,40000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'김영수','1234',40,1,10000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'이영수','1234',40,1,20000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'박영수','1234',40,2,30000000,1);
INSERT INTO cookieemp VALUES (cookieempseq.nextval,'최영수','1234',40,2,40000000,1);
SELECT COUNT(*) FROM cookieemp WHERE empno=1000;
-- 부서정보 테이블
CREATE TABLE cookiedept(
	deptno NUMBER(2) PRIMARY KEY,
	dname varchar2(50)
);
INSERT INTO cookiedept VALUES (99,'슈퍼계정');
INSERT INTO cookiedept VALUES (10,'인사');
INSERT INTO cookiedept VALUES (20,'생산');
INSERT INTO cookiedept VALUES (30,'수주');
INSERT INTO cookiedept VALUES (40,'재고');
-- 켈린더 테이블
CREATE TABLE cookieidcal(
	cno NUMBER PRIMARY KEY,
	title varchar2(100),
	empno NUMBER(4),
	CONSTRAINT cookieidcal_empno_fk
	FOREIGN KEY(empno) REFERENCES cookieemp (empno),
	start1 varchar2(30),	-- 'start'는 oracle 내장키워드라서 컬럼명으로 사용 못함
	end1 varchar2(30),
	content varchar2(1000),
	backgroundcolor varchar2(50),
	textcolor varchar2(50),
	allday number(1),
	urllink varchar2(50),
	showlevel number(1)
);
CREATE SEQUENCE cookieidcalseq;
<<<<<<< .mine
SELECT * FROM cookieidcal;

||||||| .r342

=======
SELECT * FROM cookieidcal;
>>>>>>> .r388
SELECT * FROM cookieidcal WHERE showlevel>=3
OR (showlevel>=2 AND deptno=99)
OR (showlevel=1 AND empno = 9999);
SELECT * FROM cookieidcal;
SELECT cno "id", title, empno, start1 "start", end1 "end",
		content, backgroundcolor, textcolor,
		allday, urllink, showlevel FROM cookieidcal;
INSERT INTO cookieidcal VALUES (cookieidcalseq.nextval,'임시 일정',9999,
'2025-02-15','2025-02-16','임시 등록 일정','#850000','#b8ffcd',1,NULL,9,99);
INSERT INTO cookieidcal VALUES (cookieidcalseq.nextval,'이길동의 일정',1001,
'2025-02-11','2025-02-12','이길동의 개인일정','#f5f5dc','#463232',1,NULL,1,10);
DELETE cookieidcal WHERE cno=1;

ALTER TABLE cookieidcal
ADD deptno number(2);
ALTER TABLE cookieidcal
ADD CONSTRAINT cookieidcal_deptno_fk
FOREIGN KEY (deptno) REFERENCES cookiedept(deptno);
-- 메세지 테이블
CREATE TABLE cookieempmsg(
	mid NUMBER PRIMARY KEY,
	rmid NUMBER,
	seid NUMBER(4),
	CONSTRAINT cookieempmsg_seid_fk
	FOREIGN KEY (seid) REFERENCES cookieemp (empno),
	reid NUMBER(4),
	CONSTRAINT cookieempmsg_reid_fk
	FOREIGN KEY (reid) REFERENCES cookieemp (empno),
	content varchar2(250),
	opauth number(1),
	senddte date
);
ALTER TABLE cookieempmsg
MODIFY content varchar2(1000);
CREATE SEQUENCE cookieempmsgseq;

INSERT INTO cookieempmsg VALUES (cookieempmsgseq.nextval,0,9999,1000,'김길동에게, 홍길동이',1,sysdate);
INSERT INTO cookieempmsg VALUES (cookieempmsgseq.nextval,0,1003,1003
,'비밀번호 변경 요청 알림\n이름 : 김아무개\n사원번호 : 5555',1,sysdate);
SELECT m.*,ename FROM cookieempmsg m, cookieemp
WHERE seid = empno
ORDER BY mid;
DELETE cookieempmsg WHERE reid=1041;
-- 메세지 첨부파일
CREATE TABLE cookiemsgfile(
	mid NUMBER,
	CONSTRAINT cookiemsgfile_mid_fk
	FOREIGN KEY (mid) REFERENCES cookieempmsg (mid),
	fname varchar2(100),
	finfo varchar2(100)
);
SELECT * FROM cookiemsgfile;
ALTER TABLE cookiemsgfile
DROP CONSTRAINT cookiemsgfile_mid_fk;
ALTER TABLE cookiemsgfile
ADD CONSTRAINT cookiemsgfile_mid_fk
FOREIGN KEY (mid) REFERENCES cookieempmsg(mid)
ON DELETE CASCADE;

-- 게시글
CREATE TABLE cookieempboard(
	bid NUMBER PRIMARY KEY,
	rbid NUMBER,
	deptno NUMBER(2),
	CONSTRAINT cookieempboard_deptno_fk
	FOREIGN KEY (deptno) REFERENCES cookiedept (deptno),
	headtt varchar2(12),
	title varchar2(100),
	content varchar2(1000),
	empno NUMBER(4),
	CONSTRAINT cookieempboard_empno_fk
	FOREIGN KEY (empno) REFERENCES cookieemp (empno),
	readcnt NUMBER(3),
	writedte DATE,
	uptdte DATE,
	auth NUMBER(1)
);
CREATE SEQUENCE cookieempbdseq;
-- 게시글 첨부파일
CREATE TABLE cookiebdfile(
	bid NUMBER,
	CONSTRAINT cookiemsgfile_bid_fk
	FOREIGN KEY (bid) REFERENCES cookieempboard (bid),
	fname varchar2(100),
	finfo varchar2(100)
);
ALTER TABLE cookiebdfile
DROP CONSTRAINT cookiemsgfile_bid_fk;
ALTER TABLE cookiebdfile
ADD CONSTRAINT cookiemsgfile_bid_fk
FOREIGN KEY (bid) REFERENCES cookieempboard(bid)
ON DELETE CASCADE;

-- 게시글 확인 여부
CREATE TABLE cookiecheckread(
	empno NUMBER(4),
	bid NUMBER,
	CONSTRAINT cookiecheckread_pk
	PRIMARY KEY (empno,bid),
	CONSTRAINT cookiecheckread_empno_fk
	FOREIGN KEY (empno) REFERENCES cookieemp(empno),
	CONSTRAINT cookiecheckread_bid_fk
	FOREIGN KEY (bid) REFERENCES cookieempboard(bid)
);
ALTER TABLE cookiecheckread
DROP CONSTRAINT cookiecheckread_pk;
ALTER TABLE cookiecheckread
DROP CONSTRAINT cookiecheckread_empno_fk;
ALTER TABLE cookiecheckread
DROP CONSTRAINT cookiecheckread_bid_fk;

ALTER TABLE cookiecheckread
ADD CONSTRAINT cookiecheckread_empno_fk
FOREIGN KEY (empno) REFERENCES cookieemp(empno)
ON DELETE CASCADE;
ALTER TABLE cookiecheckread
ADD CONSTRAINT cookiecheckread_bid_fk
FOREIGN KEY (bid) REFERENCES cookieempboard(bid)
ON DELETE CASCADE;

SELECT * FROM cookiecheckread;

-- 수익지출 기록 테이블
CREATE TABLE cookiejangbu(
	jid NUMBER PRIMARY KEY,
	empno number(4),
	CONSTRAINT cookiejangbu_empno_pk
	FOREIGN KEY (empno) REFERENCES cookieemp(empno),
	spinfo varchar2(50),
	cost number(10),
	plormi number(1),
	info varchar2(1000),
	writedte DATE,
	ncost NUMBER(10)
);
CREATE SEQUENCE cookiejangbuseq;

SELECT * FROM cookieemp WHERE empno=9999 AND pwd='1234';
SELECT e.*, d.dname FROM cookieemp e, cookiedept d WHERE empno=9999 AND e.deptno=d.deptno;
UPDATE cookieemp SET pwdupt=1, pwd='2345' WHERE empno=9999;


SELECT * FROM cookieempmsg WHERE reid=9999;
SELECT * FROM cookieempmsg WHERE seid=9999;

SELECT * FROM cookiedept
WHERE deptno<99
ORDER BY deptno;


SELECT e.*, d.dname FROM cookieemp e, cookiedept d
WHERE ename LIKE '%%' AND e.deptno=d.deptno AND d.deptno LIKE '10'
ORDER BY d.deptno,auth DESC,empno;

SELECT e.*, d.dname FROM cookieemp e, cookiedept d
WHERE empno = 1002 AND e.deptno=d.deptno;

SELECT COUNT(*) FROM cookieemp e
WHERE ename LIKE '%%' AND deptno LIKE '%%';
			


SELECT * FROM (
SELECT rownum cnt, e.*, d.dname FROM cookieemp e, cookiedept d
WHERE e.deptno=d.deptno AND ename LIKE '%%' AND d.deptno LIKE '%%' AND d.deptno<90
ORDER BY e.deptno,auth DESC,empno)
WHERE cnt BETWEEN 10 AND 15;

SELECT * FROM (
SELECT ROW_NUMBER() OVER (ORDER BY e.deptno,auth DESC,empno) AS cnt, 
e.*, d.dname FROM cookieemp e, cookiedept d
WHERE e.deptno=d.deptno AND ename LIKE '%%' AND d.deptno LIKE '%%' AND d.deptno<90
ORDER BY cnt)
WHERE cnt BETWEEN 1 AND 20;


SELECT * FROM (
	SELECT rownum cnt, LEVEL, m.*,
	e1.ename seename, e1.empno seempno, d1.deptno sedeptno, d1.dname sedname,
	e2.ename reename, e2.empno reempno, d2.deptno redeptno, d2.dname redname 
	FROM cookieempmsg m, cookieemp e1, cookieemp e2, cookiedept d1, cookiedept d2
	WHERE (e1.ename LIKE '%%' OR e2.ename LIKE '%%')
	AND seid = e1.empno AND reid = e2.empno
	AND d1.deptno=e1.deptno AND d2.deptno=e2.deptno AND (seid=1000 OR reid=1000)
	START WITH rmid=0 CONNECT BY PRIOR mid = rmid
	ORDER siblings BY mid DESC
) WHERE cnt BETWEEN 1 AND 15;

SELECT COUNT(*) FROM cookieempmsg, cookieemp e1, cookieemp e2
WHERE (e1.ename LIKE '%%' OR e2.ename LIKE '%%') AND (seid=1000 OR reid=1000)
AND seid = e1.empno AND reid = e2.empno;

SELECT empno,ename,pwd,d.* FROM cookieemp e,cookiedept d
WHERE e.deptno=d.deptno ORDER BY empno;

SELECT m.*, d1.dname sedname, e1.ename seename, d2.dname redname, e2.ename reename
FROM cookieempmsg m, cookieemp e1, cookieemp e2, cookiedept d1, cookiedept d2
WHERE seid = e1.empno AND reid = e2.empno
AND d1.deptno=e1.deptno AND d2.deptno=e2.deptno AND mid=5;

SELECT ename, auth FROM cookieemp
WHERE deptno = 20
ORDER BY auth DESC, empno;
 
SELECT * FROM cookieemp;
UPDATE cookieemp SET ename='김신입입', pwd='2345', sal=2500000
WHERE empno=1020;
DELETE cookieemp WHERE empno=1020;

SELECT * FROM cookiedept WHERE deptno<90
ORDER BY deptno;

SELECT COUNT(*) FROM cookiedept WHERE deptno=10;

SELECT COUNT(*) FROM cookieemp WHERE deptno=12;

SELECT COUNT(*) FROM cookieempmsg WHERE reid=1000 AND opauth=1;
SELECT * FROM cookieemp;

INSERT INTO cookiedept VALUES (12,'사원관리');
INSERT INTO cookiedept VALUES (15,'부서관리');
INSERT INTO cookiedept VALUES (32,'재료구매');
INSERT INTO cookiedept VALUES (42,'창고관리');

SELECT d.*, ename FROM cookieemp e, cookiedept d
WHERE d.deptno=e.deptno AND auth=2 AND d.deptno<90
ORDER BY d.deptno,auth DESC,empno;

SELECT d.*, ename, auth, empno FROM cookieemp e, cookiedept d
WHERE d.deptno=e.deptno AND d.deptno<90 AND d.deptno=15
ORDER BY auth DESC,empno;

UPDATE cookieemp SET deptno=15, auth=1 WHERE empno=1024;

SELECT empno, ename, auth, d.* FROM cookieemp e, cookiedept d
WHERE e.deptno=d.deptno AND ename LIKE '%%' AND d.deptno<=90
ORDER BY e.deptno,auth DESC,empno;

UPDATE cookieempmsg SET opauth=1 WHERE mid=7;

SELECT sysdate FROM dual;
