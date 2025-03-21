package com.web.cookie.a01_song.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.Customer;
import com.web.cookie.a01_song.a04_vo.CustomerSch;

@Mapper
public interface CustomerRepository {
	
	@Select("SELECT * FROM customer \r\n"
			+ "	WHERE manager=#{manager} AND CNAME = #{cname}")
	Customer login(Customer login);
	
	@Select("SELECT count(*) FROM CUSTOMER  \r\n"
			+ "	 WHERE cname LIKE #{cname}\r\n"
			+ "      AND manager LIKE #{manager}")
	int getCustomerCount(CustomerSch sch);
	
	
	@Select("select * from customer")
	List<Customer> getClist();
	
	@Select("SELECT *\r\n"
			+ "FROM (\r\n"
			+ "    SELECT ROW_NUMBER() OVER (ORDER BY num desc) AS cnt, c.*\r\n"
			+ "    FROM customer c\r\n"
			+ "    WHERE cname LIKE #{cname}\r\n"
			+ "      AND manager LIKE #{manager}\r\n"
			+ ") \r\n"
			+ "WHERE cnt BETWEEN #{start} AND #{end}")
	List<Customer> getCustomerList(CustomerSch sch);
	
	@Select("SELECT * FROM customer WHERE num=#{num}")
	Customer getCustomerByNum(@Param("num") int num);
	
	@Insert("INSERT INTO customer values(customer_seq.nextval, #{cname}, #{manager},#{contact_number},#{email})")
	int insertCustomer(Customer ins);
	@Update("UPDATE CUSTOMER \r\n"
			+ "	SET cname=#{cname},\r\n"
			+ "		manager=#{manager},\r\n"
			+ "		contact_number=#{contact_number},\r\n"
			+ "		email=#{email}\r\n"
			+ "	WHERE num=#{num}")
	int updateCustomer(Customer upt);
	
	

	
	@Delete("delete from customer where num=#{num} ")
	int deleteCustomer(@Param("num") int num);
}
