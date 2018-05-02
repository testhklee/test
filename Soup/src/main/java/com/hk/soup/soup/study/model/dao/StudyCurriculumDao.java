package com.hk.soup.soup.study.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.soup.study.dto.StudyCurriculumDto;

@Repository
public class StudyCurriculumDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.soup.study.manage.";
	
	public int curriculumInsert(StudyCurriculumDto dto) {
		
		int res = sqlSession.insert(nameSpace + "curriculumInsert", dto);
		
		return res;
	}
	
	public List<StudyCurriculumDto> curriculumList(int soupNo) {
		
		List<StudyCurriculumDto> res = sqlSession.selectList(nameSpace + "curriculumList", soupNo);
		
		return res;
	}
	
	public int delCurriculum(Map<String, Integer> map) {
		
		int res = sqlSession.delete(nameSpace + "delCurriculum", map);
		
		return res;
	}
	
}
