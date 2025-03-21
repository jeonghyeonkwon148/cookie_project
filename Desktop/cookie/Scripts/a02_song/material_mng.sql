--원재료입출고기록테이블
CREATE TABLE material_mng(
	mng_no number(4,0) PRIMARY key,
	mnum number(4,0),--원재료코드
	inc_rels_cnt number(20,0),--입출고절대수량
	inc_rels_sort number(4,0),--입출고구분 입고1 /출고2
	curr_tot_stock number(30,0),--현재재고량
	inc_rels_dte DATE,--날짜
	CONSTRAINT material_mng_fk FOREIGN KEY(mnum)
	REFERENCES material(mnum)
);
ALTER TABLE material_mng
DROP CONSTRAINT material_mng_fk;
--부모테이블 삭제시 자식데이블도 삭제
ALTER TABLE material_mng
ADD CONSTRAINT material_mng_fk FOREIGN KEY(mnum)
REFERENCES material(mnum)
ON DELETE CASCADE;

--이 코드는 부모 테이블(material)의 mnum이 업데이트될 때, 
--자식 테이블(material_mng)의 mnum도 함께 업데이트되도록
-- 트리거 생성
CREATE OR REPLACE TRIGGER trg_update_material_mng
AFTER UPDATE ON material
FOR EACH ROW
BEGIN
    UPDATE material_mng
    SET mnum = :NEW.mnum
    WHERE mnum = :OLD.mnum;
END;

CREATE SEQUENCE material_mng_seq;
INSERT INTO material_mng values(material_mng_seq.nextval,1,100,1,100,sysdate);
INSERT INTO material_mng values(material_mng_seq.nextval,2,50,1,50,sysdate);
INSERT INTO material_mng values(material_mng_seq.nextval,3,30,1,30,sysdate);
INSERT INTO material_mng values(material_mng_seq.nextval,4,100,1,100,sysdate);
INSERT INTO material_mng values(material_mng_seq.nextval,5,40,1,40,sysdate);
INSERT INTO material_mng values(material_mng_seq.nextval,6,200,1,200,sysdate);
INSERT INTO material_mng values(material_mng_seq.nextval,7,100,1,100,sysdate);
INSERT INTO material_mng values(material_mng_seq.nextval,8,100,1,100,sysdate);
INSERT INTO material_mng values(material_mng_seq.nextval,9,100,1,100,sysdate);

--원재료테이블과 원재료입출고기록테이블 조인 
SELECT mng_no,m.mnum mnum, 
inc_rels_cnt,inc_rels_sort,
curr_tot_stock,inc_rels_dte, 
mname,unit,mprice
FROM material m,material_mng mm
WHERE m.mnum = mm.mnum;

ALTER TABLE material_mng
ADD empno number(4);

ALTER TABLE material_mng
ADD CONSTRAINT material_mng_empno_fk
FOREIGN key(empno) REFERENCES cookieemp(empno);

UPDATE material_mng
	SET empno = 1008
	WHERE mng_no =9;

SELECT * FROM MATERIAL_MNG mm 
	WHERE mnum LIKE '%%';

SELECT * FROM MATERIAL_MNG mm 
	WHERE mng_no = 1;
UPDATE MATERIAL_MNG 
	SET mnum = 1,
		inc_rels_cnt =50,
		inc_rels_sort =1,
		curr_tot_stock=50,
		inc_rels_dte = TO_DATE('2025-01-01','YYYY-MM-DD'),
		empno =1000
		WHERE mng_no  =1;
/*
SELECT * FROM MATERIAL_MNG mm 
	WHERE mnum LIKE #{mnum}
List<Material_mng>  getMaterial_mngList(Material_mng sch);

SELECT * FROM MATERIAL_MNG mm 
	WHERE mng_no = #{mng_no}
Material_mng getMaterial_mng(@Param("mng_no ") int mng_no );	

INSERT INTO material_mng values(material_mng_seq.nextval,#{mnum},#{inc_rels_cnt },#{inc_rels_sort },#{curr_tot_stock },#{inc_rels_dteS},#{empno});
int insertMaterial_mng(Material_mng ins);

UPDATE MATERIAL_MNG 
	SET mnum = #{mnum},
		inc_rels_cnt =#{inc_rels_cnt},
		inc_rels_sort =#{inc_rels_sort},
		curr_tot_stock=#{curr_tot_stock},
		inc_rels_dte = TO_DATE(#{inc_rels_dteS},'YYYY-MM-DD'),
		empno =#{empno}
		WHERE mng_no  =#{mng_no}
	int updateMaterial_mng(Material_mng upt);
	
delete from material_mng where mng_no = #{mng_no}	
int deleteMaterial_mng(@Param("mng_no") int mng_no); 




SELECT count(*) FROM material_mng
	WHERE mnum LIKE #{mnum}
int getMaterial_mngCount(Material_mngSch shc);


SELECT *
FROM (
SELECT rownum AS cnt, material_mng.*
FROM material_mng
WHERE mnum LIKE #{mnum}
)
WHERE cnt BETWEEN #{start} AND #{end}
List<Material_mng> getMaterial_mngList(Material_mngSch sch);

 * */
SELECT count(*) FROM material_mng
	WHERE mnum LIKE '%%';
SELECT *
FROM (
SELECT rownum AS cnt, material_mng.*
FROM material_mng
WHERE mnum LIKE '%%'
)
WHERE cnt BETWEEN 1 AND 3;



SELECT * FROM material_mng;
SELECT * FROM cookieemp;
COMMIT;
