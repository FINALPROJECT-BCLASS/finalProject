package com.kh.finalProject.daily.model.vo;

import java.io.Serializable;

public class Bookmark implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8994455394851274067L;
	
	private String bl_no;
	private String id;
	private String bl_title;
	private String bl_con;
	private String bl_type;
	private String bl_origin;
	private String bl_rename;
	
	public Bookmark() {

	}

	public Bookmark(String bl_no, String id, String bl_title, String bl_con, String bl_type, String bl_origin,
			String bl_rename) {
		super();
		this.bl_no = bl_no;
		this.id = id;
		this.bl_title = bl_title;
		this.bl_con = bl_con;
		this.bl_type = bl_type;
		this.bl_origin = bl_origin;
		this.bl_rename = bl_rename;
	}

	public String getBl_no() {
		return bl_no;
	}

	public void setBl_no(String bl_no) {
		this.bl_no = bl_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBl_title() {
		return bl_title;
	}

	public void setBl_title(String bl_title) {
		this.bl_title = bl_title;
	}

	public String getBl_con() {
		return bl_con;
	}

	public void setBl_con(String bl_con) {
		this.bl_con = bl_con;
	}

	public String getBl_type() {
		return bl_type;
	}

	public void setBl_type(String bl_type) {
		this.bl_type = bl_type;
	}

	public String getBl_origin() {
		return bl_origin;
	}

	public void setBl_origin(String bl_origin) {
		this.bl_origin = bl_origin;
	}

	public String getBl_rename() {
		return bl_rename;
	}

	public void setBl_rename(String bl_rename) {
		this.bl_rename = bl_rename;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Bookmark [bl_no=" + bl_no + ", id=" + id + ", bl_title=" + bl_title + ", bl_con=" + bl_con
				+ ", bl_type=" + bl_type + ", bl_origin=" + bl_origin + ", bl_rename=" + bl_rename + "]";
	}
	
	
	
	

}
