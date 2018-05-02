package com.hk.soup.search.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.search.dto.SoupApplyDto;
import com.hk.soup.search.dto.SoupCreateDto;
import com.hk.soup.search.dto.SoupDetailDto;
import com.hk.soup.search.dto.SoupDto;
import com.hk.soup.search.dto.SoupFilterDto;
import com.hk.soup.search.dto.SoupJJimDto;
import com.hk.soup.search.dto.SoupSearchDto;
import com.hk.soup.soup.dto.SoupMemberDto;
import com.hk.soup.soup.dto.SoupReviewDto;

@Repository
public class SoupDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.soup.";
	
	public List<SoupSearchDto> selectP(){
		List<SoupSearchDto> list = sqlSession.selectList(nameSpace+"selectP");
		return list;
	}
	
	public List<SoupSearchDto> selectFs(){
		List<SoupSearchDto> list = sqlSession.selectList(nameSpace+"selectFs");
		return list;
	}
	
	public List<SoupSearchDto> selectPs(){
		List<SoupSearchDto> list = sqlSession.selectList(nameSpace+"selectPs");
		return list;
	}
	
	public List<SoupSearchDto> selectGubun(String soupGubun){
		List<SoupSearchDto> list = sqlSession.selectList(nameSpace+"selectGubun",soupGubun);
		return list;
	}
	
	public List<SoupSearchDto> selectSearch(SoupFilterDto soupFilterDto){
		List<SoupSearchDto> list = sqlSession.selectList(nameSpace+"selectSoupSearch",soupFilterDto);
		return list;
	}
	
	public int selectCurrentMember(int soupNo){
		int res = sqlSession.selectOne(nameSpace+"selectCurrentMember",soupNo);
		return res;
	}
	
	public int createFs(SoupCreateDto soupCreateDto){
		int res = sqlSession.insert(nameSpace+"createFs",soupCreateDto);
		return res;
	}
	
	public int createPs(SoupCreateDto soupCreateDto){
		int res = sqlSession.insert(nameSpace+"createPs",soupCreateDto);
		return res;
	}

	public int createP(SoupCreateDto soupCreateDto){
		int res = sqlSession.insert(nameSpace+"createP",soupCreateDto);
		return res;
	}
	
	public SoupDetailDto soupDetail(int soupNo){
		SoupDetailDto soupDto = sqlSession.selectOne(nameSpace+"selectOne",soupNo);
		return soupDto;
	}
	
	public int soupMemberInsert(SoupDetailDto soupDetailDto){
		int res = sqlSession.insert(nameSpace+"soupMemberInsert",soupDetailDto);
		return res;
	}
	
	public int payInsert(SoupDetailDto soupDetailDto){
		int res = sqlSession.insert(nameSpace+"payInsert",soupDetailDto);
		return res;
	}
	
	public int soupJJimInsert(SoupJJimDto soupJJimDto){
		int res = sqlSession.insert(nameSpace+"soupJJimInsert",soupJJimDto);
		return res;
	}
	
	public int soupJJimCancle(SoupJJimDto soupJJimDto){
		int res = sqlSession.delete(nameSpace+"soupJJimCancle",soupJJimDto);
		return res;
	}
	
	public SoupJJimDto soupJJimUmoo(SoupJJimDto soupJJimDto) {
		SoupJJimDto res = sqlSession.selectOne(nameSpace+"soupJJimUmoo",soupJJimDto);
		return res;
	}
	
	public int soupApplyInsert(SoupApplyDto soupApplyDto){
		int res = sqlSession.insert(nameSpace+"soupApplyInsert",soupApplyDto);
		return res;
	}
	
	public int soupApplyCancle(SoupApplyDto soupApplyDto){
		int res = sqlSession.delete(nameSpace+"soupApplyCancle",soupApplyDto);
		return res;
	}
	
	public SoupApplyDto soupApplyUmoo(SoupApplyDto soupApplyDto) {
		SoupApplyDto res = sqlSession.selectOne(nameSpace+"soupApplyUmoo",soupApplyDto);
		return res;
	}
	
	public SoupMemberDto soupMemberUmoo(SoupMemberDto soupMemberDto){
		SoupMemberDto res = sqlSession.selectOne(nameSpace+"soupMemberUmoo",soupMemberDto);		
		return res;
	}
	
	public int soupUpdate(SoupDto soupDto){
		int res = sqlSession.update(nameSpace+"soupUpdate",soupDto);	
		return res;
	}
	
	public List<SoupReviewDto> soupReviewList(int soupNo){
		List<SoupReviewDto> list = sqlSession.selectList(nameSpace+"soupReviewList",soupNo);	
		return list;
	}
}
