package com.hk.soup.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.home.dto.MemberDto;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.admin.";
	
	@Override
	public int selectTodayVisitor() {
		return sqlSession.selectOne(nameSpace + "selectTodayVisitor");
	}

	@Override
	public List<MemberDto> selectAdminMemberList() {
		return sqlSession.selectOne(nameSpace + "selectAdminMemberList");
	}
}
