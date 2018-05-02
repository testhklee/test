package com.hk.soup.soup.study.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.soup.study.dto.StudyBoardDto;

@Repository
public class StudyBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.soup.study.manage.";
	
	public int studyBoardInsert(StudyBoardDto dto) {
		
		int res = sqlSession.insert(nameSpace + "studyBoardInsert", dto);
		
		return res;
	}
	
	public List<StudyBoardDto> studyBoardList(int soupNo) {
		
		List<StudyBoardDto> res = sqlSession.selectList(nameSpace + "studyBoardList", soupNo);
		
		return res;
	}
	
	public int studyBoardHit(Map<String, Integer> map) {
		
		int res = sqlSession.update(nameSpace + "studyBoardHit", map);
		
		return res;
	}
	
	public StudyBoardDto studyBoardDetail(Map<String, Integer> map) {
		
		StudyBoardDto res = sqlSession.selectOne(nameSpace + "studyBoardDetail", map);
		
		return res;
	}
	
	public int studyBoardDelete(Map<String, Integer> map) {
		
		int res = sqlSession.update(nameSpace + "studyBoardDelete", map);
		
		return res;
	}
	
}
