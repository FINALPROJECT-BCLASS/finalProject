package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupPlan  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String gpNo;
	private String gNo;
	private String gmNo;
	private String gpTitle;
	private String gpCon;
	private String gpStart;
	private String gpEnd;
	private String gpCoordY;	// 위도/경도
	private String gpCoordX;	// 위도/경도
	private String address1;
	private String address2;
	private String color;
	private String gpDelete;

	
	private String name;
	
	
	public GroupPlan() {
		super();
	}


	public GroupPlan(String gpNo, String gNo, String gmNo, String gpTitle, String gpCon, String gpStart, String gpEnd,
			String gpCoordX, String gpCoordY, String address1, String address2, String color, String gpDelete,
			String name) {
		super();
		this.gpNo = gpNo;
		this.gNo = gNo;
		this.gmNo = gmNo;
		this.gpTitle = gpTitle;
		this.gpCon = gpCon;
		this.gpStart = gpStart;
		this.gpEnd = gpEnd;
		this.gpCoordX = gpCoordX;
		this.gpCoordY = gpCoordY;
		this.address1 = address1;
		this.address2 = address2;
		this.color = color;
		this.gpDelete = gpDelete;
		this.name = name;
	}


	public String getGpNo() {
		return gpNo;
	}


	public void setGpNo(String gpNo) {
		this.gpNo = gpNo;
	}


	public String getgNo() {
		return gNo;
	}


	public void setgNo(String gNo) {
		this.gNo = gNo;
	}


	public String getGmNo() {
		return gmNo;
	}


	public void setGmNo(String gmNo) {
		this.gmNo = gmNo;
	}


	public String getGpTitle() {
		return gpTitle;
	}


	public void setGpTitle(String gpTitle) {
		this.gpTitle = gpTitle;
	}


	public String getGpCon() {
		return gpCon;
	}


	public void setGpCon(String gpCon) {
		this.gpCon = gpCon;
	}


	public String getGpStart() {
		return gpStart;
	}


	public void setGpStart(String gpStart) {
		this.gpStart = gpStart;
	}


	public String getGpEnd() {
		return gpEnd;
	}


	public void setGpEnd(String gpEnd) {
		this.gpEnd = gpEnd;
	}


	public String getGpCoordX() {
		return gpCoordX;
	}


	public void setGpCoordX(String gpCoordX) {
		this.gpCoordX = gpCoordX;
	}


	public String getGpCoordY() {
		return gpCoordY;
	}


	public void setGpCoordY(String gpCoordY) {
		this.gpCoordY = gpCoordY;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getGpDelete() {
		return gpDelete;
	}


	public void setGpDelete(String gpDelete) {
		this.gpDelete = gpDelete;
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
		return "GroupPlan [gpNo=" + gpNo + ", gNo=" + gNo + ", gmNo=" + gmNo + ", gpTitle=" + gpTitle + ", gpCon="
				+ gpCon + ", gpStart=" + gpStart + ", gpEnd=" + gpEnd + ", gpCoordX=" + gpCoordX + ", gpCoordY="
				+ gpCoordY + ", address1=" + address1 + ", address2=" + address2 + ", color=" + color + ", gpDelete="
				+ gpDelete + ", name=" + name + "]\n";
	}


	
	
}
