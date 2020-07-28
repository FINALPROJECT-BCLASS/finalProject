package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupReply implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int grNo;
	private int gbNo;
	private int gmNo;
	private String grCon;
	private String grDate;
	private String grDelete;
	private String totalReply;
	
	private String name;
	
	public GroupReply() {
		super();
	}

	public GroupReply(int grNo, int gbNo, int gmNo, String grCon, String grDate, String grDelete, String totalReply,
			String name) {
		super();
		this.grNo = grNo;
		this.gbNo = gbNo;
		this.gmNo = gmNo;
		this.grCon = grCon;
		this.grDate = grDate;
		this.grDelete = grDelete;
		this.totalReply = totalReply;
		this.name = name;
	}

	public int getGrNo() {
		return grNo;
	}

	public void setGrNo(int grNo) {
		this.grNo = grNo;
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

	public String getGrCon() {
		return grCon;
	}

	public void setGrCon(String grCon) {
		this.grCon = grCon;
	}

	public String getGrDate() {
		return grDate;
	}

	public void setGrDate(String grDate) {
		this.grDate = grDate;
	}

	public String getGrDelete() {
		return grDelete;
	}

	public void setGrDelete(String grDelete) {
		this.grDelete = grDelete;
	}

	public String getTotalReply() {
		return totalReply;
	}

	public void setTotalReply(String totalReply) {
		this.totalReply = totalReply;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroupReply [grNo=" + grNo + ", gbNo=" + gbNo + ", gmNo=" + gmNo + ", grCon=" + grCon + ", grDate="
				+ grDate + ", grDelete=" + grDelete + ", totalReply=" + totalReply + ", name=" + name + "]\n";
	}

	
	
	
}
