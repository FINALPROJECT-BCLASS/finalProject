package com.kh.finalProject.plan.model.vo;

import java.io.Serializable;

public class DTodolist implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7695055308901911177L;
	
	private int dtNo;
	private String id;
	private String dtDate;
	private String dtCon;
	private String dtComplete;
	private String dtDelete;
	
	public DTodolist() {
	}
	
	public DTodolist(int dtNo, String id, String dtDate, String dtCon, String dtComplete, String dtDelete) {
		this.dtNo = dtNo;
		this.id = id;
		this.dtDate = dtDate;
		this.dtCon = dtCon;
		this.dtComplete = dtComplete;
		this.dtDelete = dtDelete;
	}
	
	public int getDtNo() {
		return dtNo;
	}
	public void setDtNo(int dtNo) {
		this.dtNo = dtNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDtDate() {
		return dtDate;
	}
	public void setDtDate(String dtDate) {
		this.dtDate = dtDate;
	}
	public String getDtCon() {
		return dtCon;
	}
	public void setDtCon(String dtCon) {
		this.dtCon = dtCon;
	}
	public String getDtComplete() {
		return dtComplete;
	}
	public void setDtComplete(String dtComplete) {
		this.dtComplete = dtComplete;
	}
	public String getDtDelete() {
		return dtDelete;
	}
	public void setDtDelete(String dtDelete) {
		this.dtDelete = dtDelete;
	}
	
	@Override
	public String toString() {
		return "DTodolist [dtNo=" + dtNo + ", id=" + id + ", dtDate=" + dtDate + ", dtCon=" + dtCon + ", dtComplete="
				+ dtComplete + ", dtDelete=" + dtDelete + "]";
	}

}
