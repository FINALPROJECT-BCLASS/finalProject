package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupProfit implements Serializable{

	private int gpNo;
	private int gNo;
	private int gmNo;
	private int gaNo;
	private String gpAmount;
	private String gpDelete;
	private String gpYn;
	private String gpDate;
	public GroupProfit() {
		super();
	}
	public GroupProfit(int gpNo, int gNo, int gmNo, int gaNo, String gpAmount, String gpDelete, String gpYn,
			String gpDate) {
		super();
		this.gpNo = gpNo;
		this.gNo = gNo;
		this.gmNo = gmNo;
		this.gaNo = gaNo;
		this.gpAmount = gpAmount;
		this.gpDelete = gpDelete;
		this.gpYn = gpYn;
		this.gpDate = gpDate;
	}
	public int getGpNo() {
		return gpNo;
	}
	public void setGpNo(int gpNo) {
		this.gpNo = gpNo;
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
	public int getGaNo() {
		return gaNo;
	}
	public void setGaNo(int gaNo) {
		this.gaNo = gaNo;
	}
	public String getGpAmount() {
		return gpAmount;
	}
	public void setGpAmount(String gpAmount) {
		this.gpAmount = gpAmount;
	}
	public String getGpDelete() {
		return gpDelete;
	}
	public void setGpDelete(String gpDelete) {
		this.gpDelete = gpDelete;
	}
	public String getGpYn() {
		return gpYn;
	}
	public void setGpYn(String gpYn) {
		this.gpYn = gpYn;
	}
	public String getGpDate() {
		return gpDate;
	}
	public void setGpDate(String gpDate) {
		this.gpDate = gpDate;
	}
	@Override
	public String toString() {
		return "GroupProfit [gpNo=" + gpNo + ", gNo=" + gNo + ", gmNo=" + gmNo + ", gaNo=" + gaNo + ", gpAmount="
				+ gpAmount + ", gpDelete=" + gpDelete + ", gpYn=" + gpYn + ", gpDate=" + gpDate + "]\n";
	}
	
	
	
}
