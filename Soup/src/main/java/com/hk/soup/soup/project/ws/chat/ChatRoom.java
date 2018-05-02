package com.hk.soup.soup.project.ws.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.WebSocketSession;

public class ChatRoom {

	private int soupNo;
	private List<WebSocketSession> memberList;
	
	public ChatRoom() {};
	
	public ChatRoom(int soupNo) {
		super();
		this.soupNo = soupNo;
		this.memberList = new ArrayList<WebSocketSession>();
	}
	
	public void addMember(WebSocketSession member) {
		memberList.add(member);
	}
	
	public void removeMember(WebSocketSession member) {
		memberList.remove(member);
	}
	
	// GETTER / SETTER
	public int getSoupNo() {
		return soupNo;
	}
	
	public void setSoupNo(int soupNo) {
		this.soupNo = soupNo;
	}
	
	public List<WebSocketSession> getMemberList() {
		return memberList;
	}
	
	public void setMemberList(List<WebSocketSession> memberList) {
		this.memberList = memberList;
	}
	
}
