package com.hk.soup.soup.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.hk.soup.home.alarm.dto.AlarmDto;
import com.hk.soup.home.alarm.model.biz.AlarmBiz;
import com.hk.soup.home.dto.MemberDto;
import com.hk.soup.message.dto.MessageDto;
import com.hk.soup.message.model.biz.MessageBiz;
import com.hk.soup.soup.model.biz.SoupBiz;
import com.hk.soup.soup.study.dto.StudyBoardDto;
import com.hk.soup.soup.study.dto.StudyCurriculumDto;
import com.hk.soup.soup.study.dto.StudyEvaluateDto;
import com.hk.soup.soup.study.dto.StudyMemoDto;
import com.hk.soup.soup.study.dto.StudyScheduleDto;
import com.hk.soup.soup.study.model.biz.StudyBoardBiz;
import com.hk.soup.soup.study.model.biz.StudyCurriculumBiz;
import com.hk.soup.soup.study.model.biz.StudyEvaluateBiz;
import com.hk.soup.soup.study.model.biz.StudyInfoBiz;
import com.hk.soup.soup.study.model.biz.StudyLeaderNumBiz;
import com.hk.soup.soup.study.model.biz.StudyMemoBiz;
import com.hk.soup.soup.study.model.biz.StudyMyPositionBiz;
import com.hk.soup.soup.study.model.biz.StudyScheduleBiz;
import com.hk.soup.soup.study.model.biz.StudyScheduleSearchApi;

@Controller
public class StudyController {
	
	@Autowired
	private StudyMemoBiz memoBiz;
	@Autowired
	private StudyScheduleBiz scheduleBiz;
	@Autowired
	private StudyScheduleSearchApi SearchApiBiz;
	@Autowired
	private StudyCurriculumBiz curriculumBiz;
	@Autowired
	private StudyEvaluateBiz evaluateBiz;
	@Autowired
	private StudyInfoBiz infoBiz;
	@Autowired
	private SoupBiz studyMemberbiz;
	@Autowired
	private StudyBoardBiz BoardBiz;
	@Autowired
	private StudyMyPositionBiz myPositionBiz;
	@Autowired
	private StudyLeaderNumBiz leaderNumBiz;
	@Autowired
	private AlarmBiz alarmBiz;
	@Autowired
	private MessageBiz messageBiz;

	@RequestMapping(value = "/startmemo.do", method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String startmemo(Model model, HttpSession session, @RequestParam("soup_no") String soupNo) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		StudyMemoDto dto = new StudyMemoDto(memberNo, Integer.parseInt(soupNo));
		
		int res = memoBiz.insert(dto);
		
		if(res > 0) {
			return "성공";
		} else {
			return "실패";
		}
		
	}
	
	@RequestMapping(value = "/updatememo.do", method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String startmemoupdate(Model model, HttpSession session, @RequestParam("soup_no") String soupNo, @RequestParam("memo_content") String memoContent) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		StudyMemoDto dto = new StudyMemoDto(memberNo, Integer.parseInt(soupNo), memoContent);
		
		int res = memoBiz.update(dto);
		
		if(res > 0) {
			return "성공";
		} else {
			return "실패";
		}
		
	}
	
