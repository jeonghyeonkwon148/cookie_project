package com.web.cookie.a01_song.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.Calendar;



@Mapper
public interface CalendarRepository {
	@Select("SELECT id, title, writer, start1 \"START\", end1 \"END\", content, backgroundcolor,\r\n"
			+ "	textcolor, allday, urllink \r\n"
			+ "FROM calendar")
	List<Calendar> getCalendarList();
	
	@Insert("insert into calendar values(cal_seq.nextval,#{title},#{writer},\r\n"
			+ "	#{start},#{end},#{content},#{backgroundColor},#{textColor},\r\n"
			+ "	#{allDay},#{urllink} )")
	int insertCalendar(Calendar ins);
	@Update("UPDATE calendar\r\n"
			+ "	SET title = #{title},\r\n"
			+ "		writer =#{writer},\r\n"
			+ "		start1 = #{start},\r\n"
			+ "		end1 = #{end},\r\n"
			+ "		content = #{content},\r\n"
			+ "		backgroundColor = #{backgroundColor},\r\n"
			+ "		textColor = #{textColor},\r\n"
			+ "		allDay = #{allDay},\r\n"
			+ "		urllink =#{urllink}\r\n"
			+ "where id = #{id}")
	int updateCalendar(Calendar upt);	
	// controller까지 작성 완료..  updateCalendarAjax
	@Delete("DELETE FROM CALENDAR WHERE id= #{id}")
	int deleteCalendar(@Param("id") int id);
}
