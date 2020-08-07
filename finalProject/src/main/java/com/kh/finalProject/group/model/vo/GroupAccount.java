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
	
	private String color;
	public GroupAccount() {
		super();
	}
	public GroupAccount(int gaNo, int gNo, int gmNo, String gaDate, String gaCon, String gaAmount, String gaPro,
			String gaExp, String gaFee, String gaDelete, String color) {
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
		this.color = color;
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "GroupAccount [gaNo=" + gaNo + ", gNo=" + gNo + ", gmNo=" + gmNo + ", gaDate=" + gaDate + ", gaCon="
				+ gaCon + ", gaAmount=" + gaAmount + ", gaPro=" + gaPro + ", gaExp=" + gaExp + ", gaFee=" + gaFee
				+ ", gaDelete=" + gaDelete + ", color=" + color + "]\n";
	}

	
	
}
