package com.kh.finalProject.daily.model.vo;

import java.io.Serializable;

public class Habit implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5582280732097615951L;
	private int ht_no;
	private String id;
	private String ht_title;
	private String ht_type;
	private String ht_goal;
	private String ht_unit;
	private String ht_cycle;
	private String ht_start;
	private String ht_amount;
	private String ht_color;
	private String ht_con;
	private String ht_delete;
	private String ht_now;
	
	public Habit() {
	}

	public Habit(int ht_no, String id, String ht_title, String ht_type, String ht_goal, String ht_unit,
			String ht_cycle, String ht_start, String ht_amount, String ht_color, String ht_con, String ht_delete, String ht_now) {
		super();
		this.ht_no = ht_no;
		this.id = id;
		this.ht_title = ht_title;
		this.ht_type = ht_type;
		this.ht_goal = ht_goal;
		this.ht_unit = ht_unit;
		this.ht_cycle = ht_cycle;
		this.ht_start = ht_start;
		this.ht_amount = ht_amount;
		this.ht_color = ht_color;
		this.ht_con = ht_con;
		this.ht_delete = ht_delete;
		this.ht_now = ht_now;
	}

	public int getHt_no() {
		return ht_no;
	}

	public void setHt_no(int ht_no) {
		this.ht_no = ht_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHt_title() {
		return ht_title;
	}

	public void setHt_title(String ht_title) {
		this.ht_title = ht_title;
	}

	public String getHt_type() {
		return ht_type;
	}

	public void setHt_type(String ht_type) {
		this.ht_type = ht_type;
	}

	public String getHt_goal() {
		return ht_goal;
	}

	public void setHt_goal(String ht_goal) {
		this.ht_goal = ht_goal;
	}

	public String getHt_unit() {
		return ht_unit;
	}

	public void setHt_unit(String ht_unit) {
		this.ht_unit = ht_unit;
	}

	public String getHt_cycle() {
		return ht_cycle;
	}

	public void setHt_cycle(String ht_cycle) {
		this.ht_cycle = ht_cycle;
	}

	public String getHt_start() {
		return ht_start;
	}

	public void setHt_start(String ht_start) {
		this.ht_start = ht_start;
	}

	public String getHt_amount() {
		return ht_amount;
	}

	public void setHt_amount(String ht_amount) {
		this.ht_amount = ht_amount;
	}

	public String getHt_color() {
		return ht_color;
	}

	public void setHt_color(String ht_color) {
		this.ht_color = ht_color;
	}

	public String getHt_con() {
		return ht_con;
	}

	public void setHt_con(String ht_con) {
		this.ht_con = ht_con;
	}

	public String getHt_delete() {
		return ht_delete;
	}

	public void setHt_delete(String ht_delete) {
		this.ht_delete = ht_delete;
	}
	
	public String getHt_now() {
		return ht_now;
	}

	public void setHt_now(String ht_now) {
		this.ht_now = ht_now;
	}
	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Habit [ht_no=" + ht_no + ", id=" + id + ", ht_title=" + ht_title + ", ht_type=" + ht_type + ", ht_goal="
				+ ht_goal + ", ht_unit=" + ht_unit + ", ht_cycle=" + ht_cycle + ", ht_start=" + ht_start
				+ ", ht_amount=" + ht_amount + ", ht_color=" + ht_color + ", ht_con=" + ht_con + ", ht_delete="
				+ ht_delete + ", ht_now=" + ht_now + "]";
	}

	
	
	

}
