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
	
	public GroupSearchName() {
		super();
	}
	
	public GroupSearchName(String searchName, String loginUserId) {
		super();
		this.searchName = searchName;
		this.loginUserId = loginUserId;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "GroupSearchName [searchName=" + searchName + ", loginUserId=" + loginUserId + "]\n";
	}
	
	
}
