package com.hk.soup.soup.dto;

import java.util.Date;

public class SoupReviewDto {

	/*name, face 제외하고 나머지는 db에 사용되는 값과 같은 의미*/
	private int memberNo;
	private int soupNo;
	private int teacherNo;
	private int reviewScore;
	private String reviewContent;
	private Date reviewDate;
	private String memberName; //리뷰 남긴 사람 이름
	private String memberFace; //리뷰 남긴 사람 얼굴
	
	public SoupReviewDto() {}
	
	public SoupReviewDto(int memberNo, int soupNo, int teacherNo, int reviewScore, String reviewContent,
			Date reviewDate, String memberName, String memberFace) {
		super();
		this.memberNo = memberNo;
		this.soupNo = soupNo;
		this.teacherNo = teacherNo;
		this.reviewScore = reviewScore;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.memberName = memberName;
		this.memberFace = memberFace;
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

	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
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

	@Override
	public String toString() {
		return "SoupReviewDto [memberNo=" + memberNo + ", soupNo=" + soupNo + ", teacherNo=" + teacherNo
				+ ", reviewScore=" + reviewScore + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate
				+ ", memberName=" + memberName + ", memberFace=" + memberFace + "]";
	}
	
}
