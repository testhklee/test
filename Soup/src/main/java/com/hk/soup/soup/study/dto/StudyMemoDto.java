package com.hk.soup.soup.study.dto;

import java.util.Date;

public class StudyMemoDto {
	
	private int memberNo;
	private int soupNo;
	private String memoContent;
	private Date memoDate;
	
	public StudyMemoDto() {
		super();
	}

	public StudyMemoDto(int memberNo, int soupNo) {
		super();
		this.memberNo = memberNo;
		this.soupNo = soupNo;
	}

	public StudyMemoDto(int memberNo, int soupNo, String memoContent) {
		super();
		this.memberNo = memberNo;
		this.soupNo = soupNo;
		this.memoContent = memoContent;
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

	public String getMemoContent() {
		return memoContent;
	}

	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}

	public Date getMemoDate() {
		return memoDate;
	}

	public void setMemoDate(Date memoDate) {
		this.memoDate = memoDate;
	}
	
}
