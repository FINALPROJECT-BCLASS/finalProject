package com.kh.finalProject.group.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("gmList")
public class GroupMemberList implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String groupMemberId;	// 그룹 가입 멤버Id
	private int groupNo;			// 그룹 번호
	
	public GroupMemberList() {
		super();
	}

	public GroupMemberList(String groupMemberId, int groupNo) {
		super();
		this.groupMemberId = groupMemberId;
		this.groupNo = groupNo;
	}

	public String getGroupMemberId() {
		return groupMemberId;
	}

	public void setGroupMemberId(String groupMemberId) {
		this.groupMemberId = groupMemberId;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroupMemberList [groupMemberId=" + groupMemberId + ", groupNo=" + groupNo + "]\n";
	}

	
}
