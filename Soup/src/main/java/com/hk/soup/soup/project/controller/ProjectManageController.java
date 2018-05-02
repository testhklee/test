package com.hk.soup.soup.project.controller;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.soup.model.biz.SoupBiz;
import com.hk.soup.soup.project.dto.ProjectBoardDto;
import com.hk.soup.soup.project.model.biz.ProjectManageBiz;

@Controller
public class ProjectManageController {

	@Autowired
	private ProjectManageBiz projectManageBiz;
	@Autowired
	private SoupBiz soupBiz;
	@Autowired
	private Gson gson;
	
	/**
	 * 프로젝트 관리 페이지로 넘어간다
	 * @param model
	 * @param soupNo 해당 프로젝트의 스프넘버
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "projectManage.do")
	public String projectManage(Model model, @RequestParam int soupNo, HttpSession session) {
		
		if (session.getAttribute("login") == null) {
			return "redirect:home.do";
		}
		
		String soupNoo = String.valueOf(soupNo);
		
		//게시물
		model.addAttribute("projectBoardNoticeList", projectManageBiz.selectProjectBoardList(soupNoo, "NOTICE"));
		model.addAttribute("projectBoardResourceList", projectManageBiz.selectProjectBoardList(soupNoo, "RESOURCE"));
		model.addAttribute("projectBoardTodoList", projectManageBiz.selectProjectBoardList(soupNoo, "TODO"));
		model.addAttribute("projectBoardProgressList", projectManageBiz.selectProjectBoardList(soupNoo, "INPROGRESS"));
		model.addAttribute("projectBoardDoneList", projectManageBiz.selectProjectBoardList(soupNoo, "DONE"));
		
		//팀원+신청인원 불러오기
		model.addAttribute("memberList", soupBiz.selectSoupMemberList(soupNo));
		model.addAttribute("applyList", soupBiz.selectSoupApplyList(soupNo));
		
		//프로젝트 정보 불러오기
		model.addAttribute("projectInfo", projectManageBiz.selectProjectInfo(soupNo));

		//프로젝트 활동내역 불러오기
		model.addAttribute("activityList", projectManageBiz.selectProjectActivityList(soupNo));

		return "user/soup/projectManage.tiles";
	}
	
	/**
	 * 게시물 위치 변경 시 순서 업데이트
	 * @param updateData (게시물 위치에 대한 json)
	 * @return
	 */
	@RequestMapping(value = "projectManageBoardMove.do")
	@ResponseBody
	public void projectManageBoardMove(@RequestParam String updateData) {
		JsonParser parser = new JsonParser();
		JsonObject obj = parser.parse(updateData).getAsJsonObject();
		String target = obj.get("target").getAsString();
		
		if (target.equals("whole")) {
			updateProjectBoardMoveAll(obj.get("todo").getAsJsonObject());
			updateProjectBoardMoveAll(obj.get("inProgress").getAsJsonObject());
			updateProjectBoardMoveAll(obj.get("done").getAsJsonObject());
			
		} else {
			updateProjectBoardMoveAll(obj);
		}
		
	}
	
	/**
	 * 게시물을 추가한다.
	 * @param session
	 * @param projectBoardDto
	 */
	@RequestMapping(value = "insertProjectManagerBoard.do")
	@ResponseBody
	public int insertProjectManageBoard(HttpSession session, ProjectBoardDto projectBoardDto) {
		projectBoardDto.setMemberNo(((MemberDto)session.getAttribute("login")).getMemberNo());
		projectManageBiz.insertProjectManageBoard(projectBoardDto);
		return projectManageBiz.selectProjectBoardNo(projectBoardDto);
	}
	
	@RequestMapping(value = "selectProjectManageBoardNo.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String selectprojectManageBoardNo(@RequestParam String gubun, @RequestParam String order) {
		int projectBoardNo = projectManageBiz.selectprojectManageBoardNo(gubun, order);
		JsonObject result = new JsonObject();
		result.addProperty("projectBoardNo", projectBoardNo);
		
		return gson.toJson(result);
	}
	
	/**
	 * 게시물을 삭제한다.
	 * @param projectBoardNo
	 */
	@RequestMapping(value = "deleteProjectManageBoard.do")
	@ResponseBody
	public void deleteProjectManageBoard(@RequestParam int projectBoardNo) {
		projectManageBiz.deleteProjectManageBoard(projectBoardNo);
	}
	
	private void updateProjectBoardMoveAll(JsonObject obj) {
		String target = obj.get("target").getAsString();
		Set<Map.Entry<String, JsonElement>> entrySet = obj.entrySet();
		
		for (Map.Entry<String, JsonElement> entry : entrySet) {
			//json에 담겨 있는 모든 게시물 업데이트
			if (!entry.getKey().equals("target")) {
				projectManageBiz.updateProjectBoardOrder(entry.getKey(), entry.getValue().getAsString(), target);
			}
			
		}
	}
	
	/**
	 * 프로젝트게시물 상세 클릭시 게시물 파일 가져온다
	 * @param projectBoardNo
	 * @return
	 */
	@RequestMapping(value = "selectProjectBoard.do",  produces = "application/json; charset=utf8")
	@ResponseBody
	public String selectProjectBoard(@RequestParam int projectBoardNo) {
		return gson.toJson(projectManageBiz.selectProjectBoard(projectBoardNo));
	}
	
	/**
	 * full calendar에 쓰이는 일정을 가져온다.
	 * @param soupNo
	 * @return
	 */
	@RequestMapping(value = "fullCalendar.do",  produces = "application/json; charset=utf8")
	@ResponseBody
	public String fullCalendar(@RequestParam int soupNo) {
		return gson.toJson(projectManageBiz.selectProjectBoardDateList(soupNo));
	}
	
	/**
	 * 프로젝트 관리 게시물 수정
	 * @param projectBoard
	 */
	@RequestMapping(value = "updateProjectBoard.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateProjectBoard(ProjectBoardDto projectBoard) {
		projectManageBiz.updateProjectBoard(projectBoard);
	}
	
	/**
	 * 팀 채팅방에 들어간다
	 * @param session
	 * @param soupNo
	 * @return
	 */
	@RequestMapping(value = "teamChat.do", method = RequestMethod.POST)
	public String teamChat(HttpSession session, @RequestParam int soupNo) {
		session.setAttribute("chatSoupNo", soupNo);
		return "user/soup/teamChat";
	}
	
	@RequestMapping(value = "insertProjectActivity.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertProjectActivity(@RequestParam String soupNo, @RequestParam String memberNo, @RequestParam String content) {
		projectManageBiz.insertProjectActivity(soupNo, memberNo, content);
	}
	
}
