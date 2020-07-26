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
	public int boardGetListCount() {
		return gDao.boardGetListCount();
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

	

	


}
