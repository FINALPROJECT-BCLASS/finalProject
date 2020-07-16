package com.kh.finalProject.group.model.service;

import java.util.ArrayList;

import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupTable;
import com.kh.finalProject.member.model.vo.Member;


public interface GroupService {

	ArrayList<GroupTable> selectGroup(String loginUserId);

	ArrayList<GroupMember> selectGroupMember();

	ArrayList<Member> searchNameList(String searchName);

	int groupInsert(GroupTable gt);

	int groupMemberInsert(ArrayList memberList);

	int groupNoSelect();

}
