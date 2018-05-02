package com.hk.soup.customer.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.customer.dto.NoticeDto;
import com.hk.soup.customer.model.dao.NoticeDao;

@Service
public class NoticeBiz {

	@Autowired
	private NoticeDao dao;
	
	public List<NoticeDao> selectAll(){
		return dao.selectAll();
	}
	public List<NoticeDao> selectList(int start, int end){
		return dao.selectList(start, end);
	}
	public NoticeDto selectOne(int noticeNo) {
		return dao.selectOne(noticeNo);
	}
	public int insert(NoticeDto dto) {
		return dao.insert(dto);
	}
	public int update(NoticeDto dto) {
		return dao.update(dto);
	}
	public int updateHit(NoticeDto dto) {
		return dao.updateHit(dto);
	}
	public int delete(int noticeNo) {
		return dao.delete(noticeNo);
	}
	
}
