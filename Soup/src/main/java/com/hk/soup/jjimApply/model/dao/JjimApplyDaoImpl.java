package com.hk.soup.jjimApply.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.search.dto.SoupSearchDto;

@Repository
public class JjimApplyDaoImpl implements JjimApplyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.jjimApply.";
	
	@Override
	public List<SoupSearchDto> selectApplyList(Map<String, Integer> in) {
		return sqlSession.selectList(nameSpace + "selectApplyList", in);
	}

	@Override
	public List<SoupSearchDto> selectJjimList(Map<String, Integer> in) {
		return sqlSession.selectList(nameSpace + "selectJjimList", in);
	}

}
