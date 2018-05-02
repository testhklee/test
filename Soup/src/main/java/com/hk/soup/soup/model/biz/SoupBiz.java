package com.hk.soup.soup.model.biz;

import java.util.List;

import com.hk.soup.search.dto.SoupDetailDto;
import com.hk.soup.soup.dto.MySoupDto;
import com.hk.soup.soup.dto.SoupMaxMemberDto;
import com.hk.soup.soup.dto.SoupMemberDto;
import com.hk.soup.soup.dto.SoupReviewDto;

public interface SoupBiz {

	public List<MySoupDto> selectMySoupList(int memberNo);
	
	public List<MySoupDto> selectDoneSoupList(int memberNo);
	
	public List<SoupMemberDto> selectSoupMemberList(int soupNo);
	
	public List<SoupMemberDto> selectSoupApplyList(int soupNo);
	
	public int updateSoupStatusToDone(int soupNo);
	
	public int updateSoupStatusToDrop(int soupNo);
	
	public int updateSoupStatusToEnd(int soupNo);

	public int updateProjectMemberDropOut(int soupNo, int memberNo);

	public int updateSoupApplyAccept(int soupNo, int memberNo);

	public int insertSoupMember(int soupNo, int memberNo);

	public int updateSoupApplyReject(int soupNo, int memberNo);

	public SoupMaxMemberDto selectTotalSoupMember(int soupNo);

	public int updateProjectMemberKick(int soupNo, int memberNo);

	public int updateProjectLeaderPass(int soupNo, int memberNo, int myNo);

	public int soupReviewWriteCheck(int memberNo, int soupNo);

	public SoupDetailDto selectSoupReviewTarget(int soupNo);
	
	public int insertSoupReview(SoupReviewDto soupReview);
	
	public List<SoupReviewDto> selectTeacherReviewList(int soupNo);
	
}
