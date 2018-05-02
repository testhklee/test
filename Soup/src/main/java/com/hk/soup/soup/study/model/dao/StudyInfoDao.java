package com.hk.soup.soup.study.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.soup.study.dto.StudyInfoDto;

@Repository
public class StudyInfoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.soup.study.manage.";
	
	public StudyInfoDto studyInfo(int soupNo) {
		
		StudyInfoDto res = sqlSession.selectOne(nameSpace + "studyInfo", soupNo);
		
		return res;
	}

}
