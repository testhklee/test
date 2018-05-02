package com.hk.soup.soup.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.soup.soup.project.dto.ProjectActivityDto;
import com.hk.soup.soup.project.dto.ProjectBoardDateDto;
import com.hk.soup.soup.project.dto.ProjectBoardDto;
import com.hk.soup.soup.project.dto.ProjectChecklistDto;
import com.hk.soup.soup.project.dto.ProjectInfoDto;

@Repository
public class ProjectManageDaoImpl implements ProjectManageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.projectManage.";
	
	@Override
	public List<ProjectBoardDto> selectProjectBoardList(Map<String, String> in) {
		return sqlSession.selectList(nameSpace + "selectProjectBoardList", in);
	}

	@Override
	public List<ProjectChecklistDto> selectChecklistList(Map<String, Integer> in) {
		return sqlSession.selectList(nameSpace + "selectChecklistList", in);
	}

	@Override
	public ProjectInfoDto selectProjectInfo(Map<String, Integer> in) {
		return sqlSession.selectOne(nameSpace + "selectProjectInfo", in);
	}

	@Override
	public List<ProjectActivityDto> selectProjectActivityList(Map<String, Integer> in) {
		return sqlSession.selectList(nameSpace + "selectProjectActivityList", in);
	}

	@Override
	public int updateProjectBoardOrder(Map<String, String> in) {
		return sqlSession.update(nameSpace + "updateProjectBoardOrder", in);
	}

	@Override
	public int selectprojectManageBoardNo(Map<String, String> in) {
		return sqlSession.selectOne(nameSpace + "selectprojectManageBoardNo", in);
	}

	@Override
	public int insertProjectManageBoard(ProjectBoardDto projectBoardDto) {
		return sqlSession.insert(nameSpace + "insertProjectManageBoard", projectBoardDto);
	}

	@Override
	public int selectProjectBoardNo(ProjectBoardDto projectBoardDto) {
		return sqlSession.selectOne(nameSpace + "selectProjectBoardNo", projectBoardDto);
	}

	@Override
	public int deleteProjectManageBoard(Map<String, Integer> in) {
		return sqlSession.delete(nameSpace + "deleteProjectManageBoard", in);
	}

	@Override
	public ProjectBoardDto selectProjectBoard(Map<String, Integer> in) {
		return sqlSession.selectOne(nameSpace + "selectProjectBoard", in);
	}

	@Override
	public List<ProjectBoardDateDto> selectProjectBoardDateList(Map<String, Integer> in) {
		return sqlSession.selectList(nameSpace + "selectProjectBoardDateList", in);
	}

	@Override
	public int updateProjectBoard(ProjectBoardDto projectBoard) {
		return sqlSession.update(nameSpace + "updateProjectBoard", projectBoard);
	}

	@Override
	public int insertProjectActivity(Map<String, String> in) {
		return sqlSession.insert(nameSpace + "insertProjectActivity", in);
	}
	
}
