package com.hk.soup.search.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.search.dto.SoupApplyDto;
import com.hk.soup.search.dto.SoupCreateDto;
import com.hk.soup.search.dto.SoupDetailDto;
import com.hk.soup.search.dto.SoupDto;
import com.hk.soup.search.dto.SoupFilterDto;
import com.hk.soup.search.dto.SoupJJimDto;
import com.hk.soup.search.model.biz.SoupBiz;
import com.hk.soup.soup.dto.SoupMemberDto;

@Controller
public class SearchController {
	
	@Autowired
	private SoupBiz biz;
	
	/*참여 메인*/
	@RequestMapping(value= "/search.do")
	public String searchAll(Model model) {
		
		
		model.addAttribute("pList",biz.selectP());
		model.addAttribute("fsList",biz.selectFs());
		model.addAttribute("psList",biz.selectPs());
		return "search/searchMain.tiles";
	}
	
	/*구분별 리스트 출력*/
	@RequestMapping(value= "/searchGubun.do")
	public String searchPs(Model model, HttpServletRequest request, @RequestParam String soupGubun) {
		
		model.addAttribute("list",biz.selectGubun(soupGubun));
		return "search/searchResult.tiles";
	}
	
	/*검색 필터 기능 이용 검색*/
	@RequestMapping(value= "/searchSoup.do")
	public String searchSoup(Model model, HttpServletRequest request, SoupFilterDto soupFilterDto) {
		
		if (soupFilterDto.getSoupAddr1() == null) {
			return "redirect:search.do";
		} else {
			model.addAttribute("list", biz.selectSearch(soupFilterDto));
			return "search/searchResult.tiles";
		}
	}
	
	/*Ckeditor fileUpload*/
	@RequestMapping(value = "searchUpload.do", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) throws IOException {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String orignalFileName = upload.getOriginalFilename();
		String[] fileNameArr = orignalFileName.split("\\.");
		Date date = new Date();
		String fileName = fileNameArr[0] + date.getTime() + "." + fileNameArr[1];
		byte[] bytes = upload.getBytes();

		String defaultPath = request.getRealPath("/");
		String uploadPath = defaultPath + "resources\\upload\\" + fileName;

		out = new FileOutputStream(new File(uploadPath));
		out.write(bytes);

		String callback = request.getParameter("CKEditorFuncNum");
		printWriter = response.getWriter();

		String script = "<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ", 'resources/upload/"
				+ fileName + "', '업로드에 성공하였습니다.')</script>";

		printWriter.println(script);

		printWriter.close();
		out.close();

		System.out.println("ckeditor 경로 : " + uploadPath);
	}
	
	/*스/프 생성 폼으로 가기*/
	@RequestMapping(value= "/createSoup.do")
	public String createSoup(Model model, HttpServletRequest request) {
		
		String gubun = request.getParameter("gubun");
		if(gubun.equals("PS")) {
			return "search/createPsForm.tiles";
		}else if(gubun.equals("FS")) {
			return "search/createFsForm.tiles";
		}else {
			return "search/createPForm.tiles";
		}
	}
	
	/*무료 스터디 생성*/
	@RequestMapping(value = "/createFs.do", method=RequestMethod.POST)
	public void createFS(Model model, HttpServletRequest request, HttpServletResponse response, SoupCreateDto soupCreateDto) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int soupInsertRes = biz.createFs(soupCreateDto);
		
