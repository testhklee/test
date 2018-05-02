package com.hk.soup.customer.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.customer.dto.FaqDto;

@Repository
public class FaqDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.faq.";
	
	public List<FaqDao> selectAll(){
		List<FaqDao> list = sqlSession.selectList(nameSpace+"selectAll");
		return list;
	}
	
	public int insert(FaqDto dto) {
		int res = sqlSession.insert(nameSpace+"insert"+dto);
		return res;
	}
	
	public int update(FaqDto dto) {
		int res = sqlSession.update(nameSpace+"update"+dto);
		return res;
	}
	
	public int delete(int faqNo) {
		int res = sqlSession.delete(nameSpace+"delete"+faqNo);
		return res;
	}
	
}
