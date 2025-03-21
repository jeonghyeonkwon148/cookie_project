--제품입출고기록테이블
CREATE TABLE prodt_mng(
	pmng_no number(4,0) PRIMARY key,
	no number(4,0),--제품코드
	inc_rels_cnt number(20,0),--입출고절대수량
	inc_rels_sort number(4,0),--입출고구분 입고1 /출고2
	curr_tot_stock number(30,0),--현재재고량
	inc_rels_dte DATE,--날짜
	prd_id_prc number(4,0),--제품 생산 결과 관리
	empno number(4,0),
	CONSTRAINT prodt_mng_no_fk FOREIGN KEY(no)
	REFERENCES product(no)
);
ALTER TABLE prodt_mng
DROP CONSTRAINT prodt_mng_no_fk;
--부모테이블 삭제시 자식데이블도 삭제
ALTER TABLE prodt_mng
ADD CONSTRAINT prodt_mng_no_fk FOREIGN KEY(no)
REFERENCES product(no)
ON DELETE CASCADE;

--이 코드는 부모 테이블(material)의 mnum이 업데이트될 때, 
--자식 테이블(material_mng)의 mnum도 함께 업데이트되도록
-- 트리거 생성
CREATE OR REPLACE TRIGGER trg_update_prodt_mng
AFTER UPDATE ON product
FOR EACH ROW
BEGIN
    UPDATE prodt_mng
    SET no = :NEW.no
    WHERE no = :OLD.no;
END;



CREATE SEQUENCE prodt_mng_seq01;

ALTER TABLE prodt_mng
ADD CONSTRAINT prodt_mng_prd_id_prc_fk
FOREIGN key(prd_id_prc) REFERENCES prd_mng_prc01(prd_id_prc);

ALTER TABLE prodt_mng
ADD CONSTRAINT prodt_mng_empno_fk
FOREIGN key(empno) REFERENCES cookieemp(empno);

--조인
SELECT pmng_no,prodt_mng.NO no, product.pname pname, inc_rels_cnt, inc_rels_sort,
		curr_tot_stock , inc_rels_dte,prd_id_prc, prodt_mng.empno empno, cookieemp.ename 
FROM prodt_mng, product, cookieemp
WHERE prodt_mng.NO = product.NO 
AND prodt_mng.empno = cookieemp.empno;

INSERT INTO prodt_mng values(prodt_mng_seq01.nextval,1,100,1,100,sysdate,1,1000);
INSERT INTO prodt_mng values(prodt_mng_seq01.nextval,2,100,1,200,sysdate,2,1000);

SELECT * FROM prd_mng_prc01;--공정별 생산 관리
SELECT * FROM prc01;--생산공정들
SELECT * FROM prdct_mngmn;-- 제품 생산 결과 관리
SELECT * FROM cookieemp;

SELECT * FROM prodt_mng
WHERE NO LIKE '%1%';

SELECT * FROM prodt_mng
	WHERE pmng_no =1;
UPDATE prodt_mng
	SET NO = 1,
		inc_rels_cnt = 100,
		inc_rels_sort = 1,
		curr_tot_stock =100,
		inc_rels_dte = to_date('2025-03-03','YYYY-MM-DD'),
		prd_id_prc = 1,
		empno = 1000
	WHERE pmng_no =1;
DELETE FROM prodt_mng WHERE pmng_no =1;
/*
SELECT * FROM prodt_mng
WHERE NO LIKE #{no}
List<Prodt_mng>  getProdt_mngList(Prodt_mng sch);

SELECT * FROM prodt_mng
	WHERE pmng_no =#{pmng_no}
Prodt_mng getProdt_mng(@Param("pmng_no") int pmng_no);

INSERT INTO prodt_mng values(prodt_mng_seq01.nextval,#{pmng_no},#{pmng_no},#{pmng_no},#{pmng_no},to_DATE(#{inc_rels_dteS},'YYYY-MM-DD'}),#{prd_id_prc},#{empno});
int insertProdt_mng(Prodt_mng ins);

UPDATE prodt_mng
	SET NO = #{no},
		inc_rels_cnt = #{inc_rels_cnt},
		inc_rels_sort = #{inc_rels_sort},
		curr_tot_stock =#{curr_tot_stock},
		inc_rels_dte = to_DATE(#{inc_rels_dteS},'YYYY-MM-DD'}),
		prd_id_prc = #{prd_id_prc},
		empno = #{empno}
	WHERE pmng_no =#{pmng_no}
int updateProdt_mng(Prodt_mng upt);
		
DELETE FROM prodt_mng WHERE pmng_no =#{pmng_no}	
int deleteProdt_mng(@Param("pmng_no") int pmng_no);

SELECT COUNT(*) FROM prodt_mng 
	WHERE no LIKE #{no};
int getProdt_mngCount(Prodt_mngSch sch);

SELECT *
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY pmng_no desc) AS cnt, pmng.*
    FROM prodt_mng pmng
    WHERE NO LIKE #{no}   
) 
WHERE cnt BETWEEN #{start} AND #{end}
List<Prodt_mng> getProductList(Prodt_mngSch sch);
*/
SELECT *
FROM (
    SELECT rownum AS cnt, pmng.*
    FROM prodt_mng pmng
    WHERE NO LIKE '%%'   
) 
WHERE cnt BETWEEN 1 AND 2 
ORDER BY pmng_no;

SELECT *
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY pmng_no desc) AS cnt, pmng.*
    FROM prodt_mng pmng
    WHERE NO LIKE '%%'   
) 
WHERE cnt BETWEEN 1 AND 2 
ORDER BY pmng_no;

			
SELECT * FROM prodt_mng ORDER BY pmng_no;
SELECT * FROM PRODUCT p ;
SELECT * FROM prd_mng_prc01;
SELECT * FROM prodt_mng;
COMMIT;