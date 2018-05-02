package com.hk.soup.search.dto;

import java.util.Date;

public class SoupDetailDto {

	private int soupNo;					//스/프 번호
	private String soupGubun;			//구분(FS:무료스터디,PS:유료스터디,P:프로젝트)
	private String soupTitle;			//스/프 제목
	private String soupField1;			//분야 대분류
	private String soupField2;			//분야 소분류
	private Date soupRecruitEndDate;	//모집 마감 기간
	private String soupRecruitEndTime; 	//모집 마감 시간
	private String soupContent;			//스프 내용
	private int soupMemberMin;			//최소 인원
	private int soupMemberMax;			//최대 인원
	private String soupAddr1;			//스터디 지역 시/도
	private String soupAddr2;			//스터디 지역 시/군/구
	private Date soupStartDate;			//스/프 시작 날짜
	private Date soupEndDate;			//스/프 종료 날짜
	private String soupDay;				//스터디 요일
	private String soupStartTime;		//스터디 시작 시간
	private String soupEndTime;			//스터디 끝 시간
	private int soupPrice;				//스터디 비용//유료스터디
	private String soupIntroVideo;		//스/프 영상
	private int memberNo;				//멤버 번호
	private String memberEmail;			//멤버 아이디
	private String memberName;			//멤버 이름
	private String memberFace;			//멤버 사진
	private int teacherNo;			//유료스터디 티쳐번호
	
	
	public SoupDetailDto() {
		super();
	}


	public SoupDetailDto(int soupNo, String soupGubun, String soupTitle, String soupField1, String soupField2,
			Date soupRecruitEndDate, String soupRecruitEndTime, String soupContent, int soupMemberMin,
			int soupMemberMax, String soupAddr1, String soupAddr2, Date soupStartDate, Date soupEndDate, String soupDay,
			String soupStartTime, String soupEndTime, int soupPrice, String soupIntroVideo, int memberNo,
			String memberEmail, String memberName, String memberFace, int teacherNo) {
		super();
		this.soupNo = soupNo;
		this.soupGubun = soupGubun;
		this.soupTitle = soupTitle;
		this.soupField1 = soupField1;
		this.soupField2 = soupField2;
		this.soupRecruitEndDate = soupRecruitEndDate;
		this.soupRecruitEndTime = soupRecruitEndTime;
		this.soupContent = soupContent;
		this.soupMemberMin = soupMemberMin;
		this.soupMemberMax = soupMemberMax;
		this.soupAddr1 = soupAddr1;
		this.soupAddr2 = soupAddr2;
		this.soupStartDate = soupStartDate;
		this.soupEndDate = soupEndDate;
		this.soupDay = soupDay;
		this.soupStartTime = soupStartTime;
		this.soupEndTime = soupEndTime;
		this.soupPrice = soupPrice;
		this.soupIntroVideo = soupIntroVideo;
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberName = memberName;
		this.memberFace = memberFace;
		this.teacherNo = teacherNo;
	}


	public int getSoupNo() {
		return soupNo;
	}


	public void setSoupNo(int soupNo) {
		this.soupNo = soupNo;
	}


	public String getSoupGubun() {
		return soupGubun;
	}


	public void setSoupGubun(String soupGubun) {
		this.soupGubun = soupGubun;
	}


	public String getSoupTitle() {
		return soupTitle;
	}


	public void setSoupTitle(String soupTitle) {
		this.soupTitle = soupTitle;
	}


	public String getSoupField1() {
		return soupField1;
	}


	public void setSoupField1(String soupField1) {
		this.soupField1 = soupField1;
	}


	public String getSoupField2() {
		return soupField2;
	}


	public void setSoupField2(String soupField2) {
		this.soupField2 = soupField2;
	}


	public Date getSoupRecruitEndDate() {
		return soupRecruitEndDate;
	}


	public void setSoupRecruitEndDate(Date soupRecruitEndDate) {
		this.soupRecruitEndDate = soupRecruitEndDate;
	}


	public String getSoupRecruitEndTime() {
		return soupRecruitEndTime;
	}


	public void setSoupRecruitEndTime(String soupRecruitEndTime) {
		this.soupRecruitEndTime = soupRecruitEndTime;
	}


	public String getSoupContent() {
		return soupContent;
	}


	public void setSoupContent(String soupContent) {
		this.soupContent = soupContent;
	}


	public int getSoupMemberMin() {
		return soupMemberMin;
	}


	public void setSoupMemberMin(int soupMemberMin) {
		this.soupMemberMin = soupMemberMin;
	}


	public int getSoupMemberMax() {
		return soupMemberMax;
	}


	public void setSoupMemberMax(int soupMemberMax) {
		this.soupMemberMax = soupMemberMax;
	}


	public String getSoupAddr1() {
		return soupAddr1;
	}


	public void setSoupAddr1(String soupAddr1) {
		this.soupAddr1 = soupAddr1;
	}


	public String getSoupAddr2() {
		return soupAddr2;
	}


	public void setSoupAddr2(String soupAddr2) {
		this.soupAddr2 = soupAddr2;
	}


	public Date getSoupStartDate() {
		return soupStartDate;
	}


	public void setSoupStartDate(Date soupStartDate) {
		this.soupStartDate = soupStartDate;
	}


	public Date getSoupEndDate() {
		return soupEndDate;
	}


	public void setSoupEndDate(Date soupEndDate) {
		this.soupEndDate = soupEndDate;
	}


	public String getSoupDay() {
		return soupDay;
	}


	public void setSoupDay(String soupDay) {
		this.soupDay = soupDay;
	}


	public String getSoupStartTime() {
		return soupStartTime;
	}


	public void setSoupStartTime(String soupStartTime) {
		this.soupStartTime = soupStartTime;
	}


	public String getSoupEndTime() {
		return soupEndTime;
	}


	public void setSoupEndTime(String soupEndTime) {
		this.soupEndTime = soupEndTime;
	}


	public int getSoupPrice() {
		return soupPrice;
	}


	public void setSoupPrice(int soupPrice) {
		this.soupPrice = soupPrice;
	}


	public String getSoupIntroVideo() {
		return soupIntroVideo;
	}


	public void setSoupIntroVideo(String soupIntroVideo) {
		this.soupIntroVideo = soupIntroVideo;
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


	public int getTeacherNo() {
		return teacherNo;
	}


	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

}
