package com.hk.soup.jjimApply.model.biz;

import java.util.List;

import com.hk.soup.search.dto.SoupSearchDto;

public interface JjimApplyBiz {

	public List<SoupSearchDto> selectApplyList(int memberNo);
	
	public List<SoupSearchDto> selectJjimList(int memberNo);
}
