package com.kh.finalProject.plan.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("mp")
public class MPlan implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1212681267861643920L;
	
	private int mpNo;
	private String id;
	private String mpTitle;
	private String mpStart;
	private String mpEnd;
	private String mpTime;
	private String mpColor;
	private String mpMain;
	private String mpSub;
	private String mpMemo;
	private String mpDelete;
	private int memoNo;
	private String mpView;
	
	public MPlan() {
	}

	public MPlan(int mpNo, String id, String mpTitle, String mpStart, String mpEnd, String mpTime, String mpColor,
			String mpMain, String mpSub, String mpMemo, String mpDelete, int memoNo, String mpView) {
		this.mpNo = mpNo;
		this.id = id;
		this.mpTitle = mpTitle;
		this.mpStart = mpStart;
		this.mpEnd = mpEnd;
		this.mpTime = mpTime;
		this.mpColor = mpColor;
		this.mpMain = mpMain;
		this.mpSub = mpSub;
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

	public String getMpColor() {
		return mpColor;
	}

	public void setMpColor(String mpColor) {
		this.mpColor = mpColor;
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
		return "MPlan [mpNo=" + mpNo + ", id=" + id + ", mpTitle=" + mpTitle + ", mpStart=" + mpStart + ", mpEnd="
				+ mpEnd + ", mpTime=" + mpTime + ", mpColor=" + mpColor + ", mpMain=" + mpMain + ", mpSub=" + mpSub
				+ ", mpMemo=" + mpMemo + ", mpDelete=" + mpDelete + ", memoNo=" + memoNo + ", mpView=" + mpView + "]";
	}

}
