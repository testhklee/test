package com.hk.soup.soup.study.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.soup.study.dto.StudyBoardDto;
import com.hk.soup.soup.study.model.dao.StudyBoardDao;

@Service
public class StudyBoardBiz {
	
	@Autowired
	private StudyBoardDao dao;
	
	public int studyBoardInsert(StudyBoardDto dto) {
		
		return dao.studyBoardInsert(dto);
	}
	
	public List<StudyBoardDto> studyBoardList(int soupNo) {
		
		return dao.studyBoardList(soupNo);
	}
	
	public int studyBoardHit(Map<String, Integer> map) {
		
		return dao.studyBoardHit(map);
	}
	
	public StudyBoardDto studyBoardDetail(Map<String, Integer> map) {
		
		return dao.studyBoardDetail(map);
	}
	
	public int studyBoardDelete(Map<String, Integer> map) {
		
		return dao.studyBoardDelete(map);
	}
}
