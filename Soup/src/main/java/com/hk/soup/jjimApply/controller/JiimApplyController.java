package com.hk.soup.jjimApply.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.jjimApply.model.biz.JjimApplyBiz;

@Controller
public class JiimApplyController {
	
	@Autowired
	private JjimApplyBiz biz;
	
	// 유저목록
	@RequestMapping(value = "/jjimApply.do")
	public String userlist(Model model, HttpSession session) {
		MemberDto login = (MemberDto) session.getAttribute("login");
		
		if (login == null) {
			return "redirect:home.do";
		}
		
		int memberNo = login.getMemberNo();
		
		model.addAttribute("applyList", biz.selectApplyList(memberNo));
		model.addAttribute("jjimList", biz.selectJjimList(memberNo));
		return "user/jjimApply/jjimApply.tiles";
	}
}
