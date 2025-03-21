-- 생산 공정
/*CREATE TABLE prc01(
prc_id NUMBER PRIMARY KEY,--공정아이디
prc_nm varchar2(50),-- 공정명
prc_dtl varchar2(50),-- 공정내용
prc_bsln_qntt NUMBER,-- 기준 생산량
mch_id NUMBER,-- 기계아이디
prc_stnd_qntt NUMBER,-- 기준원재료량
mnum NUMBER,-- 원재료 코드
CONSTRAINT prd01_mnum_fk FOREIGN KEY(mnum)
REFERENCES material(mnum),
CONSTRAINT prd01_mch_id_fk FOREIGN KEY(mch_id)
REFERENCES machine_management(mch_id)
);
-- 실 생산 공정
CREATE TABLE rl_prd_prc(
lvpr_id NUMBER PRIMARY KEY, -- 실 생산 아이디
prc_id NUMBER,-- 공정아이디
for_work varchar2(50), -- 작업여부
CONSTRAINT rl_prd_prc_prc_id_fk FOREIGN KEY(prc_id)
REFERENCES prc01(prc_id)
);
-- 공정별 생산 관리
CREATE TABLE prd_mng_prc01(
prd_id_prc NUMBER PRIMARY KEY,-- 공정별 생산 아이디
prc_id NUMBER ,-- 공정 아이디
prdc_date date, -- 생산 날짜
prd_yld NUMBER,-- 공정 생산량
prd_rwmt_usg NUMBER,-- 원재료 사용량
prv_prd_yld NUMBER,-- 이전 공정 생산량
prv_prd_id_prc NUMBER,-- 공정별 이전 생산 아이디
CONSTRAINT prd_mng_prc05_prc_id_fk FOREIGN KEY(prc_id)
REFERENCES prc01(prc_id)
);*/
SELECT * FROM prd_mng_prc01;

SELECT  * FROM rl_prd_prc;

