package com.web.cookie.a01_song.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.Prodt_mng;
import com.web.cookie.a01_song.a04_vo.Prodt_mngSch;

@Mapper
public interface Prodt_mngRepository {
	@Select("select * from prodt_mng")
	List<Prodt_mng> getProduct_mng();
	
	@Select("SELECT COUNT(*) FROM prodt_mng \r\n"
			+ "	WHERE no LIKE #{no}")
	int getProdt_mngCount(Prodt_mngSch sch);
	
	@Select("SELECT *\r\n"
			+ "FROM (\r\n"
			+ "    SELECT ROW_NUMBER() OVER (ORDER BY pmng_no desc) AS cnt, pmng.*\r\n"
			+ "    FROM prodt_mng pmng\r\n"
			+ "    WHERE NO LIKE #{no}   \r\n"
			+ ") \r\n"
			+ "WHERE cnt BETWEEN #{start} AND #{end}")
	List<Prodt_mng> getProdt_mngList(Prodt_mngSch sch);
	
	
	
	@Select("SELECT * FROM prodt_mng\r\n"
			+ "	WHERE pmng_no =#{pmng_no}")
	Prodt_mng getProdt_mng(@Param("pmng_no") int pmng_no);
	
	@Insert("INSERT INTO prodt_mng values(prodt_mng_seq01.nextval,#{no},#{inc_rels_cnt},#{inc_rels_sort},#{curr_tot_stock},to_DATE(#{inc_rels_dteS},'YYYY-MM-DD'),#{prd_id_prc},#{empno})")
	int insertProdt_mng(Prodt_mng ins);
	
	@Update("UPDATE prodt_mng\r\n"
			+ "	SET NO =#{no},\r\n"
			+ "		inc_rels_cnt =#{inc_rels_cnt},\r\n"
			+ "		inc_rels_sort =#{inc_rels_sort},\r\n"
			+ "		curr_tot_stock =#{curr_tot_stock},\r\n"
			+ "		inc_rels_dte = to_DATE(#{inc_rels_dteS},'YYYY-MM-DD'),\r\n"
			+ "		prd_id_prc =#{prd_id_prc},\r\n"
			+ "		empno =#{empno}\r\n"
			+ "	WHERE pmng_no =#{pmng_no}")
	int updateProdt_mng(Prodt_mng upt);
	
	@Delete("DELETE FROM prodt_mng WHERE pmng_no =#{pmng_no}")
	int deleteProdt_mng(@Param("pmng_no") int pmng_no);
	
}
