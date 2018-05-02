package com.hk.soup.teacher.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.teacher.dto.TeacherDto;

@Repository
public class TeacherDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.teacher.";
	
	public List<TeacherDao> selectAll(){
		List<TeacherDao> list = sqlSession.selectList(nameSpace+"selectAll");
		return list;
	}
	
	public TeacherDto selectOne(int memberNo) {
		TeacherDto dto = sqlSession.selectOne(nameSpace+"selectOne",memberNo);
		return dto;
	}
	
	public int updateTeacher(Map<String, String> map) {
		int res = sqlSession.update(nameSpace + "updateMemberGrade", map);
		res += sqlSession.update(nameSpace + "updateTeacherStatus", map);
		return res;
	}

}
