package com.hk.soup.soup.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.search.dto.SoupDetailDto;
import com.hk.soup.soup.dto.MySoupDto;
import com.hk.soup.soup.dto.SoupMaxMemberDto;
import com.hk.soup.soup.dto.SoupMemberDto;
import com.hk.soup.soup.dto.SoupReviewDto;

@Repository
public class SoupDaoImpl implements SoupDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.soup.";
	
	@Override
	public List<MySoupDto> selectMySoupList(Map<String, Integer> in) {
		return sqlSession.selectList(nameSpace + "selectMySoupList", in);
	}
	
	@Override
	public List<MySoupDto> selectDoneSoupList(Map<String, Integer> in) {
		return sqlSession.selectList(nameSpace + "selectDoneSoupList", in);
	}
	
	@Override
	public List<SoupMemberDto> selectSoupMemberList(Map<String, Integer> in) {
		return sqlSession.selectList(nameSpace + "selectSoupMemberList", in);
	}

	@Override
	public List<SoupMemberDto> selectSoupApplyList(Map<String, Integer> in) {
		return sqlSession.selectList(nameSpace + "selectSoupApplyMemberList", in);
	}

	@Override
	public int updateSoupStatusToDone(Map<String, Integer> in) {
		return sqlSession.update(nameSpace + "updateSoupStatusToDone", in);
	}

	@Override
	public int updateSoupStatusToDrop(Map<String, Integer> in) {
		return sqlSession.update(nameSpace + "updateSoupStatusToDrop", in);
	}

	@Override
	public int updateSoupStatusToEnd(Map<String, Integer> in) {
		return sqlSession.update(nameSpace + "updateSoupStatusToEnd", in);
	}

	@Override
	public int updateProjectMemberDropOut(Map<String, Integer> in) {
		return sqlSession.update(nameSpace + "updateProjectMemberDropOut", in);
	}
	
	@Override
	public int updateSoupApplyAccept(Map<String, Integer> in) {
		return sqlSession.update(nameSpace + "updateSoupApplyAccept", in);
	}
	
	@Override
	public int insertSoupMember(Map<String, Integer> in) {
		return sqlSession.insert(nameSpace + "insertSoupMember", in);
	}

	@Override
	public int updateSoupApplyReject(Map<String, Integer> in) {
		return sqlSession.update(nameSpace + "updateSoupApplyReject", in);
	}

	@Override
	public SoupMaxMemberDto selectTotalSoupMember(Map<String, Integer> in) {
		return sqlSession.selectOne(nameSpace + "selectTotalSoupMember", in);
	}

	@Override
	public int updateProjectMemberKick(Map<String, Integer> in) {
		return sqlSession.update(nameSpace + "updateProjectMemberKick", in);
	}

	@Override
	public int updateProjectLeaderPass(Map<String, Integer> in) {
		sqlSession.update(nameSpace + "updateLeaderToMember", in);
		return sqlSession.update(nameSpace + "updateMemberToLeader", in);
	}

	@Override
	public int soupReviewWriteCheck(Map<String, Integer> in) {
		return sqlSession.selectOne(nameSpace + "soupReviewWriteCheck", in);
	}

	@Override
	public SoupDetailDto selectSoupReviewTarget(Map<String, Integer> in) {
		return sqlSession.selectOne(nameSpace + "selectSoupReviewTarget", in);
	}

	@Override
	public int insertSoupReview(SoupReviewDto soupReview) {
		return sqlSession.insert(nameSpace + "insertSoupReview", soupReview);
	}

	@Override
	public List<SoupReviewDto> selectTeacherReviewList(Map<String, Integer> in) {
		return sqlSession.selectList(nameSpace + "selectTeacherReviewList", in);
	}

}
