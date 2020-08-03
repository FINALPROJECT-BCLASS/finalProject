package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;


public class GroupBoardPhoto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int gbpNo;
	private int gbNo;
	private int gmNo;
	private int gNo;
	private String gbpOrigin;
	private String gbpRename;
	
	public GroupBoardPhoto() {
		super();
	}
	
	
	public GroupBoardPhoto(int gbpNo, int gbNo, int gmNo, int gNo, String gbpOrigin, String gbpRename) {
		super();
		this.gbpNo = gbpNo;
		this.gbNo = gbNo;
		this.gmNo = gmNo;
		this.gNo = gNo;
		this.gbpOrigin = gbpOrigin;
		this.gbpRename = gbpRename;
	}


	public int getGbpNo() {
		return gbpNo;
	}
	public void setGbpNo(int gbpNo) {
		this.gbpNo = gbpNo;
	}
	public int getGbNo() {
		return gbNo;
	}
	public void setGbNo(int gbNo) {
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
	public String getGbpOrigin() {
		return gbpOrigin;
	}
	public void setGbpOrigin(String gbpOrigin) {
		this.gbpOrigin = gbpOrigin;
	}
	public String getGbpRename() {
		return gbpRename;
	}
	public void setGbpRename(String gbpRename) {
		this.gbpRename = gbpRename;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "GroupBoardPhoto [gbpNo=" + gbpNo + ", gbNo=" + gbNo + ", gmNo=" + gmNo + ", gNo=" + gNo + ", gbpOrigin="
				+ gbpOrigin + ", gbpRename=" + gbpRename + "]\n";
	}
	
	
}
