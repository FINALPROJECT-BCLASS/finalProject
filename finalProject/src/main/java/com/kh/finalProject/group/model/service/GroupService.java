package com.kh.finalProject.group.model.service;

import java.util.ArrayList;

import com.kh.finalProject.group.common.PageInfo;
import com.kh.finalProject.group.model.vo.GroupBoard;
import com.kh.finalProject.group.model.vo.GroupBoardPhoto;
import com.kh.finalProject.group.model.vo.GroupInfo;
import com.kh.finalProject.group.model.vo.GroupLike;
import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupNotice;
import com.kh.finalProject.group.model.vo.GroupReReply;
import com.kh.finalProject.group.model.vo.GroupReply;
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

	ArrayList<GroupBoardPhoto> selectPhotoList(PageInfo pi);

	ArrayList<GroupLike> totalLike();

	ArrayList<GroupReply> totalReply();

	GroupBoard selectBoardDetail(String gbNo);

	int plusgbCount(String gbNo);

	ArrayList<GroupBoardPhoto> selectDetailPhotoList(String gbNo);

	int totalLikeList(String gbNo);

	int totalReplyList(String gbNo);

	GroupLike selectLikeList(GroupLike gl);

	int insertHeart(GroupLike gl);

	int deletetHeart(GroupLike gl);

	ArrayList<GroupReply> selectReplyList(String gbNo);

	int replyInsert(GroupReply gr);

	int reReplyInsert(GroupReReply grr);

	ArrayList<GroupReReply> selectReReplyList(String gbNo);

	ArrayList<GroupReReply> selectReReplyList(GroupReReply grr);

	int totalReReplyList(String gbNo);

	int reReplyCurrval();

	GroupReReply selectOneReReplyList(int reReplyCurrval);



}
