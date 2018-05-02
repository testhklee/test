package com.hk.soup.soup.study.model.biz;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.soup.study.dto.StudyMemoDto;
import com.hk.soup.soup.study.model.dao.StudyMemoDao;

@Service
public class StudyMemoBiz {
	
	@Autowired
	private StudyMemoDao dao;
	
	public StudyMemoDto load(Map<String, Integer> map) {
		
		return dao.load(map);
	}
	
	public int insert(StudyMemoDto dto) {
		
		return dao.insert(dto);
	}
	
	public int update(StudyMemoDto dto) {
		
		return dao.update(dto);
	}
	
}
