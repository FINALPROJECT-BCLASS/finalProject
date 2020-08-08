package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupAccount implements Serializable{

	private int gaNo;
	private int gNo;
	private int gmNo;
	private String gaDate;
	private String gaCon;
	private String gaAmount;
	private String gaPro;
	private String gaExp;
	private String gaFee;
	private String gaDelete;
	
	private String totalAmount;
	
	private String color;
	private String year;
	private String month;
	
	public GroupAccount() {
		super();
	}

	public GroupAccount(int gaNo, int gNo, int gmNo, String gaDate, String gaCon, String gaAmount, String gaPro,
			String gaExp, String gaFee, String gaDelete, String totalAmount, String color, String year, String month) {
		super();
		this.gaNo = gaNo;
		this.gNo = gNo;
		this.gmNo = gmNo;
		this.gaDate = gaDate;
		this.gaCon = gaCon;
		this.gaAmount = gaAmount;
		this.gaPro = gaPro;
		this.gaExp = gaExp;
		this.gaFee = gaFee;
		this.gaDelete = gaDelete;
		this.totalAmount = totalAmount;
		this.color = color;
		this.year = year;
		this.month = month;
	}

	public int getGaNo() {
		return gaNo;
	}

	public void setGaNo(int gaNo) {
		this.gaNo = gaNo;
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

	public String getGaDate() {
		return gaDate;
	}

	public void setGaDate(String gaDate) {
		this.gaDate = gaDate;
	}

	public String getGaCon() {
		return gaCon;
	}

	public void setGaCon(String gaCon) {
		this.gaCon = gaCon;
	}

	public String getGaAmount() {
		return gaAmount;
	}

	public void setGaAmount(String gaAmount) {
		this.gaAmount = gaAmount;
	}

	public String getGaPro() {
		return gaPro;
	}

	public void setGaPro(String gaPro) {
		this.gaPro = gaPro;
	}

	public String getGaExp() {
		return gaExp;
	}

	public void setGaExp(String gaExp) {
		this.gaExp = gaExp;
	}

	public String getGaFee() {
		return gaFee;
	}

	public void setGaFee(String gaFee) {
		this.gaFee = gaFee;
	}

	public String getGaDelete() {
		return gaDelete;
	}

	public void setGaDelete(String gaDelete) {
		this.gaDelete = gaDelete;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "GroupAccount [gaNo=" + gaNo + ", gNo=" + gNo + ", gmNo=" + gmNo + ", gaDate=" + gaDate + ", gaCon="
				+ gaCon + ", gaAmount=" + gaAmount + ", gaPro=" + gaPro + ", gaExp=" + gaExp + ", gaFee=" + gaFee
				+ ", gaDelete=" + gaDelete + ", totalAmount=" + totalAmount + ", color=" + color + ", year=" + year
				+ ", month=" + month + "]\n";
	}
	
}
