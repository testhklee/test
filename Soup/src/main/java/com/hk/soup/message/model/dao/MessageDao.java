package com.hk.soup.message.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.message.dto.MessageDto;
import com.hk.soup.message.dto.MessageReceiverDto;

@Repository
public class MessageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.message.";
	
	public List<MessageDao> selectSender(int messageSenderNo){
		List<MessageDao> list = sqlSession.selectList(nameSpace+"selectSender",messageSenderNo);
		return list;
	}
	
	public List<MessageDao> selectSenderList(int messageSenderNo , int start , int end ){
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("messageSenderNo", messageSenderNo);
		map.put("start", start);
		map.put("end", end);
		List<MessageDao> list = sqlSession.selectList(nameSpace+"selectSenderList",map);
		return list;
	}
	
	public List<MessageDao> selectTarget(int messageTargetNo){
		List<MessageDao> list = sqlSession.selectList(nameSpace+"selectTarget", messageTargetNo);
		return list;
	}
	
	public MessageDto selectMessageNo(int messageSenderNo) {
		MessageDto dto = sqlSession.selectOne(nameSpace+"selectMessageNo",messageSenderNo);
		return dto;
	}
	
	public List<MessageDao> selectTargetList(int messageTargetNo , int start , int end ){
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("messageTargetNo", messageTargetNo);
		map.put("start", start);
		map.put("end", end);
		List<MessageDao> list = sqlSession.selectList(nameSpace+"selectTargetList",map);
		return list;
	}
	
	public MessageDto senderOne(Map<String,Integer> map) {
		MessageDto dto = sqlSession.selectOne(nameSpace+"SenderOne", map);
		return dto;
	}
	
	public MessageDto targetOne(Map<String,Integer> map) {
		MessageDto dto = sqlSession.selectOne(nameSpace+"TargetOne", map);
		return dto;
	}
	
	public int insert(MessageDto dto) {
		int res = sqlSession.insert(nameSpace+"insert", dto);
		return res;
	}
	
	public int updateCheck(MessageDto dto) {
		int res = sqlSession.update(nameSpace+"updateCheck",dto);
		return res;
	}
	
	public int delSend(MessageDto dto) {
		int res = sqlSession.update(nameSpace+"delSend",dto);
		return res;
	}
	
	public int delTarget(MessageDto dto) {
		int res = sqlSession.update(nameSpace+"delTarget",dto);
		return res;
	}

	public MessageReceiverDto selectMessageReceiver(Map<String, Integer> in) {
		return sqlSession.selectOne(nameSpace + "selectMessageReceiver", in);
	}
	
	public int mulDelSend(String messageNo[]) {
		
		int res = 0;
		Map<String,String> map = new HashMap<>();
		for(int i = 0 ; i<messageNo.length ; i++) {
			
			map.put("messageNo", messageNo[i]);
			res = sqlSession.update(nameSpace+"delSend",map);
			
		}
		
		return res;
	}
	
	public int mulDelTarget(String messageNo[]) {
		int res = 0;
		
		Map<String,String> map = new HashMap<>();
		
		for(int i = 0 ; i<messageNo.length ; i++) {
			
			map.put("messageNo", messageNo[i]);
			res = sqlSession.update(nameSpace+"delTarget",map);
			
		}
		
		return res;
	}
	
}

