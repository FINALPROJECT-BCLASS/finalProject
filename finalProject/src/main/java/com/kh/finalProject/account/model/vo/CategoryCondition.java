package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("cc")
public class CategoryCondition implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 727418812861198651L;
	
	private String id;
	private String year;
	private String month;
	
	public CategoryCondition() {
	}
	
	public CategoryCondition(String id, String year, String month) {
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
		return "CategoryCondition [id=" + id + ", year=" + year + ", month=" + month + "]";
	}

}
