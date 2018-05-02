package com.hk.soup.soup.model.dao;

import java.util.List;
import java.util.Map;

import com.hk.soup.search.dto.SoupDetailDto;
import com.hk.soup.soup.dto.MySoupDto;
import com.hk.soup.soup.dto.SoupMaxMemberDto;
import com.hk.soup.soup.dto.SoupMemberDto;
import com.hk.soup.soup.dto.SoupReviewDto;

public interface SoupDao {

	public List<MySoupDto> selectMySoupList(Map<String, Integer> in);
	
	public List<MySoupDto> selectDoneSoupList(Map<String, Integer> in);
	
	public List<SoupMemberDto> selectSoupMemberList(Map<String, Integer> in);
	
	public List<SoupMemberDto> selectSoupApplyList(Map<String, Integer> in);
	
	public int updateSoupStatusToDone(Map<String, Integer> in);
	
	public int updateSoupStatusToDrop(Map<String, Integer> in);
	
	public int updateSoupStatusToEnd(Map<String, Integer> in);

	public int updateProjectMemberDropOut(Map<String, Integer> in);

	public int updateSoupApplyAccept(Map<String, Integer> in);

	public int insertSoupMember(Map<String, Integer> in);

	public int updateSoupApplyReject(Map<String, Integer> in);

	public SoupMaxMemberDto selectTotalSoupMember(Map<String, Integer> in);

	public int updateProjectMemberKick(Map<String, Integer> in);

	public int updateProjectLeaderPass(Map<String, Integer> in);

	public int soupReviewWriteCheck(Map<String, Integer> in);

	public SoupDetailDto selectSoupReviewTarget(Map<String, Integer> in);

	public int insertSoupReview(SoupReviewDto soupReview);

	public List<SoupReviewDto> selectTeacherReviewList(Map<String, Integer> in);
	
}
