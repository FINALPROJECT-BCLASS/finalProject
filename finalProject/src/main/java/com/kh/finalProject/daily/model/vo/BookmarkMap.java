package com.kh.finalProject.daily.model.vo;

import java.io.Serializable;

public class BookmarkMap implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -75220750298148154L;
	
	private String mb_no;
	private String id;
	private String bl_no;
	private String mb_title;
	private String mb_phone;
	private String mb_time;
	private String mb_memo;
	private String mb_address;
	
	public BookmarkMap() {
	
	}

	public BookmarkMap(String mb_no, String id, String bl_no, String mb_title, String mb_phone) {
		super();
		this.mb_no = mb_no;
		this.id = id;
		this.bl_no = bl_no;
		this.mb_title = mb_title;
		this.mb_phone = mb_phone;
	}

	public BookmarkMap(String mb_no, String id, String bl_no, String mb_title, String mb_phone, String mb_time,
			String mb_memo, String mb_address) {
		super();
		this.mb_no = mb_no;
		this.id = id;
		this.bl_no = bl_no;
		this.mb_title = mb_title;
		this.mb_phone = mb_phone;
		this.mb_time = mb_time;
		this.mb_memo = mb_memo;
		this.mb_address = mb_address;
	}

	public String getMb_no() {
		return mb_no;
	}

	public void setMb_no(String mb_no) {
		this.mb_no = mb_no;
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

	public String getMb_title() {
		return mb_title;
	}

	public void setMb_title(String mb_title) {
		this.mb_title = mb_title;
	}

	public String getMb_phone() {
		return mb_phone;
	}

	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}

	public String getMb_time() {
		return mb_time;
	}

	public void setMb_time(String mb_time) {
		this.mb_time = mb_time;
	}

	public String getMb_memo() {
		return mb_memo;
	}

	public void setMb_memo(String mb_memo) {
		this.mb_memo = mb_memo;
	}

	public String getMb_address() {
		return mb_address;
	}

	public void setMb_address(String mb_address) {
		this.mb_address = mb_address;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BookmarkMap [mb_no=" + mb_no + ", id=" + id + ", bl_no=" + bl_no + ", mb_title=" + mb_title
				+ ", mb_phone=" + mb_phone + ", mb_time=" + mb_time + ", mb_memo=" + mb_memo + ", mb_address="
				+ mb_address + "]";
	}
	
	
}
