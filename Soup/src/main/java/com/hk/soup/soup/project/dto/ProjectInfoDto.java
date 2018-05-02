package com.hk.soup.soup.project.dto;

public class ProjectInfoDto {

	private int leaderNo;
	private String soupStatus;
	private String soupTitle;
	
	public ProjectInfoDto() {}

	public ProjectInfoDto(int leaderNo, String soupStatus, String soupTitle) {
		super();
		this.leaderNo = leaderNo;
		this.soupStatus = soupStatus;
		this.soupTitle = soupTitle;
	}

	public int getLeaderNo() {
		return leaderNo;
	}

	public void setLeaderNo(int leaderNo) {
		this.leaderNo = leaderNo;
	}

	public String getSoupStatus() {
		return soupStatus;
	}

	public void setSoupStatus(String soupStatus) {
		this.soupStatus = soupStatus;
	}

	public String getSoupTitle() {
		return soupTitle;
	}

	public void setSoupTitle(String soupTitle) {
		this.soupTitle = soupTitle;
	}
	
}
