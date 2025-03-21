--주문테이블
CREATE TABLE order01(
	order_no number(4,0) PRIMARY KEY,
	num number(4,0) , --고객테이블참조
	NO  number(4,0), --제품테이블참조
	order_dte date,--주문날짜
	order_cnt number(30,0),--주문수량
	tot number(30,0),--주문금액총계
	due_dte varchar2(50),--납기일
	CONSTRAINT order01_no_fk FOREIGN KEY(no) 
	REFERENCES product(no)
);
ALTER TABLE order01
DROP CONSTRAINT order01_no_fk;
--부모테이블 삭제시 자식데이블도 삭제
ALTER TABLE order01
ADD CONSTRAINT order01_no_fk FOREIGN KEY(no) 
REFERENCES product(no)
ON DELETE CASCADE;

--이 코드는 부모 테이블(material)의 mnum이 업데이트될 때, 
--자식 테이블(material_mng)의 mnum도 함께 업데이트되도록
-- 트리거 생성
CREATE OR REPLACE TRIGGER trg_update_order01
AFTER UPDATE ON product
FOR EACH ROW
BEGIN
    UPDATE order01
    SET no = :NEW.no
    WHERE no = :OLD.no;
END;


ALTER TABLE order01 
ADD CONSTRAINT order01_num_fk FOREIGN KEY(num)
REFERENCES customer(num);

CREATE SEQUENCE order_seq;
DROP SEQUENCE order_seq;
INSERT INTO order01 values(order_seq.nextval,1,1,sysdate,100,20000,'2025-02-05');
INSERT INTO order01 values(order_seq.nextval,2,1,sysdate,100,20000,'2025-02-10');
INSERT INTO order01 values(order_seq.nextval,3,2,sysdate,100,30000,'2025-02-11');
INSERT INTO order01 values(order_seq.nextval,4,3,sysdate,200,70000,'2025-02-29');
INSERT INTO order01 values(order_seq.nextval,1,2,sysdate,100,40000,'2025-02-11');
INSERT INTO order01 values(order_seq.nextval,2,3,sysdate,200,50000,'2025-02-29');


SELECT * FROM ORDER01 ORDER BY order_no;
SELECT * FROM PRODUCT p ;
UPDATE order01 
	SET order_cnt = 100,
	  tot = 20000,
	  due_dte='2025-02-05'
	  WHERE order_no=1;
DELETE FROM ORDER01 o WHERE order_no = 53;
CREATE TABLE order02 AS SELECT * FROM ORDER01 o  WHERE 1 =0;
CREATE SEQUENCE order02_seq;
INSERT INTO order02 values(order02_seq.nextval,1,1,sysdate,100,200000,'2024-02-05');
INSERT INTO order02 values(order02_seq.nextval,1,2,sysdate,100,300000,'2024-02-05');
INSERT INTO order02 values(order02_seq.nextval,1,3,sysdate,50,175000,'2024-02-05');
INSERT INTO order02 values(order02_seq.nextval,2,1,sysdate,200,400000,'2024-03-01');
INSERT INTO order02 values(order02_seq.nextval,2,2,sysdate,300,900000,'2024-03-01');
INSERT INTO order02 values(order02_seq.nextval,2,3,sysdate,50,175000,'2024-03-01');
INSERT INTO order02 values(order02_seq.nextval,3,1,sysdate,80,160000,'2024-02-10');
INSERT INTO order02 values(order02_seq.nextval,3,2,sysdate,40,120000,'2024-02-10');
INSERT INTO order02 values(order02_seq.nextval,3,3,sysdate,20,70000,'2024-02-10');
SELECT * FROM order02;
INSERT INTO order02 values(order02_seq.nextval,4,1,sysdate,120,240000,'2024-03-11');
INSERT INTO order02 values(order02_seq.nextval,4,2,sysdate,30,90000,'2024-03-11');
INSERT INTO order02 values(order02_seq.nextval,4,3,sysdate,70,245000,'2024-03-11');

