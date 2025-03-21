-- 작업지시서
/*CREATE TABLE work_order(
workl_id number PRIMARY KEY,-- 작업지시아이디
order_no number,-- 주문 아이디
final_schdl date,-- 최종작업예정일
CONSTRAINT work_order_order_no_fk FOREIGN KEY(order_no)
REFERENCES order01(order_no)
);


-- 생산재고 관리
CREATE TABLE invn_prdc(
inv_id_prd NUMBER PRIMARY KEY,-- 생산재고 아이디
exst_stck NUMBER,-- 기존 재고 갯수
prdct_cnfrm DATE,-- 생산 재고 확인 날짜
prd_id_prc NUMBER,-- 공정별 생산 아이디
mng_no NUMBER,-- 자재 입고 아이디
CONSTRAINT invn_prdc_prd_id_prc_fk FOREIGN KEY(prd_id_prc)
REFERENCES prd_mng_prc01(prd_id_prc),
CONSTRAINT invn_prdc_mng_no_fk FOREIGN KEY(mng_no)
REFERENCES material_mng(mng_no)
);
-- 제품 생산 결과 관리
CREATE TABLE prdct_mngmn(
prd_id_prc NUMBER PRIMARY KEY, -- 제품 생산 아이디
workl_id NUMBER,-- 작업 지시 아이디
prdct_date DATE,-- 생산완료일
exp_prd DATE,-- 유통기간
dfct_drng NUMBER,-- 공정중 불량 갯수
ttlp_time NUMBER,-- 총 공정 시간(시간)
CONSTRAINT prdct_mngmn_prd_id_prc_fk FOREIGN KEY(prd_id_prc)
REFERENCES prd_mng_prc01(prd_id_prc),
CONSTRAINT prdct_mngmn_workl_id_fk FOREIGN KEY(workl_id)
REFERENCES work_order(workl_id)
);*/
--부모테이블 삭제시 자식키도 삭제
ALTER TABLE prdct_mngmn
DROP CONSTRAINT prdct_mngmn_workl_id_fk;
ALTER TABLE prdct_mngmn
ADD CONSTRAINT prdct_mngmn_workl_id_fk FOREIGN KEY(workl_id)
REFERENCES work_order(workl_id)
ON DELETE CASCADE;

--order01 테이블의 레코드를 삭제할 때 work_order 테이블의 관련 레코드도 동시에 삭제하도록 하는 코드
ALTER TABLE work_order
DROP CONSTRAINT work_order_order_no_fk;
ALTER TABLE work_order
ADD CONSTRAINT work_order_order_no_fk FOREIGN KEY (order_no)
REFERENCES order01 (order_no)
ON DELETE CASCADE;
COMMIT;

SELECT * FROM invn_prdc;
SELECT * FROM prdct_mngmn;
SELECT * FROM work_order;