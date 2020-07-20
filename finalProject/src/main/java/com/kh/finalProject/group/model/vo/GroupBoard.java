package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupBoard implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String gbNo;
	private int gmNo;
	private int gNo;
	private String gbTitle;
	private String gbCon;
	private String gbDate;
	private String gbDelete;
	private int gbCount;
	
//	Member
	private String name;
	
//	해당 jsp 페이지 정보
	private int page;
	
	public GroupBoard() {
		super();
	}
	
	public GroupBoard(String gbNo, int gmNo, int gNo, String gbTitle, String gbCon, String gbDate, String gbDelete,
			int gbCount, String name, int page) {
		super();
		this.gbNo = gbNo;
		this.gmNo = gmNo;
		this.gNo = gNo;
		this.gbTitle = gbTitle;
		this.gbCon = gbCon;
		this.gbDate = gbDate;
		this.gbDelete = gbDelete;
		this.gbCount = gbCount;
		this.name = name;
		this.page = page;
	}
	
	public String getGbNo() {
		return gbNo;
	}
	
	public void setGbNo(String gbNo) {
		this.gbNo = gbNo;
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
	
	public String getGbTitle() {
		return gbTitle;
	}
	
	public void setGbTitle(String gbTitle) {
		this.gbTitle = gbTitle;
	}
	
	public String getGbCon() {
		return gbCon;
	}
	
	public void setGbCon(String gbCon) {
		this.gbCon = gbCon;
	}
	
	public String getGbDate() {
		return gbDate;
	}
	
	public void setGbDate(String gbDate) {
		this.gbDate = gbDate;
	}
	
	public String getGbDelete() {
		return gbDelete;
	}
	
	public void setGbDelete(String gbDelete) {
		this.gbDelete = gbDelete;
	}
	
	public int getGbCount() {
		return gbCount;
	}
	
	public void setGbCount(int gbCount) {
		this.gbCount = gbCount;
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
		return "GroupBoard [gbNo=" + gbNo + ", gmNo=" + gmNo + ", gNo=" + gNo + ", gbTitle=" + gbTitle + ", gbCon=" + gbCon
				+ ", gbDate=" + gbDate + ", gbDelete=" + gbDelete + ", gbCount=" + gbCount + ", name=" + name + ", page="
				+ page + "]\n";
	}	
		
	
}
