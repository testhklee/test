package com.hk.soup.admin.model.biz;

import java.util.List;

import com.hk.soup.home.dto.MemberDto;

public interface AdminBiz {

	public int selectTodayVisitor();

	public List<MemberDto> selectAdminMemberList();
	
}
