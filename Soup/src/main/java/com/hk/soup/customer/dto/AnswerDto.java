package com.hk.soup.customer.dto;

import java.util.Date;

public class AnswerDto {
	
	private int answerNo;
	private int questionNo;
	private String answerContent;
	private Date answerDate;
	private String questionTitle;
	private String questionContent;
	private Date questionDate;
	
	public AnswerDto() {}
	public AnswerDto(int answerNo, int questionNo, String answerContent, Date answerDate, String questionTitle,
			String questionContent, Date questionDate) {
		super();
		this.answerNo = answerNo;
		this.questionNo = questionNo;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.questionDate = questionDate;
	}
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public Date getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
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
	public Date getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}
	
}
