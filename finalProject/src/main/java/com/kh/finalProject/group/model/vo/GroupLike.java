package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("gl")
public class GroupLike implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String gbNo;
	private String gmNo;
	private String totalLike;
	
	public GroupLike() {
		super();
	}

	public GroupLike(String gbNo, String gmNo, String totalLike) {
		super();
		this.gbNo = gbNo;
		this.gmNo = gmNo;
		this.totalLike = totalLike;
	}

	public String getGbNo() {
		return gbNo;
	}

	public void setGbNo(String gbNo) {
		this.gbNo = gbNo;
	}

	public String getGmNo() {
		return gmNo;
	}

	public void setGmNo(String gmNo) {
		this.gmNo = gmNo;
	}

	public String getTotalLike() {
		return totalLike;
	}

	public void setTotalLike(String totalLike) {
		this.totalLike = totalLike;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroupLike [gbNo=" + gbNo + ", gmNo=" + gmNo + ", totalLike=" + totalLike + "]\n";
	}
	
}
