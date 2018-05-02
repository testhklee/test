package com.hk.soup.soup.study.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.soup.study.dto.StudyCurriculumDto;
import com.hk.soup.soup.study.model.dao.StudyCurriculumDao;

@Service
public class StudyCurriculumBiz {
	
	@Autowired
	private StudyCurriculumDao dao;
	
	public int curriculumInsert(StudyCurriculumDto dto) {
		
		return dao.curriculumInsert(dto);		
	}
	
	public List<StudyCurriculumDto> curriculumList(int soupNo) {
		
		return dao.curriculumList(soupNo);
	}
	
	public int delCurriculum(Map<String, Integer> map) {
		
		return dao.delCurriculum(map);
	}
	
}
