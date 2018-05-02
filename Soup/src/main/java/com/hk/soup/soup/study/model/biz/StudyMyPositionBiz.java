package com.hk.soup.soup.study.model.biz;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.soup.study.model.dao.StudyMyPositionDao;

@Service
public class StudyMyPositionBiz {
	
	@Autowired
	private StudyMyPositionDao dao;
	
	public String MyPosition(Map<String,Integer> map) {
		return dao.MyPosition(map);
	}
}
