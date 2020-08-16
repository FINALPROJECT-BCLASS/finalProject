package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("gSearch")
public class GroupSearchName implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String searchName;
	private String loginUserId;
	private int gNo;
	
	private String gaNo;
	
	public GroupSearchName() {
		super();
	}

	public GroupSearchName(String searchName, String loginUserId, int gNo, String gaNo) {
		super();
		this.searchName = searchName;
		this.loginUserId = loginUserId;
		this.gNo = gNo;
		this.gaNo = gaNo;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getLoginUserId() {
		return loginUserId;
	}

	public void setLoginUserId(String loginUserId) {
		this.loginUserId = loginUserId;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public String getGaNo() {
		return gaNo;
	}

	public void setGaNo(String gaNo) {
		this.gaNo = gaNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroupSearchName [searchName=" + searchName + ", loginUserId=" + loginUserId + ", gNo=" + gNo + ", gaNo="
				+ gaNo + "]";
	}

	
	
	

	
}
