package com.hk.soup.home.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hk.soup.home.alarm.model.biz.AlarmBiz;
import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.home.model.biz.HomeBiz;

@Controller
public class HomeController {

	@Autowired
	private HomeBiz biz;

	//메인
	//메인에 노출되는 유료스터디,무료스터디,프로젝트
	@Autowired
	private AlarmBiz alarmBiz;
	
	@RequestMapping(value = "/home.do")
	public String main(Model model, HttpSession session) {
		
		/*if (session.getAttribute("visit") == null) {
			biz.insertVisit();
			session.setAttribute("visit", "접속");
		}*/
		
		/*model.addAttribute("mainPsView1",biz.mainPsView1());
		model.addAttribute("mainPsView2",biz.mainPsView2());
		model.addAttribute("mainPsView3",biz.mainPsView3());
		model.addAttribute("mainFsView1",biz.mainFsView1());
		model.addAttribute("mainFsView2",biz.mainFsView2());
		model.addAttribute("mainFsView3",biz.mainFsView3());
		model.addAttribute("mainProjectView",biz.mainProjectView());*/

		return "home/home.tiles";
	}
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(Model model, HttpSession session) {

		session.invalidate();
		return "redirect:home.do";
	}

	// 로그인
		@RequestMapping(value = "/memberLogin.do", method = RequestMethod.POST)
		public String selectOne(HttpServletResponse response,HttpSession session, @RequestParam String memberEmail,
				@RequestParam("memberPw") String memberPw, HttpServletRequest request, Model model) throws IOException {

			Map<String, String> map = new HashMap<String, String>();
			map.put("memberEmail", memberEmail);
			map.put("memberPw", memberPw);
			MemberDto dto = biz.selectOne(map);
			String referer=request.getHeader("Referer");
						
			if (dto != null) {
				if(dto.getMemberEna().equals("Y")) {		
				session.setAttribute("login", dto);
				int memberNo = dto.getMemberNo();
				session.setAttribute("alarmMessageList", alarmBiz.selectAlarmList(memberNo, "MESSAGE", "NULL"));
				session.setAttribute("alarmSoupList", alarmBiz.selectAlarmList(memberNo, "STUDY", "PROJECT"));
				session.setAttribute("alarmUserList", alarmBiz.selectAlarmList(memberNo, "PAY", "ASK"));	
				
					return "redirect:"+referer;
					
				}else {
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter outer = response.getWriter();
					outer.println("<script>alert('탈퇴한 회원입니다.');location.href='logout.do'</script>");
					outer.close();	
					
				}
				
						
			}
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter outer = response.getWriter();
			outer.println("<script>alert('잘못입력하셨습니다.');location.href='logout.do'</script>");
			outer.close();	
			
			return "home/home.tiles";
		}
	
	// id체크
	@RequestMapping(value = "/checkId.do")
	public @ResponseBody String Idcheck(Model model, HttpServletRequest request) {
		String memberEmail = request.getParameter("memberEmail");
		int idch = biz.checkId(memberEmail);
		return String.valueOf(idch);
	}

	// 핸드폰체크
	@RequestMapping(value = "/checkTel.do")
	public @ResponseBody String Telcheck(Model model, HttpServletRequest request) {
		String memberTel = request.getParameter("memberTel");
		int telch = biz.checkTel(memberTel);
		return String.valueOf(telch);
	}
	
	// 회원가입
	@RequestMapping(value = "/join.do",method = {RequestMethod.GET, RequestMethod.POST}, headers = "content-type=multipart/form-data")
	public void insert(HttpServletResponse response, HttpSession session,@ModelAttribute MemberDto dto , HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IOException {

		if (!file.getOriginalFilename().equals("")) {
			OutputStream out = null;
			String orignalFileName = file.getOriginalFilename();
			String[] fileNameArr = orignalFileName.split("\\.");
			Date date = new Date();
			String fileName = fileNameArr[0] +date.getTime()+"."+fileNameArr[1];
			byte[] bytes = file.getBytes();
			String uploadPath ="D:\\JAVA\\SpringA\\Soup\\src\\main\\webapp\\resources\\upload\\memberFace\\"+fileName;
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			out.close();
			dto.setMemberFace("resources/upload/memberFace/"+fileName);
		} else {
			dto.setMemberFace("");
		}
	        
	   /* String defaultPath = request.getRealPath("/");*/
//	    String uploadPath ="D:\\SpringWorkspace\\Soup\\src\\main\\webapp\\resources\\upload\\memberFace\\"+fileName;
	     
		
		int res = biz.insert(dto);

		if (res > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter outer = response.getWriter();
			outer.println("<script>alert('"+dto.getMemberName()+"님 회원가입을 축하드립니다. 로그인해주세요'); location.href='home.do';</script>");
			outer.close();			
		}
	}
	
/*	//알림 확인여부
	@RequestMapping(value="/alarmChecked.do")
	public void alarmUpdate(@RequestParam String alarmGubun,@RequestParam int alarmDetailNo) {
		
		AlarmDto dto = new AlarmDto();
		
		alarmBiz.updateAlarm(dto);
		
	}*/
	/*
	 * @RequestMapping(value = "/notice.do") public String notice(Model
	 * model, @ModelAttribute MemberDto dto) { return
	 * "customerService/notice/notice.tiles"; }
	 */

	@RequestMapping(value = "/ask.do")
	public String ask(Model model, @ModelAttribute MemberDto dto) {
		return "customerService/ask/ask.tiles";
	}

	@RequestMapping(value = "/mainFilter.do")
	public String mainFilter(Model model, @RequestParam String gubun, @RequestParam String soupSearchWord) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("soupGubun", gubun);
	
		map.put("soupSearchWord", soupSearchWord);
		
			model.addAttribute("list", biz.mainselectSearch(map));
			return "search/searchResult.tiles";
	}
	/*
	 * @RequestMapping(value = "/faq.do") public String faq(Model
	 * model, @ModelAttribute MemberDto dto) { return
	 * "customerService/faq/faq.tiles"; }
	 */

	/*ERROR PAGE*/
	@RequestMapping(value = "/error404.do")
	public String error404() {
		return "common/error404.tiles";
	}
	
	@RequestMapping(value = "/error400.do")
	public String error400() {
		return "common/error400.tiles";
	}
	
	@RequestMapping(value = "/error500.do")
	public String error500() {
		return "common/error500.tiles";
	}
}
