package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

public class ExpCategory implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3381457701187713270L;
	
	private int no;
	private String title;
	private int sum;
	
	public ExpCategory() {
	}

	public ExpCategory(int no, String title, int sum) {
		this.no = no;
		this.title = title;
		this.sum = sum;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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
		return "ExpCategory [no=" + no + ", title=" + title + ", sum=" + sum + "]";
	}

}
