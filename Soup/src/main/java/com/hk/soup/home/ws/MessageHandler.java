package com.hk.soup.home.ws;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.hk.soup.home.alarm.dto.AlarmDto;
import com.hk.soup.home.alarm.model.biz.AlarmBiz;
import com.hk.soup.home.dto.MemberDto;

public class MessageHandler extends TextWebSocketHandler {
	
	@Autowired
	private AlarmBiz alarmBiz;
	@Autowired
	private Gson gson;
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		MemberDto member = (MemberDto) session.getAttributes().get("login");

		if (member != null) {
			sessionList.add(session);
		}
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		int targetNo = Integer.parseInt(message.getPayload());
		
		for (WebSocketSession sezzion : sessionList) {
			MemberDto member = (MemberDto)sezzion.getAttributes().get("login");

			if (member.getMemberNo() == targetNo) {
				Thread.sleep(100);
				List<AlarmDto> alarmMessageList = alarmBiz.selectAlarmList(member.getMemberNo(), "MESSAGE", "NULL");
				sezzion.getAttributes().put("alarmMessageList", alarmBiz.selectAlarmList(member.getMemberNo(), "MESSAGE", "NULL"));
				sezzion.sendMessage(new TextMessage(gson.toJson(alarmMessageList)));
				break;
			}
			
		}
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}

}
