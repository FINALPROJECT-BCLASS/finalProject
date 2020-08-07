package com.kh.finalProject.manager.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("r")
public class Report implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4182975854883157051L;
	
	private int rpNo;
	private String id;
	private String rpDate;
	private String rpCon;
	private int rprNo;
	private String rpRDate;
	private int rpCount;
	
	public Report() {
	}
	
	public Report(int rpNo, String id, String rpDate, String rpCon, int rprNo, String rpResult, String rpRDate,
			int rpCount) {
		this.rpNo = rpNo;
		this.id = id;
		this.rpDate = rpDate;
		this.rpCon = rpCon;
		this.rprNo = rprNo;
		this.rpRDate = rpRDate;
		this.rpCount = rpCount;
	}
	
	public int getRpNo() {
		return rpNo;
	}

	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRpDate() {
		return rpDate;
	}

	public void setRpDate(String rpDate) {
		this.rpDate = rpDate;
	}

	public String getRpCon() {
		return rpCon;
	}

	public void setRpCon(String rpCon) {
		this.rpCon = rpCon;
	}

	public int getRprNo() {
		return rprNo;
	}

	public void setRprNo(int rprNo) {
		this.rprNo = rprNo;
	}

	public String getRpRDate() {
		return rpRDate;
	}

	public void setRpRDate(String rpRDate) {
		this.rpRDate = rpRDate;
	}

	public int getRpCount() {
		return rpCount;
	}

	public void setRpCount(int rpCount) {
		this.rpCount = rpCount;
	}

	@Override
	public String toString() {
		return "Report [rpNo=" + rpNo + ", id=" + id + ", rpDate=" + rpDate + ", rpCon=" + rpCon + ", rprNo=" + rprNo
				+ ", rpRDate=" + rpRDate + ", rpCount=" + rpCount + "]";
	}

}
