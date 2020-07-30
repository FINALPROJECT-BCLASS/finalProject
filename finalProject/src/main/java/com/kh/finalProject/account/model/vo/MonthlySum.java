package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

public class MonthlySum implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8018767992755923592L;
	
	private int month;
	private int sum;
	
	public MonthlySum() {
	}
	
	public MonthlySum(int month, int sum) {
		this.month = month;
		this.sum = sum;
	}
	
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	@Override
	public String toString() {
		return "MonthlySum [month=" + month + ", sum=" + sum + "]";
	}

}
