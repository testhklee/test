package com.hk.soup.soup.study.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.soup.study.model.dao.StudyLeaderNumDao;

@Service
public class StudyLeaderNumBiz {

	@Autowired
	private StudyLeaderNumDao dao;
	
	public int leaderNum() {	
		
		return dao.leaderNum();
	}
}
