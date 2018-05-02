package com.hk.soup.search.dto;

public class SoupApplyDto {
	
	private int memberNo;				//멤버 번호
	private int soupNo;					//스/프 번호
	private String soupApplyIntro;		//자기소개
	private String soupApplyEntered;	//스/프 제목
	private String soupApplyDate;		//분야 대분류
	
	public SoupApplyDto() {
		super();
	}
	
	public SoupApplyDto(int memberNo, int soupNo, String soupApplyIntro, String soupApplyEntered,
			String soupApplyDate) {
		super();
		this.memberNo = memberNo;
		this.soupNo = soupNo;
		this.soupApplyIntro = soupApplyIntro;
		this.soupApplyEntered = soupApplyEntered;
		this.soupApplyDate = soupApplyDate;
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
	public String getSoupApplyIntro() {
		return soupApplyIntro;
	}
	public void setSoupApplyIntro(String soupApplyIntro) {
		this.soupApplyIntro = soupApplyIntro;
	}
	public String getSoupApplyEntered() {
		return soupApplyEntered;
	}
	public void setSoupApplyEntered(String soupApplyEntered) {
		this.soupApplyEntered = soupApplyEntered;
	}
	public String getSoupApplyDate() {
		return soupApplyDate;
	}
	public void setSoupApplyDate(String soupApplyDate) {
		this.soupApplyDate = soupApplyDate;
	}

	
}
