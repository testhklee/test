package com.hk.soup.user.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.hk.soup.home.dto.MemberDto;

@Repository
public class UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.home.";

	// update
	public int update(MemberDto dto) {
		int res = sqlSession.update(nameSpace + "update", dto);
		return res;
	}
	//userOut
	public int userOut(String memberEmail) {
		int res = sqlSession.update(nameSpace + "userOut", memberEmail);
		return res;
	}
	
}