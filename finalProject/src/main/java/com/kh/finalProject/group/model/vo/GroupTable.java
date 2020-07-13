package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

public class GroupTable implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int G_NO;
	private String G_TITLE;
	private String G_CON;
	private String G_ORIGIN;
	private String G_RENAME;
	private String G_DELETE;
	private int ID;
	private String G_DATE;
	
	public GroupTable() {
		super();
	}

	public GroupTable(int g_NO, String g_TITLE, String g_CON, String g_ORIGIN, String g_RENAME, String g_DELETE, int iD,
			String g_DATE) {
		super();
		G_NO = g_NO;
		G_TITLE = g_TITLE;
		G_CON = g_CON;
		G_ORIGIN = g_ORIGIN;
		G_RENAME = g_RENAME;
		G_DELETE = g_DELETE;
		ID = iD;
		G_DATE = g_DATE;
	}

	public int getG_NO() {
		return G_NO;
	}

	public void setG_NO(int g_NO) {
		G_NO = g_NO;
	}

	public String getG_TITLE() {
		return G_TITLE;
	}

	public void setG_TITLE(String g_TITLE) {
		G_TITLE = g_TITLE;
	}

	public String getG_CON() {
		return G_CON;
	}

	public void setG_CON(String g_CON) {
		G_CON = g_CON;
	}

	public String getG_ORIGIN() {
		return G_ORIGIN;
	}

	public void setG_ORIGIN(String g_ORIGIN) {
		G_ORIGIN = g_ORIGIN;
	}

	public String getG_RENAME() {
		return G_RENAME;
	}

	public void setG_RENAME(String g_RENAME) {
		G_RENAME = g_RENAME;
	}

	public String getG_DELETE() {
		return G_DELETE;
	}

	public void setG_DELETE(String g_DELETE) {
		G_DELETE = g_DELETE;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getG_DATE() {
		return G_DATE;
	}

	public void setG_DATE(String g_DATE) {
		G_DATE = g_DATE;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroupTable [G_NO=" + G_NO + ", G_TITLE=" + G_TITLE + ", G_CON=" + G_CON + ", G_ORIGIN=" + G_ORIGIN
				+ ", G_RENAME=" + G_RENAME + ", G_DELETE=" + G_DELETE + ", ID=" + ID + ", G_DATE=" + G_DATE + "]\n";
	}
	
	
}
