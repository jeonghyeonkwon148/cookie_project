package com.web.cookie.a01_song.a03_repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.cookie.a01_song.a04_vo.Chat;

@Mapper
public interface ChatRepository {
	@Select("SELECT * FROM CHAT \r\n"
			+ "		WHERE SENDER LIKE #{sender}\r\n"
			+ "		AND RECEIVER LIKE #{receiver}\r\n"
			+ "		ORDER BY chat_id")
	List<Chat> getChatList(Chat sch);
	
	@Select("SELECT * FROM chat WHERE sender =#{sender}")
	Chat getChatBySender(@Param("sender") String sender);
	
	@Select("SELECT * FROM chat WHERE receiver =#{receiver}")
	Chat getChatByReceiver(@Param("receiver") String receiver);
	
	@Select("SELECT * FROM chat WHERE chat_id =#{chat_id}")
	Chat getChatById(@Param("chat_id") int chat_id);
	
	
	@Insert("INSERT INTO chat values(chat_seq.nextval,#{sender},#{receiver},#{content},0,sysdate)")
	int insertChat(Chat ins);
	
	@Update("UPDATE CHAT \r\n"
			+ "		SET readcnt =#{readcnt}\r\n"
			+ "		WHERE chat_id =#{chat_id}")
	int updateChat(Chat upt);
	
	@Update("UPDATE CHAT \r\n"
			+ "		SET readcnt = readcnt +1\r\n"
			+ "		WHERE chat_id =#{chat_id}")
	int readCntUpdate(@Param("chat_id") int chat_id);
	
	
	@Delete("DELETE FROM chat WHERE chat_id=#{chat_id}")
	int deleteChat(@Param("chat_id") int chat_id);
}
