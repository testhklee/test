package com.hk.soup.business.dto;

public class BusinessDto {
	
	private int businessNo;
	private int memberNo;
	private String businessDoc;
	private String businessStatus;
	private String memberName;
	private String memberTel;
	private String memberEmail;
	private String memberGrade;
	
	public BusinessDto() {
		
	}
	
	public BusinessDto(int bueinessNo, int memberNo, String businessDoc, String businessStatus , String memberName , String memberTel, String memberEmail,String memberGrade) {
		super();
		this.businessNo = bueinessNo;
		this.memberNo = memberNo;
		this.businessDoc = businessDoc;
		this.businessStatus = businessStatus;
		this.memberName=memberName;
		this.memberTel=memberTel;
		this.memberEmail=memberEmail;
		this.memberGrade=memberGrade;
	}
	
	

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public BusinessDto(String businessStatus, int memberNo) {
		this.businessStatus=businessStatus;
		this.memberNo=memberNo;
	}
	
	public BusinessDto(int memberNo) {
		this.memberNo=memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getBusinessDoc() {
		return businessDoc;
	}

	public void setBusinessDoc(String businessDoc) {
		this.businessDoc = businessDoc;
	}

	public String getBusinessStatus() {
		return businessStatus;
	}

	public void setBusinessStatus(String businessStatus) {
		this.businessStatus = businessStatus;
	}

	public int getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(int businessNo) {
		this.businessNo = businessNo;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
	
	

}
