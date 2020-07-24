package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

public class ExpenditureSum implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6974214354226617783L;
	
	private String date;
	private int sum;
	
	public ExpenditureSum() {
	}
	
	public ExpenditureSum(String date, int sum) {
		this.date = date;
		this.sum = sum;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	@Override
	public String toString() {
		return "ExpenditureSum [date=" + date + ", sum=" + sum + "]";
	}

}
