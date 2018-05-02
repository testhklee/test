package com.hk.soup.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hk.soup.admin.model.biz.AdminBiz;
import com.hk.soup.business.model.biz.BusinessBiz;
import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.teacher.model.biz.TeacherBiz;

@Controller
public class AdminController {
	
	@Autowired
	private AdminBiz adminBiz;
	@Autowired
	private BusinessBiz businessBiz;
	@Autowired
	private TeacherBiz teacherBiz;
	@Autowired
	private Gson gson;
	
	/**
	 * admin 메인 페이지
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "adminMain.do")
	public String admin(HttpSession session, Model model) {
		MemberDto admin = (MemberDto) session.getAttribute("login");
		
		if (admin.getMemberGrade().equals("ADMIN")) {
			model.addAttribute("todayVisitor", adminBiz.selectTodayVisitor());
			
			return "admin/main.adminTiles";
		} else {
			return "redirect:home.do";
		}
		
	}
	
	@RequestMapping(value = "adminMember.do")
	public String member() {
		return "admin/member.adminTiles";
	}
	
	@RequestMapping(value = "selectAdminMemberList.do")
	@ResponseBody
	public String selectAdminMemberList() {
		return gson.toJson(adminBiz.selectAdminMemberList());
	}
	
	@RequestMapping(value = "adminSales.do")
	public String sales() {
		return "admin/sales.adminTiles";
	}
	
	@RequestMapping(value = "adminPay.do")
	public String pay() {
		return "admin/pay.adminTiles";
	}
	
	@RequestMapping(value = "adminRefund.do")
	public String refund() {
		return "admin/refund.adminTiles";
	}
	
	@RequestMapping(value = "adminApplyTeacher.do")
	public String applyTeacher(Model model) {
		model.addAttribute("list",teacherBiz.selectAll());
		
		return "admin/applyTeacher.adminTiles";
	}
	
	@RequestMapping(value = "adminApplyBusiness.do")
	public String applyBusiness(Model model) {
		model.addAttribute("list", businessBiz.selectAll());
		
		return "admin/applyBusiness.adminTiles";
	}
	
/*	@RequestMapping(value = "adminAsk.do")
	public String adminAsk() {
		return "admin/ask.adminTiles";
	}*/
	
	@RequestMapping(value = "adminFaq.do")
	public String adminFaq() {
		return "admin/faq.adminTiles";
	}
	
}
