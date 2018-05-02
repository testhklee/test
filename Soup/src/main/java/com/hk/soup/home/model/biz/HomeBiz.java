package com.hk.soup.home.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.home.model.dao.HomeDao;
import com.hk.soup.search.dto.SoupFilterDto;
import com.hk.soup.search.model.dao.SoupDao;

@Service
public class HomeBiz {

	@Autowired
	private HomeDao dao;

	
	//회원목록
	@Transactional
	public List<HomeDao> selectAll() {
		return dao.selectAll();
	}

	//회원가입
	@Transactional
	public int insert(MemberDto dto) {
		return dao.insert(dto);
	}

	//로그인
	@Transactional
	public MemberDto selectOne(Map<String, String> map) {
		return dao.selectOne(map);
	}

	//아이디 유효성 검사
	@Transactional
	public int checkId(String memberEmail) {
		return dao.checkId(memberEmail);
	}

	//전화번호 유효성 검사
	@Transactional
	public int checkTel(String memberTel) {
		return dao.checkTel(memberTel);
	}
	//id값 찾기
	@Transactional
	public String idSearch(Map<String, String> map) {
		return dao.idSearch(map);
	}
	
	//pw값 찾기
	@Transactional
	public int pwSearch(Map<String, String> map) {
		return dao.pwSearch(map);
	}
	
	//pw값 찾기
	@Transactional
	public String PwselectOne(String memberEmail) {
		return dao.PwselectOne(memberEmail);
	}
	
	
	// 유료스터디 1순위
	@Transactional
	public List<HomeDao> mainPsView1() {
		return dao.mainPsView1();
	}

	// 유료스터디 2순위
	@Transactional
	public List<HomeDao> mainPsView2() {
		return dao.mainPsView2();
	}

	// 유료스터디 3순위
	@Transactional
	public List<HomeDao> mainPsView3() {
		return dao.mainPsView3();
	}

	// 무료스터디 1순위
	@Transactional
	public List<HomeDao> mainFsView1() {
		return dao.mainFsView1();
	}

	// 무료스터디 2순위
	@Transactional
	public List<HomeDao> mainFsView2() {
		return dao.mainFsView2();
	}

	// 무료스터디 3순위
	@Transactional
	public List<HomeDao> mainFsView3() {
		return dao.mainFsView3();
	}
	// 프로젝트 8개
	@Transactional
	public List<HomeDao> mainProjectView() {
		return dao.mainProjectView();
	}
	
	@Transactional
	public List<HomeDao> mainselectSearch(Map<String, String>map){
		
		return dao.mainselectSearch(map);
	}
	
	//세션 생성시 방문자수 1증가
	@Transactional
	public int insertVisit() {
		return dao.insertVisit();
	}

}
