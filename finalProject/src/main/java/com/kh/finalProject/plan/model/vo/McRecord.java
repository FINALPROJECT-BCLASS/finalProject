package com.kh.finalProject.plan.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class McRecord implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4683265344765108132L;
	
	private int mcrNo;
	private String id;
	private String mcrStart;
	private String mcrEnd;
	private String mcrDelete;
	
	public McRecord() {
	}

	public McRecord(int mcrNo, String id, String mcrStart, String mcrEnd, String mcrDelete) {
		super();
		this.mcrNo = mcrNo;
		this.id = id;
		this.mcrStart = mcrStart;
		this.mcrEnd = mcrEnd;
		this.mcrDelete = mcrDelete;
	}

	public int getMcrNo() {
		return mcrNo;
	}

	public void setMcrNo(int mcrNo) {
		this.mcrNo = mcrNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMcrStart() {
		return mcrStart;
	}

	public void setMcrStart(String mcrStart) {
		this.mcrStart = mcrStart;
	}

	public String getMcrEnd() {
		return mcrEnd;
	}

	public void setMcrEnd(String mcrEnd) {
		this.mcrEnd = mcrEnd;
	}

	public String getMcrDelete() {
		return mcrDelete;
	}

	public void setMcrDelete(String mcrDelete) {
		this.mcrDelete = mcrDelete;
	}

	@Override
	public String toString() {
		return "McRecord [mcrNo=" + mcrNo + ", id=" + id + ", mcrStart=" + mcrStart + ", mcrEnd=" + mcrEnd
				+ ", mcrDelete=" + mcrDelete + "]";
	}
	
}
