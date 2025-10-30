package com.example.demo.workLine;

import java.io.IOException;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler {

    // 클라이언트 연결되면
	@Override
	public void afterConnectionEstablished(WebSocketSession session){
    }

    // 클라이언트 연결 끊기면
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status){
    }

    // 메시지 받으면
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
        // 클라이언트에서 보낸 메시지 처리
        String payload = message.getPayload();
        System.out.println("Received: " + payload);

        // 응답 메시지 보내기
        session.sendMessage(new TextMessage("Hello, " + payload + "!"));
    }

    // 오류 발생하면
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception){
    }
}