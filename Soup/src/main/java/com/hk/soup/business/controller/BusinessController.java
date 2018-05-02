package com.hk.soup.business.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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

import com.hk.soup.business.model.biz.BusinessBiz;
import com.hk.soup.home.dto.MemberDto;

@Controller
public class BusinessController {
	
	@Autowired
	private BusinessBiz biz;
	
	@RequestMapping(value="/businessOne.do")
	public String businessOne(Model model, @RequestParam int memberNo) {
		
		model.addAttribute("businessDao", biz.selectOne(memberNo));
		
		
		return "admin/businessDetail.adminTiles";
	}

	@RequestMapping(value="businessUpdate.do")
	public void businessUpdate(Model model,  HttpServletResponse response, @RequestParam String businessStatus2 , @RequestParam int [] memberNo2) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		
		String businessStatus [] = businessStatus2.split(",");
		
		for(int i =0 ; i< businessStatus.length;i++) {
			biz.updateBusiness(memberNo2[i], businessStatus[i]);
		}
		
		out.println("<script>alert('수정 완료.'); location.href='adminApplyBusiness.do';</script>");
		out.close();
	}
	
	@RequestMapping(value="businessStatusUpdate.do")
	public void businessStatusUpdate(Model model,HttpServletResponse response,@RequestParam String businessStatus, @RequestParam int memberNo) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        biz.updateBusiness(memberNo, businessStatus);
        
        out.println("<script>alert('수정 완료.'); location.href='adminApplyBusiness.do';</script>");
		out.close();
	}
	
	/*신청*/
	@RequestMapping(value = "/businessApply.do")
	public String businessApply() {
		return "apply/business/businessApply.tiles";
	}
	
	@RequestMapping(value = "/businessCheck.do")
	public void businessCheck(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		MemberDto login = (MemberDto) session.getAttribute("login");
		PrintWriter writer = response.getWriter();
		
		if (login == null) {
			writer.println("<script>alert('로그인 해주세요.'); window.close();</script>");
			writer.close();
		} else {

			int res = biz.selectCheckBusiness(login.getMemberNo());
			
			if (res == 0) {
				writer.println("<script>location.href = 'businessApplyPolicy.do';</script>");
				writer.close();
			} else {
				writer.println("<script>alert('이미 신청했습니다.'); window.close();</script>");
				writer.close();
			}
			
		}
		
		
	}
	
	@RequestMapping(value = "businessApplyPolicy.do")
	public String businessApplyPolicy() {
		return "apply/business/businessApplyPolicy";
	}
	
	@RequestMapping(value = "businessApplyForm.do")
	public String businessApplyForm() {
		return "apply/business/businessApplyForm";
	}
	
	@RequestMapping(value = "businessApplyInsert.do", method = RequestMethod.POST)
	public void businessApplyInsert(@RequestParam String businessDoc, HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		MemberDto login = (MemberDto) session.getAttribute("login");
		PrintWriter writer = response.getWriter();
		
		if (login == null) {
			writer.println("<script>alert('로그인 해주세요.'); window.close();</script>");
			writer.close();
		} else {
			int memberNo = login.getMemberNo();
			int res = biz.selectCheckBusiness(memberNo);
			
			if (res == 0) {
				biz.insertBusinessApply(memberNo, businessDoc);
				writer.println("<script>alert('신청 완료되었습니다.'); window.close();</script>");
				writer.close();
			} else {
				writer.println("<script>alert('이미 신청했습니다.'); window.close();</script>");
				writer.close();
			}
			
		}
		
	}
	
	@RequestMapping(value = "businessApplyInsertCK.do", method = RequestMethod.POST)
	public void businessApplyInsertCK(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		OutputStream out1 = null;
		OutputStream out2 = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        	
        String orignalFileName = upload.getOriginalFilename();
        String[] fileNameArr = orignalFileName.split("\\.");
        Date date = new Date();
        String fileName = fileNameArr[0] +date.getTime()+"."+fileNameArr[1];
        byte[] bytes = upload.getBytes();
        
        String realPath = request.getRealPath("/");
        realPath += "resources\\upload\\apply\\" + fileName;

        String uploadPath = "D:\\JAVA\\SpringA\\Soup\\src\\main\\webapp\\resources\\upload\\apply\\"+fileName;
        
        out1 = new FileOutputStream(new File(uploadPath));
        out1.write(bytes);
        out2 = new FileOutputStream(new File(realPath));
        out2.write(bytes);
        
        out1.close();
        out2.close();
        
        String callback = request.getParameter("CKEditorFuncNum");
        printWriter = response.getWriter();
        
        String script = "<script>window.parent.CKEDITOR.tools.callFunction("+callback+", 'resources/upload/apply/"+fileName+"', '업로드에 성공하였습니다.')</script>";
        
        printWriter.println(script);
        
        printWriter.close();
       
	}
	
	@RequestMapping(value = "/teacherApply.do")
	public String teacherApply() {
		return "apply/teacher/teacherApply.tiles";
	}
	
	@RequestMapping(value = "/teacherApplyPolicy.do")
	public String teacherApplyPolicy() {
		return "apply/teacher/teacherApplyPolicy";
	}
	
	@RequestMapping(value = "/teacherCheck.do")
	public void teacherCheck(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		MemberDto login = (MemberDto) session.getAttribute("login");
		PrintWriter writer = response.getWriter();
		
		if (login == null) {
			writer.println("<script>alert('로그인 해주세요.'); window.close();</script>");
			writer.close();
		} else {

			int res = biz.selectCheckTeacher(login.getMemberNo());
			
			if (res == 0) {
				writer.println("<script>location.href = 'teacherApplyPolicy.do';</script>");
				writer.close();
			} else {
				writer.println("<script>alert('이미 신청했습니다.'); window.close();</script>");
				writer.close();
			}
			
		}
		
	}
	
	@RequestMapping(value = "teacherApplyForm.do")
	public String teacherApplyForm() {
		return "apply/teacher/teacherApplyForm";
	}
	
	@RequestMapping(value = "teacherApplyInsert.do", method = RequestMethod.POST)
	public void teacherApplyInsert(@RequestParam String teacherDd, @RequestParam MultipartFile file, @RequestParam String teacherCertificate, HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		MemberDto login = (MemberDto) session.getAttribute("login");
		PrintWriter writer = response.getWriter();
		
		if (login == null) {
			writer.println("<script>alert('로그인 해주세요.'); window.close();</script>");
			writer.close();
		} else {
			int memberNo = login.getMemberNo();
			int res = biz.selectCheckTeacher(memberNo);
			
			if (res == 0) {
				OutputStream out = null;
				
				String orignalFileName = file.getOriginalFilename();
		        String[] fileNameArr = orignalFileName.split("\\.");
		        Date date = new Date();
		        String fileName = fileNameArr[0] +date.getTime()+"."+fileNameArr[1];
		        byte[] bytes = file.getBytes();

		        String uploardUrl = "D:\\JAVA\\SpringA\\Soup\\src\\main\\webapp\\resources\\upload\\apply\\"+fileName;
		        out = new FileOutputStream(new File(uploardUrl));
		        out.write(bytes);
		        out.close();
		        
		        String fileUrl = "resources/upload/apply/" + fileName;
		        		
				biz.insertTeacherApply(memberNo, teacherDd, teacherCertificate, fileUrl);
				writer.println("<script>alert('신청 완료되었습니다.'); window.close();</script>");
				writer.close();
			} else {
				writer.println("<script>alert('이미 신청했습니다.'); window.close();</script>");
				writer.close();
			}
			
		}
		
	}
	
	@RequestMapping(value = "teacherApplyInsertCK.do", method = RequestMethod.POST)
	public void teacherApplyInsertCK(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		OutputStream out1 = null;
		OutputStream out2 = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        	
        String orignalFileName = upload.getOriginalFilename();
        String[] fileNameArr = orignalFileName.split("\\.");
        Date date = new Date();
        String fileName = fileNameArr[0] +date.getTime()+"."+fileNameArr[1];
        byte[] bytes = upload.getBytes();
        
        String realPath = request.getRealPath("/");
        realPath += "resources\\upload\\apply\\" + fileName;

        String uploadPath = "D:\\JAVA\\SpringA\\Soup\\src\\main\\webapp\\resources\\upload\\apply\\"+fileName;
        
        out1 = new FileOutputStream(new File(uploadPath));
        out1.write(bytes);
        out2 = new FileOutputStream(new File(realPath));
        out2.write(bytes);
        
        out1.close();
        out2.close();
        
        String callback = request.getParameter("CKEditorFuncNum");
        printWriter = response.getWriter();
        
        String script = "<script>window.parent.CKEDITOR.tools.callFunction("+callback+", 'resources/upload/apply/"+fileName+"', '업로드에 성공하였습니다.')</script>";
        
        printWriter.println(script);
        
        printWriter.close();
        
	}
}
