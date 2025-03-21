package com.web.cookie.a01_song.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.Prodt_sal_chart;


@Mapper
public interface Prodt_sal_chartRepository {
	@Select("SELECT * FROM prodt_sal_chart\r\n"
			+ "		WHERE sal_month LIKE #{sal_month}\r\n"
			+ "		ORDER BY NUM")
	public List<Prodt_sal_chart> getProdt_sal_chartList(Prodt_sal_chart sch);
	
	@Select("SELECT COUNT(*) FROM prodt_sal_chart\r\n"
			+ "WHERE num =#{num}")
	int ckNum(@Param("num") int num);
	
	@Select("select * from prodt_sal_chart where num = #{num}")
	Prodt_sal_chart getChart(@Param("num") int num);
	
	@Insert("INSERT INTO prodt_sal_chart values(prodt_sal_chart_seq.nextval,#{sal_month},#{original_cookie_tot},#{cocho_cookie_tot},#{nut_cookie_tot})")
	int insertChart(Prodt_sal_chart ins);
	
	@Update("UPDATE prodt_sal_chart\r\n"
			+ "		SET sal_month =#{sal_month},\r\n"
			+ "			original_cookie_tot =#{original_cookie_tot},\r\n"
			+ "			cocho_cookie_tot=#{cocho_cookie_tot},\r\n"
			+ "			nut_cookie_tot=#{nut_cookie_tot}\r\n"
			+ "		where num = #{num}")
	int updateChart(Prodt_sal_chart upt);
	
	@Delete("delete from prodt_sal_chart\r\n"
			+ "where num=#{num}")
	int deleteChart(@Param("num") int num);	
	
}
