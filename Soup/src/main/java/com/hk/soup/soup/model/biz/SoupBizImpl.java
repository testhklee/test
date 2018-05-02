package com.hk.soup.soup.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.soup.search.dto.SoupDetailDto;
import com.hk.soup.soup.dto.MySoupDto;
import com.hk.soup.soup.dto.SoupMaxMemberDto;
import com.hk.soup.soup.dto.SoupMemberDto;
import com.hk.soup.soup.dto.SoupReviewDto;
import com.hk.soup.soup.model.dao.SoupDao;

@Service
public class SoupBizImpl implements SoupBiz {

	@Autowired
	private SoupDao dao;
	
	@Override
	@Transactional
	public List<MySoupDto> selectMySoupList(int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("memberNo", memberNo);
		List<MySoupDto> mySoupList = dao.selectMySoupList(in);
		
		for (MySoupDto mySoup : mySoupList) {
			mySoup.setMemberList(selectSoupMemberList(mySoup.getSoupNo()));
		}
		
		return mySoupList;
	}

	@Override
	@Transactional
	public List<MySoupDto> selectDoneSoupList(int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("memberNo", memberNo);
		List<MySoupDto> doneSoupList = dao.selectDoneSoupList(in); 
		
		for (MySoupDto doneSoup : doneSoupList) {
			doneSoup.setMemberList(selectSoupMemberList(doneSoup.getSoupNo()));
		}
		
		return doneSoupList;
	}

	@Override
	@Transactional
	public List<SoupMemberDto> selectSoupMemberList(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		return dao.selectSoupMemberList(in);
	}

	@Override
	@Transactional
	public List<SoupMemberDto> selectSoupApplyList(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		return dao.selectSoupApplyList(in);
	}

	@Override
	@Transactional
	public int updateSoupStatusToDone(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		
		return dao.updateSoupStatusToDone(in);
	}

	@Override
	@Transactional
	public int updateSoupStatusToDrop(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		
		return dao.updateSoupStatusToDrop(in);
	}

	@Override
	@Transactional
	public int updateSoupStatusToEnd(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		
		return dao.updateSoupStatusToEnd(in);
	}

	@Override
	@Transactional
	public int updateProjectMemberDropOut(int soupNo, int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		in.put("memberNo", memberNo);
		
		return dao.updateProjectMemberDropOut(in);
	}
	
	@Override
	@Transactional
	public int updateSoupApplyAccept(int soupNo, int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		in.put("memberNo", memberNo);
		
		return dao.updateSoupApplyAccept(in);
	}
	
	@Override
	@Transactional
	public int insertSoupMember(int soupNo, int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		in.put("memberNo", memberNo);
		
		return dao.insertSoupMember(in);
	}

	@Override
	@Transactional
	public int updateSoupApplyReject(int soupNo, int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		in.put("memberNo", memberNo);
		
		return dao.updateSoupApplyReject(in);
	}

	@Override
	@Transactional
	public SoupMaxMemberDto selectTotalSoupMember(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		
		return dao.selectTotalSoupMember(in);
	}

	@Override
	@Transactional
	public int updateProjectMemberKick(int soupNo, int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		in.put("memberNo", memberNo);
		
		return dao.updateProjectMemberKick(in);
	}

	@Override
	@Transactional
	public int updateProjectLeaderPass(int soupNo, int memberNo, int myNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		in.put("memberNo", memberNo);
		in.put("myNo", myNo);
		
		return dao.updateProjectLeaderPass(in);
	}

	@Override
	@Transactional
	public int soupReviewWriteCheck(int memberNo, int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("memberNo", memberNo);
		in.put("soupNo", soupNo);
		
		return dao.soupReviewWriteCheck(in);
	}

	@Override
	@Transactional
	public SoupDetailDto selectSoupReviewTarget(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		
		return dao.selectSoupReviewTarget(in);
	}

	@Override
	@Transactional
	public int insertSoupReview(SoupReviewDto soupReview) {
		return dao.insertSoupReview(soupReview);
	}

	@Override
	@Transactional
	public List<SoupReviewDto> selectTeacherReviewList(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		
		return dao.selectTeacherReviewList(in);
	}

}
