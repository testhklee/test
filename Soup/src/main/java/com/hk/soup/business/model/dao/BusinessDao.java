package com.hk.soup.business.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hk.soup.business.dto.BusinessDto;

@Repository
public class BusinessDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.business.";
	
	public List<BusinessDao> selectAll(){
		List<BusinessDao> list = sqlSession.selectList(nameSpace+"selectAll");
		return list;
	}
	
	public BusinessDto selectOne(int memberNo) {
		BusinessDto dto = sqlSession.selectOne(nameSpace+"selectOne", memberNo);
		return dto;
	}
	
	public int update(Map<String, Object> map) {

		
		int res = sqlSession.update(nameSpace+"update",map);
		
		return res;
	}
	
	public int passGrade(Map<String, Object> map) {
		int res = sqlSession.update(nameSpace+"passGrade", map);
		
		return res;
	}
	
	public int userGrade(Map<String, Object> map) {
		int res = sqlSession.update(nameSpace+"elseGrade", map);
		
		return res;
	}

	public int updateBusiness(Map<String, String> map) {
		int res = sqlSession.update(nameSpace + "updateMemberGrade", map);
		res += sqlSession.update(nameSpace + "updateBusinessStatus", map);
		return res;
	}
	
	public int selectCheckBusiness(Map<String, Integer> in) {
		return sqlSession.selectOne(nameSpace + "selectCheckBusiness", in);
	}

	public int insertBusinessApply(Map<String, String> in) {
		return sqlSession.insert(nameSpace + "insertBusinessApply", in);
	}

	public int selectCheckTeacher(Map<String, Integer> in) {
		return sqlSession.selectOne(nameSpace + "selectCheckTeacher", in);
	}

	public int insertTeacherApply(Map<String, String> in) {
		return sqlSession.insert(nameSpace + "insertTeacherApply", in);
	}
}
