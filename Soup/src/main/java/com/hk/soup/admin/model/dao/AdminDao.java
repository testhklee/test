package com.hk.soup.admin.model.dao;

import java.util.List;

import com.hk.soup.home.dto.MemberDto;

public interface AdminDao {

	public int selectTodayVisitor();

	public List<MemberDto> selectAdminMemberList();

}
