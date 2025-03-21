--월별 상품카테고리별 판매 통계 테이블
DROP TABLE prodt_sal_chart;
CREATE TABLE prodt_sal_chart(
	num number(4,0) PRIMARY KEY,
	sal_MONTH varchar2(30),--판매월
	original_cookie_tot number(4,0),
	cocho_cookie_tot number(4,0),
	nut_cookie_tot number(4,0)
);
-- 주문테이블, 제품테이블과 조인
SELECT sal_month, prodt_sal_chart.ORDER_NO order_no, order02.NO no, pname, tot
FROM  prodt_sal_chart, order02, PRODUCT  
WHERE prodt_sal_chart.ORDER_NO = order02.ORDER_NO
AND order02.NO = product.NO
AND pname LIKE '오리지날쿠키'
AND sal_month LIKE '1월';

SELECT sal_month, prodt_sal_chart.ORDER_NO order_no, order02.NO no, pname, tot
FROM  prodt_sal_chart, order02, PRODUCT  
WHERE prodt_sal_chart.ORDER_NO = order02.ORDER_NO
AND order02.NO = product.NO
AND sal_month = '3월';

SELECT  tot
FROM  prodt_sal_chart, order02, PRODUCT  
WHERE prodt_sal_chart.ORDER_NO = order02.ORDER_NO
AND order02.NO = product.NO
AND sal_month = '3월';

/*
SELECT sal_month, prodt_sal_chart.ORDER_NO order_no, order02.NO no, pname, tot
FROM  prodt_sal_chart, order02, PRODUCT  
WHERE prodt_sal_chart.ORDER_NO = order02.ORDER_NO
AND order02.NO = product.NO
AND sal_month = #{sal_month}


SELECT sal_month, prodt_sal_chart.ORDER_NO order_no, order01.NO no, pname, tot
FROM  prodt_sal_chart, order01, PRODUCT  
WHERE prodt_sal_chart.ORDER_NO = order01.ORDER_NO
AND order01.NO = product.NO
AND pname =#{pname} 
 */




DROP SEQUENCE prodt_sal_chart_seq;
CREATE SEQUENCE prodt_sal_chart_seq;
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'1월',1000,1000,1500);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'2월',1200,2000,3000);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'3월',1000,500,1000);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'4월',800,3000,1500);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'5월',1000,700,2500);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'6월',400,2000,1500);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'7월',4000,1000,1500);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'8월',1000,900,1400);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'9월',1000,1000,1100);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'10월',1000,1000,500);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'11월',1000,400,1500);
INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,'12월',2000,3000,2500);


SELECT SYSDATE, TO_CHAR(SYSDATE,'MM') FROM DUAL;


SELECT * FROM prodt_sal_chart
		WHERE sal_month LIKE '%%'
		ORDER BY NUM;
/*
SELECT * FROM prodt_sal_chart
		WHERE sal_month LIKE #{sal_month}
		ORDER BY NUM 
*/
SELECT * FROM prodt_sal_chart WHERE num =1;

UPDATE prodt_sal_chart
	SET sal_month = '1월',
		order_no = 2
		WHERE num = 1;
/*
SELECT * FROM prodt_sal_chart
		WHERE sal_month LIKE #{sal_month}
List<Prodt_sal_chart> getProdt_sal_chartList(Prodt_sal_chart sch);
				
SELECT * FROM prodt_sal_chart WHERE num =#{num}		
Prodt_sal_chart getProdt_sal_chart(@Param("num") int num);

INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,#{sal_month},#{order_no});
int insertProdt_sal_chart(Prodt_sal_chart ins);

UPDATE prodt_sal_chart
	SET sal_month = #{sal_month},
		order_no = #{order_no}	
		WHERE num = #{num}	
int updateProdt_sal_chart(Prodt_sal_chart upt);

  
UPDATE prodt_sal_chart
		SET sal_month =#{sal_month},
			original_cookie_tot =#{original_cookie_tot},
			cocho_cookie_tot=#{cocho_cookie_tot},
			nut_cookie_tot=#{nut_cookie_tot}
		where num = #{num}
int updateChart(Prodt_sal_chart upt);

SELECT COUNT(*) FROM prodt_sal_chart
WHERE num =#{num}
int ckNum(@Param("num") int num);	

INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,#{sal_month},#{original_cookie_tot},#{cocho_cookie_tot},#{nut_cookie_tot})
int insertChart(Prodt_sal_chart ins);

delete from prodt_sal_chart
where num=#{num}
int deleteChart(@Param("num") int num);	

SELECT count(*) FROM CUSTOMER  
	 WHERE cname LIKE #{cname}
      AND manager LIKE #{manager}
int getCustomerCount(CustomerSch shc); 
       
SELECT *
FROM (
    SELECT rownum AS cnt, prodt_sal_chart.*
    FROM prodt_sal_chart 
    WHERE sal_month LIKE #{sal_month}      
) 
WHERE cnt BETWEEN #{start} AND #{end} 
List<Prodt_sal_chart> getChartList(Prodt_sal_chart sch);

SELECT count(*) FROM prodt_sal_chart
WHERE sal_month LIKE #{sal_month};
int getCartCount(Prodt_sal_chart sch); 
	  		  
*/




SELECT * FROM prodt_sal_chart;
SELECT COUNT(*) FROM prodt_sal_chart
WHERE num =1;
 

COMMIT;