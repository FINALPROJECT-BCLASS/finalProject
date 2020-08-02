package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupVote implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int gvNo;
	private int gNo;
	private int gmNo;
	private String gvTitle;
	private String gvCon;
	private String gvStart;
	private String gvEnd;
	private String gvAno;
	private String gvDelete;
	
//	GROUP_VOTE_ITEM
	private int gviNo;
	private String gviItem;
	
// MEMBER 
	private String name;
	private String renameFile;
	
// GROUP_VOTE_MEMBER	
	private int totalGviNo;
	private int gvmNo;
	private int voteY;	    // 투표 총 참여
	private int voteYName;	// 투표 총 참여명
	private int voteN;		// 투표 총 미참여
	private int voteNName;	// 투표 총 미 참여명
	
	
	public GroupVote() {
		super();
	}


	public GroupVote(int gvNo, int gNo, int gmNo, String gvTitle, String gvCon, String gvStart, String gvEnd,
			String gvAno, String gvDelete, int gviNo, String gviItem, String name, String renameFile, int totalGviNo,
			int gvmNo, int voteY, int voteYName, int voteN, int voteNName) {
		super();
		this.gvNo = gvNo;
		this.gNo = gNo;
		this.gmNo = gmNo;
		this.gvTitle = gvTitle;
		this.gvCon = gvCon;
		this.gvStart = gvStart;
		this.gvEnd = gvEnd;
		this.gvAno = gvAno;
		this.gvDelete = gvDelete;
		this.gviNo = gviNo;
		this.gviItem = gviItem;
		this.name = name;
		this.renameFile = renameFile;
		this.totalGviNo = totalGviNo;
		this.gvmNo = gvmNo;
		this.voteY = voteY;
		this.voteYName = voteYName;
		this.voteN = voteN;
		this.voteNName = voteNName;
	}


	public int getGvNo() {
		return gvNo;
	}


	public void setGvNo(int gvNo) {
		this.gvNo = gvNo;
	}


	public int getgNo() {
		return gNo;
	}


	public void setgNo(int gNo) {
		this.gNo = gNo;
	}


	public int getGmNo() {
		return gmNo;
	}


	public void setGmNo(int gmNo) {
		this.gmNo = gmNo;
	}


	public String getGvTitle() {
		return gvTitle;
	}


	public void setGvTitle(String gvTitle) {
		this.gvTitle = gvTitle;
	}


	public String getGvCon() {
		return gvCon;
	}


	public void setGvCon(String gvCon) {
		this.gvCon = gvCon;
	}


	public String getGvStart() {
		return gvStart;
	}


	public void setGvStart(String gvStart) {
		this.gvStart = gvStart;
	}


	public String getGvEnd() {
		return gvEnd;
	}


	public void setGvEnd(String gvEnd) {
		this.gvEnd = gvEnd;
	}


	public String getGvAno() {
		return gvAno;
	}


	public void setGvAno(String gvAno) {
		this.gvAno = gvAno;
	}


	public String getGvDelete() {
		return gvDelete;
	}


	public void setGvDelete(String gvDelete) {
		this.gvDelete = gvDelete;
	}


	public int getGviNo() {
		return gviNo;
	}


	public void setGviNo(int gviNo) {
		this.gviNo = gviNo;
	}


	public String getGviItem() {
		return gviItem;
	}


	public void setGviItem(String gviItem) {
		this.gviItem = gviItem;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getRenameFile() {
		return renameFile;
	}


	public void setRenameFile(String renameFile) {
		this.renameFile = renameFile;
	}


	public int getTotalGviNo() {
		return totalGviNo;
	}


	public void setTotalGviNo(int totalGviNo) {
		this.totalGviNo = totalGviNo;
	}


	public int getGvmNo() {
		return gvmNo;
	}


	public void setGvmNo(int gvmNo) {
		this.gvmNo = gvmNo;
	}


	public int getVoteY() {
		return voteY;
	}


	public void setVoteY(int voteY) {
		this.voteY = voteY;
	}


	public int getVoteYName() {
		return voteYName;
	}


	public void setVoteYName(int voteYName) {
		this.voteYName = voteYName;
	}


	public int getVoteN() {
		return voteN;
	}


	public void setVoteN(int voteN) {
		this.voteN = voteN;
	}


	public int getVoteNName() {
		return voteNName;
	}


	public void setVoteNName(int voteNName) {
		this.voteNName = voteNName;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "GroupVote [gvNo=" + gvNo + ", gNo=" + gNo + ", gmNo=" + gmNo + ", gvTitle=" + gvTitle + ", gvCon="
				+ gvCon + ", gvStart=" + gvStart + ", gvEnd=" + gvEnd + ", gvAno=" + gvAno + ", gvDelete=" + gvDelete
				+ ", gviNo=" + gviNo + ", gviItem=" + gviItem + ", name=" + name + ", renameFile=" + renameFile
				+ ", totalGviNo=" + totalGviNo + ", gvmNo=" + gvmNo + ", voteY=" + voteY + ", voteYName=" + voteYName
				+ ", voteN=" + voteN + ", voteNName=" + voteNName + "]\n";
	}


	
}
