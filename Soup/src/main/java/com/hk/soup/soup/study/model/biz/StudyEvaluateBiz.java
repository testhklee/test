package com.hk.soup.soup.study.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.soup.study.dto.StudyEvaluateDto;
import com.hk.soup.soup.study.model.dao.StudyEvaluateDao;

@Service
public class StudyEvaluateBiz {

	@Autowired
	private StudyEvaluateDao dao;
	
	public int evaluatInsert(Map<String, Object> map) {
		return dao.evaluatInsert(map);
	}
	
	public List<StudyEvaluateDto> evaluatList(StudyEvaluateDto dto) {
		return dao.evaluatList(dto);
	}
	
	public List<StudyEvaluateDto> chartEvaluatList(StudyEvaluateDto dto) {
		return dao.chartEvaluatList(dto);
	}
	
	public int delEvaluat(Map<String, Integer> map) {		
		return dao.delEvaluat(map);
	}
	
	public int updateEvaluat(Map<String, Object> map) {
		return dao.updateEvaluat(map);
	}
	
	public List<Double> allEvaluatAvg(Map<String, Integer> map) {
		return dao.allEvaluatAvg(map);
	}
	
	public List<Integer> allEvaluatCommentNum(Map<String, Integer> map) {
		return dao.allEvaluatCommentNum(map);
	}
	
	public List<StudyEvaluateDto> allEvaluatComment(Map<String, Integer> map) {
		return dao.allEvaluatComment(map);
	}
	
	public List<Integer> completeEvaluat(int soupNo) {
		return dao.completeEvaluat(soupNo);
	}
}
