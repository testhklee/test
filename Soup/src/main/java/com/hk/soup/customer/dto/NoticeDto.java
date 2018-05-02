package com.hk.soup.customer.dto;

import java.sql.Date;

public class NoticeDto {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int noticeHit;
	
	
	public NoticeDto() {
		super();
	}
	
	
	
	public NoticeDto(int noticeNo) {
		super();
		this.noticeNo = noticeNo;
	}



	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getNoticeHit() {
		return noticeHit;
	}
	public void setNoticeHit(int noticeHit) {
		this.noticeHit = noticeHit;
	}
	
	

}
