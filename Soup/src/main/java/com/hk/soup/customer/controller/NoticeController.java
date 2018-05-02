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
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.soup.customer.dto.NoticeDto;
import com.hk.soup.customer.model.biz.NoticeBiz;
import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.studyRoom.dto.BoardPager;

@Controller
public class NoticeController {

	@Autowired
	private NoticeBiz biz;

	
	@RequestMapping(value = "/noticeList.do")
	public String noticeList(Model model , HttpSession session , @RequestParam(defaultValue="1") int curPage) {

		Object login = session.getAttribute("login");
		
		int count = biz.selectAll().size();
		
		BoardPager boardPager = new BoardPager(count,curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		model.addAttribute("login", login);
		model.addAttribute("noticeList", biz.selectList(start,end));
		model.addAttribute("count", count);
		model.addAttribute("boardPager", boardPager);
		
		return "customerService/notice/notice.tiles";
	}
	
	@RequestMapping(value = "/adminNotice.do")
	public String adminNotice(Model model , HttpSession session , @RequestParam(defaultValue="1") int curPage) {

		int count = biz.selectAll().size();
		
		BoardPager boardPager = new BoardPager(count,curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		model.addAttribute("noticeList", biz.selectList(start,end));
		model.addAttribute("count", count);
		model.addAttribute("boardPager", boardPager);
		
		return "admin/adminNotice.adminTiles";
	}
	
	@RequestMapping(value="/noticeDetail.do")
	public String noticeDetail(Model model, @RequestParam int noticeNo , @ModelAttribute NoticeDto dto, HttpSession session) {
		
		biz.updateHit(dto);
		
		Object login = session.getAttribute("login");
		
		model.addAttribute("login", login);
		
		model.addAttribute("noticeDto", biz.selectOne(noticeNo));
		
		
		return "customerService/notice/noticeDetail.tiles";
		
	}
	
	@RequestMapping(value="/adminNoticeDetail.do")
	public String adminNoticeDetail(Model model, @RequestParam int noticeNo , @ModelAttribute NoticeDto dto, HttpSession session) {
		
		biz.updateHit(dto);
		
		Object login = session.getAttribute("login");
		
		model.addAttribute("login", login);
		
		model.addAttribute("noticeDto", biz.selectOne(noticeNo));
		
		
		return "admin/adminNoticeDetail.adminTiles";
		
	}
	
	@RequestMapping(value="/noticeInsertForm.do")
	public String noticeInsertForm(Model model) {
		
		return "admin/noticeInsertForm.adminTiles";
		
	}
	
	@RequestMapping(value="/noticeInsert.do")
	public void noticeInsert(Model model, @ModelAttribute NoticeDto dto , HttpServletResponse response) throws IOException {
		
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        if(dto.getNoticeContent() == null || dto.getNoticeTitle() == null ||dto.getNoticeContent().equals("")||dto.getNoticeTitle().equals("")) {
			out.println("<script>alert('글이 작성되지 않았습니다.'); history.go(-1);</script>");
            out.close();
		} else {
            int res = biz.insert(dto);
			if(res>0) {
				out.println("<script>alert('글 작성에 성공 하였습니다.');location.href='adminNotice.do';</script>");
	            out.close();
			}else {
				out.println("<script>alert('글 작성에 실패 하였습니다.');location.href='noticeInsertForm.do';</script>");
	            out.close();
			}
		}
       
	}
	
	@RequestMapping(value="/noticeDelete.do")
	public void noticeDelete(Model model, @RequestParam int noticeNo , HttpServletResponse response) throws IOException {
		int res = biz.delete(noticeNo);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		
		if(res>0) {
			out.println("<script>alert('삭제가 완료 되었습니다.');location.href='adminNotice.do';</script>");
            out.close();
		}else {
			out.println("<script>alert('삭제에 실패 하였습니다.');location.href='adminNotice.do';</script>");
            out.close();
		}
		
	}
	
	@RequestMapping(value="/noticeUpdateForm.do")
	public String noticeUpdateForm(Model model , @RequestParam int noticeNo) {
		
		model.addAttribute("noticeDto", biz.selectOne(noticeNo));
		
		return "admin/noticeUpdateForm.adminTiles";
	}
	
	@RequestMapping(value="/noticeUpdate.do")
	public void noticeUpdate(Model model , @ModelAttribute NoticeDto dto , HttpServletResponse response) throws IOException {
		
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        
		if(dto.getNoticeContent() == null || dto.getNoticeTitle() == null ||dto.getNoticeContent().equals("")||dto.getNoticeTitle().equals("")) {
			out.println("<script>alert('글이 작성되지 않았습니다.'); history.go(-1);</script>");
            out.close();
		} else {
			int res = biz.update(dto);
//			업데이트 처리
			if(res>0) {
				out.println("<script>alert('수정에 성공 하였습니다.');location.href='adminNotice.do'</script>");
	            out.close();
			}else {
				out.println("<script>alert('수정에 실패 하였습니다.');location.href='noticeUpdateForm.do'</script>");
	            out.close();
			}
		}
	}

	
	
	
}
