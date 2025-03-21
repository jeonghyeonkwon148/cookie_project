package com.web.cookie.a01_song.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.Material_mng;
import com.web.cookie.a01_song.a04_vo.Material_mngSch;

@Mapper
public interface Material_mngRepository {
	@Select("select * from MATERIAL_MNG")
	List<Material_mng> getM_mngList();
	
	@Select("SELECT count(*) FROM material_mng\r\n"
			+ "	WHERE mnum LIKE #{mnum}")
	int getMaterial_mngCount(Material_mngSch sch);
	
	
	@Select("SELECT *\r\n"
			+ "FROM (\r\n"
			+ "SELECT ROW_NUMBER() OVER (ORDER BY mng_no desc) AS cnt, material_mng.*\r\n"
			+ "FROM material_mng\r\n"
			+ "WHERE mnum LIKE #{mnum}\r\n"
			+ ")\r\n"
			+ "WHERE cnt BETWEEN #{start} AND #{end}")
	public List<Material_mng>  getMaterial_mngList(Material_mngSch sch);
	
	@Select("SELECT * FROM MATERIAL_MNG mm \r\n"
			+ "	WHERE mng_no = #{mng_no}")
	Material_mng getMaterial_mng(@Param("mng_no") int mng_no);
	
	@Insert("INSERT INTO material_mng values(material_mng_seq.nextval,#{mnum},#{inc_rels_cnt},#{inc_rels_sort},#{curr_tot_stock},#{inc_rels_dteS},#{empno})")
	int insertMaterial_mng(Material_mng ins);
	
	@Update("UPDATE MATERIAL_MNG \r\n"
			+ "	SET mnum = #{mnum},\r\n"
			+ "		inc_rels_cnt =#{inc_rels_cnt},\r\n"
			+ "		inc_rels_sort =#{inc_rels_sort},\r\n"
			+ "		curr_tot_stock=#{curr_tot_stock},\r\n"
			+ "		inc_rels_dte = TO_DATE(#{inc_rels_dteS},'YYYY-MM-DD'),\r\n"
			+ "		empno =#{empno}\r\n"
			+ "		WHERE mng_no  =#{mng_no}")
	int updateMaterial_mng(Material_mng upt);
	
	@Delete("delete from material_mng where mng_no = #{mng_no}")
	int deleteMaterial_mng(@Param("mng_no") int mng_no); 
}
