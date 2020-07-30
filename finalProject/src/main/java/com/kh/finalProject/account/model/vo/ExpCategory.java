package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

public class ExpCategory implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3381457701187713270L;
	
	private int sum;
	private String title;
	
	public ExpCategory() {
	}
	
	public ExpCategory(int sum, String title) {
		this.sum = sum;
		this.title = title;
	}
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "ExpCategory [sum=" + sum + ", title=" + title + "]";
	}

}
