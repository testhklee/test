package com.hk.soup.teacher.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.teacher.dto.TeacherDto;
import com.hk.soup.teacher.model.dao.TeacherDao;

@Service
public class TeacherBiz {
	
	@Autowired
	private TeacherDao dao;
	
	public List<TeacherDao> selectAll(){
		return dao.selectAll();
	}
	
	public TeacherDto selectOne(int memberNo) {
		return dao.selectOne(memberNo);
	}
	
	public int updateTeacher(int memberNo, String teacherStatus) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberNo", String.valueOf(memberNo));
		map.put("teacherStatus", teacherStatus);
		
		if (teacherStatus.equals("PASS")) {
			map.put("memberGrade", "TEACHER");
		} else {
			map.put("memberGrade", "USER");
		}
		return dao.updateTeacher(map);
	}

}
