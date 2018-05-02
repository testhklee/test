package com.hk.soup.message.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.message.dto.MessageDto;
import com.hk.soup.message.dto.MessageReceiverDto;
import com.hk.soup.message.model.dao.MessageDao;

@Service
public class MessageBiz {

	@Autowired
	private MessageDao dao;
	
	public List<MessageDao> selectSender(int messageSenderNo){
		return dao.selectSender(messageSenderNo);
	}
	
	public List<MessageDao> selectSenderList(int messageSenderNo,int start, int end){
		return dao.selectSenderList(messageSenderNo,start,end);
	}
	
	public List<MessageDao> selectTarget(int messageTargetNo){
		return dao.selectTarget(messageTargetNo);
	}
	
	public List<MessageDao> selectTargetList(int messageTargetNo , int start, int end){
		return dao.selectTargetList(messageTargetNo,start,end);
	}
	
	public MessageDto selectMessageNo(int messageSenderNo) {
		return dao.selectMessageNo(messageSenderNo);
	}
	
	
	public MessageDto senderOne(Map<String,Integer> map) {
		return dao.senderOne(map);
	}
	
	public MessageDto targetOne(Map<String,Integer> map) {
		return dao.targetOne(map);
	}
	
	public int insert(MessageDto dto) {
		return dao.insert(dto);
	}
	
	public int updateCheck(MessageDto dto) {
		return dao.updateCheck(dto);
	}
	
	public int delSend(MessageDto dto) {
		return dao.delSend(dto);
	}
	
	public int delTarget(MessageDto dto) {
		return dao.delTarget(dto);
	}
	
	public int mulDelSend(String messageNo[]) {
		return dao.mulDelSend(messageNo);
	}
	
	public int mulDelTarget(String messageNo[]) {
		return dao.mulDelTarget(messageNo);
	}
	
	public MessageReceiverDto selectMessageReceiver(int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("memberNo", memberNo);
		
		return dao.selectMessageReceiver(in);
	}
}
