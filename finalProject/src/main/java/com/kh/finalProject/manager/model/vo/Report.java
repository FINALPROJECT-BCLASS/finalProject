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
	private String reportId;
	private String reportedId;
	private String rpDate;
	private String rpCon;
	private String rpChat;
	private int rprNo;
	private String rpRDate;
	private int rpCount;
	
	public Report() {
	}

	public Report(int rpNo, String reportId, String reportedId, String rpDate, String rpCon, String rpChat, int rprNo,
			String rpRDate, int rpCount) {
		this.rpNo = rpNo;
		this.reportId = reportId;
		this.reportedId = reportedId;
		this.rpDate = rpDate;
		this.rpCon = rpCon;
		this.rpChat = rpChat;
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

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public String getReportedId() {
		return reportedId;
	}

	public void setReportedId(String reportedId) {
		this.reportedId = reportedId;
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

	public String getRpChat() {
		return rpChat;
	}

	public void setRpChat(String rpChat) {
		this.rpChat = rpChat;
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
		return "Report [rpNo=" + rpNo + ", reportId=" + reportId + ", reportedId=" + reportedId + ", rpDate=" + rpDate
				+ ", rpCon=" + rpCon + ", rpChat=" + rpChat + ", rprNo=" + rprNo + ", rpRDate=" + rpRDate + ", rpCount="
				+ rpCount + "]";
	}

}
