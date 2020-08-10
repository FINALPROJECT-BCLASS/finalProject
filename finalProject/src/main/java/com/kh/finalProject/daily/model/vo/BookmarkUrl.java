package com.kh.finalProject.daily.model.vo;

import java.io.Serializable;

public class BookmarkUrl implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3179011843496346953L;
	private String ub_no;
	private String id;
	private String bl_no;
	private String ub_title;
	private String ub_con;
	private String ub_url;
	
	public BookmarkUrl() {
		
	}
	
	public BookmarkUrl(String ub_no, String id, String bl_no, String ub_title, String ub_con, String ub_url) {
		super();
		this.ub_no = ub_no;
		this.id = id;
		this.bl_no = bl_no;
		this.ub_title = ub_title;
		this.ub_con = ub_con;
		this.ub_url = ub_url;
	}

	public String getUb_no() {
		return ub_no;
	}

	public void setUb_no(String ub_no) {
		this.ub_no = ub_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBl_no() {
		return bl_no;
	}

	public void setBl_no(String bl_no) {
		this.bl_no = bl_no;
	}

	public String getUb_title() {
		return ub_title;
	}

	public void setUb_title(String ub_title) {
		this.ub_title = ub_title;
	}

	public String getUb_con() {
		return ub_con;
	}

	public void setUb_con(String ub_con) {
		this.ub_con = ub_con;
	}

	public String getUb_url() {
		return ub_url;
	}

	public void setUb_url(String ub_url) {
		this.ub_url = ub_url;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BookmarkUrl [ub_no=" + ub_no + ", id=" + id + ", bl_no=" + bl_no + ", ub_title=" + ub_title
				+ ", ub_con=" + ub_con + ", ub_url=" + ub_url + "]";
	}
	
	

}
