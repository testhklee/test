package com.hk.soup.emp.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.emp.dto.EmpDto;


@Repository
public class EmpDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.ex.";
	
	public List<EmpDto> selectAll() {
		List<EmpDto> list = sqlSession.selectList(nameSpace+"selectAll");
		return list;
	}
}
