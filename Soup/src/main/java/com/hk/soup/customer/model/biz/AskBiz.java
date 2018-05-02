package com.hk.soup.customer.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.customer.dto.AnswerDto;
import com.hk.soup.customer.dto.QuestionDto;
import com.hk.soup.customer.model.dao.AskDao;

@Service
public class AskBiz {

	@Autowired
	private AskDao dao;
	
	public List<AskDao> selectUser(int memberNo){
		return dao.selectUser(memberNo);
	}
	
	public List<AskDao> selectUserList(int memberNo,int start,int end){
		return dao.selectUserList(memberNo,start,end);
	}
	
	public List<AskDao> selectAdmin(){
		return dao.selectAdmin();
	}
	
	public QuestionDto selelctOne(int questionNo) {
		return dao.selectOne(questionNo);
	}
	
	public AnswerDto selectAnswer(int questionNo) {
		return dao.selectAnswer(questionNo);
	}
	
	public int questionInsert(QuestionDto dto) {
		return dao.questionInsert(dto);
	}
	
	public int aswerInsert(AnswerDto dto) {
		return dao.answerInsert(dto);
	}
	
	public int ynUpdate(QuestionDto dto) {
		return dao.ynUpdate(dto);
	}
	
	public int selectMemberNo(int questionNo) {
		return dao.selectMemberNo(questionNo);
	}
}
