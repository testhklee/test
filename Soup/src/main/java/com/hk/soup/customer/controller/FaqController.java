package com.hk.soup.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.soup.customer.model.biz.FaqBiz;

@Controller
public class FaqController {

	@Autowired
	private FaqBiz biz;
	
	@RequestMapping(value="/faqList.do")
	public String faqList(Model model) {
		model.addAttribute("faqList",biz.selectAll());
		int a = biz.selectAll().size();
		
		System.out.println(a);
		
		return "customerService/faq/faq.tiles";
	}
}
