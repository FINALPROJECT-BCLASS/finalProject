package com.kh.finalProject.group.model.service;

import java.util.ArrayList;

import com.kh.finalProject.group.common.PageInfo;
import com.kh.finalProject.group.model.vo.GroupBoard;
import com.kh.finalProject.group.model.vo.GroupInfo;
import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupNotice;
import com.kh.finalProject.group.model.vo.GroupSearchName;
import com.kh.finalProject.group.model.vo.GroupTable;
import com.kh.finalProject.member.model.vo.Member;


public interface GroupService {

	ArrayList<GroupTable> selectGroup(String loginUserId);

	ArrayList<GroupMember> selectGroupMember();

	ArrayList<Member> searchNameList(GroupSearchName gSearch);

	int groupInsert(GroupTable gt);

	int groupMemberInsert(ArrayList memberList);

	int groupNoSelect();

	int memberNoSelect(GroupInfo gInfo);

	ArrayList<GroupNotice> selectNoticeList(PageInfo pi);

	int getListCount(GroupInfo gInfo);

	int noticeInsert(GroupNotice gn);

	int noticeUpdate(GroupNotice gn);

	GroupNotice selectNoticeOne(GroupInfo gInfo);

	int boardGetListCount();

	ArrayList<GroupBoard> selectBoardList(PageInfo pi);



}
