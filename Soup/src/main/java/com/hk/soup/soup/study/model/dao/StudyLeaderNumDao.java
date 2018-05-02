package com.hk.soup.soup.study.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyLeaderNumDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.soup.study.manage.";
	
	public int leaderNum() {
		
		int res = sqlSession.selectOne(nameSpace + "leaderNum");
		
		return res;
	}

}
