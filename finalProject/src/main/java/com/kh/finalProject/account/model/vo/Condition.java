package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("condition")
public class Condition implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 180450698626191540L;
	
	private String id;
	private String year;
	private String month;
	
	public Condition() {
	}
	
	public Condition(String id, String year, String month) {
		this.id = id;
		this.year = year;
		this.month = month;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	@Override
	public String toString() {
		return "Condition [id=" + id + ", year=" + year + ", month=" + month + "]";
	}
	
}
