package com.hk.soup.home.dto;

import java.util.Date;

public class MemberDto {

	private int memberNo;							//회원번호
	private String memberEmail;						//회원아이디
	private String memberPw;						//회원비밀번호
	private String memberisTmp;						//임시비밀번호
	private String memberName;						//회원이름
	private String memberTel;						//회원전화번호
	private String memberFace;						//회원얼굴사진
	private String memberGrade;						//회원등급
	private String memberEna;						//회원탈퇴유무
	private Date memberJoinDate;					//회원가입날짜
	private Date memberDropDate;					//회원탈퇴날짜

	public MemberDto() {
		super();

	}

	public MemberDto(int memberNo, String memberEmail, String memberPw, String memberisTmp, String memberName,
			String memberTel, String memberFace, String memberGrade, String memberEna, Date memberJoinDate,
			Date memberDropDate) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberPw = memberPw;
		this.memberisTmp = memberisTmp;
		this.memberName = memberName;
		this.memberTel = memberTel;
		this.memberFace = memberFace;
		this.memberGrade = memberGrade;
		this.memberEna = memberEna;
		this.memberJoinDate = memberJoinDate;
		this.memberDropDate = memberDropDate;
	}

	



	public MemberDto(String memberEmail, String memberPw, String memberName, String memberTel, String memberFace) {
		super();
		this.memberEmail = memberEmail;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberTel = memberTel;
		this.memberFace = memberFace;
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

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberisTmp() {
		return memberisTmp;
	}

	public void setMemberisTmp(String memberisTmp) {
		this.memberisTmp = memberisTmp;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	public String getMemberFace() {
		return memberFace;
	}

	public void setMemberFace(String memberFace) {
		this.memberFace = memberFace;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberEna() {
		return memberEna;
	}

	public void setMemberEna(String memberEna) {
		this.memberEna = memberEna;
	}

	public Date getMemberJoinDate() {
		return memberJoinDate;
	}

	public void setMemberJoinDate(Date memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}

	public Date getMemberDropDate() {
		return memberDropDate;
	}

	public void setMemberDropDate(Date memberDropDate) {
		this.memberDropDate = memberDropDate;
	}
	
	
}


