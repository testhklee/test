package com.hk.soup.soup.dto;

public class SoupMaxMemberDto {

	private int currentNo;
	private int soupMemberMax;
	
	public SoupMaxMemberDto() {}
	
	public SoupMaxMemberDto(int currentNo, int soupMemberMax) {
		super();
		this.currentNo = currentNo;
		this.soupMemberMax = soupMemberMax;
	}

	public int getCurrentNo() {
		return currentNo;
	}

	public void setCurrentNo(int currentNo) {
		this.currentNo = currentNo;
	}

	public int getSoupMemberMax() {
		return soupMemberMax;
	}

	public void setSoupMemberMax(int soupMemberMax) {
		this.soupMemberMax = soupMemberMax;
	}
	
}
