package com.kh.finalProject.group.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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


@Repository("gDao")
public class GroupDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<GroupTable> selectGroup(String loginUserId) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectGroup", loginUserId);
	}

	public ArrayList<GroupMember> selectGroupMember() {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectGroupMember");
	}

	public ArrayList<Member> searchNameList(GroupSearchName gSearch) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.searchNameList", gSearch);
	}

	public int groupInsert(GroupTable gt) {
		return sqlSessionTemplate.insert("groupMapper.groupInsert", gt);
	}

	public int groupMemberInsert(ArrayList memberList) {
		return sqlSessionTemplate.insert("groupMapper.groupMemberInsert", memberList);
	}


	public int groupNoSelect() {
		return sqlSessionTemplate.selectOne("groupMapper.groupNoSelect");
	}

	public int memberNoSelect(GroupInfo gInfo) {
		return sqlSessionTemplate.selectOne("groupMapper.memberNoSelect",gInfo);
	}

	public ArrayList<GroupNotice> selectNoticeList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectNoticeList",pi, rowBounds);
	}

	public int getListCount(GroupInfo gInfo) {
		return sqlSessionTemplate.selectOne("groupMapper.getListCount", gInfo);
	}

	public int noticeInsert(GroupNotice gn) {
		return sqlSessionTemplate.insert("groupMapper.noticeInsert", gn);
	}

	public int noticeUpdate(GroupNotice gn) {
		return sqlSessionTemplate.update("groupMapper.noticeUpdate", gn);
	}

	public GroupNotice selectNoticeOne(GroupInfo gInfo) {
		return sqlSessionTemplate.selectOne("groupMapper.selectNoticeOne", gInfo);
	}

	public int boardGetListCount() {
		return sqlSessionTemplate.selectOne("groupMapper.boardGetListCount");
	}

	public ArrayList<GroupBoard> selectBoardList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectBoardList",pi, rowBounds);
		
	}

	public ArrayList<GroupBoardPhoto> selectPhotoList(PageInfo pi) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectPhotoList",pi);
	}

	public ArrayList<GroupLike> totalLike() {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.totlaLike");
	}

	public ArrayList<GroupReply> totalReply() {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.totalReply");
	}

	public GroupBoard selectBoardDetail(String gbNo) {
		return sqlSessionTemplate.selectOne("groupMapper.selectBoardDetail", gbNo);
	}

	public int plusgbCount(String gbNo) {
		return sqlSessionTemplate.update("groupMapper.plusgbCount", gbNo);
	}

	public ArrayList<GroupBoardPhoto> selectDetailPhotoList(String gbNo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectDetailPhotoList", gbNo);
	}

	public int totalLikeList(String gbNo) {
		return sqlSessionTemplate.selectOne("groupMapper.totalLikeList", gbNo);
	}

	public int totalReplyList(String gbNo) {
		return sqlSessionTemplate.selectOne("groupMapper.totalReplyList", gbNo);
	}

	public GroupLike selectLikeList(GroupLike gl) {
		return sqlSessionTemplate.selectOne("groupMapper.selectLikeList", gl);
	}

	public int insertHeart(GroupLike gl) {
		return sqlSessionTemplate.insert("groupMapper.insertHeart", gl);
	}

	public int deletetHeart(GroupLike gl) {
		return sqlSessionTemplate.delete("groupMapper.deletetHeart", gl);
	}

	public ArrayList<GroupReply> selectReplyList(String gbNo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectReplyList", gbNo);
	}

	public int replyInsert(GroupReply gr) {
		return sqlSessionTemplate.insert("groupMapper.replyInsert", gr);
	}

	public int reReplyInsert(GroupReReply grr) {
		return sqlSessionTemplate.insert("groupMapper.reReplyInsert", grr);
	}

	public ArrayList<GroupReReply> selectReReplyList(String gbNo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectReReplyList", gbNo);
	}

	public ArrayList<GroupReReply> selectReReplyList(GroupReReply grr) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectReReplyList2", grr);
	}
	
	
	
	
}
