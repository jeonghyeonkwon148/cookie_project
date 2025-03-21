package com.web.cookie.a01_song.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.CookieFile;
import com.web.cookie.a01_song.a04_vo.Product;
import com.web.cookie.a01_song.a04_vo.ProductSch;

@Mapper
public interface ProductRepository {
	@Select("SELECT COUNT(*) FROM PRODUCT \r\n"
			+ "	WHERE pname LIKE #{pname}")
	int getProductCount(ProductSch sch);
	
	@Select("SELECT * FROM product")
	List<Product> getProdtList();
	
	@Select("SELECT *\r\n"
			+ "FROM (\r\n"
			+ "    SELECT ROW_NUMBER() OVER (ORDER BY NO desc) AS cnt, product.*\r\n"
			+ "    FROM product\r\n"
			+ "    WHERE pname LIKE #{pname}      \r\n"
			+ ") \r\n"
			+ "WHERE cnt BETWEEN #{start} AND #{end}")
	List<Product> getProductList(ProductSch sch);
	
	@Select("SELECT * FROM product\r\n"
			+ "	WHERE no=#{no}")
	Product getProduct(@Param("no") int no);
	
	
	@Insert("INSERT INTO product values(prdt_seq.nextval,#{pname},#{unit},#{price})")
	
	@SelectKey(statement="SELECT prdt_seq.nextval  FROM dual", 
			keyProperty = "no", before=true, resultType=int.class)
	int insertProdt(Product ins);
	@Insert("INSERT INTO cookiefile values(#{no}, "
			+ "#{fname},#{etc},sysdate, sysdate)")
	int insertCookieFile(CookieFile ins);
	
	@Select("SELECT fname FROM cookiefile WHERE NO = #{no}")
	List<String> getCookieFile(@Param("no") int no);	
	
	@Update("update product\r\n"
			+ "	set pname=#{pname},\r\n"
			+ "		unit=#{unit},\r\n"
			+ "		price=#{price}\r\n"
			+ "	where no=#{no}")
	int updateProdt(Product upt);
	
	@Delete("delete from product where no=#{no}")
	int deleteProdt(@Param("no") int no);
	
}
