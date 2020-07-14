package com.kh.finalProject.plan.model.vo;

import java.io.Serializable;

public class McOvulation implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 41893203894675736L;
	
	private int mcoNo;
	private String id;
	private String mcoStart;
	private String mcoEnd;
	private String mcoDelete;
	
	public McOvulation() {
	}
	
	public McOvulation(int mcoNo, String id, String mcoStart, String mcoEnd, String mcoDelete) {
		this.mcoNo = mcoNo;
		this.id = id;
		this.mcoStart = mcoStart;
		this.mcoEnd = mcoEnd;
		this.mcoDelete = mcoDelete;
	}
	
	public int getMcoNo() {
		return mcoNo;
	}
	public void setMcoNo(int mcoNo) {
		this.mcoNo = mcoNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMcoStart() {
		return mcoStart;
	}
	public void setMcoStart(String mcoStart) {
		this.mcoStart = mcoStart;
	}
	public String getMcoEnd() {
		return mcoEnd;
	}
	public void setMcoEnd(String mcoEnd) {
		this.mcoEnd = mcoEnd;
	}
	public String getMcoDelete() {
		return mcoDelete;
	}
	public void setMcoDelete(String mcoDelete) {
		this.mcoDelete = mcoDelete;
	}
	
	@Override
	public String toString() {
		return "McOvulation [mcoNo=" + mcoNo + ", id=" + id + ", mcoStart=" + mcoStart + ", mcoEnd=" + mcoEnd
				+ ", mcoDelete=" + mcoDelete + "]";
	}

}
