package com.hk.soup.soup.study.dto;

import java.util.Date;

public class StudyBoardDto {
	
	private int memberNo;
	private int soupNo;
	private String title;
	private String contents;
	private int boardNo;
	private Date dateCreated;
	private String name;
	private String noticeCheck;
	private int hits;
	private String fileName;
	private String fileRoute;
	private String enable;
	
	public StudyBoardDto() {
		super();
	}

	public StudyBoardDto(int memberNo, int soupNo, String title, String contents, int boardNo, String name) {
		super();
		this.memberNo = memberNo;
		this.soupNo = soupNo;
		this.title = title;
		this.contents = contents;
		this.boardNo = boardNo;
		this.name = name;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getSoupNo() {
		return soupNo;
	}

	public void setSoupNo(int soupNo) {
		this.soupNo = soupNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNoticeCheck() {
		return noticeCheck;
	}

	public void setNoticeCheck(String noticeCheck) {
		this.noticeCheck = noticeCheck;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRoute() {
		return fileRoute;
	}

	public void setFileRoute(String fileRoute) {
		this.fileRoute = fileRoute;
	}

	public String getEnable() {
		return enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
	}
	
}
