package com.hk.soup.jjimApply.model.dao;

import java.util.List;
import java.util.Map;

import com.hk.soup.search.dto.SoupSearchDto;

public interface JjimApplyDao {

	List<SoupSearchDto> selectApplyList(Map<String, Integer> in);

	List<SoupSearchDto> selectJjimList(Map<String, Integer> in);

}
