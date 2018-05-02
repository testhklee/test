package com.hk.soup.soup.study.model.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.soup.study.dto.StudyScheduleDto;
import com.hk.soup.soup.study.model.dao.StudyScheduleDao;

@Service
public class StudyScheduleBiz {
	
	@Autowired
	private StudyScheduleDao dao;
	
	
	public int insert(StudyScheduleDto dto) {
		
		return dao.insert(dto);
	}
	
	public List<StudyScheduleDto> selectAll(Map<String, Integer> map) {
		
		return dao.selectAll(map);
	}
	
	public List<StudyScheduleDto> dateList(StudyScheduleDto dto) {
		
		return dao.dateList(dto);
	}
	
	public StudyScheduleDto dateDetail(StudyScheduleDto dto) {
		
		return dao.dateDetail(dto);
	}
	
	public int update(StudyScheduleDto dto) {
		
		return dao.update(dto);
	}
	
	public int delete(StudyScheduleDto dto) {		
		
		return dao.delete(dto);
	}
	
	
}
