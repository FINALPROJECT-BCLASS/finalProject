package com.kh.finalProject.memo.model.vo;

import java.io.Serializable;

public class Memo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1231455028191754035L;
	
	private int memoNo;
	private String id;
	private String memoDate;
	private String memoCon;
	private int mainNo;
	private String memoDelete;
	
	public Memo() {
	}
	
	public Memo(int memoNo, String id, String memoDate, String memoCon, int mainNo, String memoDelete) {
		this.memoNo = memoNo;
		this.id = id;
		this.memoDate = memoDate;
		this.memoCon = memoCon;
		this.mainNo = mainNo;
		this.memoDelete = memoDelete;
	}
	
	public int getMemoNo() {
		return memoNo;
	}
	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMemoDate() {
		return memoDate;
	}
	public void setMemoDate(String memoDate) {
		this.memoDate = memoDate;
	}
	public String getMemoCon() {
		return memoCon;
	}
	public void setMemoCon(String memoCon) {
		this.memoCon = memoCon;
	}
	public int getMainNo() {
		return mainNo;
	}
	public void setMainNo(int mainNo) {
		this.mainNo = mainNo;
	}
	public String getMemoDelete() {
		return memoDelete;
	}
	public void setMemoDelete(String memoDelete) {
		this.memoDelete = memoDelete;
	}
	
	@Override
	public String toString() {
		return "Memo [memoNo=" + memoNo + ", id=" + id + ", memoDate=" + memoDate + ", memoCon=" + memoCon + ", mainNo="
				+ mainNo + ", memoDelete=" + memoDelete + "]";
	}

}
