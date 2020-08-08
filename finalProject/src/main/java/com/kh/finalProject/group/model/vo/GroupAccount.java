package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupAccount implements Serializable{

	private int gaNo;
	private int gNo;
	private int gmNo;
	private String gaTitle;
	private String gaDate;
	private String gaCon;
	private String gaAmount;
	private String gaPro;
	private String gaExp;
	private String gaFee;
	private String gaDelete;
	private String gasYn;
	
	private String totalAmount;
	
	private String color;
	private String year;
	private String month;
	
	public GroupAccount() {
		super();
	}

	public GroupAccount(int gaNo, int gNo, int gmNo, String gaTitle, String gaDate, String gaCon, String gaAmount,
			String gaPro, String gaExp, String gaFee, String gaDelete, String gasYn, String totalAmount, String color,
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

	public final int getGaNo() {
		return gaNo;
	}

	public final void setGaNo(int gaNo) {
		this.gaNo = gaNo;
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

	public final String getGaCon() {
		return gaCon;
	}

	public final void setGaCon(String gaCon) {
		this.gaCon = gaCon;
	}

	public final String getGaAmount() {
		return gaAmount;
	}

	public final void setGaAmount(String gaAmount) {
		this.gaAmount = gaAmount;
	}

	public final String getGaPro() {
		return gaPro;
	}

	public final void setGaPro(String gaPro) {
		this.gaPro = gaPro;
	}

	public final String getGaExp() {
		return gaExp;
	}

	public final void setGaExp(String gaExp) {
		this.gaExp = gaExp;
	}

	public final String getGaFee() {
		return gaFee;
	}

	public final void setGaFee(String gaFee) {
		this.gaFee = gaFee;
	}

	public final String getGaDelete() {
		return gaDelete;
	}

	public final void setGaDelete(String gaDelete) {
		this.gaDelete = gaDelete;
	}

	public final String getGasYn() {
		return gasYn;
	}

	public final void setGasYn(String gasYn) {
		this.gasYn = gasYn;
	}

	public final String getTotalAmount() {
		return totalAmount;
	}

	public final void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public final String getColor() {
		return color;
	}

	public final void setColor(String color) {
		this.color = color;
	}

	public final String getYear() {
		return year;
	}

	public final void setYear(String year) {
		this.year = year;
	}

	public final String getMonth() {
		return month;
	}

	public final void setMonth(String month) {
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
