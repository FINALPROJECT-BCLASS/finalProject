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
	
	// MONTHLY_PLAN (mainNo == 1)
	private String mpTitle;
	private String mpStart;
	private String mpEnd;
	private String mpTime;
	private String mpMain;
	private String mpSub;
	private String mpMemo;
	
	public Memo() {
	}

	public Memo(int memoNo, String id, String memoDate, String memoCon, int mainNo, String memoDelete, String mpTitle,
			String mpStart, String mpEnd, String mpTime, String mpMain, String mpSub, String mpMemo) {
		this.memoNo = memoNo;
		this.id = id;
		this.memoDate = memoDate;
		this.memoCon = memoCon;
		this.mainNo = mainNo;
		this.memoDelete = memoDelete;
		this.mpTitle = mpTitle;
		this.mpStart = mpStart;
		this.mpEnd = mpEnd;
		this.mpTime = mpTime;
		this.mpMain = mpMain;
		this.mpSub = mpSub;
		this.mpMemo = mpMemo;
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

	public String getMpMain() {
		return mpMain;
	}

	public void setMpMain(String mpMain) {
		this.mpMain = mpMain;
	}

	public String getMpSub() {
		return mpSub;
	}

	public void setMpSub(String mpSub) {
		this.mpSub = mpSub;
	}

	public String getMpMemo() {
		return mpMemo;
	}

	public void setMpMemo(String mpMemo) {
		this.mpMemo = mpMemo;
	}

	@Override
	public String toString() {
		return "Memo [memoNo=" + memoNo + ", id=" + id + ", memoDate=" + memoDate + ", memoCon=" + memoCon + ", mainNo="
				+ mainNo + ", memoDelete=" + memoDelete + ", mpTitle=" + mpTitle + ", mpStart=" + mpStart + ", mpEnd="
				+ mpEnd + ", mpTime=" + mpTime + ", mpMain=" + mpMain + ", mpSub=" + mpSub + ", mpMemo=" + mpMemo + "]";
	}

}
