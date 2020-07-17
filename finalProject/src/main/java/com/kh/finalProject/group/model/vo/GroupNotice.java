package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupNotice implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int gnNo;
	private int gmNo;
	private int gNo;
	private String gnTitle;
	private String gnCon;
	private String gnDate;
	private String gnDelete;
	private int gnCount;
	
//	Member
	private String name;
	
	private int page;	// 해당 jsp 페이지 정보
	
	public GroupNotice() {
		super();
	}

	public GroupNotice(int gnNo, int gmNo, int gNo, String gnTitle, String gnCon, String gnDate, String gnDelete,
			int gnCount, String name, int page) {
		super();
		this.gnNo = gnNo;
		this.gmNo = gmNo;
		this.gNo = gNo;
		this.gnTitle = gnTitle;
		this.gnCon = gnCon;
		this.gnDate = gnDate;
		this.gnDelete = gnDelete;
		this.gnCount = gnCount;
		this.name = name;
		this.page = page;
	}

	public int getGnNo() {
		return gnNo;
	}

	public void setGnNo(int gnNo) {
		this.gnNo = gnNo;
	}

	public int getGmNo() {
		return gmNo;
	}

	public void setGmNo(int gmNo) {
		this.gmNo = gmNo;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public String getGnTitle() {
		return gnTitle;
	}

	public void setGnTitle(String gnTitle) {
		this.gnTitle = gnTitle;
	}

	public String getGnCon() {
		return gnCon;
	}

	public void setGnCon(String gnCon) {
		this.gnCon = gnCon;
	}

	public String getGnDate() {
		return gnDate;
	}

	public void setGnDate(String gnDate) {
		this.gnDate = gnDate;
	}

	public String getGnDelete() {
		return gnDelete;
	}

	public void setGnDelete(String gnDelete) {
		this.gnDelete = gnDelete;
	}

	public int getGnCount() {
		return gnCount;
	}

	public void setGnCount(int gnCount) {
		this.gnCount = gnCount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroupNotice [gnNo=" + gnNo + ", gmNo=" + gmNo + ", gNo=" + gNo + ", gnTitle=" + gnTitle + ", gnCon="
				+ gnCon + ", gnDate=" + gnDate + ", gnDelete=" + gnDelete + ", gnCount=" + gnCount + ", name=" + name
				+ ", page=" + page + "]\n";
	}

	

	
	
	
}
