package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupAccount implements Serializable{

	private int gaNo;
	private int gNo;
	private int gmNo;
	private String gaStart;
	private String gaEnd;
	private String gaPost;
	private String address1;
	private String address2;
	private String gaCon;
	private String gaExp;
	private String gaDelete;
	public GroupAccount() {
		super();
	}
	public GroupAccount(int gaNo, int gNo, int gmNo, String gaStart, String gaEnd, String gaPost, String address1,
			String address2, String gaCon, String gaExp, String gaDelete) {
		super();
		this.gaNo = gaNo;
		this.gNo = gNo;
		this.gmNo = gmNo;
		this.gaStart = gaStart;
		this.gaEnd = gaEnd;
		this.gaPost = gaPost;
		this.address1 = address1;
		this.address2 = address2;
		this.gaCon = gaCon;
		this.gaExp = gaExp;
		this.gaDelete = gaDelete;
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
	public String getGaStart() {
		return gaStart;
	}
	public void setGaStart(String gaStart) {
		this.gaStart = gaStart;
	}
	public String getGaEnd() {
		return gaEnd;
	}
	public void setGaEnd(String gaEnd) {
		this.gaEnd = gaEnd;
	}
	public String getGaPost() {
		return gaPost;
	}
	public void setGaPost(String gaPost) {
		this.gaPost = gaPost;
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
	public String getGaCon() {
		return gaCon;
	}
	public void setGaCon(String gaCon) {
		this.gaCon = gaCon;
	}
	public String getGaExp() {
		return gaExp;
	}
	public void setGaExp(String gaExp) {
		this.gaExp = gaExp;
	}
	public String getGaDelete() {
		return gaDelete;
	}
	public void setGaDelete(String gaDelete) {
		this.gaDelete = gaDelete;
	}
	@Override
	public String toString() {
		return "GroupAccount [gaNo=" + gaNo + ", gNo=" + gNo + ", gmNo=" + gmNo + ", gaStart=" + gaStart + ", gaEnd="
				+ gaEnd + ", gaPost=" + gaPost + ", address1=" + address1 + ", address2=" + address2 + ", gaCon="
				+ gaCon + ", gaExp=" + gaExp + ", gaDelete=" + gaDelete + "]\n";
	}
	
	
	
}
