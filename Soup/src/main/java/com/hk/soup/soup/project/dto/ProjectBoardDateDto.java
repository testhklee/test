package com.hk.soup.soup.project.dto;

import java.util.Date;

public class ProjectBoardDateDto {

	private String title;
	private Date start;
	private Date end;
	
	public ProjectBoardDateDto() {}

	public ProjectBoardDateDto(String title, Date start, Date end) {
		super();
		this.title = title;
		this.start = start;
		this.end = end;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}
	
}
