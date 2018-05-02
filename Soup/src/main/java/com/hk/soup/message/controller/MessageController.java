package com.hk.soup.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.soup.home.alarm.dto.AlarmDto;
import com.hk.soup.home.alarm.model.biz.AlarmBiz;
import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.message.dto.MessageDto;
import com.hk.soup.message.model.biz.MessageBiz;
import com.hk.soup.studyRoom.dto.BoardPager;

@Controller
public class MessageController {

	@Autowired
	private MessageBiz biz;
	
	@Autowired
	private AlarmBiz alarmBiz;
	
	@RequestMapping(value="/messageTargetList.do")
	public String messageTargetList(Model model , @RequestParam(defaultValue="1") int curPage, HttpSession session, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        MemberDto login = (MemberDto) session.getAttribute("login");
        
        int count = biz.selectTarget(login.getMemberNo()).size();
        BoardPager boardPager = new BoardPager(count,curPage);
        int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		
        if(session.getAttribute("login")==null) {
        	out.println("<script>alert('로그인이 필요한 페이지입니다.'); history.go(-1);</script>");
            out.close();
        }
        model.addAttribute("messageTargetList",biz.selectTargetList(login.getMemberNo(),start,end));
        model.addAttribute("count", count);
		model.addAttribute("boardPager", boardPager);
		
		return "message/messageTargetList.tiles";
	}
	
	@RequestMapping(value="/messageSenderList.do")
	public String messageSenderList(Model model , @RequestParam(defaultValue="1") int curPage, HttpSession session, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        MemberDto login = (MemberDto) session.getAttribute("login");
        
        int count = biz.selectSender(login.getMemberNo()).size();
        BoardPager boardPager = new BoardPager(count,curPage);
        int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		
        if(session.getAttribute("login")==null) {
        	out.println("<script>alert('로그인이 필요한 페이지입니다.') history.go(-1);</script>");
            out.close();
        }
        model.addAttribute("messageSenderList",biz.selectSenderList(login.getMemberNo(),start,end));
        model.addAttribute("count", count);
		model.addAttribute("boardPager", boardPager);
		
		return "message/messageSenderList.tiles";
	}
	
	@RequestMapping(value="/senderOne.do")		//받은메세지
	public String senderOne(Model model , @ModelAttribute MessageDto dto , @RequestParam int messageNo , HttpSession session, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        biz.updateCheck(dto);
        
        MemberDto login = (MemberDto) session.getAttribute("login");
        if(session.getAttribute("login")==null) {
        	out.println("<script>alert('로그인이 필요한 페이지입니다.') history.go(-1);</script>");
            out.close();
        }
        
        Map<String,Integer> map = new HashMap<String,Integer>();
        map.put("messageSenderNo", login.getMemberNo());
        map.put("messageNo", messageNo);
        
        model.addAttribute("messageDto",biz.senderOne(map));
        
		return "message/messageSenderOne";
	}
	
	@RequestMapping(value="/targetOne.do")		//보낸메세지
	public String targetOne(Model model , @ModelAttribute MessageDto dto , @RequestParam(value="messageNo") int messageNo , HttpSession session) throws IOException {
        biz.updateCheck(dto);
        
        MemberDto login = (MemberDto) session.getAttribute("login");
        if (session.getAttribute("login") == null) {
            return "redirect:home.do";
        } else {
        
	        Map<String,Integer> map = new HashMap<String,Integer>();
	        map.put("messageTargetNo", login.getMemberNo());
	        map.put("messageNo", messageNo);
	        model.addAttribute("messageDto",biz.targetOne(map));
	        
	        AlarmDto alarmDto = new AlarmDto();
	        alarmDto.setAlarmGubun("MESSAGE");
	        alarmDto.setAlarmDetailNo(messageNo);
	        alarmBiz.updateAlarm(alarmDto);
	        
	        session.setAttribute("alarmMessageList", alarmBiz.selectAlarmList(login.getMemberNo(), "MESSAGE", "NULL"));
	        
			return "message/messageTargetOne";
        }
	}
	
