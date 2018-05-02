package com.hk.soup.user.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


import javax.mail.MessagingException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.home.model.biz.HomeBiz;
import com.hk.soup.user.model.biz.UserBiz;

@Controller
public class UserController {

	@Autowired
	private HomeBiz biz;

	@Autowired
	private UserBiz ubiz;

	@Autowired
	private JavaMailSender mailSender;

	// 관리자 페이지
	@RequestMapping(value = "/manager.do")
	public String manage(Model model) {

		return "user/manager/manager.tiles";
	}

	// 유저목록
	@RequestMapping(value = "/userlist.do")
	public String userlist(Model model) {

		model.addAttribute("list", biz.selectAll());
		return "user/manager/userList";
	}

	// id찾기
	@RequestMapping(value = "/idSearch.do")
	public String idSearch(Model model) {
		model.addAttribute("list", biz.selectAll());
		return "user/mySearch/idSearch";
	}

	// id값 가져오기
	@RequestMapping(value = "/idMacth.do",method =RequestMethod.POST)
	public String idMacth(Model model, @RequestParam String memberName, @RequestParam String memberTel) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("memberName", memberName);
		map.put("memberTel", memberTel);
		String res = biz.idSearch(map);

		if (res != null) {
			model.addAttribute("idSearch", biz.idSearch(map));
			return "user/mySearch/idSearch";
		} else {
			return "user/mySearch/idSearch";
		}

	}

	// 임시비밀번호, 임시비번으로 로그인 이메일 전송
	@RequestMapping(value = "/pwMacth.do", method = { RequestMethod.POST })
	public String pwMacth(Model model, @RequestParam String memberName, @RequestParam String memberTel,
			@RequestParam String memberEmail, HttpServletRequest request, MemberDto dto,HttpServletResponse response) throws IOException {

		Map<String, String> map = new HashMap<String, String>();
		map.put("memberName", memberName);
		map.put("memberTel", memberTel);
		map.put("memberEmail", memberEmail);
		int res = biz.pwSearch(map);

		String newPw = ubiz.bufString();
		String tomail = request.getParameter("memberEmail");
		String title = "안녕하세요 스프입니다. " + request.getParameter("memberName") + "님의 임시비밀번호를 발송합니다.";
		String content= "귀하의 임시비밀번호는 "+newPw+"입니다.<br/>"
				+ "<a href='http://localhost:8787/Soup/pwUpdate.do?newPw="+newPw+"'>이곳을 클릭해주십시오</a>";
				
		if (res > 0) {

			try {
				System.out.println(res);
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper =new MimeMessageHelper(message,true,"UTF-8");
				
				messageHelper.setFrom("tten0210@gmail.com");
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);			
				messageHelper.setText(content,true);
				mailSender.send(message);

			} catch (MessagingException e) {
				e.printStackTrace();
			}
				
			return "user/mySearch/pwSearch";
						
			
		} else {

			return "home/home.tiles";
		}
	}
	
	@RequestMapping(value = "/pwUpdate.do")
	public String pwUpdate(Model model, @RequestParam String newPw) {
			
		model.addAttribute("newPw",newPw);
		return "user/mySearch/pwUpdate.tiles";
	}

	@RequestMapping(value = "/pwUpdateForm.do", method = { RequestMethod.POST })
	public String pwUpdateForm(Model model,HttpSession session,@RequestParam String memberEmail) {

		model.addAttribute("newPw",biz.PwselectOne(memberEmail));
				
		return "user/mySearch/newPwUpgrade";
	}
			
	// 비밀번호찾기
	@RequestMapping(value = "/pwSearch.do")
	public String pwSearch() {
		return "user/mySearch/pwSearch";
	}

	// 비밀번호수정
	@RequestMapping(value = "/finalPwUpdate.do")
	public String finalPwUpdate(@RequestParam String memberPw, MemberDto dto) {
		
		
			ubiz.update(dto);
		
		return "home/home.tiles";
	}
	

		// 내정보 전 비밀번호 확인
		@RequestMapping(value = "/pwCheck.do")
		public String pwCheck() {
			
			return "user/myInfo/pwCheck.tiles";
		}
		
		// 내정보 전 비밀번호 확인체크 후 업데이트폼으로 넘김
		@RequestMapping(value = "/updateForm.do")
		public String updateform(){
			
			return "user/myInfo/updateForm.tiles";			
		}
		//수정
		@RequestMapping(value = "/userUpdate.do",method = {RequestMethod.GET,RequestMethod.POST},headers = "content-type=multipart/form-data")
		public String userUpdate(Model model,HttpServletResponse response,HttpSession session,@ModelAttribute MemberDto dto, @RequestParam("file") MultipartFile file,HttpServletRequest request )  throws IOException { 
	
		OutputStream out = null;
				
			String orignalFileName = file.getOriginalFilename();
		    String[] fileNameArr = orignalFileName.split("\\.");
		    Date date = new Date();
		    String fileName = fileNameArr[0] +date.getTime()+"."+fileNameArr[1];
		    byte[] bytes = file.getBytes();
		        
		       	        
		  String defaultPath = request.getRealPath("/");
		   
		  	String uploadPath ="D:\\JAVA\\SpringA\\Soup\\src\\main\\webapp\\resources\\upload\\memberFace\\"+fileName;
//		    String uploadPath ="D:\\SpringWorkspace\\Soup\\src\\main\\webapp\\resources\\upload\\memberFace\\"+fileName;
		    out = new FileOutputStream(new File(uploadPath));
	        out.write(bytes);
	        
	       dto.setMemberFace("resources/upload/memberFace/"+fileName);
	                
			int res = ubiz.update(dto);
			
			System.out.println(dto.getMemberFace());
			System.out.println(res);
			if(res>0) {		

				Map<String, String> map = new HashMap<String, String>();
				map.put("memberEmail", dto.getMemberEmail());
				map.put("memberPw", dto.getMemberPw());
			
				System.out.println(biz.selectOne(map).getMemberFace());
				
				session.setAttribute("login",biz.selectOne(map));
				
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter outer = response.getWriter();

				outer.println("<script>alert('수정이 성공하였습니다.'); location.href='updateForm.do'</script>");
				outer.close();			

			
			}
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter outer = response.getWriter();

			outer.println("<script>alert('수정이 실패하였습니다.');</script>");
			outer.close();	
			
			return "user/myInfo/updateForm.tiles";
		}
		
		//수정2
				@RequestMapping(value = "/userUpdate2.do",method = {RequestMethod.GET,RequestMethod.POST},headers = "content-type=multipart/form-data")
				public String userUpdate2(Model model,HttpServletResponse response,HttpSession session,@ModelAttribute MemberDto dto, HttpServletRequest request )  throws IOException { 
             	
						
						dto.setMemberFace(((MemberDto)session.getAttribute("login")).getMemberFace());
					
							
					int res = ubiz.update(dto);
							
					if(res>0) {		

					Map<String, String> map = new HashMap<String, String>();
						map.put("memberEmail", dto.getMemberEmail());
						map.put("memberPw", dto.getMemberPw());
					
						session.setAttribute("login",biz.selectOne(map));
						
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter outer = response.getWriter();

						outer.println("<script>alert('수정이 성공하였습니다.'); location.href='updateForm.do'</script>");
						outer.close();			

					}
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter outer = response.getWriter();

					outer.println("<script>alert('수정이 실패하였습니다.');</script>");
					outer.close();	
					
					return "user/myInfo/updateForm.tiles";
				}
			
	
		//delete
		@RequestMapping(value = "/userDelete.do")
		public String userDelete(Model model, @RequestParam String memberEmail){
			System.out.println(memberEmail);
			MemberDto dto = new MemberDto();
			
			int res=ubiz.userOut(memberEmail);
			System.out.println(dto.getMemberEna());
		
			if(res>0) {
				
		}
			return "redirect:home.do";
	}

}