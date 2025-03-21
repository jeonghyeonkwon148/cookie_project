--원재료테이블
CREATE TABLE material(
	mnum number(4,0),
	mname varchar2(50),--원재료명
	unit varchar2(20),--단위
	mprice number(20,0)	--가격
);
ALTER TABLE material
ADD CONSTRAINT material_mnum_pk PRIMARY key(mnum);
CREATE SEQUENCE material_seq;
INSERT INTO material values(material_seq.nextval,'밀가루','kg',10000);
INSERT INTO material values(material_seq.nextval,'베이킹파우더','kg',10000);
INSERT INTO material values(material_seq.nextval,'소금','kg',20000);
INSERT INTO material values(material_seq.nextval,'계란','kg',5000);
INSERT INTO material values(material_seq.nextval,'카카오','kg',3000);
INSERT INTO material values(material_seq.nextval,'설탕','kg',5000);
INSERT INTO material values(material_seq.nextval,'버터','kg',20000);
INSERT INTO material values(material_seq.nextval,'견과류','kg',25000);
INSERT INTO material values(material_seq.nextval,'바닐라추출물','kg',8000);
INSERT INTO material values(material_seq.nextval,'포장박스','kg',100);
SELECT * FROM material 
	WHERE mname LIKE '%%'
	ORDER by mnum;
SELECT * FROM material 
	WHERE mname = '계란';
UPDATE material 
		SET mname ='밀가루',
			unit = 'kg',
			MPRICE =10000
		WHERE mnum = 1;

/*
SELECT * FROM material 
	WHERE mname LIKE #{mname}
	ORDER by mnum 
List<Material> getMaterialList(Material sch);

SELECT * FROM material 
	WHERE mname = #{mname}
Material getMaterial(@Param("mname") String mname);

INSERT INTO material values(material_seq.nextval,#{mname},#{unit},#{mprice})
int insertMaterial(Material ins);


UPDATE material 
		SET mname =#{mname},
			unit = #{unit},
			MPRICE =#{mprice}
		WHERE mnum = #{mnum}
int updateMaterial(Material upt);

DELETE FROM material WHERE mnum = #{mnum}
int deleteMaterial(@Param("mnum") int mnum);

SELECT count(*) FROM CUSTOMER  
	 WHERE cname LIKE #{cname}
      AND manager LIKE #{manager}
int getCustomerCount(CustomerSch shc); 
       
SELECT *
FROM (
    SELECT rownum AS cnt, c.*
    FROM customer c
    WHERE cname LIKE #{cname}
      AND manager LIKE #{manager}
) 
WHERE cnt BETWEEN #{start} AND #{end} 
List<Customer> getCustomerList(CustomerSch sch);


SELECT count(*) FROM MATERIAL 
	WHERE mname LIKE '%%';
int getMaterialCount(MaterialSch sch);

SELECT * FROM (SELECT rownum AS cnt, m.*
			FROM material m
			WHERE mname LIKE '%%'
)
WHERE cnt BETWEEN 1 AND 3;
List<Material> getMaterialList(MaterialSch sch);
*/

COMMIT;