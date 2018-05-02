package com.hk.soup.soup.study.dto;

public class StudyEvaluateDto {

	private int memberNo;
	private int soupNo;
	private int curiNo;
	private String item;
	private String itemVal;
	
	public StudyEvaluateDto() {
		super();
	}

	public StudyEvaluateDto(int memberNo, int soupNo, int curiNo, String item, String itemVal) {
		super();
		this.memberNo = memberNo;
		this.soupNo = soupNo;
		this.curiNo = curiNo;
		this.item = item;
		this.itemVal = itemVal;
	}
	
	public StudyEvaluateDto(int memberNo, int soupNo, int curiNo) {
		super();
		this.memberNo = memberNo;
		this.soupNo = soupNo;
		this.curiNo = curiNo;
	}
	
	public StudyEvaluateDto(int memberNo, int soupNo) {
		super();
		this.memberNo = memberNo;
		this.soupNo = soupNo;
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

	public int getCuriNo() {
		return curiNo;
	}

	public void setCuriNo(int curiNo) {
		this.curiNo = curiNo;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getItemVal() {
		return itemVal;
	}

	public void setItemVal(String itemVal) {
		this.itemVal = itemVal;
	}
	
}
