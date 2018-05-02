package com.hk.soup.search.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.soup.search.dto.SoupApplyDto;
import com.hk.soup.search.dto.SoupCreateDto;
import com.hk.soup.search.dto.SoupDetailDto;
import com.hk.soup.search.dto.SoupDto;
import com.hk.soup.search.dto.SoupFilterDto;
import com.hk.soup.search.dto.SoupJJimDto;
import com.hk.soup.search.dto.SoupSearchDto;
import com.hk.soup.search.model.dao.SoupDao;
import com.hk.soup.soup.dto.SoupMemberDto;
import com.hk.soup.soup.dto.SoupReviewDto;

@Service
public class SoupBiz {

	@Autowired
	private SoupDao dao;
	
	@Transactional
	public List<SoupSearchDto> selectP(){
		
		List<SoupSearchDto> list = dao.selectP();
		
		for (SoupSearchDto searchDto :  list) {
			searchDto.setCurrentMember(dao.selectCurrentMember(searchDto.getSoupNo()));
		}
		
		return list;
	}
	
	@Transactional
	public List<SoupSearchDto> selectFs(){

		List<SoupSearchDto> list = dao.selectFs();
		
		for (SoupSearchDto searchDto :  list) {
			searchDto.setCurrentMember(dao.selectCurrentMember(searchDto.getSoupNo()));
		}
		
		return list;
	}
	
	@Transactional
	public List<SoupSearchDto> selectPs(){
		
		List<SoupSearchDto> list = dao.selectPs();
		
		for (SoupSearchDto searchDto :  list) {
			searchDto.setCurrentMember(dao.selectCurrentMember(searchDto.getSoupNo()));
		}
		
		return list;
	}
	
	@Transactional
	public List<SoupSearchDto> selectGubun(String soupGubun){
		
		List<SoupSearchDto> list = dao.selectGubun(soupGubun);
		
		for (SoupSearchDto searchDto :  list) {
			searchDto.setCurrentMember(dao.selectCurrentMember(searchDto.getSoupNo()));
		}
		
		return list;
	}
	
	@SuppressWarnings("null")
	@Transactional
	public List<SoupSearchDto> selectSearch(SoupFilterDto soupFilterDto){
		
		if(soupFilterDto.getSoupField1().equals("전체")||soupFilterDto.getSoupField1().equals("")) {
			soupFilterDto.setSoupField1("");
			soupFilterDto.setSoupField2("");
		}
		
		if(soupFilterDto.getSoupField2().equals("전체")||soupFilterDto.getSoupField2().equals("")) {
			soupFilterDto.setSoupField2("");
		}
		
		if(soupFilterDto.getSoupAddr1().equals("시/도")||soupFilterDto.getSoupAddr1().equals("시/도")) {
			soupFilterDto.setSoupAddr1("");
			soupFilterDto.setSoupAddr2("");
		}
		
		if(soupFilterDto.getSoupAddr2().equals("시/군/구")||soupFilterDto.getSoupAddr2().equals("시/군/구")) {
			soupFilterDto.setSoupAddr2("");
		}
		
		if(soupFilterDto.getSoupDay().equals("")||soupFilterDto.getSoupDay().equals("월 화 수 목 금 토 일 ")){
			soupFilterDto.setSoupDay("");
		}
		
		
		List<SoupSearchDto> list = dao.selectSearch(soupFilterDto);
		
		if(list.size()>0) {
		for (SoupSearchDto searchDto :  list) {
			searchDto.setCurrentMember(dao.selectCurrentMember(searchDto.getSoupNo()));
		}
		}else {
			SoupSearchDto dto = new SoupSearchDto();
			dto.setSoupGubun(soupFilterDto.getSoupGubun());
			list.add(dto);
		}
		
		
		return list;
	}
	
	@Transactional
	public int createFs(SoupCreateDto soupCreateDto){
		return dao.createFs(soupCreateDto);
	}
	
	@Transactional
	public int createPs(SoupCreateDto soupCreateDto){
		return dao.createPs(soupCreateDto);
	}
	
	@Transactional
	public int createP(SoupCreateDto soupCreateDto){
		return dao.createP(soupCreateDto);
	}
	
	@Transactional
	public SoupDetailDto soupDetail(int soupNo){
		return dao.soupDetail(soupNo);
	}
	
	
	@Transactional
	public int soupMemberInsert(SoupDetailDto soupDetailDto){
		return dao.soupMemberInsert(soupDetailDto);
	}
	
	@Transactional
	public int payInsert(SoupDetailDto soupDetailDto){
		return dao.payInsert(soupDetailDto);
	}
	
	@Transactional
	public int soupJJimInsert(SoupJJimDto soupJJimDto){
		return dao.soupJJimInsert(soupJJimDto);
	}
	
	@Transactional
	public int soupJJimCancle(SoupJJimDto soupJJimDto){
		return dao.soupJJimCancle(soupJJimDto);
	}
	
	@Transactional
	public SoupJJimDto soupJJimUmoo(SoupJJimDto soupJJimDto){
		return dao.soupJJimUmoo(soupJJimDto);
	}
	
	@Transactional
	public int soupApplyInsert(SoupApplyDto soupApplyDto){
		return dao.soupApplyInsert(soupApplyDto);
	}
	
	@Transactional
	public int soupApplyCancle(SoupApplyDto soupApplyDto){
		return dao.soupApplyCancle(soupApplyDto);
	}
	
	@Transactional
	public SoupApplyDto soupApplyUmoo(SoupApplyDto soupApplyDto){
		return dao.soupApplyUmoo(soupApplyDto);
	}
	
	@Transactional
	public SoupMemberDto soupMemberUmoo(SoupMemberDto soupMemberDto){
		return dao.soupMemberUmoo(soupMemberDto);
	}
	
	@Transactional
	public int soupUpdate(SoupDto soupDto){
		return dao.soupUpdate(soupDto);
	}
	
	@Transactional
	public List<SoupReviewDto> soupReviewList(int soupNo){
		return dao.soupReviewList(soupNo);
	}
	
}
