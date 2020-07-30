package com.kh.finalProject.chat.model.vo;

import java.io.Serializable;

public class Chat implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -642269781780958932L;

	private int co_no;				//co_no
	private int ol_no;				//ol_no
	private String id; 				//id1
	private String id2; 			//id2
	private String ol_cont;			//OL_CONT
	private String ol_date;			//OL_DATE
	public Chat() {
	}
	public Chat(int co_no, int ol_no, String id, String id2, String ol_cont, String ol_date) {
		this.co_no = co_no;
		this.ol_no = ol_no;
		this.id = id;
		this.id2 = id2;
		this.ol_cont = ol_cont;
		this.ol_date = ol_date;
	}
	public int getCo_no() {
		return co_no;
	}
	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	public int getOl_no() {
		return ol_no;
	}
	public void setOl_no(int ol_no) {
		this.ol_no = ol_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getId2() {
		return id2;
	}
	public void setId2(String id2) {
		this.id2 = id2;
	}
	public String getOl_cont() {
		return ol_cont;
	}
	public void setOl_cont(String ol_cont) {
		this.ol_cont = ol_cont;
	}
	public String getOl_date() {
		return ol_date;
	}
	public void setOl_date(String ol_date) {
		this.ol_date = ol_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Chat [co_no=" + co_no + ", ol_no=" + ol_no + ", id=" + id + ", id2=" + id2 + ", ol_cont=" + ol_cont
				+ ", ol_date=" + ol_date + "]";
	}
	
	
}
