package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

public class MaxExpenditure implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7405230270174715406L;
	
	private String title;
	private int sum;
	
	public MaxExpenditure() {
	}
	
	public MaxExpenditure(String title, int sum) {
		this.title = title;
		this.sum = sum;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	@Override
	public String toString() {
		return "MaxExpenditure [title=" + title + ", sum=" + sum + "]";
	}
	
}