	@RequestMapping(value = "/msgInsert.do", method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public void msgInsert(Model model, HttpSession session, int targetNo, String memberName, String content) {
		MemberDto login = (MemberDto) session.getAttribute("login");
        int messageSenderNo =  login.getMemberNo();
        
        MessageDto message = new MessageDto(messageSenderNo, targetNo, content);
        
        int res = messageBiz.insert(message);
        
    	MessageDto messageDto = messageBiz.selectMessageNo(messageSenderNo);
    	
    	int alarmDetailNo = messageDto.getMessageNo();
    	AlarmDto alarmDto = new AlarmDto();
    	
    	alarmDto.setMemberNo(targetNo);
    	alarmDto.setAlarmContent(messageDto.getMemberName()+"님의 메세지 도착");
    	alarmDto.setAlarmGubun("MESSAGE");
    	alarmDto.setAlarmDetailNo(alarmDetailNo);
    	
    	alarmBiz.insertAlarm(alarmDto);
	}
	
	@RequestMapping(value = "/myStudy.do")
	public String myStudy(Model model, HttpSession session, int soupNo) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		if (session.getAttribute("login") == null) {
			return "redirect:home.do";
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("soupNo", soupNo);
		
		model.addAttribute("memo", memoBiz.load(map));
		model.addAttribute("soupNo", soupNo);
		model.addAttribute("studyInfo", infoBiz.studyInfo(soupNo));
		model.addAttribute("studyMember", studyMemberbiz.selectSoupMemberList(soupNo));
		model.addAttribute("selectSoupApply", studyMemberbiz.selectSoupApplyList(soupNo));
		model.addAttribute("TotalSoupMember", studyMemberbiz.selectTotalSoupMember(soupNo));		
		model.addAttribute("myPosition", myPositionBiz.MyPosition(map));
		
		return "user/soup/myStudyManage.tiles";
	}
	
	@RequestMapping(value = "/studyschedule.do")
	public String schedule(Model model, HttpSession session, @RequestParam("soup_no") int soupNo) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("soupNo", soupNo);
		
		String schedule = "";
		int index = 0;
		
		for(StudyScheduleDto selectAll : scheduleBiz.selectAll(map)) {
			if(index == scheduleBiz.selectAll(map).size()-1) {
				schedule += "{title: '" + selectAll.getStudyScheduleTitle() + "', start: new Date(" + selectAll.getStudyScheduleDday().substring(0, 4) + ", " + String.valueOf(Integer.parseInt(selectAll.getStudyScheduleDday().substring(4, 6))-1) + ", " + selectAll.getStudyScheduleDday().substring(6, 8) + "), constraint: '', allDay: true }";
			}else {
				schedule += "{title: '" + selectAll.getStudyScheduleTitle() + "', start: new Date(" + selectAll.getStudyScheduleDday().substring(0, 4) + ", " + String.valueOf(Integer.parseInt(selectAll.getStudyScheduleDday().substring(4, 6))-1) + ", " + selectAll.getStudyScheduleDday().substring(6, 8) + "), constraint: '', allDay: true }, ";
			}
			
			index++;
		}
		
		model.addAttribute("memo", memoBiz.load(map));
		model.addAttribute("schedule", schedule);
		model.addAttribute("soupNo", soupNo);
		model.addAttribute("myPosition", myPositionBiz.MyPosition(map));
		
		return "user/soup/studyScheduleManage.tiles";
	}
	
	@RequestMapping(value = "/addschedule.do")
	public String addschedule(Model model, HttpSession session, @RequestParam("soup_no") String soupNo, @RequestParam("date") String date, @RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("lat") String lat, @RequestParam("lng") String lng) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		StudyScheduleDto dto = new StudyScheduleDto(date, memberNo, Integer.parseInt(soupNo), title, content, Double.parseDouble(lat), Double.parseDouble(lng));
		
		int res = scheduleBiz.insert(dto);
		
