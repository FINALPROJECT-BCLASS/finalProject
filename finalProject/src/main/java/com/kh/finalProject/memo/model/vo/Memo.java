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
	private String memoType;
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
	
	private String blTitle;
	
	// MAP_BOOKMARK
	private String mbTitle;
	private String mbPhone;
	private String mbTime;
	private String mbMemo;
	private String mbAddress;
	
	// URL_BOOKMARK
	private String ubTitle;
	private String ubCon;
	private String ubUrl;
	
	public Memo() {
	}

	public Memo(int memoNo, String id, String memoDate, String memoCon, int mainNo, String memoType, String memoDelete,
			String mpTitle, String mpStart, String mpEnd, String mpTime, String mpMain, String mpSub, String mpMemo,
			String abDate, int apcNo, String apcTitle, int aecNo, String aecTitle, int abAmount, String abMemo,
			String blTitle, String mbTitle, String mbPhone, String mbTime, String mbMemo, String mbAddress,
			String ubTitle, String ubCon, String ubUrl) {
		super();
		this.memoNo = memoNo;
		this.id = id;
		this.memoDate = memoDate;
		this.memoCon = memoCon;
		this.mainNo = mainNo;
		this.memoType = memoType;
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
		this.blTitle = blTitle;
		this.mbTitle = mbTitle;
		this.mbPhone = mbPhone;
		this.mbTime = mbTime;
		this.mbMemo = mbMemo;
		this.mbAddress = mbAddress;
		this.ubTitle = ubTitle;
		this.ubCon = ubCon;
		this.ubUrl = ubUrl;
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

	public String getMemoType() {
		return memoType;
	}

	public void setMemoType(String memoType) {
		this.memoType = memoType;
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

	public String getBlTitle() {
		return blTitle;
	}

	public void setBlTitle(String blTitle) {
		this.blTitle = blTitle;
	}

	public String getMbTitle() {
		return mbTitle;
	}

	public void setMbTitle(String mbTitle) {
		this.mbTitle = mbTitle;
	}

	public String getMbPhone() {
		return mbPhone;
	}

	public void setMbPhone(String mbPhone) {
		this.mbPhone = mbPhone;
	}

	public String getMbTime() {
		return mbTime;
	}

	public void setMbTime(String mbTime) {
		this.mbTime = mbTime;
	}

	public String getMbMemo() {
		return mbMemo;
	}

	public void setMbMemo(String mbMemo) {
		this.mbMemo = mbMemo;
	}

	public String getMbAddress() {
		return mbAddress;
	}

	public void setMbAddress(String mbAddress) {
		this.mbAddress = mbAddress;
	}

	public String getUbTitle() {
		return ubTitle;
	}

	public void setUbTitle(String ubTitle) {
		this.ubTitle = ubTitle;
	}

	public String getUbCon() {
		return ubCon;
	}

	public void setUbCon(String ubCon) {
		this.ubCon = ubCon;
	}

	public String getUbUrl() {
		return ubUrl;
	}

	public void setUbUrl(String ubUrl) {
		this.ubUrl = ubUrl;
	}

	@Override
	public String toString() {
		return "Memo [memoNo=" + memoNo + ", id=" + id + ", memoDate=" + memoDate + ", memoCon=" + memoCon + ", mainNo="
				+ mainNo + ", memoType=" + memoType + ", memoDelete=" + memoDelete + ", mpTitle=" + mpTitle
				+ ", mpStart=" + mpStart + ", mpEnd=" + mpEnd + ", mpTime=" + mpTime + ", mpMain=" + mpMain + ", mpSub="
				+ mpSub + ", mpMemo=" + mpMemo + ", abDate=" + abDate + ", apcNo=" + apcNo + ", apcTitle=" + apcTitle
				+ ", aecNo=" + aecNo + ", aecTitle=" + aecTitle + ", abAmount=" + abAmount + ", abMemo=" + abMemo
				+ ", blTitle=" + blTitle + ", mbTitle=" + mbTitle + ", mbPhone=" + mbPhone + ", mbTime=" + mbTime
				+ ", mbMemo=" + mbMemo + ", mbAddress=" + mbAddress + ", ubTitle=" + ubTitle + ", ubCon=" + ubCon
				+ ", ubUrl=" + ubUrl + "]";
	}

}
