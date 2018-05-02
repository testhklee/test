package com.hk.soup.soup.study.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class StudyMyPositionDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.soup.study.manage.";
	
	public String MyPosition(Map<String,Integer> map) {
		
		String res = sqlSession.selectOne(nameSpace + "MyPosition", map);
		
		return res;
	}
	
	
}
