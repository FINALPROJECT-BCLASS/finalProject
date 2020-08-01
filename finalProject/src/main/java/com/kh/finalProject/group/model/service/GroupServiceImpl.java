package com.kh.finalProject.group.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.group.common.PageInfo;
import com.kh.finalProject.group.model.dao.GroupDao;
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


@Service("gService")
public class GroupServiceImpl implements GroupService{

	@Autowired
	GroupDao gDao;

	@Override
	public ArrayList<GroupTable> selectGroup(String loginUserId) {
		return gDao.selectGroup(loginUserId);
	}

	@Override
	public ArrayList<GroupMember> selectGroupMember() {
		return gDao.selectGroupMember();
	}

	@Override
	public ArrayList<Member> searchNameList(GroupSearchName gSearch) {
		return gDao.searchNameList(gSearch);
	}

	@Override
	public int groupInsert(GroupTable gt) {
		return gDao.groupInsert(gt);
	}

	@Override
	public int groupMemberInsert(ArrayList memberList) {
		return gDao.groupMemberInsert(memberList);
	}

	@Override
	public int groupNoSelect() {
		return gDao.groupNoSelect();
	}

	@Override
	public int memberNoSelect(GroupInfo gInfo) {
		return gDao.memberNoSelect(gInfo);
	}

	@Override
	public ArrayList<GroupNotice> selectNoticeList(PageInfo pi) {
		return gDao.selectNoticeList(pi);
	}

	@Override
	public int getListCount(GroupInfo gInfo) {
		return gDao.getListCount(gInfo);
	}

	@Override
	public int noticeInsert(GroupNotice gn) {
		return gDao.noticeInsert(gn);
	}

	@Override
	public int noticeUpdate(GroupNotice gn) {
		return gDao.noticeUpdate(gn);
	}

	@Override
	public GroupNotice selectNoticeOne(GroupInfo gInfo) {
		return gDao.selectNoticeOne(gInfo);
	}

	@Override
	public int boardGetListCount(int groupNo) {
		return gDao.boardGetListCount(groupNo);
	}

	@Override
	public ArrayList<GroupBoard> selectBoardList(PageInfo pi) {
		return gDao.selectBoardList(pi);
	}

	@Override
	public ArrayList<GroupBoardPhoto> selectPhotoList(PageInfo pi) {
		return gDao.selectPhotoList(pi);
	}

	@Override
	public ArrayList<GroupLike> totalLike() {
		return gDao.totalLike();
	}

	@Override
	public ArrayList<GroupReply> totalReply() {
		return gDao.totalReply();
	}

	@Override
	public GroupBoard selectBoardDetail(String gbNo) {
		return gDao.selectBoardDetail(gbNo);
	}

	@Override
	public int plusgbCount(String gbNo) {
		return gDao.plusgbCount(gbNo);
	}

	@Override
	public ArrayList<GroupBoardPhoto> selectDetailPhotoList(String gbNo) {
		return gDao.selectDetailPhotoList(gbNo);
	}

	@Override
	public int totalLikeList(String gbNo) {
		return gDao.totalLikeList(gbNo);
	}

	@Override
	public int totalReplyList(String gbNo) {
		return gDao.totalReplyList(gbNo);
	}

	@Override
	public GroupLike selectLikeList(GroupLike gl) {
		return gDao.selectLikeList(gl);
	}

	@Override
	public int insertHeart(GroupLike gl) {
		return gDao.insertHeart(gl);
	}

	@Override
	public int deletetHeart(GroupLike gl) {
		return gDao.deletetHeart(gl);
	}

	@Override
	public ArrayList<GroupReply> selectReplyList(String gbNo) {
		return gDao.selectReplyList(gbNo);
	}

	@Override
	public int replyInsert(GroupReply gr) {
		return gDao.replyInsert(gr);
	}

	@Override
	public int reReplyInsert(GroupReReply grr) {
		return gDao.reReplyInsert(grr);
	}

	@Override
	public ArrayList<GroupReReply> selectReReplyList(String gbNo) {
		return gDao.selectReReplyList(gbNo);
	}

	@Override
	public ArrayList<GroupReReply> selectReReplyList(GroupReReply grr) {
		return gDao.selectReReplyList(grr);
	}

	@Override
	public int totalReReplyList(String gbNo) {
		return gDao.totalReReplyList(gbNo);
		}

	@Override
	public int reReplyCurrval() {
		return gDao.reReplyCurrval();
	}

	@Override
	public ArrayList<GroupReReply> selectOneReReplyList(int reReplyCurrval) {
		return gDao.selectOneReReplyList(reReplyCurrval);
	}

	@Override
	public int replyCurrval() {
		return gDao.replyCurrval();
		}

	@Override
	public ArrayList<GroupReply> selectOneReplyList(int replyCurrval) {
		return gDao.selectOneReplyList(replyCurrval);
	}

	@Override
	public ArrayList<GroupReReply> totalReReply() {
		return gDao.totalReReply();
	}

	@Override
	public int deleteReply(String grNo) {
		return gDao.deleteReply(grNo);
	}

	@Override
	public int deleteReReply(String grrNo) {
		return gDao.deleteReReply(grrNo);
	}

	@Override
	public int insertBoard(GroupBoard gb) {
		return gDao.insertBoard(gb);
	}

	@Override
	public int selectGbNo() {
		return gDao.selectGbNo();
	}

	@Override
	public int insertBoardPhoto(ArrayList<GroupBoardPhoto> photoList) {
		return gDao.insertBoardPhoto(photoList);
	}

	@Override
	public int deletePhoto(String gbNo) {
		return gDao.deletePhoto(gbNo);
	}

	@Override
	public int updateBoard(GroupBoard gb) {
		return gDao.updateBoard(gb);
	}

	@Override
	public int deleteBoard(String gbNo) {
		return gDao.deleteBoard(gbNo);
	}




	

	


}
