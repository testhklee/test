package com.hk.soup.soup.project.model.biz;

import java.util.List;

import com.hk.soup.soup.project.dto.ProjectActivityDto;
import com.hk.soup.soup.project.dto.ProjectBoardDateDto;
import com.hk.soup.soup.project.dto.ProjectBoardDto;
import com.hk.soup.soup.project.dto.ProjectChecklistDto;
import com.hk.soup.soup.project.dto.ProjectInfoDto;

public interface ProjectManageBiz {

	public List<ProjectBoardDto> selectProjectBoardList(String soupNo, String gubun);
	
	public List<ProjectChecklistDto> selectChecklistList(int projectBoardNo);
	
	public ProjectInfoDto selectProjectInfo(int soupNo);
	
	public List<ProjectActivityDto> selectProjectActivityList(int soupNo);
	
	public int updateProjectBoardOrder(String projectBoardNo, String projectBoardOrder, String projectBoardGubun);
	
	public int selectprojectManageBoardNo(String gubun, String order);
	
	public int insertProjectManageBoard(ProjectBoardDto projectBoardDto);

	public int selectProjectBoardNo(ProjectBoardDto projectBoardDto);

	public int deleteProjectManageBoard(int projectBoardNo);
	
	public ProjectBoardDto selectProjectBoard(int projectBoardNo);

	public List<ProjectBoardDateDto> selectProjectBoardDateList(int soupNo);

	public int updateProjectBoard(ProjectBoardDto projectBoard);

	public int insertProjectActivity(String soupNo, String memberNo, String content);

}
