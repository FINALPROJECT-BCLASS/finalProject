package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

public class AccountBook implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7348699050478400850L;
	
	private int abNo;
	private String id;
	private String abDate;
	private int apcNo;
	private int aecNo;
	private int abAmount;
	private String abMemo;
	private String abDelete;
	private int memoNo;
	private String abView;
	
	public AccountBook() {
	}

	public AccountBook(int abNo, String id, String abDate, int apcNo, int aecNo, int abAmount, String abMemo,
			String abDelete, int memoNo, String abView) {
		this.abNo = abNo;
		this.id = id;
		this.abDate = abDate;
		this.apcNo = apcNo;
		this.aecNo = aecNo;
		this.abAmount = abAmount;
		this.abMemo = abMemo;
		this.abDelete = abDelete;
		this.memoNo = memoNo;
		this.abView = abView;
	}

	public int getAbNo() {
		return abNo;
	}

	public void setAbNo(int abNo) {
		this.abNo = abNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getAecNo() {
		return aecNo;
	}

	public void setAecNo(int aecNo) {
		this.aecNo = aecNo;
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

	public String getAbDelete() {
		return abDelete;
	}

	public void setAbDelete(String abDelete) {
		this.abDelete = abDelete;
	}

	public int getMemoNo() {
		return memoNo;
	}

	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}

	public String getAbView() {
		return abView;
	}

	public void setAbView(String abView) {
		this.abView = abView;
	}

	@Override
	public String toString() {
		return "AccountBook [abNo=" + abNo + ", id=" + id + ", abDate=" + abDate + ", apcNo=" + apcNo + ", aecNo="
				+ aecNo + ", abAmount=" + abAmount + ", abMemo=" + abMemo + ", abDelete=" + abDelete + ", memoNo="
				+ memoNo + ", abView=" + abView + "]";
	}
	
}
