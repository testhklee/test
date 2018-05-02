package com.hk.soup.message.dto;

import java.sql.Date;

public class MessageDto {
	
	private int messageNo;
	private int messageSenderNo;
	private int messageTargetNo;
	private String messageContent;
	private Date messageDate;
	private String messageChecked;
	private String messageSendDel;
	private String messageTargetDel;
	private String memberName;
	
	public MessageDto() {
		super();
	}
	
	public MessageDto(int messageSenderNo, int messageTargetNo, String messageContent) {
		this.messageSenderNo = messageSenderNo;
		this.messageTargetNo = messageTargetNo;
		this.messageContent = messageContent;
	}
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public int getMessageSenderNo() {
		return messageSenderNo;
	}
	public void setMessageSenderNo(int messageSenderNo) {
		this.messageSenderNo = messageSenderNo;
	}
	public int getMessageTargetNo() {
		return messageTargetNo;
	}
	public void setMessageTargetNo(int messageTargetNo) {
		this.messageTargetNo = messageTargetNo;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	public String getMessageChecked() {
		return messageChecked;
	}
	public void setMessageChecked(String messageChecked) {
		this.messageChecked = messageChecked;
	}
	public String getMessageSendDel() {
		return messageSendDel;
	}
	public void setMessageSendDel(String messageSendDel) {
		this.messageSendDel = messageSendDel;
	}
	public String getMessageTargetDel() {
		return messageTargetDel;
	}
	public void setMessageTargetDel(String messageTargetDel) {
		this.messageTargetDel = messageTargetDel;
	}
	
	
	

}
