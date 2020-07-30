package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupReReply implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int grrNo;
	private int gmNo;
	private int gbNo;
	private int grNo;
	private String grrCon;
	private String grrDate;
	private String grrDelete;
	private String totalReReply;
	
	private String name;
	

	public GroupReReply() {
		super();
	}


	public GroupReReply(int grrNo, int gmNo, int gbNo, int grNo, String grrCon, String grrDate, String grrDelete,
			String totalReReply, String name) {
		super();
		this.grrNo = grrNo;
		this.gmNo = gmNo;
		this.gbNo = gbNo;
		this.grNo = grNo;
		this.grrCon = grrCon;
		this.grrDate = grrDate;
		this.grrDelete = grrDelete;
		this.totalReReply = totalReReply;
		this.name = name;
	}


	public int getGrrNo() {
		return grrNo;
	}


	public void setGrrNo(int grrNo) {
		this.grrNo = grrNo;
	}


	public int getGmNo() {
		return gmNo;
	}


	public void setGmNo(int gmNo) {
		this.gmNo = gmNo;
	}


	public int getGbNo() {
		return gbNo;
	}


	public void setGbNo(int gbNo) {
		this.gbNo = gbNo;
	}


	public int getGrNo() {
		return grNo;
	}


	public void setGrNo(int grNo) {
		this.grNo = grNo;
	}


	public String getGrrCon() {
		return grrCon;
	}


	public void setGrrCon(String grrCon) {
		this.grrCon = grrCon;
	}


	public String getGrrDate() {
		return grrDate;
	}


	public void setGrrDate(String grrDate) {
		this.grrDate = grrDate;
	}


	public String getGrrDelete() {
		return grrDelete;
	}


	public void setGrrDelete(String grrDelete) {
		this.grrDelete = grrDelete;
	}


	public String getTotalReReply() {
		return totalReReply;
	}


	public void setTotalReReply(String totalReReply) {
		this.totalReReply = totalReReply;
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
		return "GroupReReply [grrNo=" + grrNo + ", gmNo=" + gmNo + ", gbNo=" + gbNo + ", grNo=" + grNo + ", grrCon="
				+ grrCon + ", grrDate=" + grrDate + ", grrDelete=" + grrDelete + ", totalReReply=" + totalReReply
				+ ", name=" + name + "]\n";
	}

	
	
	
	
}
