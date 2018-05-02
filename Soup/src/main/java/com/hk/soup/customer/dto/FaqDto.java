package com.hk.soup.customer.dto;

public class FaqDto {
	
	private int faqNo;
	private String faqQuestion;
	private String faqAnswer;
	private String faqGubun;
	
	public FaqDto() {
		super();
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqQuestion() {
		return faqQuestion;
	}
	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}
	public String getFaqAnswer() {
		return faqAnswer;
	}
	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}
	public String getFaqGubun() {
		return faqGubun;
	}
	public void setFaqGubun(String faqGubun) {
		this.faqGubun = faqGubun;
	}
	
	

}
