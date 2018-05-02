package com.hk.soup.soup.study.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.soup.study.dto.StudyScheduleDto;


@Repository
public class StudyScheduleDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.soup.study.manage.";
	
	public int insert(StudyScheduleDto dto) {
		
		int res = sqlSession.insert(nameSpace + "scheduleInsert", dto);
		
		return res;
	}
	
	public List<StudyScheduleDto> selectAll(Map<String, Integer> map) {
		
		List<StudyScheduleDto> res = new ArrayList<>();
		
		res = sqlSession.selectList(nameSpace + "scheduleSelectAll", map);
		
		return res;
	}
	
	public List<StudyScheduleDto> dateList(StudyScheduleDto dto) {
		
		List<StudyScheduleDto> res = new ArrayList<>();
		
		res = sqlSession.selectList(nameSpace + "dateList", dto);
		
		return res;
	}

	public StudyScheduleDto dateDetail(StudyScheduleDto dto) {
		
		StudyScheduleDto res = sqlSession.selectOne(nameSpace + "dateDetail", dto);
		
		return res;
	}
	
	public int update(StudyScheduleDto dto) {
		
		int res = sqlSession.update(nameSpace + "scheduleUpdate", dto);
		
		return res;
	}
	
	public int delete(StudyScheduleDto dto) {
		
		int res = sqlSession.delete(nameSpace + "scheduleDelete", dto);
		
		return res;
	}
	
}
