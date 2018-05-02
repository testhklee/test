package com.hk.soup.soup.project.dto;

import java.util.Date;
import java.util.List;

public class ProjectBoardDto {
	
	private int projectBoardNo;
	private int projectBoardOrder;
	private int soupNo;
	private int memberNo;
	private String memberName;
	private String projectBoardTitle;
	private String projectBoardContent;
	private String projectBoardGubun;
	private String projectBoardScope;
	private String projectBoardFixed;
	private Date projectBoardStartDate;
	private Date projectBoardEndDate;
	private String projectBoardFileName;
	private String projectBoardFileUrl;
	private String projectBoardChecklistName;
	private List<ProjectChecklistDto> projectChecklistContents;
	
	public ProjectBoardDto() {}

	public ProjectBoardDto(int projectBoardNo, int projectBoardOrder, int soupNo, int memberNo, String memberName,
			String projectBoardTitle, String projectBoardContent, String projectBoardGubun, String projectBoardScope,
			String projectBoardFixed, Date projectBoardStartDate, Date projectBoardEndDate, String projectBoardFileName,
			String projectBoardFileUrl, String projectBoardChecklistName,
			List<ProjectChecklistDto> projectChecklistContents) {
		super();
		this.projectBoardNo = projectBoardNo;
		this.projectBoardOrder = projectBoardOrder;
		this.soupNo = soupNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.projectBoardTitle = projectBoardTitle;
		this.projectBoardContent = projectBoardContent;
		this.projectBoardGubun = projectBoardGubun;
		this.projectBoardScope = projectBoardScope;
		this.projectBoardFixed = projectBoardFixed;
		this.projectBoardStartDate = projectBoardStartDate;
		this.projectBoardEndDate = projectBoardEndDate;
		this.projectBoardFileName = projectBoardFileName;
		this.projectBoardFileUrl = projectBoardFileUrl;
		this.projectBoardChecklistName = projectBoardChecklistName;
		this.projectChecklistContents = projectChecklistContents;
	}

	public int getProjectBoardNo() {
		return projectBoardNo;
	}

	public void setProjectBoardNo(int projectBoardNo) {
		this.projectBoardNo = projectBoardNo;
	}

	public int getProjectBoardOrder() {
		return projectBoardOrder;
	}

	public void setProjectBoardOrder(int projectBoardOrder) {
		this.projectBoardOrder = projectBoardOrder;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getProjectBoardTitle() {
		return projectBoardTitle;
	}

	public void setProjectBoardTitle(String projectBoardTitle) {
		this.projectBoardTitle = projectBoardTitle;
	}

	public String getProjectBoardContent() {
		return projectBoardContent;
	}

	public void setProjectBoardContent(String projectBoardContent) {
		this.projectBoardContent = projectBoardContent;
	}

	public String getProjectBoardScope() {
		return projectBoardScope;
	}

	public void setProjectBoardScope(String projectBoardScope) {
		this.projectBoardScope = projectBoardScope;
	}

	public String getProjectBoardFixed() {
		return projectBoardFixed;
	}

	public void setProjectBoardFixed(String projectBoardFixed) {
		this.projectBoardFixed = projectBoardFixed;
	}

	public Date getProjectBoardStartDate() {
		return projectBoardStartDate;
	}

	public void setProjectBoardStartDate(Date projectBoardStartDate) {
		this.projectBoardStartDate = projectBoardStartDate;
	}

	public Date getProjectBoardEndDate() {
		return projectBoardEndDate;
	}

	public void setProjectBoardEndDate(Date projectBoardEndDate) {
		this.projectBoardEndDate = projectBoardEndDate;
	}

	public String getProjectBoardFileName() {
		return projectBoardFileName;
	}

	public void setProjectBoardFileName(String projectBoardFileName) {
		this.projectBoardFileName = projectBoardFileName;
	}

	public String getProjectBoardFileUrl() {
		return projectBoardFileUrl;
	}

	public void setProjectBoardFileUrl(String projectBoardFileUrl) {
		this.projectBoardFileUrl = projectBoardFileUrl;
	}

	public String getProjectBoardChecklistName() {
		return projectBoardChecklistName;
	}

	public void setProjectBoardChecklistName(String projectBoardChecklistName) {
		this.projectBoardChecklistName = projectBoardChecklistName;
	}

	public List<ProjectChecklistDto> getProjectChecklistContents() {
		return projectChecklistContents;
	}

	public void setProjectChecklistContents(List<ProjectChecklistDto> projectChecklistContents) {
		this.projectChecklistContents = projectChecklistContents;
	}

	public String getProjectBoardGubun() {
		return projectBoardGubun;
	}

	public void setProjectBoardGubun(String projectBoardGubun) {
		this.projectBoardGubun = projectBoardGubun;
	}

	public int getSoupNo() {
		return soupNo;
	}

	public void setSoupNo(int soupNo) {
		this.soupNo = soupNo;
	}

	@Override
	public String toString() {
		return "ProjectBoardDto [projectBoardNo=" + projectBoardNo + ", projectBoardOrder=" + projectBoardOrder
				+ ", soupNo=" + soupNo + ", memberNo=" + memberNo + ", memberName=" + memberName
				+ ", projectBoardTitle=" + projectBoardTitle + ", projectBoardContent=" + projectBoardContent
				+ ", projectBoardGubun=" + projectBoardGubun + ", projectBoardScope=" + projectBoardScope
				+ ", projectBoardFixed=" + projectBoardFixed + ", projectBoardStartDate=" + projectBoardStartDate
				+ ", projectBoardEndDate=" + projectBoardEndDate + ", projectBoardFileName=" + projectBoardFileName
				+ ", projectBoardFileUrl=" + projectBoardFileUrl + ", projectBoardChecklistName="
				+ projectBoardChecklistName + ", projectChecklistContents=" + projectChecklistContents + "]";
	}
	
}
