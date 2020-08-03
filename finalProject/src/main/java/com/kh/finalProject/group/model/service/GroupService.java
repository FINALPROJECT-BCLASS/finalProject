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
import com.kh.finalProject.group.model.vo.GroupVote;
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

	int boardGetListCount(int groupNo);

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

	ArrayList<GroupReReply> selectOneReReplyList(int reReplyCurrval);

	int replyCurrval();

	ArrayList<GroupReply> selectOneReplyList(int replyCurrval);

	ArrayList<GroupReReply> totalReReply();

	int deleteReply(String grNo);

	int deleteReReply(String grrNo);

	int insertBoard(GroupBoard gb);

	int selectGbNo();

	int insertBoardPhoto(ArrayList<GroupBoardPhoto> photoList);

	int deletePhoto(String gbNo);

	int updateBoard(GroupBoard gb);

	int deleteBoard(String gbNo);

	int deleteNotice(String gnNo);

	int voteGetListCount(int groupNo);

	ArrayList<GroupVote> selectVoteList(PageInfo pi);

	ArrayList<GroupVote> selectItemList(GroupInfo gInfo);

	ArrayList<GroupVote> selectVoteMemberLsit(GroupInfo gInfo);

	GroupVote selectOneVote(GroupVote gv);

	ArrayList<GroupVote> selectOneItem(GroupVote gv);

	GroupVote selectTotalItem(GroupVote gv);

	int deleteVote(GroupVote gv);

	int insertVote(GroupVote gv);

	int oneTotalItem(GroupVote gv);

	int endVote(GroupVote gv);

	int removeVote(GroupVote gv);

	int finishedVoteGetListCount(int groupNo);

	ArrayList<GroupVote> selectfinishedVoteList(PageInfo pi);

	ArrayList<GroupVote> selectfinishedItemList(GroupInfo gInfo);

	ArrayList<GroupVote> selectfinishedVoteMemberLsit(GroupInfo gInfo);

	int insertNewVote(GroupVote gv);

	int voteCurrval();

	int insertNewItem(ArrayList<GroupVote> voteItemList);


	



}
