package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("gm")
public class GroupMember implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int gmNO;
	private String gmId;
	private String gNo;
	private String gmDelete;
	
	
	public GroupMember() {
		super();
	}


	public GroupMember(int gmNO, String gmId, String gNo, String gmDelete) {
		super();
		this.gmNO = gmNO;
		this.gmId = gmId;
		this.gNo = gNo;
		this.gmDelete = gmDelete;
	}


	public int getGmNO() {
		return gmNO;
	}


	public void setGmNO(int gmNO) {
		this.gmNO = gmNO;
	}


	public String getGmId() {
		return gmId;
	}


	public void setGmId(String gmId) {
		this.gmId = gmId;
	}


	public String getgNo() {
		return gNo;
	}


	public void setgNo(String gNo) {
		this.gNo = gNo;
	}


	public String getGmDelete() {
		return gmDelete;
	}


	public void setGmDelete(String gmDelete) {
		this.gmDelete = gmDelete;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "GroupMember [gmNO=" + gmNO + ", gmId=" + gmId + ", gNo=" + gNo + ", gmDelete=" + gmDelete + "]\n";
	}

	
	

}
