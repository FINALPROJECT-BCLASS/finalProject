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
	
	// ACCOUNT_BOOK (mainNo == 9)
	private String abDate;
	private int apcNo;
	private String apcTitle;
	private int aecNo;
	private String aecTitle;
	private int abAmount;
	private String abMemo;
	
	public Memo() {
	}

	public Memo(int memoNo, String id, String memoDate, String memoCon, int mainNo, String memoDelete, String mpTitle,
			String mpStart, String mpEnd, String mpTime, String mpMain, String mpSub, String mpMemo, String abDate,
			int apcNo, String apcTitle, int aecNo, String aecTitle, int abAmount, String abMemo) {
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
		this.abDate = abDate;
		this.apcNo = apcNo;
		this.apcTitle = apcTitle;
		this.aecNo = aecNo;
		this.aecTitle = aecTitle;
		this.abAmount = abAmount;
		this.abMemo = abMemo;
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

	public String getAbDate() {
		return abDate;
	}

	public void setAbDate(String abDate) {
		this.abDate = abDate;
	}

	public int getApcNo() {
		return apcNo;
	}

	public void setApcNo(int apcNo) {
		this.apcNo = apcNo;
	}

	public String getApcTitle() {
		return apcTitle;
	}

	public void setApcTitle(String apcTitle) {
		this.apcTitle = apcTitle;
	}

	public int getAecNo() {
		return aecNo;
	}

	public void setAecNo(int aecNo) {
		this.aecNo = aecNo;
	}

	public String getAecTitle() {
		return aecTitle;
	}

	public void setAecTitle(String aecTitle) {
		this.aecTitle = aecTitle;
	}

	public int getAbAmount() {
		return abAmount;
	}

	public void setAbAmount(int abAmount) {
		this.abAmount = abAmount;
	}

	public String getAbMemo() {
		return abMemo;
	}

	public void setAbMemo(String abMemo) {
		this.abMemo = abMemo;
	}

	@Override
	public String toString() {
		return "Memo [memoNo=" + memoNo + ", id=" + id + ", memoDate=" + memoDate + ", memoCon=" + memoCon + ", mainNo="
				+ mainNo + ", memoDelete=" + memoDelete + ", mpTitle=" + mpTitle + ", mpStart=" + mpStart + ", mpEnd="
				+ mpEnd + ", mpTime=" + mpTime + ", mpMain=" + mpMain + ", mpSub=" + mpSub + ", mpMemo=" + mpMemo
				+ ", abDate=" + abDate + ", apcNo=" + apcNo + ", apcTitle=" + apcTitle + ", aecNo=" + aecNo
				+ ", aecTitle=" + aecTitle + ", abAmount=" + abAmount + ", abMemo=" + abMemo + "]";
	}

}
