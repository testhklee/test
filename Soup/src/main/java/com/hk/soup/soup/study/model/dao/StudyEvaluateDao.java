package com.hk.soup.soup.study.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.soup.study.dto.StudyEvaluateDto;


@Repository
public class StudyEvaluateDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.soup.study.manage.";
	
	public int evaluatInsert(Map<String, Object> map) {
		
		int res = sqlSession.insert(nameSpace + "evaluatInsert", map);
		
		return res;
	}
	
	public List<StudyEvaluateDto> evaluatList(StudyEvaluateDto dto) {
		
		List<StudyEvaluateDto> res = sqlSession.selectList(nameSpace + "evaluatList", dto);
		
		return res;
	}
	
	public List<StudyEvaluateDto> chartEvaluatList(StudyEvaluateDto dto) {
		
		List<StudyEvaluateDto> res = sqlSession.selectList(nameSpace + "chartEvaluatList", dto);
		
		return res;
	}
	
	public int delEvaluat(Map<String, Integer> map) {
		
		int res = sqlSession.delete(nameSpace + "delEvaluat", map);
		
		return res;
	}
	
	public int updateEvaluat(Map<String, Object> map) {
		
		int res = sqlSession.delete(nameSpace + "updateEvaluat", map);
		
		return res;
	}
	
	public List<Double> allEvaluatAvg(Map<String, Integer> map) {
		
		List<Double> res = sqlSession.selectList(nameSpace + "allEvaluatAvg", map);
		
		return res;
	}
	
	public List<Integer> allEvaluatCommentNum(Map<String, Integer> map) {
		
		List<Integer> res = sqlSession.selectList(nameSpace + "allEvaluatCommentNum", map);
		
		return res;
	}
	
	public List<StudyEvaluateDto> allEvaluatComment(Map<String, Integer> map) {
		
		List<StudyEvaluateDto> res = sqlSession.selectList(nameSpace + "allEvaluatComment", map);
		
		return res;
	}
	
	public List<Integer> completeEvaluat(int soupNo) {
		
		List<Integer> res = sqlSession.selectList(nameSpace + "completeEvaluat", soupNo);
		
		return res;
	}

}
