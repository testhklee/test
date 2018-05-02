package com.hk.soup.soup.project.dto;

import java.util.Date;

public class ProjectActivityDto {

	private String memberName;
	private String memberFace;
	private String projectActivityContent;
	private Date projectActivityDate;
	
	public ProjectActivityDto() {}
	
	public ProjectActivityDto(String memberName, String memberFace, String projectActivityContent,
			Date projectActivityDate) {
		super();
		this.memberName = memberName;
		this.memberFace = memberFace;
		this.projectActivityContent = projectActivityContent;
		this.projectActivityDate = projectActivityDate;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberFace() {
		return memberFace;
	}

	public void setMemberFace(String memberFace) {
		this.memberFace = memberFace;
	}

	public String getProjectActivityContent() {
		return projectActivityContent;
	}

	public void setProjectActivityContent(String projectActivityContent) {
		this.projectActivityContent = projectActivityContent;
	}

	public Date getProjectActivityDate() {
		return projectActivityDate;
	}

	public void setProjectActivityDate(Date projectActivityDate) {
		this.projectActivityDate = projectActivityDate;
	}
	
}
