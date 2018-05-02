package com.hk.soup.search.dto;

public class SoupFilterDto {

	private String soupGubun;
	private String soupField1;
	private String soupField2;
	private String soupAddr1;
	private String soupAddr2;
	private String soupDay;
	private String soupSearchWord;
	private String soupSearchSelect;
	
	public SoupFilterDto() {
		super();
	}
	
	public SoupFilterDto(String soupGubun, String soupField1, String soupField2, String soupAddr1, String soupAddr2,
			String soupDay, String soupSearchWord, String soupSearchSelect) {
		super();
		this.soupGubun = soupGubun;
		this.soupField1 = soupField1;
		this.soupField2 = soupField2;
		this.soupAddr1 = soupAddr1;
		this.soupAddr2 = soupAddr2;
		this.soupDay = soupDay;
		this.soupSearchWord = soupSearchWord;
		this.soupSearchSelect = soupSearchSelect;
	}

	public String getSoupGubun() {
		return soupGubun;
	}

	public void setSoupGubun(String soupGubun) {
		this.soupGubun = soupGubun;
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

	public String getSoupDay() {
		return soupDay;
	}

	public void setSoupDay(String soupDay) {
		this.soupDay = soupDay;
	}

	public String getSoupSearchWord() {
		return soupSearchWord;
	}

	public void setSoupSearchWord(String soupSearchWord) {
		this.soupSearchWord = soupSearchWord;
	}

	public String getSoupSearchSelect() {
		return soupSearchSelect;
	}

	public void setSoupSearchSelect(String soupSearchSelect) {
		this.soupSearchSelect = soupSearchSelect;
	}
	
}
