package com.hk.soup.soup.project.model.dao;

import java.util.List;
import java.util.Map;

import com.hk.soup.soup.project.dto.ProjectActivityDto;
import com.hk.soup.soup.project.dto.ProjectBoardDateDto;
import com.hk.soup.soup.project.dto.ProjectBoardDto;
import com.hk.soup.soup.project.dto.ProjectChecklistDto;
import com.hk.soup.soup.project.dto.ProjectInfoDto;

public interface ProjectManageDao {

	public List<ProjectBoardDto> selectProjectBoardList(Map<String, String> in);
	
	public List<ProjectChecklistDto> selectChecklistList(Map<String, Integer> in);
	
	public ProjectInfoDto selectProjectInfo(Map<String, Integer> in);
	
	public List<ProjectActivityDto> selectProjectActivityList(Map<String, Integer> in);
	
	public int updateProjectBoardOrder(Map<String, String> in);
	
	public int selectprojectManageBoardNo(Map<String, String> in);
	
	public int insertProjectManageBoard(ProjectBoardDto projectBoardDto);

	public int selectProjectBoardNo(ProjectBoardDto projectBoardDto);

	public int deleteProjectManageBoard(Map<String, Integer> in);
	
	public ProjectBoardDto selectProjectBoard(Map<String, Integer> in);

	public List<ProjectBoardDateDto> selectProjectBoardDateList(Map<String, Integer> in);

	public int updateProjectBoard(ProjectBoardDto projectBoard);

	public int insertProjectActivity(Map<String, String> in);

}
