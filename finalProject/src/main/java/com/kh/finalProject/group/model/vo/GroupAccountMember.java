package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupAccountMember implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String gaTitle;
	private String gaDate;
	
	private int gamNo;
	private int gNo;
	private int gmNo;
	private int gaNo;
	private String gamAmount;
	private String gamDelete;
	private String gamYn;
	
	private String name;
	
	
	public GroupAccountMember() {
		super();
	}


	public GroupAccountMember(String gaTitle, String gaDate, int gamNo, int gNo, int gmNo, int gaNo, String gamAmount,
			String gamDelete, String gamYn, String name) {
		super();
		this.gaTitle = gaTitle;
		this.gaDate = gaDate;
		this.gamNo = gamNo;
		this.gNo = gNo;
		this.gmNo = gmNo;
		this.gaNo = gaNo;
		this.gamAmount = gamAmount;
		this.gamDelete = gamDelete;
		this.gamYn = gamYn;
		this.name = name;
	}


	public final String getGaTitle() {
		return gaTitle;
	}


	public final void setGaTitle(String gaTitle) {
		this.gaTitle = gaTitle;
	}


	public final String getGaDate() {
		return gaDate;
	}


	public final void setGaDate(String gaDate) {
		this.gaDate = gaDate;
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


	public final String getGamAmount() {
		return gamAmount;
	}


	public final void setGamAmount(String gamAmount) {
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


	public final String getName() {
		return name;
	}


	public final void setName(String name) {
		this.name = name;
	}


	public static final long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "GroupAccountMember [gaTitle=" + gaTitle + ", gaDate=" + gaDate + ", gamNo=" + gamNo + ", gNo=" + gNo
				+ ", gmNo=" + gmNo + ", gaNo=" + gaNo + ", gamAmount=" + gamAmount + ", gamDelete=" + gamDelete
				+ ", gamYn=" + gamYn + ", name=" + name + "]\n";
	}


		
}
