--고객테이블
CREATE TABLE customer(
	num number(4,0),
	cname varchar(50),--거래처명
	manager varchar(50),--담당자명
	contact_number number(20,0),--전화번호
	email varchar(50)
);
ALTER TABLE customer
MODIFY (contact_number number(30));
ALTER TABLE customer 
ADD CONSTRAINT customer_num_pk primary KEY (num);
CREATE SEQUENCE customer_seq;
INSERT INTO customer values(customer_seq.nextval, '한국마트', '김준우',01012345555,'aabb12@example.com');
INSERT INTO customer values(customer_seq.nextval, '휴먼플러스', '이길자',01012341221,'reb3333@example.com');
INSERT INTO customer values(customer_seq.nextval, '지마트', '박지우',01021123232,'erws2222@example.com');
INSERT INTO customer values(customer_seq.nextval, '고려마트', '김준삼',01011113333,'dwre5544@example.com');
SELECT * FROM customer
	ORDER BY num;
SELECT * FROM customer
	WHERE manager = '김준삼';
SELECT * FROM customer 
	WHERE manager='이길자' AND CNAME = '휴먼플러스';
SELECT * FROM customer WHERE cname LIKE '%%'
AND manager LIKE '%%';
SELECT * FROM customer WHERE num=1;
ALTER TABLE CUSTOMER 
modify(cname varchar2(50), manager varchar2(50));
/*
INSERT INTO customer values(customer_seq.nextval, #{cname}, #{manager},#{contact_number},#{email})
SELECT * FROM customer WHERE manager=#{manager} AND CNAME = #{cname}

SELECT * FROM customer 
	WHERE manager=#{manager} AND CNAME = #{cname}
	
	
SELECT * FROM customer WHERE num=#{num}
	
UPDATE CUSTOMER 
	SET cname=#{cname},
		manager=#{manager},
		contact_number=#{contact_number},
		email=#{email}
	WHERE num=#{num}
delete from customer where num=#{num} 
select * from customer
	WHERE cname LIKE #{cname}
      AND manager LIKE #{manager}
*/
select * from customer WHERE cname LIKE '%%'
      AND manager LIKE '%%';
SELECT * FROM CUSTOMER c 
	WHERE manager = '김준우';


SELECT *
FROM (
    SELECT rownum AS cnt, c.*
    FROM customer c
    WHERE cname LIKE '%%'
      AND manager LIKE '%%'
) 
WHERE cnt BETWEEN 1 AND 3;
SELECT count(*) FROM CUSTOMER c 
	 WHERE cname LIKE '%%'
      AND manager LIKE '%%'; 

/* 
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

*/

SELECT * FROM customer;
/*
SELECT * FROM CUSTOMER c 
	WHERE manager =#{manager}
	
Customer
private int num;
private String cname;;
private String manager;
private int contact_number;
private String email; 
*/
COMMIT;
