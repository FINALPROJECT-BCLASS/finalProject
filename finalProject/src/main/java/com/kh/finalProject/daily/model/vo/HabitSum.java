package com.kh.finalProject.daily.model.vo;

import java.io.Serializable;

public class HabitSum implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5884854034481544628L;
	private int ht_no;
	private int ht_now;
	
	public HabitSum() {
	}

	public HabitSum(int ht_no, int ht_now) {
		super();
		this.ht_no = ht_no;
		this.ht_now = ht_now;
	}

	public int getHt_no() {
		return ht_no;
	}

	public void setHt_no(int ht_no) {
		this.ht_no = ht_no;
	}

	public int getHt_now() {
		return ht_now;
	}

	public void setHt_now(int ht_now) {
		this.ht_now = ht_now;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "HabitSum [ht_no=" + ht_no + ", ht_now=" + ht_now + "]";
	}
	
	
	
	
		
	
}
