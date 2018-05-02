package com.hk.soup.customer.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.customer.dto.AnswerDto;
import com.hk.soup.customer.dto.QuestionDto;

@Repository
public class AskDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.ask.";
	
	public List<AskDao> selectUser(int memberNo){
		List<AskDao> list = sqlSession.selectList(nameSpace+"selectUser",memberNo);
		return list;
	}
	
	public List<AskDao> selectUserList(int memberNo,int start , int end){
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("memberNo", memberNo);
		map.put("start", start);
		map.put("end", end);
		List<AskDao> list = sqlSession.selectList(nameSpace+"selectUserList",map);
		return list;
	}
	
	public List<AskDao> selectAdmin(){
		List<AskDao> list  = sqlSession.selectList(nameSpace+"selectAdmin");
		return list;
	}
	
	public QuestionDto selectOne(int questionNo) {
		QuestionDto dto = sqlSession.selectOne(nameSpace+"selectOne",questionNo);
		return dto;
	}
	
	public AnswerDto selectAnswer(int questionNo) {
		AnswerDto dto = sqlSession.selectOne(nameSpace+"selectAnswer", questionNo);
		return dto;
	}
	
	public int questionInsert(QuestionDto dto) {
		int res = sqlSession.insert(nameSpace+"question", dto);
		return res;
	}
	
	public int answerInsert(AnswerDto dto) {
		int res = sqlSession.insert(nameSpace+"answer", dto);
		return res;
	}
	
	public int ynUpdate(QuestionDto dto) {
		int res = sqlSession.update(nameSpace+"update", dto);
		return res;
	}
	
	public int selectMemberNo(int questionNo) {
		int res = sqlSession.selectOne(nameSpace+"selectMemberNo",questionNo);
		return res;
	}
}
