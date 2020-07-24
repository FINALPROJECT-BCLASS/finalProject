package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

public class ProfitSum implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4667438296661054609L;
	
	private String date;
	private int sum;
	
	public ProfitSum() {
	}
	
	public ProfitSum(String date, int sum) {
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
		return "ProfitSum [date=" + date + ", sum=" + sum + "]";
	}

}
