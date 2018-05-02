package com.hk.soup.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.soup.emp.model.biz.EmpBiz;

@Controller
public class EmpController {

	@Autowired
	private EmpBiz biz;
	
	@RequestMapping(value="/empList.do")
	public String empList(Model model) {
		model.addAttribute("empList", biz.selectAll());
		return "emp/empList";
	}
	
}
