package com.hk.soup.soup.dto;

import java.util.List;

public class MySoupDto {
	
	private int soupNo;
	private String soupTitle;
	private String soupGubun;
	private List<SoupMemberDto> memberList;
	private String soupMemberGubun;
	private String soupField1;
	private String soupField2;
	
	public MySoupDto() {}
	
	public MySoupDto(int soupNo, String soupTitle, String soupGubun, List<SoupMemberDto> memberList,
			String soupMemberGubun, String soupField1, String soupField2) {
		super();
		this.soupNo = soupNo;
		this.soupTitle = soupTitle;
		this.soupGubun = soupGubun;
		this.memberList = memberList;
		this.soupMemberGubun = soupMemberGubun;
		this.soupField1 = soupField1;
		this.soupField2 = soupField2;
	}

	public int getSoupNo() {
		return soupNo;
	}

	public void setSoupNo(int soupNo) {
		this.soupNo = soupNo;
	}

	public String getSoupTitle() {
		return soupTitle;
	}

	public void setSoupTitle(String soupTitle) {
		this.soupTitle = soupTitle;
	}

	public String getSoupGubun() {
		return soupGubun;
	}

	public void setSoupGubun(String soupGubun) {
		this.soupGubun = soupGubun;
	}

	public List<SoupMemberDto> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<SoupMemberDto> memberList) {
		this.memberList = memberList;
	}

	public String getSoupMemberGubun() {
		return soupMemberGubun;
	}

	public void setSoupMemberGubun(String soupMemberGubun) {
		this.soupMemberGubun = soupMemberGubun;
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
	
}
