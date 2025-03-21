package com.web.cookie.a01_config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.web.cookie.a02_chatting.A02_ChattingHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
	private final A02_ChattingHandler chatHandler;
	public WebSocketConfig(A02_ChattingHandler chatHandler) {
		this.chatHandler=chatHandler;
	}
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addHandler(chatHandler, "/chat").setAllowedOrigins("*");
		
	}
	
}


