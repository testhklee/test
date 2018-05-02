package com.hk.soup.teacher.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.soup.teacher.model.biz.TeacherBiz;

@Controller
public class TeacherController {
	
	@Autowired
	private TeacherBiz biz;

	@RequestMapping(value = "/teacherOne.do")
	public String teacherOne(Model model, @RequestParam int memberNo) {
		
		model.addAttribute("teacherDao",biz.selectOne(memberNo));
		
		return "admin/teacherDetail.adminTiles";
	}
	
	@RequestMapping(value="teacherUpdate.do")
	public void teacherUpdate(Model model, HttpServletResponse response, @RequestParam String teacherStatus2, @RequestParam int [] memberNo) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String teacherStatus [] = teacherStatus2.split(",");
        
        for(int i = 0 ;i<teacherStatus.length;i++) {
        	biz.updateTeacher(memberNo[i], teacherStatus[i]);
        }
        out.println("<script>alert('수정 완료.'); location.href='adminApplyTeacher.do';</script>");
		out.close();
	}
	
	@RequestMapping(value="teacherStatusUpdate.do")
	public void teacherStatusUpdate(Model model, HttpServletResponse response, @RequestParam String teacherStatus, @RequestParam int memberNo) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        biz.updateTeacher(memberNo, teacherStatus);
        
        out.println("<script>alert('수정 완료.'); location.href='adminApplyTeacher.do';</script>");
		out.close();
        
	}
}
