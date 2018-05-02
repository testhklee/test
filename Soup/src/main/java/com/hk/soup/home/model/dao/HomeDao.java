package com.hk.soup.home.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.hk.soup.home.dto.MemberDto;

@Repository
public class HomeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.home.";
	private String nameSpaceMain = "com.soup.";

	// List
	public List<HomeDao> selectAll() {
		List<HomeDao> list = sqlSession.selectList(nameSpace + "selectAll");
		return list;
	}

	// selectOne
	public MemberDto selectOne(Map<String, String> map) {
		MemberDto res = sqlSession.selectOne(nameSpace + "selectOne", map);
		return res;
	}

	// insert
	public int insert(MemberDto dto) {
		int res = sqlSession.insert(nameSpace + "insert", dto);
		return res;
	}

	// idcheck
	public int checkId(String memberEmail) {
		int res = sqlSession.selectOne(nameSpace + "checkId", memberEmail);
		return res;
	}

	// Telcheck
	public int checkTel(String memberTel) {
		int res = sqlSession.selectOne(nameSpace + "checkTel", memberTel);
		return res;
	}
	
	//idSearch
	public String idSearch(Map<String, String> map) {
		String res = sqlSession.selectOne(nameSpace + "idSearch", map);
		return res;
	}
	
	//pwSearch
	public int pwSearch(Map<String, String> map) {
		int res = sqlSession.update(nameSpace + "pwSearch", map);
		return res;
	}
	
	//pwselecOne
	public String PwselectOne(String memberEmail) {
		String res = sqlSession.selectOne(nameSpace +"PwselectOne", memberEmail);
		return res;
	}
	
	
	// MainStudy[1]유료
	public List<HomeDao> mainPsView1() {
		List<HomeDao> list = sqlSession.selectList(nameSpaceMain + "mainPsView1");
		return list;
	}

	// MainStudy[2]유료
	public List<HomeDao> mainPsView2() {
		List<HomeDao> list = sqlSession.selectList(nameSpaceMain + "mainPsView2");
		return list;
	}

	// MainStudy[3]유료
	public List<HomeDao> mainPsView3() {
		List<HomeDao> list = sqlSession.selectList(nameSpaceMain + "mainPsView3");
		return list;
	}

	// MainStudy[1]무료
	public List<HomeDao> mainFsView1() {
		List<HomeDao> list = sqlSession.selectList(nameSpaceMain + "mainFsView1");
		return list;
	}

	// MainStudy[2]무료
	public List<HomeDao> mainFsView2() {
		List<HomeDao> list = sqlSession.selectList(nameSpaceMain + "mainFsView2");
		return list;
	}

	// MainStudy[3]무료
	public List<HomeDao> mainFsView3() {
		List<HomeDao> list = sqlSession.selectList(nameSpaceMain + "mainFsView3");
		return list;
	}

	// MainProject[8]
	public List<HomeDao> mainProjectView() {
		List<HomeDao> list = sqlSession.selectList(nameSpaceMain + "mainProjectView");
		return list;
	}
	
	// MainSearch
	public List<HomeDao> mainselectSearch(Map<String, String> map) {
		List<HomeDao> res = sqlSession.selectList(nameSpaceMain + "mainselectSearch", map);
		return res;
		
	}
	
	//세션 생성시 방문자수 1증가
	public int insertVisit() {
		return sqlSession.insert(nameSpace + "insertVisit");
	}
	
}
