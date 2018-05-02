package com.hk.soup.home.alarm.dto;

import java.util.Date;

public class AlarmDto {

	private int memberNo;
	private String alarmContent;
	private Date alarmDate;
	private String alarmChecked;
	private String alarmGubun;
	private int alarmDetailNo;
	
	public AlarmDto() {}
	
	public AlarmDto(int memberNo, String alarmContent, Date alarmDate, String alarmChecked, String alarmGubun,
			int alarmDetailNo) {
		super();
		this.memberNo = memberNo;
		this.alarmContent = alarmContent;
		this.alarmDate = alarmDate;
		this.alarmChecked = alarmChecked;
		this.alarmGubun = alarmGubun;
		this.alarmDetailNo = alarmDetailNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getAlarmContent() {
		return alarmContent;
	}

	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}

	public Date getAlarmDate() {
		return alarmDate;
	}

	public void setAlarmDate(Date alarmDate) {
		this.alarmDate = alarmDate;
	}

	public String getAlarmChecked() {
		return alarmChecked;
	}

	public void setAlarmChecked(String alarmChecked) {
		this.alarmChecked = alarmChecked;
	}

	public String getAlarmGubun() {
		return alarmGubun;
	}

	public void setAlarmGubun(String alarmGubun) {
		this.alarmGubun = alarmGubun;
	}

	public int getAlarmDetailNo() {
		return alarmDetailNo;
	}

	public void setAlarmDetailNo(int alarmDetailNo) {
		this.alarmDetailNo = alarmDetailNo;
	}
	
}
