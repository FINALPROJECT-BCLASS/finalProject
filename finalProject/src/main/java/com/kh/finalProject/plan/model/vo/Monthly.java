package com.kh.finalProject.plan.model.vo;

import java.io.Serializable;

public class Monthly implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5354285263246260218L;
	
	private int mpNo;
	private String id;
	private String mpTitle;
	private String mpStart;
	private String mpEnd;
	private String mpTime;
	private String mpLocation;
	private String mpMemo;
	private String mpDelete;
	private int memoNo;
	private String mpView;
	
	public Monthly() {
	}
	
	public Monthly(int mpNo, String id, String mpTitle, String mpStart, String mpEnd, String mpTime, String mpLocation,
			String mpMemo, String mpDelete, int memoNo, String mpView) {
		this.mpNo = mpNo;
		this.id = id;
		this.mpTitle = mpTitle;
		this.mpStart = mpStart;
		this.mpEnd = mpEnd;
		this.mpTime = mpTime;
		this.mpLocation = mpLocation;
		this.mpMemo = mpMemo;
		this.mpDelete = mpDelete;
		this.memoNo = memoNo;
		this.mpView = mpView;
	}

	public int getMpNo() {
		return mpNo;
	}

	public void setMpNo(int mpNo) {
		this.mpNo = mpNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMpTitle() {
		return mpTitle;
	}

	public void setMpTitle(String mpTitle) {
		this.mpTitle = mpTitle;
	}

	public String getMpStart() {
		return mpStart;
	}

	public void setMpStart(String mpStart) {
		this.mpStart = mpStart;
	}

	public String getMpEnd() {
		return mpEnd;
	}

	public void setMpEnd(String mpEnd) {
		this.mpEnd = mpEnd;
	}

	public String getMpTime() {
		return mpTime;
	}

	public void setMpTime(String mpTime) {
		this.mpTime = mpTime;
	}

	public String getMpLocation() {
		return mpLocation;
	}

	public void setMpLocation(String mpLocation) {
		this.mpLocation = mpLocation;
	}

	public String getMpMemo() {
		return mpMemo;
	}

	public void setMpMemo(String mpMemo) {
		this.mpMemo = mpMemo;
	}

	public String getMpDelete() {
		return mpDelete;
	}

	public void setMpDelete(String mpDelete) {
		this.mpDelete = mpDelete;
	}

	public int getMemoNo() {
		return memoNo;
	}

	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}

	public String getMpView() {
		return mpView;
	}

	public void setMpView(String mpView) {
		this.mpView = mpView;
	}

	@Override
	public String toString() {
		return "Monthly [mpNo=" + mpNo + ", id=" + id + ", mpTitle=" + mpTitle + ", mpStart=" + mpStart + ", mpEnd="
				+ mpEnd + ", mpTime=" + mpTime + ", mpLocation=" + mpLocation + ", mpMemo=" + mpMemo + ", mpDelete="
				+ mpDelete + ", memoNo=" + memoNo + ", mpView=" + mpView + "]";
	}

}
