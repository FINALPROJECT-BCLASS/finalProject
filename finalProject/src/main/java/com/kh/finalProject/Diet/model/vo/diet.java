package com.kh.finalProject.Diet.model.vo;

import java.io.Serializable;

public class diet implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String diNo;		//번호
	private String id; 			//작성자아이디
	private String dtDate; 		//작성날짜
	private String dtWhen;		//먹은 시간
	private String diFood;		//음식명
	private String diAmount;	//수량
	private int diCar;		//탄수화물
	private int diPro;		//단백질
	private int diFat;		//지방
	private int diNa;		//나트륨
	private int diKcal;		//칼로리
	private String diDelete;	//삭제여부
	
	public diet() {
	}
	
	public diet(String diNo, String id, String dtDate, String dtWhen, String diFood, String diAmount, int diCar,
			int diPro, int diFat, int diNa, int diKcal, String diDelete) {
		this.diNo = diNo;
		this.id = id;
		this.dtDate = dtDate;
		this.dtWhen = dtWhen;
		this.diFood = diFood;
		this.diAmount = diAmount;
		this.diCar = diCar;
		this.diPro = diPro;
		this.diFat = diFat;
		this.diNa = diNa;
		this.diKcal = diKcal;
		this.diDelete = diDelete;
	}
	public String getDiNo() {
		return diNo;
	}
	public void setDiNo(String diNo) {
		this.diNo = diNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDtDate() {
		return dtDate;
	}
	public void setDtDate(String dtDate) {
		this.dtDate = dtDate;
	}
	public String getDtWhen() {
		return dtWhen;
	}
	public void setDtWhen(String dtWhen) {
		this.dtWhen = dtWhen;
	}
	public String getDiFood() {
		return diFood;
	}
	public void setDiFood(String diFood) {
		this.diFood = diFood;
	}
	public String getDiAmount() {
		return diAmount;
	}
	public void setDiAmount(String diAmount) {
		this.diAmount = diAmount;
	}
	public int getDiCar() {
		return diCar;
	}
	public void setDiCar(int diCar) {
		this.diCar = diCar;
	}
	public int getDiPro() {
		return diPro;
	}
	public void setDiPro(int diPro) {
		this.diPro = diPro;
	}
	public int getDiFat() {
		return diFat;
	}
	public void setDiFat(int diFat) {
		this.diFat = diFat;
	}
	public int getDiNa() {
		return diNa;
	}
	public void setDiNa(int diNa) {
		this.diNa = diNa;
	}
	public int getDiKcal() {
		return diKcal;
	}
	public void setDiKcal(int diKcal) {
		this.diKcal = diKcal;
	}
	public String getDiDelete() {
		return diDelete;
	}
	public void setDiDelete(String diDelete) {
		this.diDelete = diDelete;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "diet [diNo=" + diNo + ", id=" + id + ", dtDate=" + dtDate + ", dtWhen=" + dtWhen + ", diFood=" + diFood
				+ ", diAmount=" + diAmount + ", diCar=" + diCar + ", diPro=" + diPro + ", diFat=" + diFat + ", diNa="
				+ diNa + ", diKcal=" + diKcal + ", diDelete=" + diDelete + "]";
	}
	
	
	
	
}
