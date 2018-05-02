package com.hk.soup.soup.study.dto;

import java.util.Date;

public class StudyCurriculumDto {
	
	private int soupNo;
	private int curiNo;
	private String title;
	private Date dateClose;
	
	public StudyCurriculumDto() {
		super();
	}

	public StudyCurriculumDto(int soupNo, int curiNo, String title, Date dateClose) {
		super();
		this.soupNo = soupNo;
		this.curiNo = curiNo;
		this.title = title;
		this.dateClose = dateClose;
	}

	public int getSoupNo() {
		return soupNo;
	}

	public void setSoupNo(int soupNo) {
		this.soupNo = soupNo;
	}

	public int getCuriNo() {
		return curiNo;
	}

	public void setCuriNo(int curiNo) {
		this.curiNo = curiNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDateClose() {
		return dateClose;
	}

	public void setDateClose(Date dateClose) {
		this.dateClose = dateClose;
	}
	
}
