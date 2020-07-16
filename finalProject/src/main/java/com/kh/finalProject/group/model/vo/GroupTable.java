package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupTable implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// group_table
	private int gNo;
	private String gTitle;
	private String gCon;
	private String gName;
	private String gOrigin;
	private String gRename;
	private String gDelete;
	private String id;		// 관리자 아이디
	private String gDate;
	
	// group_memeber
	private int gmNo;
	private String gmId;	// 그룹 멤버 아이디
	private String gmDelete;
	
	public GroupTable() {
		super();
	}

	public GroupTable(int gNo, String gTitle, String gCon, String gName, String gOrigin, String gRename, String gDelete,
			String id, String gDate, int gmNo, String gmId, String gmDelete) {
		super();
		this.gNo = gNo;
		this.gTitle = gTitle;
		this.gCon = gCon;
		this.gName = gName;
		this.gOrigin = gOrigin;
		this.gRename = gRename;
		this.gDelete = gDelete;
		this.id = id;
		this.gDate = gDate;
		this.gmNo = gmNo;
		this.gmId = gmId;
		this.gmDelete = gmDelete;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public String getgTitle() {
		return gTitle;
	}

	public void setgTitle(String gTitle) {
		this.gTitle = gTitle;
	}

	public String getgCon() {
		return gCon;
	}

	public void setgCon(String gCon) {
		this.gCon = gCon;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getgOrigin() {
		return gOrigin;
	}

	public void setgOrigin(String gOrigin) {
		this.gOrigin = gOrigin;
	}

	public String getgRename() {
		return gRename;
	}

	public void setgRename(String gRename) {
		this.gRename = gRename;
	}

	public String getgDelete() {
		return gDelete;
	}

	public void setgDelete(String gDelete) {
		this.gDelete = gDelete;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getgDate() {
		return gDate;
	}

	public void setgDate(String gDate) {
		this.gDate = gDate;
	}

	public int getGmNo() {
		return gmNo;
	}

	public void setGmNo(int gmNo) {
		this.gmNo = gmNo;
	}

	public String getGmId() {
		return gmId;
	}

	public void setGmId(String gmId) {
		this.gmId = gmId;
	}

	public String getGmDelete() {
		return gmDelete;
	}

	public void setGmDelete(String gmDelete) {
		this.gmDelete = gmDelete;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroupTable [gNo=" + gNo + ", gTitle=" + gTitle + ", gCon=" + gCon + ", gName=" + gName + ", gOrigin="
				+ gOrigin + ", gRename=" + gRename + ", gDelete=" + gDelete + ", id=" + id + ", gDate=" + gDate
				+ ", gmNo=" + gmNo + ", gmId=" + gmId + ", gmDelete=" + gmDelete + "]\n";
	}



	

	
}
