-- 기계관리
/*CREATE TABLE machine_management(
mch_id number PRIMARY KEY, --기계아이디
mch_nm varchar2(100) ,--기계명
mchn_date date, --기계입고일
mchn_mntn date,--기계 최종 보수일
mchn_usg_prd number, --기계 사용기간(달단위)
mchn_nmb_mlf number,--오작동 횟수
mchn_cndt varchar2(50) --기계상태
);*/
SELECT * FROM MACHINE_MANAGEMENT;
--INSERT INTO MACHINE_MANAGEMENT values(1,'')
-- 정기검사
--CREATE TABLE periodic_inspection( 
--prd_ins_id NUMBER PRIMARY key, --정기검사 아이디
--mch_id number,--기계아이디
--prd_ins_itm varchar2(50), --검사항목
--prd_unc varchar2(50),--합/불합여부
--prd_ins_dt DATE, --검사날짜
--CONSTRAINT periodic_inspection_mch_id_fk FOREIGN KEY(mch_id)
--REFERENCES machine_management(mch_id)
--);

