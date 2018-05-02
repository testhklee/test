package com.hk.soup.search.dto;

public class SoupDto {

	
	private int soupNo;					//스/프 번호
	private String soupGubun;			//구분(FS:무료스터디,PS:유료스터디,P:프로젝트)
	private String soupTitle;			//스/프 제목
	private String soupField1;			//분야 대분류
	private String soupField2;			//분야 소분류
	private String soupRecruitEndDate;	//모집 마감 기간
	private String soupRecruitEndTime;	//모집 마감 기간
	private int soupMemberMin;			//최소 인원
	private int soupMemberMax;			//최대 인원
	private String soupContent;			//내용
	private String soupCreateDate;		//생성 날짜
	private String soupStatus;			//상태(모집중:recruit, 모집완료:done, 폐기 drop, 종료 end)
	private String soupAddr1;			//스터디 지역 시/도
	private String soupAddr2;			//스터디 지역 시/군/구
	private String soupStartDate;			//스/프 시작 날짜
	private String soupEndDate;			//스/프 종료 날짜
	private String soupDay;				//스터디 요일
	private String soupStartTime;		//스터디 시작 시간
	private String soupEndTime;			//스터디 끝 시간
	private int soupPrice;				//스터디 비용//유료스터디
	private String soupIntroVideo;		//동영상 경로//유료스터디
	
	public SoupDto() {
		super();
	}

	public SoupDto(int soupNo, String soupGubun, String soupTitle, String soupField1, String soupField2,
			String soupRecruitEndDate, String soupRecruitEndTime, int soupMemberMin, int soupMemberMax,
			String soupContent, String soupCreateDate, String soupStatus, String soupAddr1, String soupAddr2,
			String soupStartDate, String soupEndDate, String soupDay, String soupStartTime, String soupEndTime,
			int soupPrice, String soupIntroVideo) {
		super();
		this.soupNo = soupNo;
		this.soupGubun = soupGubun;
		this.soupTitle = soupTitle;
		this.soupField1 = soupField1;
		this.soupField2 = soupField2;
		this.soupRecruitEndDate = soupRecruitEndDate;
		this.soupRecruitEndTime = soupRecruitEndTime;
		this.soupMemberMin = soupMemberMin;
		this.soupMemberMax = soupMemberMax;
		this.soupContent = soupContent;
		this.soupCreateDate = soupCreateDate;
		this.soupStatus = soupStatus;
		this.soupAddr1 = soupAddr1;
		this.soupAddr2 = soupAddr2;
		this.soupStartDate = soupStartDate;
		this.soupEndDate = soupEndDate;
		this.soupDay = soupDay;
		this.soupStartTime = soupStartTime;
		this.soupEndTime = soupEndTime;
		this.soupPrice = soupPrice;
		this.soupIntroVideo = soupIntroVideo;
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

	public String getSoupRecruitEndDate() {
		return soupRecruitEndDate;
	}

	public void setSoupRecruitEndDate(String soupRecruitEndDate) {
		this.soupRecruitEndDate = soupRecruitEndDate;
	}

	public String getSoupRecruitEndTime() {
		return soupRecruitEndTime;
	}

	public void setSoupRecruitEndTime(String soupRecruitEndTime) {
		this.soupRecruitEndTime = soupRecruitEndTime;
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

	public String getSoupContent() {
		return soupContent;
	}

	public void setSoupContent(String soupContent) {
		this.soupContent = soupContent;
	}

	public String getSoupCreateDate() {
		return soupCreateDate;
	}

	public void setSoupCreateDate(String soupCreateDate) {
		this.soupCreateDate = soupCreateDate;
	}

	public String getSoupStatus() {
		return soupStatus;
	}

	public void setSoupStatus(String soupStatus) {
		this.soupStatus = soupStatus;
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

	public String getSoupStartDate() {
		return soupStartDate;
	}

	public void setSoupStartDate(String soupStartDate) {
		this.soupStartDate = soupStartDate;
	}

	public String getSoupEndDate() {
		return soupEndDate;
	}

	public void setSoupEndDate(String soupEndDate) {
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
	
	
}