	@RequestMapping(value="/messageInsert.do")
	public void messageInsert(Model model, @ModelAttribute MessageDto dto, @RequestParam int targetNo, @RequestParam String memberName, @RequestParam String content, HttpServletResponse response , HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        MemberDto login = (MemberDto) session.getAttribute("login");
        int messageSenderNo =  login.getMemberNo();
        
        MessageDto message = new MessageDto(messageSenderNo, targetNo, content);
        
        if(content == null) {
        	out.println("<script>alert('내용을 작성해주세요.'); history.go(-1);</script>");
            out.close();
        } else {
        	int res = biz.insert(message);
        	
        	if(res <= 0) {
        		out.println("<script>alert('전송에 실패 하였습니다.'); history.go(-1);</script>");
        	}
        	
        	MessageDto messageDto = biz.selectMessageNo(messageSenderNo);
        	
        	int alarmDetailNo = messageDto.getMessageNo();
        	AlarmDto alarmDto = new AlarmDto();
        	
        	alarmDto.setMemberNo(targetNo);
        	alarmDto.setAlarmContent(messageDto.getMemberName()+"님의 메세지 도착");
        	alarmDto.setAlarmGubun("MESSAGE");
        	alarmDto.setAlarmDetailNo(alarmDetailNo);
        	
        	alarmBiz.insertAlarm(alarmDto);
        	
        	out.println("<script>alert('전송 성공!'); window.close();</script>");
        	out.close();
        }
        
	}
	
	@RequestMapping(value="/delSend.do")
	public void delSend(Model model , @ModelAttribute MessageDto dto , HttpServletResponse response ,HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int res = biz.delSend(dto);
        
        if(res>0) {
        	
        	out.println("<script>alert('메세지를 삭제 하였습니다.'); opener.location.reload(); window.close();</script>");
            out.close();
        }else {
        	out.println("<script>alert('메세지 삭제에 실패 했습니다.'); window.close();</script>");
            out.close();
        }
	}

	@RequestMapping(value="/delTarget.do")
	public void delTarget(Model model , @ModelAttribute MessageDto dto , HttpServletResponse response ,HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        MemberDto login = (MemberDto) session.getAttribute("login");
        
        int res = biz.delTarget(dto);
        
        if(res>0) {
        	
        	out.println("<script>alert('메세지를 삭제 하였습니다.'); opener.location.reload(); window.close();</script>");
            out.close();
        	
        }else {
        	out.println("<script>alert('메세지 삭제에 실패 했습니다.'); window.close();</script>");
            out.close();
        }
	}

	/**
	 * 메세지 양식
	 * @param model 받는이의 정보를 담는다
	 * @param memberNo 받는이의 멤버번호
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/message.do")
	public String message(Model model, @RequestParam int memberNo, HttpServletResponse response, HttpSession session) throws IOException {

		if (((MemberDto)session.getAttribute("login")).getMemberNo() == memberNo) {
			PrintWriter out = response.getWriter();
			out.println("<script>window.close();</script>");
            out.close();
            return null;
		}
		
        model.addAttribute("receiver", biz.selectMessageReceiver(memberNo));
		return "user/message/message";
	}

	
	@RequestMapping(value="/mulDelSend.do")
	public void mulDelSend(Model model , @RequestParam String messageNo[] , HttpServletResponse response ,HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        MemberDto login = (MemberDto) session.getAttribute("login");
        
        int res = biz.mulDelSend(messageNo);
        
        if(res>0) {
        	
        	out.println("<script>alert('메세지를 삭제 하였습니다.'); location.href='messageSenderList.do';</script>");
            out.close();
        	
        }else {
        	out.println("<script>alert('메세지 삭제에 실패 했습니다.'); history.go(-1);</script>");
            out.close();
        }
	}
	
	@RequestMapping(value="/mulDelTarget.do")
	public void mulDelTarget(Model model , @RequestParam String messageNo[] , HttpServletResponse response ,HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        MemberDto login = (MemberDto) session.getAttribute("login");
        
        int res = biz.mulDelTarget(messageNo);
        
        if(res>0) {
        	
        	out.println("<script>alert('메세지를 삭제 하였습니다.'); window.location.replace('messageTargetList.do');</script>");
            out.close();
        }else {
        	out.println("<script>alert('메세지 삭제에 실패 했습니다.'); history.go(-1);</script>");
            out.close();
        }
	}
	
	@RequestMapping(value="/setSessionMessageList.do")
	@ResponseBody
	public void setSessionMessageList(HttpSession session) throws IOException {
		MemberDto login = (MemberDto) session.getAttribute("login");
		session.setAttribute("alarmMessageList", alarmBiz.selectAlarmList(login.getMemberNo(), "MESSAGE", "NULL"));
	}
	
}