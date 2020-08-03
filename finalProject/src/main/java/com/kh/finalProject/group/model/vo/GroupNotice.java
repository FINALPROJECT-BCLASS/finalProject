package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupNotice implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String gnNo;
	private int gmNo;
	private int gNo;
	private String gnTitle;
	private String gnCon;
	private String gnDate;
	private String gnDelete;
	private int gnCount;
	
//	Member
	private String name;
	private String renameFile;
	
//	해당 jsp 페이지 정보
	private int page;	
	
	public GroupNotice() {
		super();
	}

	public GroupNotice(String gnNo, int gmNo, int gNo, String gnTitle, String gnCon, String gnDate, String gnDelete,
			int gnCount, String name, String renameFile, int page) {
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
		this.renameFile = renameFile;
		this.page = page;
	}

	public String getGnNo() {
		return gnNo;
	}

	public void setGnNo(String gnNo) {
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

	public String getRenameFile() {
		return renameFile;
	}

	public void setRenameFile(String renameFile) {
		this.renameFile = renameFile;
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
		return "GroupNotice [gmNo=" + gmNo + ", gnCon=" + gnCon + ", gnCount=" + gnCount + ", gnDate=" + gnDate
				+ ", gnDelete=" + gnDelete + ", gnNo=" + gnNo + ", gNo=" + gNo + ", gnTitle=" + gnTitle + ", name="
				+ name + ", page=" + page + ", renameFile=" + renameFile + "]\n";
	}

	
}
