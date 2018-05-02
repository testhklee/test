package com.hk.soup.studyRoom.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.studyRoom.dto.StudyRoomDto;

@Repository
public class StudyRoomDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.studyRoom.";
	
	public List<StudyRoomDao> selectList(){
		List<StudyRoomDao> list = sqlSession.selectList(nameSpace+"selectList");
		return list;
	}
	
	public List<StudyRoomDao> selectAll(int start, int end){
	    Map<String, Object> map = new HashMap<String, Object>();
	    
	    map.put("start", start);
	    map.put("end", end);
		List<StudyRoomDao> list = sqlSession.selectList(nameSpace+"selectAll",map);
		return list;
	}
	
	public List<StudyRoomDao> selectSearch(int start, int end, String searchOption, String keyword){
		// 검색옵션, 키워드 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    // BETWEEN #{start}, #{end}에 입력될 값을 맵에 
	    map.put("start", start);
	    map.put("end", end);
		
		
		List<StudyRoomDao> list = sqlSession.selectList(nameSpace+"selectSearch",map);
		return list;
	}
	
	public int countArticle(String searchOption, String keyword) {
		Map<String,String> map = new  HashMap<String,String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		int res = sqlSession.selectOne(nameSpace+"countArticle",map);
		
		return res;
	}
	
	
	public int insert(StudyRoomDto dto) {
		
		int res = sqlSession.insert(nameSpace+"insert",dto);
		
		return res;
		
	}
	
	public int delete(int studyRoomNo) {
		int res = sqlSession.delete(nameSpace+"delete",studyRoomNo);
		
		return res;
		
	}
	
	public int updateHit(StudyRoomDto dto) {
		int res = sqlSession.update(nameSpace+"updateHit",dto);
		return res;
	}
	
	public StudyRoomDto selectOne(int studyRoomNo) {
		StudyRoomDto  dto = sqlSession.selectOne(nameSpace+"selectOne", studyRoomNo);
		return dto;
	}
	
	
}
