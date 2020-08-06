package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupFee implements Serializable{

	private int gfNo;
	private int gNo;
	private int gmNo;
	private String gfStart;
	private String gfDelete;
	private String gfCon;
	private String gfAmount;
	private String gfDeleteYn;
	public GroupFee() {
		super();
	}
	public GroupFee(int gfNo, int gNo, int gmNo, String gfStart, String gfDelete, String gfCon, String gfAmount,
			String gfDeleteYn) {
		super();
		this.gfNo = gfNo;
		this.gNo = gNo;
		this.gmNo = gmNo;
		this.gfStart = gfStart;
		this.gfDelete = gfDelete;
		this.gfCon = gfCon;
		this.gfAmount = gfAmount;
		this.gfDeleteYn = gfDeleteYn;
	}
	public int getGfNo() {
		return gfNo;
	}
	public void setGfNo(int gfNo) {
		this.gfNo = gfNo;
	}
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public int getGmNo() {
		return gmNo;
	}
	public void setGmNo(int gmNo) {
		this.gmNo = gmNo;
	}
	public String getGfStart() {
		return gfStart;
	}
	public void setGfStart(String gfStart) {
		this.gfStart = gfStart;
	}
	public String getGfDelete() {
		return gfDelete;
	}
	public void setGfDelete(String gfDelete) {
		this.gfDelete = gfDelete;
	}
	public String getGfCon() {
		return gfCon;
	}
	public void setGfCon(String gfCon) {
		this.gfCon = gfCon;
	}
	public String getGfAmount() {
		return gfAmount;
	}
	public void setGfAmount(String gfAmount) {
		this.gfAmount = gfAmount;
	}
	public String getGfDeleteYn() {
		return gfDeleteYn;
	}
	public void setGfDeleteYn(String gfDeleteYn) {
		this.gfDeleteYn = gfDeleteYn;
	}
	@Override
	public String toString() {
		return "GroupFee [gfNo=" + gfNo + ", gNo=" + gNo + ", gmNo=" + gmNo + ", gfStart=" + gfStart + ", gfDelete="
				+ gfDelete + ", gfCon=" + gfCon + ", gfAmount=" + gfAmount + ", gfDeleteYn=" + gfDeleteYn + "]\n";
	}
	
	
	 
	
}
