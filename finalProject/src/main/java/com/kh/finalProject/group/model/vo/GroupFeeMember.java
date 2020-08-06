package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupFeeMember implements Serializable{

	private int gfmNo;
	private int gmNo;
	private int gfNo;
	private String gfmAmount;
	private String gfmDelete;
	private String gfmYn;
	public GroupFeeMember() {
		super();
	}
	public GroupFeeMember(int gfmNo, int gmNo, int gfNo, String gfmAmount, String gfmDelete, String gfmYn) {
		super();
		this.gfmNo = gfmNo;
		this.gmNo = gmNo;
		this.gfNo = gfNo;
		this.gfmAmount = gfmAmount;
		this.gfmDelete = gfmDelete;
		this.gfmYn = gfmYn;
	}
	public int getGfmNo() {
		return gfmNo;
	}
	public void setGfmNo(int gfmNo) {
		this.gfmNo = gfmNo;
	}
	public int getGmNo() {
		return gmNo;
	}
	public void setGmNo(int gmNo) {
		this.gmNo = gmNo;
	}
	public int getGfNo() {
		return gfNo;
	}
	public void setGfNo(int gfNo) {
		this.gfNo = gfNo;
	}
	public String getGfmAmount() {
		return gfmAmount;
	}
	public void setGfmAmount(String gfmAmount) {
		this.gfmAmount = gfmAmount;
	}
	public String getGfmDelete() {
		return gfmDelete;
	}
	public void setGfmDelete(String gfmDelete) {
		this.gfmDelete = gfmDelete;
	}
	public String getGfmYn() {
		return gfmYn;
	}
	public void setGfmYn(String gfmYn) {
		this.gfmYn = gfmYn;
	}
	@Override
	public String toString() {
		return "GroupFeeMember [gfmNo=" + gfmNo + ", gmNo=" + gmNo + ", gfNo=" + gfNo + ", gfmAmount=" + gfmAmount
				+ ", gfmDelete=" + gfmDelete + ", gfmYn=" + gfmYn + "]\n";
	}

	
}
