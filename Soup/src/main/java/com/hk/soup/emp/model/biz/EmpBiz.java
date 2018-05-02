package com.hk.soup.emp.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.soup.emp.dto.EmpDto;
import com.hk.soup.emp.model.dao.EmpDao;

@Service
public class EmpBiz {

	@Autowired
	private EmpDao dao;
	
	@Transactional
	public List<EmpDto> selectAll(){
		return dao.selectAll();
	}
	
}
