package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupAccount implements Serializable{

	private int gaNo;
	private int gNo;
	private int gmNo;
	private String gaTitle;
	private String gaDate;
	private String gaCon;
	private int gaAmount;
	private String gaPro;
	private String gaExp;
	private String gaFee;
	private String gaDelete;
	private String gasYn;
	
	private int totalAmount;
	
	private String color;
	private String year;
	private String month;
	
	public GroupAccount() {
		super();
	}

	public GroupAccount(int gaNo, int gNo, int gmNo, String gaTitle, String gaDate, String gaCon, int gaAmount,
			String gaPro, String gaExp, String gaFee, String gaDelete, String gasYn, int totalAmount, String color,
			String year, String month) {
		super();
		this.gaNo = gaNo;
		this.gNo = gNo;
		this.gmNo = gmNo;
		this.gaTitle = gaTitle;
		this.gaDate = gaDate;
		this.gaCon = gaCon;
		this.gaAmount = gaAmount;
		this.gaPro = gaPro;
		this.gaExp = gaExp;
		this.gaFee = gaFee;
		this.gaDelete = gaDelete;
		this.gasYn = gasYn;
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

	public String getGaTitle() {
		return gaTitle;
	}

	public void setGaTitle(String gaTitle) {
		this.gaTitle = gaTitle;
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

	public int getGaAmount() {
		return gaAmount;
	}

	public void setGaAmount(int gaAmount) {
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

	public String getGasYn() {
		return gasYn;
	}

	public void setGasYn(String gasYn) {
		this.gasYn = gasYn;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
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
		return "GroupAccount [gaNo=" + gaNo + ", gNo=" + gNo + ", gmNo=" + gmNo + ", gaTitle=" + gaTitle + ", gaDate="
				+ gaDate + ", gaCon=" + gaCon + ", gaAmount=" + gaAmount + ", gaPro=" + gaPro + ", gaExp=" + gaExp
				+ ", gaFee=" + gaFee + ", gaDelete=" + gaDelete + ", gasYn=" + gasYn + ", totalAmount=" + totalAmount
				+ ", color=" + color + ", year=" + year + ", month=" + month + "]\n";
	}

		
	
}
