package com.kh.finalProject.plan.model.vo;

import java.io.Serializable;

public class MTodolist implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 9171390646794750642L;
	
	private String mtDate;
	private int mtNo;
	private String id;
	private String mtCon;
	private String mtComplete;
	private String mtDelete;
	
	public MTodolist() {
	}

	public MTodolist(String mtDate, int mtNo, String id, String mtCon, String mtComplete, String mtDelete) {
		this.mtDate = mtDate;
		this.mtNo = mtNo;
		this.id = id;
		this.mtCon = mtCon;
		this.mtComplete = mtComplete;
		this.mtDelete = mtDelete;
	}

	public String getMtDate() {
		return mtDate;
	}

	public void setMtDate(String mtDate) {
		this.mtDate = mtDate;
	}

	public int getMtNo() {
		return mtNo;
	}

	public void setMtNo(int mtNo) {
		this.mtNo = mtNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMtCon() {
		return mtCon;
	}

	public void setMtCon(String mtCon) {
		this.mtCon = mtCon;
	}

	public String getMtComplete() {
		return mtComplete;
	}

	public void setMtComplete(String mtComplete) {
		this.mtComplete = mtComplete;
	}

	public String getMtDelete() {
		return mtDelete;
	}

	public void setMtDelete(String mtDelete) {
		this.mtDelete = mtDelete;
	}

	@Override
	public String toString() {
		return "MTodolist [mtDate=" + mtDate + ", mtNo=" + mtNo + ", id=" + id + ", mtCon=" + mtCon + ", mtComplete="
				+ mtComplete + ", mtDelete=" + mtDelete + "]";
	}

}
