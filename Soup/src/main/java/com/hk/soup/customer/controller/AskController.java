package com.hk.soup.customer.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.soup.customer.dto.AnswerDto;
import com.hk.soup.customer.dto.QuestionDto;
import com.hk.soup.customer.model.biz.AskBiz;
import com.hk.soup.home.alarm.dto.AlarmDto;
import com.hk.soup.home.alarm.model.biz.AlarmBiz;
import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.studyRoom.dto.BoardPager;

@Controller
public class AskController {

	@Autowired
	private AskBiz biz;
	@Autowired
	private AlarmBiz alarmBiz;
	
	@RequestMapping(value = "/questionUserList.do")
	public String questionUserList(Model model , @RequestParam(defaultValue="1") int curPage,HttpSession session , HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
		MemberDto login = (MemberDto) session.getAttribute("login");
		int count = biz.selectUser(login.getMemberNo()).size();
		BoardPager boardPager = new BoardPager(count,curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		if(session.getAttribute("login")==null) {
			out.println("<script>alert('로그인이 필요한 페이지입니다.'); history.go(-1);</script>");
            out.close();
		}
		
		model.addAttribute("questionUserList",biz.selectUserList(login.getMemberNo(),start,end));
		model.addAttribute("count", count);
		model.addAttribute("boardPager", boardPager);
		
		return "customerService/ask/questionUser.tiles";
	}
	
	@RequestMapping(value="/questionAdminList.do")
	public String questionAdminList(Model model , HttpSession session , HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        MemberDto login = (MemberDto) session.getAttribute("login");
        
        if(login.getMemberGrade().equals("ADMIN")) {
        	model.addAttribute("questionAdminList", biz.selectAdmin());
        	return "admin/questionAdmin.adminTiles";
        }else{
        	out.println("<script>alert('권한이 없습니다.');</script>");
            out.close();
        }
        return "home.do";
	}

	
	@RequestMapping(value="/questionInsertForm.do")
	public String questionInsertForm(Model model , HttpSession session ,HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if(session.getAttribute("login")==null) {
        	String referer= request.getHeader("Referer");
        	out.println("<script>alert('로그인이 필요한 페이지입니다.');location.href=parent.document.referrer</script>");
            out.close();
        }
		
		return "customerService/ask/questionInsertForm.tiles";
	}
	
	@RequestMapping(value="/questionInsert.do")
	public void questionInsert(Model model, HttpServletResponse response ,@ModelAttribute QuestionDto dto) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		if(dto.getQuestionTitle()==null||dto.getQuestionTitle()==""||dto.getQuestionContent()==null||dto.getQuestionContent()=="") {
			out.println("<script>alert('글이 작성되지 않았습니다.'); history.go(-1);</script>");
            out.close();
		}else {
			int res = biz.questionInsert(dto);
			if(res>0) {
				out.println("<script>alert('문의글이 작성 되었습니다.');location.href='questionUserList.do';</script>");
	            out.close();
			}
		}
	}
	
	@RequestMapping(value="/answerInsertForm.do")
	public String answerInsertForm(Model model,@ModelAttribute QuestionDto dto, @RequestParam int questionNo , HttpServletResponse response , HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        MemberDto login = (MemberDto) session.getAttribute("login");
        if(login.getMemberGrade().equals("ADMIN")) {
        	
        	model.addAttribute("answerDto",biz.selelctOne(questionNo));
        	return "admin/answerInsertForm.adminTiles";
        	
        }else {
        	out.println("<script>alert('잘못된 접근 입니다.');</script>");
            out.close();
        }
        return "home.do";
	}
	
	@RequestMapping(value="/answerInsert.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public void answerInsert(Model model,HttpServletResponse response , @ModelAttribute AnswerDto dto, @ModelAttribute QuestionDto dto2) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        
        if(dto.getAnswerContent()==null) {
        	out.println("<script>alert('글이 작성되지 않았습니다.'); history.go(-1);</script>");
            out.close();
        }else {
        	int res = biz.aswerInsert(dto);
        	if(res>0) {
        		biz.ynUpdate(dto2);
        		AlarmDto alarmDto = new AlarmDto();
        		alarmDto.setMemberNo(biz.selectMemberNo(dto.getQuestionNo()));
        		alarmDto.setAlarmContent("1:1문의 답변이 도착했습니다.");
        		alarmDto.setAlarmGubun("ASK");
        		alarmDto.setAlarmDetailNo(dto.getQuestionNo());
        		alarmBiz.insertAlarm(alarmDto);
        		out.println("<script>alert('답변이 작성 되었습니다.'); location.href='questionAdminList.do';</script>");
	            out.close();
        	}
        }
		
	}
	
	@RequestMapping(value="/answer.do")
	public String answer(Model model, @RequestParam int questionNo) {

		model.addAttribute("answerDto",biz.selectAnswer(questionNo));

		model.addAttribute("questionDto",biz.selelctOne(questionNo));
		
		AlarmDto alarmDto = new AlarmDto();
        alarmDto.setAlarmGubun("ASK");
        alarmDto.setAlarmDetailNo(questionNo);
        alarmBiz.updateAlarm(alarmDto);
		
		return "customerService/ask/answer.tiles";
	}
}