		if(soupInsertRes>0) {
			try {
				jsResponse("스터디 생성 완료", "search.do?", response);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/*유료 스터디 생성*/
	@RequestMapping(value = "/createPs.do", method=RequestMethod.POST)
	public void createPS(Model model, HttpSession session, MultipartHttpServletRequest request ,HttpServletResponse response, SoupCreateDto soupCreateDto) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MultipartFile upload = request.getFile("upload");
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		
		if(upload!=null && !(upload.getOriginalFilename().equals(""))) {
			String orignalFileName = upload.getOriginalFilename();
			String[] fileNameArr = orignalFileName.split("\\.");
			Date date = new Date();
			String fileName = fileNameArr[0] + date.getTime() + "." + fileNameArr[1];
//			String uploadPath = "D:/project/Soup/src/main/webapp/resources/upload/memberVideo/"+memberDto.getMemberNo()+"_"+fileName;
			String uploadPath = "D:/JAVA/SpringA/Soup/src/main/webapp/resources/upload/memberVideo/"+memberDto.getMemberNo()+"_"+fileName;
			byte[] bytes;
			try {
				bytes = upload.getBytes();
				File file = new File(uploadPath);
				FileOutputStream fos = new FileOutputStream(file);
				fos.write(bytes);
		        fos.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		
        	soupCreateDto.setSoupIntroVideo(uploadPath);
		}else {
			soupCreateDto.setSoupIntroVideo("");
		}
        
		int soupInsertRes = biz.createPs(soupCreateDto);
		
		if(soupInsertRes>0) {
			try {
				jsResponse("스터디 생성 완료", "search.do?", response);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}
	
	/*프로젝트 생성*/
	@RequestMapping(value = "/createP.do", method=RequestMethod.POST)
	public void createP(Model model, HttpServletRequest request, HttpServletResponse response, SoupCreateDto soupCreateDto) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int soupInsertRes = biz.createP(soupCreateDto);
		
		if(soupInsertRes>0) {
			try {
				jsResponse("프로젝트 생성 완료", "search.do?", response);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/*상세보기 가기*/
	@RequestMapping(value = "/detailForm.do")
	public String soupDetailForm(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestParam int soupNo) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		SoupJJimDto soupJJimDto = new SoupJJimDto();
		SoupApplyDto soupApplyDto = new SoupApplyDto();
		SoupMemberDto soupMemberDto = new SoupMemberDto();
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		
		if(memberDto!=null) {
			soupJJimDto.setSoupNo(soupNo);
			soupJJimDto.setMemberNo(memberDto.getMemberNo());
			
			soupApplyDto.setSoupNo(soupNo);
			soupApplyDto.setMemberNo(memberDto.getMemberNo());
			
			soupMemberDto.setSoupNo(soupNo);
			soupMemberDto.setMemberNo(memberDto.getMemberNo());
			
			model.addAttribute("soupApplyUmoo", biz.soupApplyUmoo(soupApplyDto));
			model.addAttribute("soupJJimUmoo", biz.soupJJimUmoo(soupJJimDto));
			model.addAttribute("soupMemberUmoo", biz.soupMemberUmoo(soupMemberDto));
		}
		
		SoupDetailDto detailDto  = biz.soupDetail(soupNo);
		
		if(detailDto.getSoupGubun().equals("PS")) {
			model.addAttribute("soupReviewList", biz.soupReviewList(soupNo));
		}
		
		model.addAttribute("selectDto", detailDto);
		
		return "search/soupDetail.tiles";
	}
	
	/*찜하기*/
	@RequestMapping(value = "/soupJJimInsert.do")
	public void soupJJimInsert(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, SoupJJimDto soupJJimDto) throws UnsupportedEncodingException {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		
		soupJJimDto.setMemberNo(memberDto.getMemberNo());
		
		biz.soupJJimInsert(soupJJimDto);
		
	}
	
	/*찜취소*/
	@RequestMapping(value = "/soupJJimCancle.do")
	public void soupJJimCancle(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, SoupJJimDto soupJJimDto) throws UnsupportedEncodingException {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		
		soupJJimDto.setMemberNo(memberDto.getMemberNo());
		
		biz.soupJJimCancle(soupJJimDto);
		
	}
	
	/*스/프 신청 폼*/
	@RequestMapping(value = "/soupApplyForm.do")
	public String soupApplyForm(Model model, HttpServletRequest request, HttpServletResponse response, SoupDetailDto soupDetailDto) throws UnsupportedEncodingException {
		model.addAttribute("soupDetailDto", soupDetailDto);
		
		return "search/soupApplyForm";
	}
	
	/*스/프 신청*/
	@RequestMapping(value = "/soupApply.do")
	public void soupApply(Model model, HttpServletRequest request, HttpServletResponse response, SoupApplyDto soupApplyDto) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int res = biz.soupApplyInsert(soupApplyDto);
		
		if(res>0) {
			try {
				jsResponseClose("신청완료", "opener.parent.location.reload(); self.close();", response);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/*스/프 신청 취소 폼*/
	@RequestMapping(value = "/soupApplyCancleForm.do")
	public String soupApplyCancleForm(Model model, HttpServletRequest request, HttpServletResponse response, SoupDetailDto soupDetailDto) throws UnsupportedEncodingException {
		model.addAttribute("soupDetailDto", soupDetailDto);
		
		return "search/soupApplyCancleForm";
	}
	
	/*스/프 신청 취소*/
	@RequestMapping(value = "/soupApplyCancle.do")
	public void soupApplyCancle(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, SoupApplyDto soupApplyDto) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		
		soupApplyDto.setMemberNo(memberDto.getMemberNo());
		
		int res = biz.soupApplyCancle(soupApplyDto);
		
		if(res>0) {
			try {
				jsResponseClose("취소완료", "opener.parent.location.reload(); self.close();", response);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/*결제 폼*/
	@RequestMapping(value = "/soupPaymentForm.do")
	public String soupPaymentForm(Model model, HttpServletRequest request, HttpServletResponse response, SoupDetailDto soupDetailDto) throws UnsupportedEncodingException {
		
		model.addAttribute("soupDetailDto", soupDetailDto);
		
		return "search/soupPaymentForm";
	}
	
	/*결제 완료 후 스/프 멤버 추가*/
	@RequestMapping(value = "/soupPayment.do")
	public void soupPayment(Model model, HttpServletRequest request, HttpServletResponse response, SoupDetailDto soupDetailDto) throws UnsupportedEncodingException {
		
		//멤버 추가 
		int insertRes = biz.soupMemberInsert(soupDetailDto);
		
		if(insertRes>0) {
			//결제 내역 추가
			biz.payInsert(soupDetailDto);
		}
	}
	
	/*결제 취소 폼*/
	@RequestMapping(value = "/soupPaymentCancleForm.do")
	public String soupPaymentCancleForm(Model model, HttpServletRequest request, HttpServletResponse response, SoupDetailDto soupDetailDto) throws UnsupportedEncodingException {
		
		model.addAttribute("soupDetailDto", soupDetailDto);
		
		return "search/soupPaymentCancleForm";
	}
	
	/*결제 약관*/
	@RequestMapping(value = "/soupPaymentClause.do")
	public String soupPaymentClause(Model model, HttpServletRequest request, HttpServletResponse response, SoupDetailDto soupDetailDto) throws UnsupportedEncodingException {
		
		model.addAttribute("soupDetailDto", soupDetailDto);
		
		return "search/soupPaymentClause";
	}
	
	/*스/프 수정 폼*/
	@RequestMapping(value = "/soupUpdateForm.do")
	public String soupUpdateForm(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam int soupNo) throws UnsupportedEncodingException {
		
		model.addAttribute("soupDetailDto", biz.soupDetail(soupNo));
		
		return "search/soupUpdateForm.tiles";
	}
	
	/*스/프 수정*/
	@RequestMapping(value = "/soupUpdate.do")
	public void soupUpdate(Model model, HttpSession session, MultipartHttpServletRequest MultipartRequest, HttpServletRequest request, HttpServletResponse response, SoupDto soupDto) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MultipartFile upload = MultipartRequest.getFile("upload");
		if(upload!=null && !(upload.getOriginalFilename().equals(""))) {
			MemberDto memberDto = (MemberDto) session.getAttribute("login");
			String orignalFileName = upload.getOriginalFilename();
			String[] fileNameArr = orignalFileName.split("\\.");
			Date date = new Date();
			String fileName = fileNameArr[0] + date.getTime() + "." + fileNameArr[1];
			
			String uploadPath = "D:/JAVA/SpringA/Soup/src/main/webapp/resources/upload/memberVideo/"+memberDto.getMemberNo()+"_"+fileName;
			byte[] bytes;
			try {
				bytes = upload.getBytes();
				File file = new File(uploadPath);
				FileOutputStream fos = new FileOutputStream(file);
				fos.write(bytes);
		        fos.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	        soupDto.setSoupIntroVideo(uploadPath);
		}
		
		int soupUpdateRest = biz.soupUpdate(soupDto);
		
		if(soupUpdateRest>0) {
			try {
				jsResponse("SOUP 수정 완료", "detailForm.do?soupNo="+soupDto.getSoupNo(), response);//detailForm.do?soupNo="+soupDto.getSoupNo()
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'> alert('"+msg+"'); location.href='"+ url +"'</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
		out.close();
	}
	
	public void jsResponseClose(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'> alert('"+msg+"');"+ url +"</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
		out.close();
	}
}
