package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;


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
	private String renameFile;
	
//	해당 jsp 페이지 정보
	private int page;
	
	private int currentGroupNo;
	private int currentGmNo;
	private String searchKind;
	private String searchCon;
	
	
	public GroupBoard() {
		super();
	}


	public GroupBoard(String gbNo, int gmNo, int gNo, String gbTitle, String gbCon, String gbDate, String gbDelete,
			int gbCount, String name, String renameFile, int page, int currentGroupNo, int currentGmNo,
			String searchKind, String searchCon) {
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
		this.renameFile = renameFile;
		this.page = page;
		this.currentGroupNo = currentGroupNo;
		this.currentGmNo = currentGmNo;
		this.searchKind = searchKind;
		this.searchCon = searchCon;
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


	public int getCurrentGroupNo() {
		return currentGroupNo;
	}


	public void setCurrentGroupNo(int currentGroupNo) {
		this.currentGroupNo = currentGroupNo;
	}


	public int getCurrentGmNo() {
		return currentGmNo;
	}


	public void setCurrentGmNo(int currentGmNo) {
		this.currentGmNo = currentGmNo;
	}


	public String getSearchKind() {
		return searchKind;
	}


	public void setSearchKind(String searchKind) {
		this.searchKind = searchKind;
	}


	public String getSearchCon() {
		return searchCon;
	}


	public void setSearchCon(String searchCon) {
		this.searchCon = searchCon;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "GroupBoard [gbNo=" + gbNo + ", gmNo=" + gmNo + ", gNo=" + gNo + ", gbTitle=" + gbTitle + ", gbCon="
				+ gbCon + ", gbDate=" + gbDate + ", gbDelete=" + gbDelete + ", gbCount=" + gbCount + ", name=" + name
				+ ", renameFile=" + renameFile + ", page=" + page + ", currentGroupNo=" + currentGroupNo
				+ ", currentGmNo=" + currentGmNo + ", searchKind=" + searchKind + ", searchCon=" + searchCon + "]\n";
	}


	
	
}
