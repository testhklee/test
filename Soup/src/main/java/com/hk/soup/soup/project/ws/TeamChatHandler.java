package com.hk.soup.soup.project.ws;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.soup.project.ws.chat.ChatRoom;

public class TeamChatHandler extends TextWebSocketHandler {
	
	private List<ChatRoom> chatRoomList = new ArrayList<ChatRoom>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> attributes = session.getAttributes();
		int soupNo = (int) attributes.get("chatSoupNo");
		
		//현재 있는 채팅방 목록 중 들어가려는 스프의 채팅방이 있다면 들어간다
		boolean isExist = false;
		for (ChatRoom chatRoom : chatRoomList) {
			
			if (chatRoom.getSoupNo() == soupNo) {
				isExist = true;
				chatRoom.addMember(session);
			}
			
		}
		
		//스프 채팅방이 없다면 새로 만들어준다
		if (!isExist) {
			ChatRoom chatRoom = new ChatRoom(soupNo);
			chatRoom.addMember(session);
			chatRoomList.add(chatRoom);
		}
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//세션의 정보를 담아 json형식으로 보낸다
		int soupNo = (int) session.getAttributes().get("chatSoupNo");
		MemberDto login = (MemberDto)session.getAttributes().get("login");
		String content = message.getPayload();

		JsonObject json = new JsonObject();
		json.addProperty("sender", login.getMemberName());
		json.addProperty("content", content);
		json.addProperty("face", login.getMemberFace());

		//본인을 제외한 채팅방 인원들에게 메세지를 보낸다
		for (ChatRoom chatRoom : chatRoomList) {
			
			if (chatRoom.getSoupNo() == soupNo) {
				
				for (WebSocketSession member : chatRoom.getMemberList()) {
			
					if (!member.getId().equals(session.getId())) {
						member.sendMessage(new TextMessage(json.toString()));
					}
					
				}
				break;
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		int soupNo = (int) session.getAttributes().get("chatSoupNo");

		//해당 세션을 채팅방에서 제외시키고 만약 인원이 없다면 채팅방을 없앤다.
		for (ChatRoom chatRoom : chatRoomList) {
			
			if (chatRoom.getSoupNo() == soupNo) {
				
				chatRoom.removeMember(session);
				
				if(chatRoom.getMemberList().size() == 0) {
					chatRoomList.remove(chatRoom);
				}
				
				break;
			}
			
		}
		
	}

}
