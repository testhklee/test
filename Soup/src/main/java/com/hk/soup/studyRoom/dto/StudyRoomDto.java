package com.hk.soup.studyRoom.dto;

import java.sql.Date;

public class StudyRoomDto {
	
	private int studyRoomNo;
	private String studyRoomThumbnail;
	private String studyRoomName;
	private String studyRoomPrice;
	private int BusinessNo;
	private String studyRoomContent;
	private String studyRoomAddr1;
	private String studyRoomAddr2;
	private String studyRoomAddr;
	private Date studyRoomDate;
	private int studyRoomHit;
	
	
	
	public StudyRoomDto() {
		super();
	}
	
	public StudyRoomDto(int studyRoomNo, String studyRoomThumbnail, String studyRoomName, String studyRoomPrice,
			int businessNo, String studyRoomContent, String studyRoomAddr1, String studyRoomAddr2, String studyRoomAddr,
			Date studyRoomDate, int studyRoomHit) {
		super();
		this.studyRoomNo = studyRoomNo;
		this.studyRoomThumbnail = studyRoomThumbnail;
		this.studyRoomName = studyRoomName;
		this.studyRoomPrice = studyRoomPrice;
		BusinessNo = businessNo;
		this.studyRoomContent = studyRoomContent;
		this.studyRoomAddr1 = studyRoomAddr1;
		this.studyRoomAddr2 = studyRoomAddr2;
		this.studyRoomAddr = studyRoomAddr;
		this.studyRoomDate = studyRoomDate;
		this.studyRoomHit = studyRoomHit;
	}

	public int getStudyRoomNo() {
		return studyRoomNo;
	}
	public void setStudyRoomNo(int studyRoomNo) {
		this.studyRoomNo = studyRoomNo;
	}
	public String getStudyRoomThumbnail() {
		return studyRoomThumbnail;
	}
	public void setStudyRoomThumbnail(String studyRoomThumbnail) {
		this.studyRoomThumbnail = studyRoomThumbnail;
	}
	public String getStudyRoomName() {
		return studyRoomName;
	}
	public void setStudyRoomName(String studyRoomName) {
		this.studyRoomName = studyRoomName;
	}
	public String getStudyRoomPrice() {
		return studyRoomPrice;
	}
	public void setStudyRoomPrice(String studyRoomPrice) {
		this.studyRoomPrice = studyRoomPrice;
	}
	public int getBusinessNo() {
		return BusinessNo;
	}
	public void setBusinessNo(int businessNo) {
		BusinessNo = businessNo;
	}
	public String getStudyRoomContent() {
		return studyRoomContent;
	}
	public void setStudyRoomContent(String studyRoomContent) {
		this.studyRoomContent = studyRoomContent;
	}
	public String getStudyRoomAddr1() {
		return studyRoomAddr1;
	}
	public void setStudyRoomAddr1(String studyRoomAddr1) {
		this.studyRoomAddr1 = studyRoomAddr1;
	}
	public String getStudyRoomAddr2() {
		return studyRoomAddr2;
	}
	public void setStudyRoomAddr2(String studyRoomAddr2) {
		this.studyRoomAddr2 = studyRoomAddr2;
	}
	public String getStudyRoomAddr() {
		return studyRoomAddr;
	}
	public void setStudyRoomAddr(String studyRoomAddr) {
		this.studyRoomAddr = studyRoomAddr;
	}
	public Date getStudyRoomDate() {
		return studyRoomDate;
	}
	public void setStudyRoomDate(Date studyRoomDate) {
		this.studyRoomDate = studyRoomDate;
	}
	public int getStudyRoomHit() {
		return studyRoomHit;
	}
	public void setStudyRoomHit(int studyRoomHit) {
		this.studyRoomHit = studyRoomHit;
	}
	
	
	
}