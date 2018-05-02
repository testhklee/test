package com.hk.soup.soup.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.soup.dto.MySoupDto;
import com.hk.soup.soup.dto.SoupMaxMemberDto;
import com.hk.soup.soup.dto.SoupReviewDto;
import com.hk.soup.soup.model.biz.SoupBiz;

@Controller
public class SoupController {

	@Autowired
	private SoupBiz biz;
	
	/**
	 * 내 스프 리스트
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "soup.do")
	public String soup(Model model, HttpSession session) {
		if (session.getAttribute("login") == null) {
			return "redirect:home.do";
		} else {
			MemberDto login = (MemberDto) session.getAttribute("login");
			int memberNo = login.getMemberNo();
			List<MySoupDto> mySoupList = biz.selectMySoupList(memberNo);
			List<MySoupDto> doneSoupList = biz.selectDoneSoupList(memberNo);
			model.addAttribute("mySoupList", mySoupList);
			model.addAttribute("doneSoupList", doneSoupList);
			
			return "user/soup/soup.tiles";
		}
	}
	
	/**
	 * 프로젝트 상태를 모집완료로 변경한다.
	 * @param soupNo 스프 번호
	 */
	@RequestMapping(value = "updateSoupStatusToDone.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateSoupStatusToDone(@RequestParam int soupNo) {
		biz.updateSoupStatusToDone(soupNo);
	}
	
	/**
	 * 프로젝트 상태를 폐지로 변경한다.
	 * @param soupNo
	 */
	@RequestMapping(value = "updateSoupStatusToDrop.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateSoupStatusToDrop(@RequestParam int soupNo) {
		biz.updateSoupStatusToDrop(soupNo);
	}
	
	/**
	 * 프로젝트 상태를 종료로 변경한다.
	 * @param soupNo
	 */
	@RequestMapping(value = "updateSoupStatusToEnd.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateSoupStatusToEnd(@RequestParam int soupNo) {
		biz.updateSoupStatusToEnd(soupNo);
	}
	
	/**
	 * 프로젝트에서 나간다
	 * @param soupNo
	 * @param memberNo
	 */
	@RequestMapping(value = "updateProjectMemberDropOut.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateProjectMemberDropOut(@RequestParam int soupNo, @RequestParam int memberNo) {
		biz.updateProjectMemberDropOut(soupNo, memberNo);
	}
	
	/**
	 * 신청자를 받아 들인다.
	 * @param soupNo
	 * @param memberNo
	 */
	@RequestMapping(value = "soupApplyAccept.do", method = RequestMethod.POST)
	@ResponseBody
	public void soupApplyAccept(@RequestParam int soupNo, @RequestParam int memberNo) {
		biz.updateSoupApplyAccept(soupNo, memberNo);
		biz.insertSoupMember(soupNo, memberNo);
		
		SoupMaxMemberDto maxMemberDto = biz.selectTotalSoupMember(soupNo);
		int currentNo = maxMemberDto.getCurrentNo();
		int maxMember = maxMemberDto.getSoupMemberMax();
		
		if (currentNo >= maxMember) {
			updateSoupStatusToDone(soupNo);
		}
			
	}
	
	/**
	 * 신청자 거절
	 * @param soupNo
	 * @param memberNo
	 */
	@RequestMapping(value = "updateSoupApplyReject.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateSoupApplyReject(@RequestParam int soupNo, @RequestParam int memberNo) {
		biz.updateSoupApplyReject(soupNo, memberNo);
	}
	
	/**
	 * 프로젝트 멤버 추방
	 * @param soupNo
	 * @param memberNo
	 */
	@RequestMapping(value = "updateProjectMemberKick.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateProjectMemberKick(@RequestParam int soupNo, @RequestParam int memberNo) {
		biz.updateProjectMemberKick(soupNo, memberNo);
	}
	
	/**
	 * 프로젝트 리더를 바꾼다
	 * @param soupNo
	 * @param memberNo
	 * @param myNo
	 */
	@RequestMapping(value = "updateProjectLeaderPass.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateProjectLeaderPass(@RequestParam int soupNo, @RequestParam int memberNo, @RequestParam int myNo) {
		biz.updateProjectLeaderPass(soupNo, memberNo, myNo);
	}
	
	/**
	 * 기존에 리뷰를 작성했는지 확인 후 리뷰 폼으로 보낸다
	 * @param session
	 * @param response
	 * @param soupNo
	 */
	@RequestMapping(value = "soupReviewWriteCheck.do", method = RequestMethod.POST)
	public void reviewWriteCheck(HttpSession session, HttpServletResponse response, @RequestParam int soupNo) {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = null;

		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MemberDto login = (MemberDto) session.getAttribute("login");
		int memberNo = login.getMemberNo();
		
		if (biz.soupReviewWriteCheck(memberNo, soupNo) > 0) {
			writer.println("<script>alert('이미 후기를 작성한 스프입니다.'); window.close();</script>");
		} else {
			writer.println("<form action='soupReviewWriteForm.do' method='post'>");
			writer.println("<input type='hidden' name='soupNo' value=" + soupNo + ">");
			writer.println("<input type='submit' id='btn' style='display:none;'>");
			writer.println("</form>");
			writer.println("<script>var btn = document.querySelector('#btn'); btn.click();</script>");
		}
		
		writer.close();
		
	}
	
	/**
	 * 리뷰 폼으로 보내준다.
	 * @param soupNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "soupReviewWriteForm.do", method = RequestMethod.POST)
	public String reviewWriteForm(@RequestParam int soupNo, Model model) {
		model.addAttribute("soup", biz.selectSoupReviewTarget(soupNo));
		return "user/soup/soupReview";
	}
	
	/**
	 * 리뷰 insert method
	 * @param soupReview
	 * @param session
	 * @param response
	 */
	@RequestMapping(value = "insertSoupReview.do", method = RequestMethod.POST)
	public void insertReview(SoupReviewDto soupReview, HttpSession session, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");

		MemberDto login = (MemberDto) session.getAttribute("login");
		soupReview.setMemberNo(login.getMemberNo());
		biz.insertSoupReview(soupReview);
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		writer.println("<script>alert('리뷰를 등록했습니다.'); window.close();</script>");
		writer.close();
	}
	
}
