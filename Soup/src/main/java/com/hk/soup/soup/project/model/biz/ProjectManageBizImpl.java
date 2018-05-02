package com.hk.soup.soup.project.model.biz;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.soup.soup.project.dto.ProjectActivityDto;
import com.hk.soup.soup.project.dto.ProjectBoardDateDto;
import com.hk.soup.soup.project.dto.ProjectBoardDto;
import com.hk.soup.soup.project.dto.ProjectChecklistDto;
import com.hk.soup.soup.project.dto.ProjectInfoDto;
import com.hk.soup.soup.project.model.dao.ProjectManageDao;

@Service
public class ProjectManageBizImpl implements ProjectManageBiz {

	@Autowired
	private ProjectManageDao dao;

	/**
	 * 프로젝트 관리 페이지의 게시물 리스트를 가져온다
	 */
	@Override
	@Transactional
	public List<ProjectBoardDto> selectProjectBoardList(String soupNo, String gubun) {
		Map<String, String> in = new HashMap<String, String>();
		in.put("soupNo", soupNo);
		in.put("gubun", gubun);
		
		List<ProjectBoardDto> projectBoardList = dao.selectProjectBoardList(in);
		
		return projectBoardList;
	}

	@Override
	@Transactional
	public List<ProjectChecklistDto> selectChecklistList(int projectBoardNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("projectBoardNo", projectBoardNo);
		
		return dao.selectChecklistList(in);
	}

	@Override
	@Transactional
	public ProjectInfoDto selectProjectInfo(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		
		return dao.selectProjectInfo(in);
	}

	@Override
	@Transactional
	public List<ProjectActivityDto> selectProjectActivityList(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		
		return dao.selectProjectActivityList(in);
	}

	@Override
	@Transactional
	public int updateProjectBoardOrder(String projectBoardNo, String projectBoardOrder, String projectBoardGubun) {
		Map<String, String> in = new HashMap<String, String>();
		in.put("projectBoardNo", projectBoardNo);
		in.put("projectBoardOrder", projectBoardOrder);
		in.put("projectBoardGubun", projectBoardGubun.toUpperCase());

		return dao.updateProjectBoardOrder(in);
	}

	@Override
	@Transactional
	public int selectprojectManageBoardNo(String gubun, String order) {
		Map<String, String> in = new HashMap<String, String>();
		in.put("gubun", gubun);
		in.put("order", order);

		return dao.selectprojectManageBoardNo(in);
	}

	@Override
	@Transactional
	public int insertProjectManageBoard(ProjectBoardDto projectBoardDto) {
		return dao.insertProjectManageBoard(projectBoardDto);
	}

	@Override
	@Transactional
	public int selectProjectBoardNo(ProjectBoardDto projectBoardDto) {
		return dao.selectProjectBoardNo(projectBoardDto);
	}

	@Override
	@Transactional
	public int deleteProjectManageBoard(int projectBoardNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("projectBoardNo", projectBoardNo);
		
		return dao.deleteProjectManageBoard(in);
	}

	@Override
	@Transactional
	public ProjectBoardDto selectProjectBoard(int projectBoardNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("projectBoardNo", projectBoardNo);
		ProjectBoardDto projectBoard = dao.selectProjectBoard(in);

		if (projectBoard.getProjectBoardChecklistName() != null) {
			projectBoard.setProjectChecklistContents(selectChecklistList(projectBoardNo));
		}
		
		return projectBoard;
	}

	@Override
	@Transactional
	public List<ProjectBoardDateDto> selectProjectBoardDateList(int soupNo) {
		Map<String, Integer> in = new HashMap<String, Integer>();
		in.put("soupNo", soupNo);
		
		return dao.selectProjectBoardDateList(in);
	}

	@Override
	@Transactional
	public int updateProjectBoard(ProjectBoardDto projectBoard) {
		Date start = projectBoard.getProjectBoardStartDate();
		Date end = projectBoard.getProjectBoardEndDate();
		Date compareDate = new Date(110, 0, 1);

		if (compareDate.compareTo(start) == 0) {
			projectBoard.setProjectBoardStartDate(null);
		}
		
		return dao.updateProjectBoard(projectBoard);
	}

	@Override
	@Transactional
	public int insertProjectActivity(String soupNo, String memberNo, String content) {
		Map<String, String> in = new HashMap<String, String>();
		in.put("soupNo", soupNo);
		in.put("memberNo", memberNo);
		in.put("content", content);
		
		return dao.insertProjectActivity(in);
	}

}
