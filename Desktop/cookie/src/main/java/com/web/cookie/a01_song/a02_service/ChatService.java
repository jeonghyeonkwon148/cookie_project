package com.web.cookie.a01_song.a02_service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.cookie.a01_song.a03_repository.ChatRepository;
import com.web.cookie.a01_song.a04_vo.Chat;

@Service
public class ChatService {
	@Autowired(required = false)
	private ChatRepository dao;
	
	public List<Chat> getChatList(Chat sch){
		if(sch.getSender()==null) sch.setSender("");
		if(sch.getReceiver()==null) sch.setReceiver("");
		sch.setSender("%"+sch.getSender()+"%");
		sch.setReceiver("%"+sch.getReceiver()+"%");
		return dao.getChatList(sch);
	}
	public Chat getChatBySender(String sender) {
		return dao.getChatBySender(sender);
	}
	public Chat getChatByReceiver(String receiver) {
		return dao.getChatByReceiver(receiver);
	}
	public Chat getChatById(int chat_id) {
		dao.readCntUpdate(chat_id);
		return dao.getChatById(chat_id);
	}
	public String insertChat(Chat ins) {
		return dao.insertChat(ins)>0?"등록성공":"등록실패";
	}
	public String updateChat(Chat upt) {
		return dao.updateChat(upt)>0?"수정성공":"수정실패"; 
	}
	public String deleteChat(int chat_id) {
		return dao.deleteChat(chat_id)>0?"삭제성공":"삭제실패"; 
	}
}
