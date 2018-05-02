package com.hk.soup.message.dto;

public class MessageReceiverDto {

	private int memberNo;
	private String memberEmail;
	private String memberName;
	
	public MessageReceiverDto() {}
	
	public MessageReceiverDto(int memberNo, String memberEmail, String memberName) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberName = memberName;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
}
