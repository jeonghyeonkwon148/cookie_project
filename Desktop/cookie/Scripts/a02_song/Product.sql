--제품테이블
CREATE TABLE product(
	NO number(4,0),
	pname varchar2(50),--제품명
	unit varchar2(20),--단위
	price number(20,0)	--가격
);
ALTER TABLE product
DROP COLUMN fname;

ALTER TABLE product
ADD fname VARCHAR2(50);
ALTER TABLE product
ADD CONSTRAINT product_NO_pk PRIMARY key(NO);
SELECT * FROM product;
DROP SEQUENCE prdt_seq;
CREATE SEQUENCE prdt_seq;
INSERT INTO product values(prdt_seq.nextval,'오리지날쿠키','kg',2000); 
INSERT INTO product values(prdt_seq.nextval,'초코쿠키','kg',3000); 
INSERT INTO product values(prdt_seq.nextval,'견과류쿠키','kg',3500);
update product
	set pname='오리지날쿠키',
		unit='kg',
		price='2000'
	where no=1;
/*
INSERT INTO product values(prdt_seq.nextval,#{pname},#{unit},#{price})
int insertProdt(Product ins);

update product
	set pname=#{pname},
		unit=#{unit},
		price=#{price}
	where no=#{no}
	int updateProdt(Product upt);
 * */
SELECT * FROM product
	WHERE pname LIKE '%%'
	ORDER BY NO;
/*
SELECT * FROM product
	WHERE pname LIKE #{pname}
	ORDER BY no
	
SELECT * FROM product
	WHERE pname=#{pname}
SELECT count(*) FROM CUSTOMER  
	 WHERE cname LIKE #{cname}
      AND manager LIKE #{manager}
int getCustomerCount(CustomerSch shc); 
       
SELECT *
FROM (
    SELECT rownum AS cnt, product.*
    FROM product
    WHERE pname LIKE #{pname}      
) 
WHERE cnt BETWEEN #{start} AND #{end} 
List<Product> getCustomerList(ProductSch sch);

SELECT COUNT(*) FROM PRODUCT 
	WHERE pname LIKE #{pname};
int getProductCount(ProductSch sch);

SELECT *
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY NO desc) AS cnt, product.*
    FROM product
    WHERE pname LIKE #{pname}      
) 
WHERE cnt BETWEEN #{start} AND #{end}
List<Product> getProductList(ProductSch sch)

*/
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY NO desc) AS cnt, product.*
    FROM product
    WHERE pname LIKE '%%'      
) 
WHERE cnt BETWEEN 1 AND 4;

DELETE FROM PRODUCT p WHERE NO =22;

SELECT * FROM product
	WHERE pname='오리지날쿠키';

SELECT * FROM product;
SELECT * from cookiefile;
SELECT * FROM COOKIEEMP c ;
COMMIT;