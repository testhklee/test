package com.hk.soup.soup.project.dto;

import java.util.Date;

public class ProjectChecklistDto {

	private int projectBoardNo;
	private String projectChecklistContent;
	private String projectChecklistChecked;
	private Date projectChecklistDate;
	
	public ProjectChecklistDto() {
		super();
	}

	public ProjectChecklistDto(int projectBoardNo, String projectChecklistContent, String projectChecklistChecked,
			Date projectChecklistDate) {
		super();
		this.projectBoardNo = projectBoardNo;
		this.projectChecklistContent = projectChecklistContent;
		this.projectChecklistChecked = projectChecklistChecked;
		this.projectChecklistDate = projectChecklistDate;
	}

	public int getProjectBoardNo() {
		return projectBoardNo;
	}

	public void setProjectBoardNo(int projectBoardNo) {
		this.projectBoardNo = projectBoardNo;
	}

	public String getProjectChecklistContent() {
		return projectChecklistContent;
	}

	public void setProjectChecklistContent(String projectChecklistContent) {
		this.projectChecklistContent = projectChecklistContent;
	}

	public String getProjectChecklistChecked() {
		return projectChecklistChecked;
	}

	public void setProjectChecklistChecked(String projectChecklistChecked) {
		this.projectChecklistChecked = projectChecklistChecked;
	}

	public Date getProjectChecklistDate() {
		return projectChecklistDate;
	}

	public void setProjectChecklistDate(Date projectChecklistDate) {
		this.projectChecklistDate = projectChecklistDate;
	}
		
}
