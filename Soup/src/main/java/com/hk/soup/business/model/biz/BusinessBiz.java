package com.hk.soup.business.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.soup.business.dto.BusinessDto;
import com.hk.soup.business.model.dao.BusinessDao;

@Service
public class BusinessBiz {

	@Autowired
	private BusinessDao dao;
	
	@Transactional
	public List<BusinessDao> selectAll(){
		return dao.selectAll();
	}
	
	@Transactional
	public BusinessDto selectOne(int memberNo) {
		return dao.selectOne(memberNo);
	}

	@Transactional
	public int update(Map<String, Object> map) {
		return dao.update(map);
	}

	@Transactional
	public int passGrade(Map<String, Object> map) {
		return dao.passGrade(map);
	}

	@Transactional
	public int userGrade(Map<String, Object> map) {
		return dao.userGrade(map);
	}

	@Transactional
	public int updateBusiness(int memberNo, String businessStatus) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberNo", String.valueOf(memberNo));
		map.put("businessStatus", businessStatus);
		
		if (businessStatus.equals("PASS")) {
			map.put("memberGrade", "BUSINESS");
		} else {
			map.put("memberGrade", "USER");
		}
		
		return dao.updateBusiness(map);
	}

	@Transactional
	public int selectCheckBusiness(int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("memberNo", memberNo);
		
		return dao.selectCheckBusiness(in);
	}

	@Transactional
	public int insertBusinessApply(int memberNo, String businessDoc) {
		Map<String, String> in = new HashMap<String, String>();
		in.put("memberNo", String.valueOf(memberNo));
		in.put("businessDoc", businessDoc);
		
		return dao.insertBusinessApply(in);
	}

	@Transactional
	public int selectCheckTeacher(int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("memberNo", memberNo);
		
		return dao.selectCheckTeacher(in);
	}

	public int insertTeacherApply(int memberNo, String teacherDd, String teacherCertificate, String fileUrl) {
		Map<String, String> in = new HashMap<String, String>();
		in.put("memberNo", String.valueOf(memberNo));
		in.put("teacherDd", teacherDd);
		in.put("teacherCertificate", teacherCertificate);
		in.put("fileUrl", fileUrl);
		
		return dao.insertTeacherApply(in);
	}
}