SELECT * FROM product;
SELECT * FROM CUSTOMER c ;
/*
SELECT * FROM ORDER01 

List<Order> getOrderList();

select * from order01
			where order_no=#{order_no}
Order getOrder(@Param("order_no") int order_no);

			
*/
--order01,product,customer 테이블 조인
SELECT *
	FROM (SELECT rownum AS cnt,order_no, order01.num num,cname, order01.NO no, pname ,unit ,price, order_dte,order_cnt,tot,due_dte
	FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO
	AND cname LIKE '%%'
	AND pname LIKE '%%' )
	WHERE cnt BETWEEN 1 AND 3
	ORDER BY order_no;
/*
SELECT *
	FROM (SELECT ROW_NUMBER() OVER (ORDER BY order_no desc) AS cnt,order_no, order01.num num,cname, order01.NO no, pname ,unit ,price, order_dte,order_cnt,tot,due_dte
	FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO
	AND cname LIKE #{cname}
	AND pname LIKE #{pname} )
	WHERE cnt BETWEEN #{start} AND #{end}
	
List<OrderJoin> getOrderJoinList(OrderJoinSch sch); 

SELECT COUNT(*) FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO
	AND cname LIKE #{cname}
	AND pname LIKE #{pname}; 
int getOrderJoinCount(OrderJoinSch sch);

SELECT order_no, order01.num num,cname, order01.NO no, pname ,unit ,price, order_dte,order_cnt,tot,due_dte
	FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO
	ORDER BY order_no;
List<OrderJoin> getOlist();
*/
	
	
SELECT order_no, order01.num num,cname, order01.NO no, pname ,unit ,price, order_dte,order_cnt,tot,due_dte
	FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO
	AND cname LIKE '%%'
	AND pname LIKE '%%'
	ORDER BY order_no;
SELECT order_no, order01.num num,cname, order01.NO no, pname ,unit ,price, order_dte,order_cnt,tot,due_dte
	FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO
	ORDER BY order_no;

SELECT COUNT(*) FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO
	AND cname LIKE '%%'
	AND pname LIKE '%%'; 
/*
select count(*) from order01 
	SELECT order_no, order01.num num,cname, order01.NO no, pname ,unit ,price, order_dte,order_cnt,tot,due_dte
	FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO
	AND cname LIKE '%%'
	AND pname LIKE '%%'
	ORDER BY order_no;
*/

SELECT order_no, order01.num num, order01.NO no, order_dte,order_cnt,tot,due_dte,
	cname ,manager ,contact_number ,email ,
	pname ,unit ,price 
	FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO 
	AND order_no = 1;

/*
SELECT order_no, order01.num num, order01.NO no, order_dte,order_cnt,tot,due_dte,
	cname ,manager ,contact_number ,email ,
	pname ,unit ,price 
	FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO
	AND order_no LIKE #{order_no}
	AND cname LIKE #{cname}
	
SELECT order_no, order01.num num, order01.NO no, order_dte,order_cnt,tot,due_dte,
	cname ,manager ,contact_number ,email ,
	pname ,unit ,price 
	FROM order01,product,customer
	WHERE order01.num = customer.NUM 
	AND order01.NO = product.NO 
	AND order_no = #{order_no}

	
			
INSERT INTO order01 values(order_seq.nextval,#{no},#{num},sysdate,#{order_cnt},#{tot},#{due_dte})
int insertOrder(Order ins);

UPDATE order01 
	SET num = #{num},
		no = #{no},
		order_dte = #{order_dte},
		order_cnt = #{order_cnt},
	 	 tot = #{tot},
	  	due_dte=#{due_dte}
	  WHERE order_no=#{order_no}
int updateOrder(Order upt);

delete from order01
		where order_no=#{order_no}
int deleteOrder(@Param("order_no") int order_no);	
*/



SELECT * FROM ORDER01;
SELECT * FROM ORDER01 
	WHERE num = 1;
/*
SELECT * FROM ORDER01 
	WHERE num = #{num} 
List<Order> findByCustomer(@Param("num") int num);

*/
SELECT * FROM ORDER01;
SELECT count(*) FROM ORDER01;
UPDATE order01 
	SET tot = 60000	  	
	  WHERE order_no=43;	
delete from order01
		where order_no=25;
COMMIT;
SELECT * FROM order01;

