package com.hk.soup.studyRoom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

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

import org.springframework.web.multipart.MultipartFile;

import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.studyRoom.dto.BoardPager;
import com.hk.soup.studyRoom.dto.StudyRoomDto;
import com.hk.soup.studyRoom.model.biz.StudyRoomAPIBiz;
import com.hk.soup.studyRoom.model.biz.StudyRoomBiz;

@Controller
public class RoomController {

	
	@Autowired
	private StudyRoomAPIBiz APIbiz;
	@Autowired
	private StudyRoomBiz biz;


	@RequestMapping(value="/studyRoom.do")
	public String studyRoom(Model model , @RequestParam(defaultValue="1") int curPage) {
		 // 레코드의 갯수 계산
	    int count = biz.selectList().size();
	    
	    // 페이지 나누기 관련 처리
	    BoardPager boardPager = new BoardPager(count, curPage);
	    int start = boardPager.getPageBegin();
	    int end = boardPager.getPageEnd();
	    
		model.addAttribute("list", biz.selectAll(start,end));
		model.addAttribute("count", count);
		model.addAttribute("boardPager", boardPager);
		
		return "studyRoom/studyRoom.tiles";
	}
	
	@RequestMapping(value="studyRoomSearch.do")
	public String studyRoomSearch(Model model, @RequestParam(defaultValue="all") String searchOption,
            @RequestParam(defaultValue="") String keyword,
            @RequestParam(defaultValue="1") int curPage) {
		 // 레코드의 갯수 계산
	    int count = biz.countArticle(searchOption, keyword);
	    
	    // 페이지 나누기 관련 처리
	    BoardPager boardPager = new BoardPager(count, curPage);
	    int start = boardPager.getPageBegin();
	    int end = boardPager.getPageEnd();
	    
	    model.addAttribute("list", biz.selectSearch(start, end, searchOption, keyword));
	    model.addAttribute("count", count);
	    model.addAttribute("searchOption", searchOption);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("boardPager", boardPager);
		
		return "studyRoom/studyRoom.tiles";
	}
	
	@RequestMapping(value="studyRoomInsertForm.do")
	public String studyRoomInsertform( HttpSession session , HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		if(session.getAttribute("login") != null) {
			MemberDto login = (MemberDto) session.getAttribute("login");
			if(login.getMemberGrade().equals("USER")) {
				out.println("<script>alert('권한이 없습니다.'); window.location.replace('home.do');</script>");
	            out.close();
			}
		}else {
			out.println("<script>alert('권한이 없습니다.'); window.location.replace('home.do');</script>");
            out.close();
		}
		
		
		
		return "studyRoom/studyRoomInsert.tiles";
	}
	
	@RequestMapping(value="studyRoomInsert.do", method = {RequestMethod.GET, RequestMethod.POST}, headers = "content-type=multipart/form-data")
	public void studyRoomInsert(Model model, @ModelAttribute StudyRoomDto dto, HttpServletRequest request,
			HttpServletResponse response, @RequestParam("file") MultipartFile file) throws IOException {

		OutputStream out = null;
		OutputStream out2 = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 

        	
        String orignalFileName = file.getOriginalFilename();
        String[] fileNameArr = orignalFileName.split("\\.");
        Date date = new Date();
        String fileName = fileNameArr[0] +date.getTime()+"."+fileNameArr[1];
        byte[] bytes = file.getBytes();
        
       
        String defaultPath = request.getRealPath("/");
        defaultPath += "resources\\upload\\apply\\"+fileName;
        /*String uploadPath ="D:\\Spring_Workspace\\Soup\\src\\main\\webapp\\resources\\upload\\studyRoom\\"+fileName;*/
        String uploadPath = "D:\\JAVA\\SpringA\\Soup\\src\\main\\webapp\\resources\\upload\\studyRoom\\"+fileName;
        
        out = new FileOutputStream(new File(uploadPath));
        out.write(bytes);
        out2 = new FileOutputStream(new File(defaultPath));
        out2.write(bytes);
        
        out.close();
        out2.close();
        
       /* String callback = request.getParameter("CKEditorFuncNum");
        printWriter = response.getWriter();
        
        String script = "<script>window.parent.CKEDITOR.tools.callFunction("+callback+", 'resources/upload/"+fileName+"', '�씠誘몄�瑜� �뾽濡쒕뱶 �뻽�뒿�땲�떎.')</script>";
        
        printWriter.println(script);
        
        printWriter.close();
        out.close();*/
        
        
        dto.setStudyRoomThumbnail("resources\\upload\\studyRoom\\"+fileName);
            
		
		int res = biz.insert(dto);
		
		
		
		model.addAttribute("list", biz.selectAll(1,9));
		
		if(res>0) {
			response.sendRedirect("studyRoom.do");
		}else {
			response.sendRedirect("studyRoomInsertForm.do");
		}
		
	}
	
	@RequestMapping(value="localList.do")
	public String localList(Model model, @RequestParam(required=false) String keyword) {
		if(keyword != null) {
			try {
				model.addAttribute("localList", APIbiz.searchLocal(keyword, 10, 1));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		return "studyRoom/localList";
	}
	
	@RequestMapping(value = "Upload.do", method = RequestMethod.POST)
    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
    		@RequestParam MultipartFile upload) throws IOException {
		
		
        OutputStream out = null;
        OutputStream out2 = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        	
        String orignalFileName = upload.getOriginalFilename();
        String[] fileNameArr = orignalFileName.split("\\.");
        Date date = new Date();
        String fileName = fileNameArr[0] +date.getTime()+"."+fileNameArr[1];//泥⑤��뙆�씪�씠由�
        byte[] bytes = upload.getBytes();
        
        String defaultPath = request.getRealPath("/");
        defaultPath += "resources\\upload\\apply\\"+fileName;
        /*String uploadPath = "D:\\Spring_Workspace\\Soup\\src\\main\\webapp\\resources\\upload\\ckeditor\\"+fileName;*/
        String uploadPath = "D:\\JAVA\\SpringA\\Soup\\src\\main\\webapp\\resources\\upload\\ckeditor\\"+fileName;
        
        out = new FileOutputStream(new File(uploadPath));
        out.write(bytes);
        out2 = new FileOutputStream(new File(defaultPath));
        out2.write(bytes);
        out.close();
        out2.close();
        
        
        String callback = request.getParameter("CKEditorFuncNum");
        printWriter = response.getWriter();
        
        String script = "<script>window.parent.CKEDITOR.tools.callFunction("+callback+", 'resources/upload/ckeditor/"+fileName+"', '업로드에 성공하였습니다.')</script>";
        
        printWriter.println(script);
        
        printWriter.close();
            
 
    }
	
	@RequestMapping(value="/studyRoomDetail.do")
	public String studyRoomDetail(Model model, @RequestParam int studyRoomNo) {
		
		model.addAttribute("studyRoom",biz.selectOne(studyRoomNo));
		
		return "studyRoom/studyRoomDetail.tiles";
	}
	
	

}
