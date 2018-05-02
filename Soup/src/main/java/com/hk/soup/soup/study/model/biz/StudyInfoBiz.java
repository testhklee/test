package com.hk.soup.soup.study.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.soup.study.dto.StudyInfoDto;
import com.hk.soup.soup.study.model.dao.StudyInfoDao;

@Service
public class StudyInfoBiz {

	@Autowired
	private StudyInfoDao dao;
	
	public StudyInfoDto studyInfo(int soupNo) {
		
		return dao.studyInfo(soupNo);
	}
	
}
