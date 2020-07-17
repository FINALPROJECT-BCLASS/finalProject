package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("gInfo")
public class GroupInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String loginUserId;
	private int groupNo;
	private int gmNo;
	
	public GroupInfo() {
		super();
	}

	public GroupInfo(String loginUserId, int groupNo, int gmNo) {
		super();
		this.loginUserId = loginUserId;
		this.groupNo = groupNo;
		this.gmNo = gmNo;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroupInfo [loginUserId=" + loginUserId + ", groupNo=" + groupNo + ", gmNo=" + gmNo + "]\n";
	}
	
}
