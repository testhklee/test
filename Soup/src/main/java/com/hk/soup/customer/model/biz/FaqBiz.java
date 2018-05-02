package com.hk.soup.customer.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.soup.customer.dto.FaqDto;
import com.hk.soup.customer.model.dao.FaqDao;

@Service
public class FaqBiz {

	@Autowired
	private FaqDao dao;
	
	public List<FaqDao> selectAll(){
		return dao.selectAll();
	}
	
	public int insert(FaqDto dto) {
		return dao.insert(dto);
	}
	public int update(FaqDto dto) {
		return dao.update(dto);
	}
	public int delete(int faqNo) {
		return dao.delete(faqNo);
	}
}
