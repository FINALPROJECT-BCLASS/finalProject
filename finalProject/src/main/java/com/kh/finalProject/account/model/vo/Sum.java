package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

public class Sum implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5035108774249487640L;
	
	private String date;
	private int sum;
	
	public Sum() {
	}
	
	public Sum(String date, int sum) {
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
		return "Sum [date=" + date + ", sum=" + sum + "]";
	}

}
