package com.web.cookie.a04_Jung.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a04_Jung.vo.Dfct_calendar;

@Mapper
public interface A13_JungDao {

/*
	-- 불량 캘린더
	private int id; // 번호
	private int dfct_id; //불량 관리 아이디
	private String title;// 제목
	private String start;//시작일
	private String end;//마지막일
	private String backgroundColor;//배경색
	private String textColor;//색상
	private boolean allday;//종일여부
	private String dfc_typ;//불량유형
	private String dfct_pic_nm;//담당자명
	private String dfc_prd_cnfr_name;//확인근무자명
	private String dfct_prcs_rslt;//불량처리결과
	--);*/
	@Select("SELECT id,dc.dfct_id,title,start1 \"START\", end1 \"END\",backgroundColor, "
			+ "textColor,allday,"
			+ "dfc_typ,dfct_pic_nm,dfc_prd_cnfr_name,dfct_prcs_rslt "
			+ "FROM DFCT_CALENDAR dc,DFCT_MNGM01 dm,DFC_PRD01 dp,DEFECT_TYPE dt \r\n"
			+ "where dc.DFCT_ID=dm.DFCT_ID AND dp.DFC_PRD_ID = dm.DFC_PRD_ID AND dt.DFC_TYP_ID = dp.DFC_TYP_ID")
	List<Dfct_calendar> getDfct_calendarList();
	
	@Insert("insert into DFCT_CALENDAR values(dfct_calendar_seq.nextval,#{title},#{dfct_id},\r\n"
			+ "	#{start},#{end},#{backgroundColor},#{textColor},\r\n"
			+ "	#{allday} )")
	int insertDfct_calendar(Dfct_calendar ins);
	
	@Insert("insert into DFCT_CALENDAR values(dfct_calendar_seq.nextval,'불량발생',#{dfct_id}, "
			+ "#{dfct_dsps_dateStr},TO_CHAR(to_date(#{dfct_dsps_dateStr},'yyyy-mm-dd')+1,'yyyy-mm-dd'), "
			+ " '#3399ff','#ffff00',0)")
	int insertDfct_calendar2(Dfct_calendar ins);
	
	@Update("UPDATE DFCT_CALENDAR\r\n"
			+ "	set	title = #{title},"
			+ "		dfct_id=#{dfct_id},"
			+ "		start1 = #{start},\r\n"
			+ "		end1 = #{end},\r\n"
			+ "		backgroundColor = #{backgroundColor},\r\n"
			+ "		textColor = #{textColor},\r\n"
			+ "		allday = #{allday}\r\n"
			+ "where id = #{id}")
	int updateDfct_calendar(Dfct_calendar upt);	
	// controller까지 작성 완료..  updateCalendarAjax
	@Delete("DELETE FROM DFCT_CALENDAR WHERE id= #{id}")
	int deleteDfct_calendar(@Param("id") int id);

}
