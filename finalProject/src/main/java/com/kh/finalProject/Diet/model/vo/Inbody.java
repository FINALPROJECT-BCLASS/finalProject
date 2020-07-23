package com.kh.finalProject.Diet.model.vo;

import java.io.Serializable;

public class Inbody implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int inNo; 	//번호
	private String id;	//작성자아이디
	private String inWeight;	//체중
	private String inMuscle;	//골격근량
	private String inFat;		//체지방량
	private String inDate;		//날짜
	private String inDelete;	//삭제여부
	public Inbody() {
	}
	public Inbody(int inNo, String id, String inWeight, String inMuscle, String inFat, String inDate, String inDelete) {
		this.inNo = inNo;
		this.id = id;
		this.inWeight = inWeight;
		this.inMuscle = inMuscle;
		this.inFat = inFat;
		this.inDate = inDate;
		this.inDelete = inDelete;
	}
	public int getInNo() {
		return inNo;
	}
	public void setInNo(int inNo) {
		this.inNo = inNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getInWeight() {
		return inWeight;
	}
	public void setInWeight(String inWeight) {
		this.inWeight = inWeight;
	}
	public String getInMuscle() {
		return inMuscle;
	}
	public void setInMuscle(String inMuscle) {
		this.inMuscle = inMuscle;
	}
	public String getInFat() {
		return inFat;
	}
	public void setInFat(String inFat) {
		this.inFat = inFat;
	}
	public String getInDate() {
		return inDate;
	}
	public void setInDate(String inDate) {
		this.inDate = inDate;
	}
	public String getInDelete() {
		return inDelete;
	}
	public void setInDelete(String inDelete) {
		this.inDelete = inDelete;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Inbody [inNo=" + inNo + ", id=" + id + ", inWeight=" + inWeight + ", inMuscle=" + inMuscle + ", inFat="
				+ inFat + ", inDate=" + inDate + ", inDelete=" + inDelete + "]";
	}
	
	
	
	
	
}
