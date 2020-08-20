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
	private String diCar;		//탄수화물
	private String diPro;		//단백질
	private String diFat;		//지방
	private String diNa;		//나트륨
	private String diKcal;		//칼로리
	private String diDelete;	//삭제여부
	
	public diet() {
	}



	public diet(String diNo, String id, String dtDate, String dtWhen, String diFood, String diAmount, String diCar,
			String diPro, String diFat, String diNa, String diKcal, String diDelete) {
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

	public String getDiCar() {
		return diCar;
	}

	public void setDiCar(String diCar) {
		this.diCar = diCar;
	}

	public String getDiPro() {
		return diPro;
	}

	public void setDiPro(String diPro) {
		this.diPro = diPro;
	}

	public String getDiFat() {
		return diFat;
	}

	public void setDiFat(String diFat) {
		this.diFat = diFat;
	}

	public String getDiNa() {
		return diNa;
	}

	public void setDiNa(String diNa) {
		this.diNa = diNa;
	}

	public String getDiKcal() {
		return diKcal;
	}

	public void setDiKcal(String diKcal) {
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
