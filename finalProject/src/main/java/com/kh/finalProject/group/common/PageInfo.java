package com.kh.finalProject.group.common;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("pi")
public class PageInfo implements Serializable{	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//	GroupInfo class
	private String loginUserId;
	private int groupNo;
	private int gmNo;
	
	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	private int boardLimit;
	
	private String searchCon;
	 
	public PageInfo() {
		super();
	}

	
	
	public PageInfo(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
			int boardLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.boardLimit = boardLimit;
	}



	public PageInfo(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
			int boardLimit, String searchCon) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.boardLimit = boardLimit;
		this.searchCon = searchCon;
	}



	public PageInfo(String loginUserId, int groupNo, int gmNo, int currentPage, int listCount, int pageLimit,
			int maxPage, int startPage, int endPage, int boardLimit, String searchCon) {
		super();
		this.loginUserId = loginUserId;
		this.groupNo = groupNo;
		this.gmNo = gmNo;
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.boardLimit = boardLimit;
		this.searchCon = searchCon;
	}

	public String getLoginUserId() {
		return loginUserId;
	}

	public void setLoginUserId(String loginUserId) {
		this.loginUserId = loginUserId;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getGmNo() {
		return gmNo;
	}

	public void setGmNo(int gmNo) {
		this.gmNo = gmNo;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
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
		return "PageInfo [loginUserId=" + loginUserId + ", groupNo=" + groupNo + ", gmNo=" + gmNo + ", currentPage="
				+ currentPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit + ", maxPage=" + maxPage
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", boardLimit=" + boardLimit + ", searchCon="
				+ searchCon + "]\n";
	}

	
	
}