		return "redirect:/studyschedule.do?soup_no=" + soupNo;
	}
	
	@RequestMapping(value = "/updateschedule.do")
	public String updateschedule(Model model, HttpSession session, @RequestParam("soup_no") String soupNo, @RequestParam("date") String date, @RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("lat") String lat, @RequestParam("lng") String lng) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		StudyScheduleDto dto = new StudyScheduleDto(date, memberNo, Integer.parseInt(soupNo), title, content, Double.parseDouble(lat), Double.parseDouble(lng));
		
		int res = scheduleBiz.update(dto);
		
		return "redirect:/studyschedule.do?soup_no=" + soupNo;
	}
	
	@RequestMapping(value = "/delschedule.do", method=RequestMethod.POST)
	public String delschedule(Model model, HttpSession session, @RequestParam("soup_no") String soupNo, @RequestParam("title") String title, @RequestParam("dday") String dday) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		StudyScheduleDto dto = new StudyScheduleDto(dday, memberNo, Integer.parseInt(soupNo), title);
		
		int res = scheduleBiz.delete(dto);
		
		return "redirect:/studyschedule.do?soup_no=" + soupNo;
	}
	
	@RequestMapping(value = "/dateList.do", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String dateList(Model model, HttpSession session, @RequestParam("soup_no") String soupNo, @RequestParam("dday") String dday) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		StudyScheduleDto dto = new StudyScheduleDto(dday, memberNo, Integer.parseInt(soupNo));
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		
		JsonArray jsonArr = new JsonArray();
		JsonObject jsonObjAll = new JsonObject();
		
		for(StudyScheduleDto list : scheduleBiz.dateList(dto)) {
			
			JsonObject jsonObj = new JsonObject();
			
			jsonObj.addProperty("dday", list.getStudyScheduleDday());
			jsonObj.addProperty("title", list.getStudyScheduleTitle());
			jsonObj.addProperty("content", list.getStudyScheduleContent());
			jsonObj.addProperty("writeDate", String.valueOf(format.format(list.getStudyScheduleWriteDate())));
			
			jsonArr.add(jsonObj);
		}
		
		jsonObjAll.add("jsonObjAll", jsonArr.getAsJsonArray());
		
		return jsonObjAll.toString();
	}
	
	@RequestMapping(value = "/dateDetail.do", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String dateDetail(Model model, HttpSession session, @RequestParam("soup_no") String soupNo, @RequestParam("dday") String dday, @RequestParam("title") String title) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		StudyScheduleDto dto = new StudyScheduleDto(dday, memberNo, Integer.parseInt(soupNo), title);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		
		JsonObject jsonObj = new JsonObject();
		
		jsonObj.addProperty("dday", scheduleBiz.dateDetail(dto).getStudyScheduleDday());
		jsonObj.addProperty("title", scheduleBiz.dateDetail(dto).getStudyScheduleTitle());
		jsonObj.addProperty("content", scheduleBiz.dateDetail(dto).getStudyScheduleContent());
		jsonObj.addProperty("writeDate", String.valueOf(format.format(scheduleBiz.dateDetail(dto).getStudyScheduleWriteDate())));
		jsonObj.addProperty("lat", scheduleBiz.dateDetail(dto).getStudyScheduleLatitude());
		jsonObj.addProperty("lng", scheduleBiz.dateDetail(dto).getStudyScheduleLongtude());
		jsonObj.addProperty("ismain", scheduleBiz.dateDetail(dto).getStudyScheduleIsmain());
		
		return jsonObj.toString();
	}
	
	@RequestMapping(value = "/searchAD.do", method=RequestMethod.GET,produces = "application/json; charset=utf8")
	@ResponseBody
	public String searchAD(Model model, HttpSession session, @RequestParam("address") String address) throws UnsupportedEncodingException {
		
		JsonObject jsonObj = new JsonObject();
		
		jsonObj.addProperty("searchAddress", SearchApiBiz.searchResult(address, 1, 1).get(0).getAddress());
		
		return jsonObj.toString();
	}
	
	@RequestMapping(value = "/studyCurriculum.do")
	public String studyCurriculum(Model model, HttpSession session, @RequestParam("soup_no") int soupNo) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("soupNo", soupNo);
		
		model.addAttribute("memo", memoBiz.load(map));
		model.addAttribute("soupNo", soupNo);
		model.addAttribute("curriculumList", curriculumBiz.curriculumList(soupNo));
		model.addAttribute("myPosition", myPositionBiz.MyPosition(map));
		model.addAttribute("completeEvaluat", evaluateBiz.completeEvaluat(soupNo));
				
		return "user/soup/studyCurriculumManage.tiles";
	}
	
	@RequestMapping(value = "/removeCurriculum.do", method=RequestMethod.POST)
	public String removeCurriculum(Model model, HttpSession session, @RequestParam("soup_no") int soupNo, @RequestParam("curi_no") int curiNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("soupNo", soupNo);
		map.put("curiNo", curiNo);
		
		int criRes = curriculumBiz.delCurriculum(map);
		int evalRes = evaluateBiz.delEvaluat(map);
				
		return "redirect:/studyCurriculum.do?soup_no=" + soupNo;
	}
	
	@RequestMapping(value = "/updateMyself.do", method=RequestMethod.POST)
	public String addMyself(Model model, HttpSession session, @RequestParam("soup_no") int soupNo, @RequestParam("curi_no") int curiNo, String[] item, String[] itemVal) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		List<StudyEvaluateDto> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		for(int i=0; i<item.length; i++) {
			
			StudyEvaluateDto dto = new StudyEvaluateDto(memberNo, soupNo, curiNo, item[i], itemVal[i]);
			
			list.add(dto);
		}
		
		map.put("list", list);
		
		int res = evaluateBiz.updateEvaluat(map);
		
		return "redirect:/studyCurriculum.do?soup_no=" + soupNo;
	}
	
	@RequestMapping(value = "/listMyself.do", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String listMyself(Model model, HttpSession session, @RequestParam("soup_no") int soupNo, @RequestParam("curi_no") int curiNo) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		StudyEvaluateDto dto = new StudyEvaluateDto(memberNo, soupNo, curiNo);
		
		JsonArray jsonArr = new JsonArray();
		JsonObject jsonObjAll = new JsonObject();
		
		if(evaluateBiz.evaluatList(dto).size() == 0) {
			dto = new StudyEvaluateDto(leaderNumBiz.leaderNum(), soupNo, curiNo);
			jsonObjAll.addProperty("writeCheck", "N");
		}else {
			jsonObjAll.addProperty("writeCheck", "Y");
		}
		
		for(StudyEvaluateDto list : evaluateBiz.evaluatList(dto)) {
			
			JsonObject jsonObj = new JsonObject();
			
			jsonObj.addProperty("item", list.getItem());
			jsonObj.addProperty("itemVal", list.getItemVal());
			
			jsonArr.add(jsonObj);
		}
		
		jsonObjAll.add("jsonObjAll", jsonArr.getAsJsonArray());
		
		return jsonObjAll.toString();
	}
	
	@RequestMapping(value = "/addsCurriculum.do", method=RequestMethod.POST)
	public String addsCurriculum(Model model, HttpSession session, @RequestParam("soup_no") int soupNo, @RequestParam("curi_no") int curiNo, @RequestParam("curriculum_title") String curriculumTitle, @RequestParam("curriculum_date") String curriculumDate, String[] item, String[] itemVal) throws ParseException {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(curriculumDate);
		
		StudyCurriculumDto curriDto = new StudyCurriculumDto(soupNo, curiNo, curriculumTitle, date);
		
		int curriRes = curriculumBiz.curriculumInsert(curriDto);
		
		List<StudyEvaluateDto> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		for(int i=0; i<item.length; i++) {
			
			StudyEvaluateDto evalDto = new StudyEvaluateDto(memberNo, soupNo, curiNo, item[i], itemVal[i]);
			
			list.add(evalDto);
		}
		
		map.put("list", list);
		
		int evalRes = evaluateBiz.evaluatInsert(map);
		
		return "redirect:/studyCurriculum.do?soup_no=" + soupNo;
	}
	
	@RequestMapping(value = "/addEvaluate.do", method=RequestMethod.POST)
	public String addEvaluate(Model model, HttpSession session, @RequestParam("soup_no") int soupNo, @RequestParam("curi_no") int curiNo, String[] item, String[] itemVal) throws ParseException {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		List<StudyEvaluateDto> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		for(int i=0; i<item.length; i++) {
			
			StudyEvaluateDto evalDto = new StudyEvaluateDto(memberNo, soupNo, curiNo, item[i], itemVal[i]);
			
			list.add(evalDto);
		}
		
		map.put("list", list);
		
		int evalRes = evaluateBiz.evaluatInsert(map);
		
		return "redirect:/studyCurriculum.do?soup_no=" + soupNo;
	}
	
	@RequestMapping(value = "/evaluateChart.do")
	public String evaluateChart(Model model, HttpSession session, @RequestParam("soup_no") int soupNo) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("soupNo", soupNo);
		
		StudyEvaluateDto dto = new StudyEvaluateDto(memberNo, soupNo);
		
		model.addAttribute("memo", memoBiz.load(map));
		model.addAttribute("soupNo", soupNo);
		model.addAttribute("curriculumList", curriculumBiz.curriculumList(soupNo));
		model.addAttribute("evaluateList", evaluateBiz.chartEvaluatList(dto));
		
		List<Object> avgList = new ArrayList<>();
		String curriculum = "";
		String evaluate = "";
		String allChartTitle = "";
		String TotalAvg = "";
		
		for(int i = 0; i < curriculumBiz.curriculumList(soupNo).size(); i++) {
			
			double avg = 0;
			int number = 0;
			
			String eval = "";
			
			for(int j = 0; j < evaluateBiz.chartEvaluatList(dto).size(); j++) {
				
				if(!evaluateBiz.chartEvaluatList(dto).get(j).getItem().equals("코멘트")) {
					
					if(evaluateBiz.chartEvaluatList(dto).get(j).getCuriNo()-1 == i) {
						avg += Integer.parseInt(evaluateBiz.chartEvaluatList(dto).get(j).getItemVal());
						number++;
						if(evaluateBiz.chartEvaluatList(dto).size() == j+1) {
							eval += "[ '" + evaluateBiz.chartEvaluatList(dto).get(j).getItem() + "', " + evaluateBiz.chartEvaluatList(dto).get(j).getItemVal() + "]";
						}else {
							eval += "[ '" + evaluateBiz.chartEvaluatList(dto).get(j).getItem() + "', " + evaluateBiz.chartEvaluatList(dto).get(j).getItemVal() + "],";
						}
						
					}
					
				}
				
			}
			
			if(i == 0) {				
				if(curriculumBiz.curriculumList(soupNo).size() == i+1) {
					allChartTitle += "'" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "'";
					curriculum += "[{name: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', y: " + String.format("%.2f", avg/number) + ", drilldown: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "'}]";
					evaluate += "[{name: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', id: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', data : [ " + eval + " ] }]";
				}else {
					allChartTitle += "'" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "',";
					curriculum += "[{name: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', y: " + String.format("%.2f", avg/number) + ", drilldown: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "'}, ";
					evaluate += "[{name: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', id: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', data : [ " + eval + " ] }, ";
				}
			}else {
				if(curriculumBiz.curriculumList(soupNo).size() == i+1) {
					allChartTitle += "'" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "'";
					curriculum += "{name: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', y: " + String.format("%.2f", avg/number) + ", drilldown: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "'}]";
					evaluate += "{name: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', id: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', data : [ " + eval + " ] }]";
				}else {
					allChartTitle += "'" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "',";
					curriculum += "{name: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', y: " + String.format("%.2f", avg/number) + ", drilldown: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "'}, ";
					evaluate += "{name: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', id: '" + curriculumBiz.curriculumList(soupNo).get(i).getTitle() + "', data : [ " + eval + " ] }, ";
				}
			}
				
			avgList.add(avg/number);
		}
		
		for(int k = 0; k < evaluateBiz.allEvaluatAvg(map).size(); k++) {
			
			if(evaluateBiz.allEvaluatAvg(map).size() == k+1) {
				TotalAvg += evaluateBiz.allEvaluatAvg(map).get(k);
			}else {
				TotalAvg += evaluateBiz.allEvaluatAvg(map).get(k) + ", ";
			}
			
		}
		
		model.addAttribute("curriculum", curriculum);
		model.addAttribute("evaluate", evaluate);
		model.addAttribute("allChartTitle", allChartTitle);
		model.addAttribute("TotalAvg", TotalAvg);
		model.addAttribute("allEvaluatCommentNum", evaluateBiz.allEvaluatCommentNum(map));
		model.addAttribute("allEvaluatComment", evaluateBiz.allEvaluatComment(map));
		return "user/soup/studyEvaluateChartManage.tiles";
	}
	
	@RequestMapping(value = "/studyBoardList.do")
	public String studyBoardList(Model model, HttpSession session, @RequestParam("soup_no") int soupNo) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		if (session.getAttribute("login") == null) {
			return "redirect:home.do";
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("soupNo", soupNo);
		
		model.addAttribute("memo", memoBiz.load(map));
		model.addAttribute("soupNo", soupNo);
			
		return "user/soup/studyBoardListManage.tiles";
	}
	
	@RequestMapping(value = "/jqGridList.do",produces = "application/json; charset=utf8")
	@ResponseBody
	public String jqGridList(Model model, HttpSession session, @RequestParam("soup_no") int soupNo) {
		
		JsonArray jsonArr = new JsonArray();
		JsonObject jsonObjAll = new JsonObject();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		
		for(StudyBoardDto list : BoardBiz.studyBoardList(soupNo)) {
			
			JsonObject jsonObj = new JsonObject();
			
			jsonObj.addProperty("boardNo", list.getBoardNo());
			jsonObj.addProperty("title", list.getTitle());
			jsonObj.addProperty("name", list.getName());
			jsonObj.addProperty("dateCreated", format.format(list.getDateCreated()));
			jsonObj.addProperty("hits", list.getHits());
			
			jsonArr.add(jsonObj);
		}
		
		jsonObjAll.add("jsonObjAll", jsonArr.getAsJsonArray());
		
		return jsonObjAll.toString();
	}
	
	@RequestMapping(value = "/studyBoardWriteForm.do")
	public String studyBoardWriteForm(Model model, HttpSession session, @RequestParam("soup_no") int soupNo) {
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		if (session.getAttribute("login") == null) {
			return "redirect:home.do";
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("soupNo", soupNo);
		
		model.addAttribute("memo", memoBiz.load(map));
		model.addAttribute("soupNo", soupNo);
				
		return "user/soup/studyBoardWriteManage.tiles";
	}
	
	@RequestMapping(value = "/imageUpload.do", method = RequestMethod.POST)
	public void imageupload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws IOException {
		
		OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        	
        String orignalFileName = upload.getOriginalFilename();
        String[] fileNameArr = orignalFileName.split("\\.");
        Date date = new Date();
        String fileName = fileNameArr[0] +date.getTime()+"."+fileNameArr[1];
        byte[] bytes = upload.getBytes();
        
        String defaultPath = request.getRealPath("/");
        //String uploadPath = "D:\\Spring_Workspace\\Soup\\src\\main\\webapp\\resources\\upload\\studyBoard\\"+fileName;
        String uploadPath = "D:\\JAVA\\SpringA\\Soup\\src\\main\\webapp\\resources\\upload\\studyBoard\\"+fileName;
        out = new FileOutputStream(new File(uploadPath));
        out.write(bytes);
        
        String callback = request.getParameter("CKEditorFuncNum");
        printWriter = response.getWriter();
        
        String script = "<script>window.parent.CKEDITOR.tools.callFunction("+callback+", 'resources/upload/studyBoard/"+fileName+"', '업로드에 성공하였습니다.')</script>";
        
        try {
			Thread.sleep(300);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
        
        printWriter.println(script);
        
        printWriter.flush();
        out.flush();
	}
	
	@RequestMapping(value = "/studyBoardWrite.do")
	public String studyBoardWrite(Model model, HttpSession session, @RequestParam("soup_no") int soupNo, @RequestParam String title, @RequestParam String contents) {
		
		int boardNo = 0;
		
		if(BoardBiz.studyBoardList(soupNo).size() == 0) {
			boardNo = 1;
		}else {
			boardNo = BoardBiz.studyBoardList(soupNo).get(0).getBoardNo()+1;			
		}
		
		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		StudyBoardDto dto = new StudyBoardDto(memberNo, soupNo, title, contents, boardNo, ((MemberDto)session.getAttribute("login")).getMemberName());
		
		BoardBiz.studyBoardInsert(dto);
		
		return "redirect:/studyBoardList.do?soup_no=" + soupNo;
	}
	
	@RequestMapping(value = "/studyBoardDetail.do")
	public String studyBoardDetail(Model model, HttpSession session, @RequestParam("soup_no") int soupNo, @RequestParam("board_no") int boardNo) {

		int memberNo = ((MemberDto)session.getAttribute("login")).getMemberNo();
		
		if (session.getAttribute("login") == null) {
			return "redirect:home.do";
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		
		Map<String, Integer> mapMemo = new HashMap<>();
		mapMemo.put("memberNo", memberNo);
		mapMemo.put("soupNo", soupNo);		
		Map<String, Integer> mapHits = new HashMap<>();
		mapHits.put("soupNo", soupNo);
		mapHits.put("boardNo", boardNo);
		
		BoardBiz.studyBoardHit(mapHits);
		
		model.addAttribute("memo", memoBiz.load(mapMemo));
		model.addAttribute("soupNo", soupNo);
		model.addAttribute("BoardDetail", BoardBiz.studyBoardDetail(mapHits));
		model.addAttribute("dateCreated", format.format(BoardBiz.studyBoardDetail(mapHits).getDateCreated()));
		model.addAttribute("myPosition", myPositionBiz.MyPosition(mapMemo));
		
		return "user/soup/studyBoardDetailManage.tiles";
	}
	
	@RequestMapping(value = "/studyBoardDelete.do")
	public String studyBoardDelete(Model model, HttpSession session, @RequestParam("soup_no") int soupNo, @RequestParam("board_no") int boardNo) {
		
		Map<String, Integer> map = new HashMap<>();
		map.put("soupNo", soupNo);
		map.put("boardNo", boardNo);
		
		BoardBiz.studyBoardDelete(map);
		
		return "redirect:/studyBoardList.do?soup_no=" + soupNo;
	}
	
	
		
}
