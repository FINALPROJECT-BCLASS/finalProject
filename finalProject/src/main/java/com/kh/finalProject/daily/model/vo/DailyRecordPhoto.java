package com.kh.finalProject.daily.model.vo;

import java.io.Serializable;

public class DailyRecordPhoto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3707840072441356320L;
	private String drp_no;
	private String dr_no;
	private String drp_origin;
	private String drp_rename;
	
	public DailyRecordPhoto() {

	}

	public DailyRecordPhoto(String drp_no, String dr_no, String drp_origin, String drp_rename) {
		super();
		this.drp_no = drp_no;
		this.dr_no = dr_no;
		this.drp_origin = drp_origin;
		this.drp_rename = drp_rename;
	}

	public String getDrp_no() {
		return drp_no;
	}

	public void setDrp_no(String drp_no) {
		this.drp_no = drp_no;
	}

	public String getDr_no() {
		return dr_no;
	}

	public void setDr_no(String dr_no) {
		this.dr_no = dr_no;
	}

	public String getDrp_origin() {
		return drp_origin;
	}

	public void setDrp_origin(String drp_origin) {
		this.drp_origin = drp_origin;
	}

	public String getDrp_rename() {
		return drp_rename;
	}

	public void setDrp_rename(String drp_rename) {
		this.drp_rename = drp_rename;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "DailyRecordPhoto [drp_no=" + drp_no + ", dr_no=" + dr_no + ", drp_origin=" + drp_origin
				+ ", drp_rename=" + drp_rename + "]";
	}
	
	
	
	
	
	

}
