package com.kh.finalProject.account.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

public class MSumCondition implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2558042746708687973L;
	
	private String id;
	private String year;
	
	public MSumCondition() {
	}
	
	public MSumCondition(String id, String year) {
		this.id = id;
		this.year = year;
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
	
	@Override
	public String toString() {
		return "MSumCondition [id=" + id + ", year=" + year + "]";
	}

}
