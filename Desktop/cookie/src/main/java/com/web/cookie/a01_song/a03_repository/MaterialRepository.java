package com.web.cookie.a01_song.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.Material;

@Mapper
public interface MaterialRepository {
	@Select("SELECT * FROM material \r\n"
			+ "	WHERE mname LIKE #{mname}\r\n"
			+ "	ORDER by mnum ")
	List<Material> getMaterialList(Material sch);
	
	@Select("SELECT * FROM material \r\n"
			+ "	WHERE mnum = #{mnum}")
	Material getMaterial(@Param("mnum") int mnum);
	
	@Insert("INSERT INTO material values(material_seq.nextval,#{mname},#{unit},#{mprice})")
	int insertMaterial(Material ins);
	
	@Update("UPDATE material \r\n"
			+ "		SET mname =#{mname},\r\n"
			+ "			unit = #{unit},\r\n"
			+ "			MPRICE =#{mprice}\r\n"
			+ "		WHERE mnum = #{mnum}")
	int updateMaterial(Material upt);
	
	@Delete("DELETE FROM material WHERE mnum = #{mnum}")
	int deleteMaterial(@Param("mnum") int mnum);
}
