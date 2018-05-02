package com.hk.soup.customer.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.customer.dto.NoticeDto;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.notice.";

	public List<NoticeDao> selectAll(){
		List<NoticeDao> list = sqlSession.selectList(nameSpace+"selectAll");
		return list;
	}
	
	public List<NoticeDao> selectList(int start , int end){
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("start", start);
		map.put("end", end);
		List<NoticeDao> list = sqlSession.selectList(nameSpace+"selectList", map);
		return list;
	}
	
	public NoticeDto selectOne(int noticeNo) {
		NoticeDto dto =sqlSession.selectOne(nameSpace+"selectOne",noticeNo);
		return dto;
	}
	
	public int insert(NoticeDto dto) {
		int res = sqlSession.insert(nameSpace+"insert", dto);
		return res;
	}
	
	public int updateHit(NoticeDto dto) {
		int res = sqlSession.update(nameSpace+"updateHit", dto);
		return res;
	}
	
	public int update(NoticeDto dto) {
		int res = sqlSession.update(nameSpace+"update", dto);
		return res;
	}
	
	public int delete(int noticeNo) {
		int res = sqlSession.delete(nameSpace+"delete", noticeNo);
		return res;
	}
	
}
