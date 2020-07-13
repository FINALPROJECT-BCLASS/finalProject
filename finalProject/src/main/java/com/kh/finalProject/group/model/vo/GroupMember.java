package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupMember implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int GM_NO;
	private String GM_ID;
	private String G_NO;
	private String GM_DELETE;
	private String NAME;
	
	public GroupMember() {
		super();
	}

	public GroupMember(int gM_NO, String gM_ID, String g_NO, String gM_DELETE, String nAME) {
		super();
		GM_NO = gM_NO;
		GM_ID = gM_ID;
		G_NO = g_NO;
		GM_DELETE = gM_DELETE;
		NAME = nAME;
	}

	public int getGM_NO() {
		return GM_NO;
	}

	public void setGM_NO(int gM_NO) {
		GM_NO = gM_NO;
	}

	public String getGM_ID() {
		return GM_ID;
	}

	public void setGM_ID(String gM_ID) {
		GM_ID = gM_ID;
	}

	public String getG_NO() {
		return G_NO;
	}

	public void setG_NO(String g_NO) {
		G_NO = g_NO;
	}

	public String getGM_DELETE() {
		return GM_DELETE;
	}

	public void setGM_DELETE(String gM_DELETE) {
		GM_DELETE = gM_DELETE;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroupMember [GM_NO=" + GM_NO + ", GM_ID=" + GM_ID + ", G_NO=" + G_NO + ", GM_DELETE=" + GM_DELETE
				+ ", NAME=" + NAME + "]\n";
	}

	

}
