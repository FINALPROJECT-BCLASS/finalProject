package com.kh.finalProject.plan.model.vo;

import java.io.Serializable;

public class Timetable implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -5062184425348067721L;
	
	private int ttNo;
	private String id;
	private String ttTitle;
	private String ttDate;
	private String ttStart;
	private String ttEnd;
	private String ttColor;
	private String ttMemo;
	private String ttDelete;
	
	public Timetable() {
	}

	public Timetable(int ttNo, String id, String ttTitle, String ttDate, String ttStart, String ttEnd, String ttColor,
			String ttMemo, String ttDelete) {
		this.ttNo = ttNo;
		this.id = id;
		this.ttTitle = ttTitle;
		this.ttDate = ttDate;
		this.ttStart = ttStart;
		this.ttEnd = ttEnd;
		this.ttColor = ttColor;
		this.ttMemo = ttMemo;
		this.ttDelete = ttDelete;
	}

	public int getTtNo() {
		return ttNo;
	}

	public void setTtNo(int ttNo) {
		this.ttNo = ttNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTtTitle() {
		return ttTitle;
	}

	public void setTtTitle(String ttTitle) {
		this.ttTitle = ttTitle;
	}

	public String getTtDate() {
		return ttDate;
	}

	public void setTtDate(String ttDate) {
		this.ttDate = ttDate;
	}

	public String getTtStart() {
		return ttStart;
	}

	public void setTtStart(String ttStart) {
		this.ttStart = ttStart;
	}

	public String getTtEnd() {
		return ttEnd;
	}

	public void setTtEnd(String ttEnd) {
		this.ttEnd = ttEnd;
	}

	public String getTtColor() {
		return ttColor;
	}

	public void setTtColor(String ttColor) {
		this.ttColor = ttColor;
	}

	public String getTtMemo() {
		return ttMemo;
	}

	public void setTtMemo(String ttMemo) {
		this.ttMemo = ttMemo;
	}

	public String getTtDelete() {
		return ttDelete;
	}

	public void setTtDelete(String ttDelete) {
		this.ttDelete = ttDelete;
	}

	@Override
	public String toString() {
		return "Timetable [ttNo=" + ttNo + ", id=" + id + ", ttTitle=" + ttTitle + ", ttDate=" + ttDate + ", ttStart="
				+ ttStart + ", ttEnd=" + ttEnd + ", ttColor=" + ttColor + ", ttMemo=" + ttMemo + ", ttDelete="
				+ ttDelete + "]";
	}
	
}
