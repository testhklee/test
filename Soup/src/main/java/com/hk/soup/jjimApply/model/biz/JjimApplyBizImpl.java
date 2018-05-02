package com.hk.soup.jjimApply.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.jjimApply.model.dao.JjimApplyDao;
import com.hk.soup.search.dto.SoupSearchDto;

@Service
public class JjimApplyBizImpl implements JjimApplyBiz {

	@Autowired
	private JjimApplyDao dao;
	
	@Override
	public List<SoupSearchDto> selectApplyList(int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("memberNo", memberNo);
		
		return dao.selectApplyList(in);
	}

	@Override
	public List<SoupSearchDto> selectJjimList(int memberNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("memberNo", memberNo);
		
		return dao.selectJjimList(in);
	}

}
