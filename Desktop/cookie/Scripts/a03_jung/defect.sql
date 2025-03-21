-- 불량유형
/*CREATE TABLE defect_type( 
dfc_typ_id NUMBER PRIMARY KEY, --불량유형아이디
dfc_typ varchar2(50) -- 불량유형
--);*/
SELECT * FROM defect_type;
-- 생산중 불량리스트
/*CREATE TABLE dfc_prd01(
dfc_prd_id NUMBER PRIMARY KEY,-- 생산중 불량아이디
prc_id NUMBER,	-- 공정 아이디
dfc_prd_cnfr_name varchar2(50),-- 확인 근무자명
dfc_prd_dfct_arvl DATE, -- 불량이 나온시간
dfc_prd_dfct_cnt NUMBER,	-- 불량갯수
dfc_typ_id NUMBER,	-- 불량유형 아이디
CONSTRAINT dfc_prd01_prc_id_fk FOREIGN KEY(prc_id)
REFERENCES prc01(prc_id),
CONSTRAINT dfc_prd01_dfc_typ_id_fk FOREIGN KEY(dfc_typ_id)
REFERENCES defect_type(dfc_typ_id)
--);*/

--  불량관리
/*CREATE TABLE dfct_mngm01( 			
dfct_id number PRIMARY KEY,	-- 불량관리 아이디
dfc_prd_id NUMBER, -- 생산중 불량 아이디
dfct_pic_nm	varchar2(50), -- 담당자명
dfct_hndl_type varchar2(50), -- 불량처리유형
dfct_prcs_rslt	varchar2(50),-- 불량처리결과
dfct_dsps_date DATE, -- 불량 처리 날짜
CONSTRAINT dfct_mngm01_dfc_prd_id_fk FOREIGN KEY(dfc_prd_id)
REFERENCES dfc_prd01(dfc_prd_id)
);
*/