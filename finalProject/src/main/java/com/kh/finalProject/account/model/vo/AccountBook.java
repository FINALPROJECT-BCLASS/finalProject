package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

public class AccountBook implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7348699050478400850L;
	
	private int abNo;
	private String id;
	private int abPro;
	private int apcNo;
	private int abExp;
	private int aecNo;
	private String abDate;
	private int abAmount;
	private String abMemo;
	private String abDelete;
	private int memoNo;
	private String abView;
	
	public AccountBook() {
	}
	
	public AccountBook(int abNo, String id, int abPro, int apcNo, int abExp, int aecNo, String abDate, int abAmount,
			String abMemo, String abDelete, int memoNo, String abView) {
		this.abNo = abNo;
		this.id = id;
		this.abPro = abPro;
		this.apcNo = apcNo;
		this.abExp = abExp;
		this.aecNo = aecNo;
		this.abDate = abDate;
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

	public int getAbPro() {
		return abPro;
	}

	public void setAbPro(int abPro) {
		this.abPro = abPro;
	}

	public int getApcNo() {
		return apcNo;
	}

	public void setApcNo(int apcNo) {
		this.apcNo = apcNo;
	}

	public int getAbExp() {
		return abExp;
	}

	public void setAbExp(int abExp) {
		this.abExp = abExp;
	}

	public int getAecNo() {
		return aecNo;
	}

	public void setAecNo(int aecNo) {
		this.aecNo = aecNo;
	}

	public String getAbDate() {
		return abDate;
	}

	public void setAbDate(String abDate) {
		this.abDate = abDate;
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
		return "AccountBook [abNo=" + abNo + ", id=" + id + ", abPro=" + abPro + ", apcNo=" + apcNo + ", abExp=" + abExp
				+ ", aecNo=" + aecNo + ", abDate=" + abDate + ", abAmount=" + abAmount + ", abMemo=" + abMemo
				+ ", abDelete=" + abDelete + ", memoNo=" + memoNo + ", abView=" + abView + "]";
	}
	
}
