package com.hk.soup.search.dto;

public class SoupJJimDto {

	
	private int soupNo;			//스/프 번호
	private int memberNo;		//멤버 번호
	private String jjimDate;	//찜 날짜
	
	public SoupJJimDto() {
		super();
	}

	public SoupJJimDto(int soupNo, int memberNo, String jjimDate) {
		super();
		this.soupNo = soupNo;
		this.memberNo = memberNo;
		this.jjimDate = jjimDate;
	}

	public int getSoupNo() {
		return soupNo;
	}

	public void setSoupNo(int soupNo) {
		this.soupNo = soupNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getJjimDate() {
		return jjimDate;
	}

	public void setJjimDate(String jjimDate) {
		this.jjimDate = jjimDate;
	}
	
	
}
