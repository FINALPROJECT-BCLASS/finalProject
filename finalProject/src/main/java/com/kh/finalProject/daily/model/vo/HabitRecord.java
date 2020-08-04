package com.kh.finalProject.daily.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class HabitRecord implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7944083292181141057L;
	private String htr_no;
	private String id;
	private int ht_no;
	private String htr_month;
	private String htr_time;
	private String htr_date;
	private String htr_now;
	private String htr_con;
	private String htr_delete;
	
	public HabitRecord() {
	}

	public HabitRecord(String htr_no, String id, int ht_no, String htr_date, String htr_now, String htr_con,
			String htr_delete) {
		super();
		this.htr_no = htr_no;
		this.id = id;
		this.ht_no = ht_no;
		this.htr_date = htr_date;
		this.htr_now = htr_now;
		this.htr_con = htr_con;
		this.htr_delete = htr_delete;
	}
	

	public HabitRecord(String htr_no, String id, int ht_no, String htr_month, String htr_time, String htr_date,
			String htr_now, String htr_con, String htr_delete) {
		super();
		this.htr_no = htr_no;
		this.id = id;
		this.ht_no = ht_no;
		this.htr_month = htr_month;
		this.htr_time = htr_time;
		this.htr_date = htr_date;
		this.htr_now = htr_now;
		this.htr_con = htr_con;
		this.htr_delete = htr_delete;
	}

	public String getHtr_no() {
		return htr_no;
	}

	public void setHtr_no(String htr_no) {
		this.htr_no = htr_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getHt_no() {
		return ht_no;
	}

	public void setHt_no(int ht_no) {
		this.ht_no = ht_no;
	}

	public String getHtr_date() {
		return htr_date;
	}

	public void setHtr_date(String htr_date) {
		this.htr_date = htr_date;
	}

	public String getHtr_now() {
		return htr_now;
	}

	public void setHtr_now(String htr_now) {
		this.htr_now = htr_now;
	}

	public String getHtr_con() {
		return htr_con;
	}

	public void setHtr_con(String htr_con) {
		this.htr_con = htr_con;
	}

	public String getHtr_delete() {
		return htr_delete;
	}

	public void setHtr_delete(String htr_delete) {
		this.htr_delete = htr_delete;
	}

	public String getHtr_month() {
		return htr_month;
	}

	public void setHtr_month(String htr_month) {
		this.htr_month = htr_month;
	}

	public String getHtr_time() {
		return htr_time;
	}

	public void setHtr_time(String htr_time) {
		this.htr_time = htr_time;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "HabitRecord [htr_no=" + htr_no + ", id=" + id + ", ht_no=" + ht_no + ", htr_month=" + htr_month
				+ ", htr_time=" + htr_time + ", htr_date=" + htr_date + ", htr_now=" + htr_now + ", htr_con=" + htr_con
				+ ", htr_delete=" + htr_delete + "]";
	}


	
	
	
	
	
	
}
