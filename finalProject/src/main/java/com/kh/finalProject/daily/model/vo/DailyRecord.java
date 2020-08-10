package com.kh.finalProject.daily.model.vo;

import java.io.Serializable;

public class DailyRecord implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1748846615809346259L;
	private String dr_no;
	private String id;
	private String dr_title;
	private String dr_date;
	private String dr_weather;
	private String dr_emotion;
	private String dr_con;
	private String dr_main;
	
	
	public DailyRecord() {

	}

	public DailyRecord(String dr_no, String id, String dr_title, String dr_date, String dr_weather, String dr_emotion,
			String dr_con) {
		super();
		this.dr_no = dr_no;
		this.id = id;
		this.dr_title = dr_title;
		this.dr_date = dr_date;
		this.dr_weather = dr_weather;
		this.dr_emotion = dr_emotion;
		this.dr_con = dr_con;
	}
	
	

	public DailyRecord(String dr_no, String id, String dr_title, String dr_date, String dr_weather, String dr_emotion,
			String dr_con, String dr_main) {
		super();
		this.dr_no = dr_no;
		this.id = id;
		this.dr_title = dr_title;
		this.dr_date = dr_date;
		this.dr_weather = dr_weather;
		this.dr_emotion = dr_emotion;
		this.dr_con = dr_con;
		this.dr_main = dr_main;
	}

	public String getDr_no() {
		return dr_no;
	}

	public void setDr_no(String dr_no) {
		this.dr_no = dr_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDr_title() {
		return dr_title;
	}

	public void setDr_title(String dr_title) {
		this.dr_title = dr_title;
	}

	public String getDr_date() {
		return dr_date;
	}

	public void setDr_date(String dr_date) {
		this.dr_date = dr_date;
	}

	public String getDr_weather() {
		return dr_weather;
	}

	public void setDr_weather(String dr_weather) {
		this.dr_weather = dr_weather;
	}

	public String getDr_emotion() {
		return dr_emotion;
	}

	public void setDr_emotion(String dr_emotion) {
		this.dr_emotion = dr_emotion;
	}

	public String getDr_con() {
		return dr_con;
	}

	public void setDr_con(String dr_con) {
		this.dr_con = dr_con;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getDr_main() {
		return dr_main;
	}

	public void setDr_main(String dr_main) {
		this.dr_main = dr_main;
	}

	@Override
	public String toString() {
		return "DailyRecord [dr_no=" + dr_no + ", id=" + id + ", dr_title=" + dr_title + ", dr_date=" + dr_date
				+ ", dr_weather=" + dr_weather + ", dr_emotion=" + dr_emotion + ", dr_con=" + dr_con + ", dr_main="
				+ dr_main + "]";
	}

	
	
	
	
	

}
