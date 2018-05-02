package com.hk.soup.soup.study.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.soup.study.dto.StudyMemoDto;


@Repository
public class StudyMemoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.soup.study.manage.";
	
	public StudyMemoDto load(Map<String, Integer> map) {
		
		StudyMemoDto res = sqlSession.selectOne(nameSpace + "memoLoad", map);
		
		return res;
	}
	
	public int insert(StudyMemoDto dto) {
		
		int res = sqlSession.insert(nameSpace + "memoInsert", dto);
		
		return res;
	}
	
	public int update(StudyMemoDto dto) {
		
		int res = sqlSession.insert(nameSpace + "memoUpdate", dto);
		
		return res;
	}
	
	
}
