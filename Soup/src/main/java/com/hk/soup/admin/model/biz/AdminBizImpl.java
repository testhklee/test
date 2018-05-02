package com.hk.soup.admin.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.soup.admin.model.dao.AdminDao;
import com.hk.soup.home.dto.MemberDto;

@Service
public class AdminBizImpl implements AdminBiz {

	@Autowired
	private AdminDao dao;

	@Override
	@Transactional
	public int selectTodayVisitor() {
		return dao.selectTodayVisitor();
	}

	@Override
	@Transactional
	public List<MemberDto> selectAdminMemberList() {
		return dao.selectAdminMemberList();
	}
}
