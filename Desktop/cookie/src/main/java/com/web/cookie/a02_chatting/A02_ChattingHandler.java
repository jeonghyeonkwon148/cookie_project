package com.web.cookie.a02_chatting;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

// 컨테이너에 chatHandler라는 이름으로 등록
// front 단에서 chat-ws로 호출 가능
// js로 'ws:localhost:3030/chat' 호출 시에, chatHandler backend 연동 WevSocketConfig에서 처리해준다
@Component("chatHandler")
public class A02_ChattingHandler extends TextWebSocketHandler {
	// 접속한 클라이언트 할당 (소켓아이디, 소켓세션으로 할당)
	private Map<String, WebSocketSession> users = new ConcurrentHashMap();

	// 접속을 했을 때 처리 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		//super.afterConnectionEstablished(session);
		System.out.println("[소켓 서버단]접속되었습니다.!!"+session.getId());
		// 접속했을 때, 하나씩 할당처리
		users.put(session.getId(), session);
		//users 맵에 세션 ID와 세션 객체를 저장합니다. 이는 연결된 모든 클라이언트를 관리하는 데 사용
	}

	// 메세지를 전송할 때 처리 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		//super.handleTextMessage(session, message);
		System.out.println(session.getId()+" : "+message.getPayload());
		//콘솔에 세션 ID와 메시지 내용을 출력
		// 접속한 모든 클라이언트에게 메세지전달
		for(WebSocketSession ws: users.values()) {//접속한 모든 클라이언트에게 메시지를 전달하기 위해 users 맵에 저장된 모든 세션을 반복
			ws.sendMessage(message);// 접속한 모든 클라이언트에게 메시지를 전송 메서드
		}
	}

	// 접속 종료 시 처리 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		//super.afterConnectionClosed(session, status);
		users.remove(session.getId());
		System.out.println("#접속 종료\n"+session.getId()+" 제외처리");
	}

	// 채팅에 에러 발생 시 처리 메서드
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		//super.handleTransportError(session, exception);
		System.out.println(session.getId()+" 예외 발생 : "+exception.getMessage());
	}

}
