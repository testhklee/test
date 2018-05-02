package com.hk.soup.soup.dto;

public class SoupMemberDto {

	private int soupNo;
	private int memberNo;
	private String memberEmail;
	private String memberName;
	private String memberFace;
	private String soupMemberGubun;
	private String soupApplyIntro;
	private String soupMemberStatus;
	
	public SoupMemberDto() {}

	public SoupMemberDto(int soupNo, int memberNo, String memberEmail, String memberName, String memberFace,
			String soupMemberGubun, String soupApplyIntro, String soupMemberStatus) {
		super();
		this.soupNo = soupNo;
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberName = memberName;
		this.memberFace = memberFace;
		this.soupMemberGubun = soupMemberGubun;
		this.soupApplyIntro = soupApplyIntro;
		this.soupMemberStatus = soupMemberStatus;
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

	public String getMemberFace() {
		return memberFace;
	}

	public void setMemberFace(String memberFace) {
		this.memberFace = memberFace;
	}

	public String getSoupMemberGubun() {
		return soupMemberGubun;
	}

	public void setSoupMemberGubun(String soupMemberGubun) {
		this.soupMemberGubun = soupMemberGubun;
	}

	public String getSoupApplyIntro() {
		return soupApplyIntro;
	}

	public void setSoupApplyIntro(String soupApplyIntro) {
		this.soupApplyIntro = soupApplyIntro;
	}

	public String getSoupMemberStatus() {
		return soupMemberStatus;
	}

	public void setSoupMemberStatus(String soupMemberStatus) {
		this.soupMemberStatus = soupMemberStatus;
	}

	
	
}
