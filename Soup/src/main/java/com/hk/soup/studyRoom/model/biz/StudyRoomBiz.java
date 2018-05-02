package com.hk.soup.studyRoom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.studyRoom.dto.StudyRoomDto;
import com.hk.soup.studyRoom.model.dao.StudyRoomDao;

@Service
public class StudyRoomBiz {

	@Autowired
	private StudyRoomDao dao;
	
	public List<StudyRoomDao> selectList(){
		return dao.selectList();
	}
	
	public List<StudyRoomDao> selectAll(int start, int end){
		return dao.selectAll(start,end);
	}
	
	public List<StudyRoomDao> selectSearch(int start, int end, String searchOption, String keyword){
		return dao.selectSearch(start,end,searchOption,keyword);
	}
	
	public int countArticle(String searchOption, String keyword) {
		return dao.countArticle(searchOption, keyword);
	}
	
	public StudyRoomDto selectOne(int studyRoomNo) {
		return dao.selectOne(studyRoomNo);
	}
	
	public int insert(StudyRoomDto dto) {
		return dao.insert(dto);
	}
	
	public int updateHit(StudyRoomDto dto) {
		return dao.updateHit(dto);
	}
	
	public int delete(int studyRoomNo) {
		return dao.delete(studyRoomNo);
	}
	
}
