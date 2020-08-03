package com.kh.finalProject.chat.model.vo;

import java.io.Serializable;

public class openChat implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6757861198381183388L;
	
	private int cm_no;			//오픈채팅방 번호
	private String cm_title; 	// 오픈채팅방이름
	private String cm_pwd;		//오픈채팅방비밀번호
	private int cm_max;			//최대인원
	private int cm_cot;			//현재인원
	private String cm_con;		//방 소개
	private String cm_id;		//아이디
	
	public openChat() {
	}
	public openChat(int cm_no, String cm_title, String cm_pwd, int cm_max, int cm_cot, String cm_con, String cm_id) {
		this.cm_no = cm_no;
		this.cm_title = cm_title;
		this.cm_pwd = cm_pwd;
		this.cm_max = cm_max;
		this.cm_cot = cm_cot;
		this.cm_con = cm_con;
		this.cm_id = cm_id;
	}
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public String getCm_title() {
		return cm_title;
	}
	public void setCm_title(String cm_title) {
		this.cm_title = cm_title;
	}
	public String getCm_pwd() {
		return cm_pwd;
	}
	public void setCm_pwd(String cm_pwd) {
		this.cm_pwd = cm_pwd;
	}
	public int getCm_max() {
		return cm_max;
	}
	public void setCm_max(int cm_max) {
		this.cm_max = cm_max;
	}
	public int getCm_cot() {
		return cm_cot;
	}
	public void setCm_cot(int cm_cot) {
		this.cm_cot = cm_cot;
	}
	public String getCm_con() {
		return cm_con;
	}
	public void setCm_con(String cm_con) {
		this.cm_con = cm_con;
	}
	public String getCm_id() {
		return cm_id;
	}
	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "openChat [cm_no=" + cm_no + ", cm_title=" + cm_title + ", cm_pwd=" + cm_pwd + ", cm_max=" + cm_max
				+ ", cm_cot=" + cm_cot + ", cm_con=" + cm_con + ", cm_id=" + cm_id + "]";
	}
	
	

}
