package com.hk.soup.customer.dto;

import java.util.Date;

public class QuestionDto {
	
	private int questionNo;
	private int memberNo;
	private String questionTitle;
	private String questionContent;
	private String questionGubun;
	private Date questionDate;
	private String questionYn;
	private String memberName;
	
	public QuestionDto() {}

	public QuestionDto(int questionNo, int memberNo, String questionTitle, String questionContent, String questionGubun,
			Date questionDate, String questionYn, String memberName) {
		super();
		this.questionNo = questionNo;
		this.memberNo = memberNo;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.questionGubun = questionGubun;
		this.questionDate = questionDate;
		this.questionYn = questionYn;
		this.memberName = memberName;
	}
	
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getQuestionGubun() {
		return questionGubun;
	}
	public void setQuestionGubun(String questionGubun) {
		this.questionGubun = questionGubun;
	}
	public Date getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}
	public String getQuestionYn() {
		return questionYn;
	}
	public void setQuestionYn(String questionYn) {
		this.questionYn = questionYn;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	
}
	
	