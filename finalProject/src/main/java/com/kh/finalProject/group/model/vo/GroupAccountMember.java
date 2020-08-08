package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupAccountMember implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int gamNo;
	private int gNo;
	private int gmNo;
	private int gaNo;
	private int gamAmount;
	private String gamDelete;
	private String gamYn;
	
	
	
	
	public GroupAccountMember() {
		super();
	}




	public GroupAccountMember(int gamNo, int gNo, int gmNo, int gaNo, int gamAmount, String gamDelete, String gamYn) {
		super();
		this.gamNo = gamNo;
		this.gNo = gNo;
		this.gmNo = gmNo;
		this.gaNo = gaNo;
		this.gamAmount = gamAmount;
		this.gamDelete = gamDelete;
		this.gamYn = gamYn;
	}




	public final int getGamNo() {
		return gamNo;
	}




	public final void setGamNo(int gamNo) {
		this.gamNo = gamNo;
	}




	public final int getgNo() {
		return gNo;
	}




	public final void setgNo(int gNo) {
		this.gNo = gNo;
	}




	public final int getGmNo() {
		return gmNo;
	}




	public final void setGmNo(int gmNo) {
		this.gmNo = gmNo;
	}




	public final int getGaNo() {
		return gaNo;
	}




	public final void setGaNo(int gaNo) {
		this.gaNo = gaNo;
	}




	public final int getGamAmount() {
		return gamAmount;
	}




	public final void setGamAmount(int gamAmount) {
		this.gamAmount = gamAmount;
	}




	public final String getGamDelete() {
		return gamDelete;
	}




	public final void setGamDelete(String gamDelete) {
		this.gamDelete = gamDelete;
	}




	public final String getGamYn() {
		return gamYn;
	}




	public final void setGamYn(String gamYn) {
		this.gamYn = gamYn;
	}




	public static final long getSerialversionuid() {
		return serialVersionUID;
	}




	@Override
	public String toString() {
		return "GroupAccountMember [gamNo=" + gamNo + ", gNo=" + gNo + ", gmNo=" + gmNo + ", gaNo=" + gaNo
				+ ", gamAmount=" + gamAmount + ", gamDelete=" + gamDelete + ", gamYn=" + gamYn + "]\n";
	}


	
	
}
