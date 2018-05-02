package com.hk.soup.soup.study.dto;

import java.util.Date;

public class StudyScheduleDto {
	
	private String studyScheduleDday;
	private int memberNo;
	private int soupNo;
	private String studyScheduleTitle;
	private String studyScheduleContent;
	private Date studyScheduleWriteDate;
	private double studyScheduleLatitude;
	private double studyScheduleLongtude;
	private String studyScheduleIsmain;
	
	public StudyScheduleDto() {
		super();
	}

	public StudyScheduleDto(String studyScheduleDday, int memberNo, int soupNo, String studyScheduleTitle,
			String studyScheduleContent, double studyScheduleLatitude, double studyScheduleLongtude) {
		super();
		this.studyScheduleDday = studyScheduleDday;
		this.memberNo = memberNo;
		this.soupNo = soupNo;
		this.studyScheduleTitle = studyScheduleTitle;
		this.studyScheduleContent = studyScheduleContent;
		this.studyScheduleLatitude = studyScheduleLatitude;
		this.studyScheduleLongtude = studyScheduleLongtude;
	}
	
	public StudyScheduleDto(String studyScheduleDday, int memberNo, int soupNo, String studyScheduleTitle) {
		super();
		this.studyScheduleDday = studyScheduleDday;
		this.memberNo = memberNo;
		this.soupNo = soupNo;
		this.studyScheduleTitle = studyScheduleTitle;
	}

	public StudyScheduleDto(String studyScheduleDday, int memberNo, int soupNo) {
		super();
		this.studyScheduleDday = studyScheduleDday;
		this.memberNo = memberNo;
		this.soupNo = soupNo;
	}

	public String getStudyScheduleDday() {
		return studyScheduleDday;
	}

	public void setStudyScheduleDday(String studyScheduleDday) {
		this.studyScheduleDday = studyScheduleDday;
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

	public String getStudyScheduleTitle() {
		return studyScheduleTitle;
	}

	public void setStudyScheduleTitle(String studyScheduleTitle) {
		this.studyScheduleTitle = studyScheduleTitle;
	}

	public String getStudyScheduleContent() {
		return studyScheduleContent;
	}

	public void setStudyScheduleContent(String studyScheduleContent) {
		this.studyScheduleContent = studyScheduleContent;
	}

	public Date getStudyScheduleWriteDate() {
		return studyScheduleWriteDate;
	}

	public void setStudyScheduleWriteDate(Date studyScheduleWriteDate) {
		this.studyScheduleWriteDate = studyScheduleWriteDate;
	}

	public double getStudyScheduleLatitude() {
		return studyScheduleLatitude;
	}

	public void setStudyScheduleLatitude(double studyScheduleLatitude) {
		this.studyScheduleLatitude = studyScheduleLatitude;
	}

	public double getStudyScheduleLongtude() {
		return studyScheduleLongtude;
	}

	public void setStudyScheduleLongtude(double studyScheduleLongtude) {
		this.studyScheduleLongtude = studyScheduleLongtude;
	}

	public String getStudyScheduleIsmain() {
		return studyScheduleIsmain;
	}

	public void setStudyScheduleIsmain(String studyScheduleIsmain) {
		this.studyScheduleIsmain = studyScheduleIsmain;
	}
	
}
