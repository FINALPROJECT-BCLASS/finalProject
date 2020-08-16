package com.kh.finalProject.group.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.group.common.PageInfo;
import com.kh.finalProject.group.model.vo.GroupAccount;
import com.kh.finalProject.group.model.vo.GroupAccountMember;
import com.kh.finalProject.group.model.vo.GroupBoard;
import com.kh.finalProject.group.model.vo.GroupBoardPhoto;
import com.kh.finalProject.group.model.vo.GroupInfo;
import com.kh.finalProject.group.model.vo.GroupLike;
import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupNotice;
import com.kh.finalProject.group.model.vo.GroupPlan;
import com.kh.finalProject.group.model.vo.GroupReReply;
import com.kh.finalProject.group.model.vo.GroupReply;
import com.kh.finalProject.group.model.vo.GroupSearchName;
import com.kh.finalProject.group.model.vo.GroupTable;
import com.kh.finalProject.group.model.vo.GroupVote;
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

	public int boardGetListCount(GroupBoard gb) {
		return sqlSessionTemplate.selectOne("groupMapper.boardGetListCount", gb);
	}

	public ArrayList<GroupBoard> selectBoardList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		String searchCon = pi.getSearchCon();
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

	public int totalReReplyList(String gbNo) {
		return sqlSessionTemplate.selectOne("groupMapper.totalReReplyList", gbNo);
	}

	public int reReplyCurrval() {
		return sqlSessionTemplate.selectOne("groupMapper.reReplyCurrval");
	}

	public ArrayList<GroupReReply> selectOneReReplyList(int reReplyCurrval) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectOneReReplyList",reReplyCurrval);
	}

	public int replyCurrval() {
		return sqlSessionTemplate.selectOne("groupMapper.replyCurrval");
	}

	public ArrayList<GroupReply> selectOneReplyList(int replyCurrval) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectOneReplyList",replyCurrval);
	}

	public ArrayList<GroupReReply> totalReReply() {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.totalReReply");
	}

	public int deleteReply(String grNo) {
		return sqlSessionTemplate.update("groupMapper.deleteReply",grNo);
	}

	public int deleteReReply(String grrNo) {
		return sqlSessionTemplate.update("groupMapper.deleteReReply",grrNo);
	}

	public int insertBoard(GroupBoard gb) {
		return sqlSessionTemplate.insert("groupMapper.insertBoard",gb);
	}

	public int selectGbNo() {
		return sqlSessionTemplate.selectOne("groupMapper.selectGbNo");
	}

	public int insertBoardPhoto(ArrayList<GroupBoardPhoto> photoList) {
		return sqlSessionTemplate.insert("groupMapper.insertBoardPhoto",photoList);
	}

	public int deletePhoto(String gbNo) {
		return sqlSessionTemplate.delete("groupMapper.deletePhoto",gbNo);
	}

	public int updateBoard(GroupBoard gb) {
		return sqlSessionTemplate.update("groupMapper.updateBoard",gb);
	}

	public int deleteBoard(String gbNo) {
		return sqlSessionTemplate.update("groupMapper.deleteBoard",gbNo);
	}

	public int deleteNotice(String gnNo) {
		return sqlSessionTemplate.update("groupMapper.deleteNotice",gnNo);
	}

	public int voteGetListCount(int groupNo) {
		return sqlSessionTemplate.selectOne("groupMapper.voteGetListCount", groupNo);
	}

	public ArrayList<GroupVote> selectVoteList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectVoteList",pi, rowBounds);
		
	}

	public ArrayList<GroupVote> selectItemList(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectItemList", gInfo);		
	}

	public ArrayList<GroupVote> selectVoteMemberLsit(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectVoteMemberLsit", gInfo);		
	}

	public GroupVote selectOneVote(GroupVote gv) {
		return sqlSessionTemplate.selectOne("groupMapper.selectOneVote", gv);
	}

	public ArrayList<GroupVote> selectOneItem(GroupVote gv) {
		return  (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectOneItem", gv);
	}

	public GroupVote selectTotalItem(GroupVote gv) {
		return sqlSessionTemplate.selectOne("groupMapper.selectTotalItem", gv);		
	}

	public int deleteVote(GroupVote gv) {
		return sqlSessionTemplate.delete("groupMapper.deleteVote", gv);		
	}

	public int insertVote(GroupVote gv) {
		return sqlSessionTemplate.delete("groupMapper.insertVote", gv);		
	}

	public int oneTotalItem(GroupVote gv) {
		return sqlSessionTemplate.selectOne("groupMapper.oneTotalItem", gv);		
	}

	public int endVote(GroupVote gv) {
		return sqlSessionTemplate.update("groupMapper.endVote", gv);		
		}

	public int removeVote(GroupVote gv) {
		return sqlSessionTemplate.delete("groupMapper.removeVote", gv);		
	}

	public int finishedVoteGetListCount(int groupNo) {
		return sqlSessionTemplate.selectOne("groupMapper.finishedVoteGetListCount", groupNo);
	}

	public ArrayList<GroupVote> selectfinishedVoteList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectfinishedVoteList",pi, rowBounds);
		
	}

	public ArrayList<GroupVote> selectfinishedItemList(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectfinishedItemList", gInfo);		
	}

	public ArrayList<GroupVote> selectfinishedVoteMemberLsit(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectfinishedVoteMemberLsit", gInfo);		
	}

	public int insertNewVote(GroupVote gv) {
		return sqlSessionTemplate.insert("groupMapper.insertNewVote", gv);		
	}

	public int voteCurrval() {
		return sqlSessionTemplate.selectOne("groupMapper.voteCurrval");		
	}

	public int insertNewItem(ArrayList<GroupVote> voteItemList) {
		return sqlSessionTemplate.insert("groupMapper.insertNewItem", voteItemList);		
	}

	public ArrayList<GroupVote> selectMemberList(GroupVote gv) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectMemberList", gv);		
	}

	public GroupTable selectOneGroup(GroupInfo gInfo) {
		return sqlSessionTemplate.selectOne("groupMapper.selectOneGroup",gInfo);		
	}

	public ArrayList<GroupMember> selectGroupMemberList(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectGroupMemberList",gInfo);		
	}

	public int groupUpdate(GroupTable gt) {
		return sqlSessionTemplate.update("groupMapper.groupUpdate",gt);		
	}

	public int deleteMemberList(int groupNo) {
		return sqlSessionTemplate.delete("groupMapper.deleteMemberList",groupNo);		
	}

	public int insertNewMember(GroupMember gm) {
		return sqlSessionTemplate.delete("groupMapper.insertNewMember",gm);		
	}

	public int updateMember(GroupMember gm) {
		return sqlSessionTemplate.update("groupMapper.updateMember",gm);		
	}

	public int planInsert(GroupPlan gp) {
		return sqlSessionTemplate.insert("groupMapper.planInsert", gp);		
	}

	public ArrayList<GroupPlan> selectPlanList(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectPlanList",gInfo);		
	}

	public GroupPlan detailPlan(GroupPlan gp) {
		return sqlSessionTemplate.selectOne("groupMapper.detailPlan",gp);		
	}

	public int planUpdate(GroupPlan gp) {
		return sqlSessionTemplate.update("groupMapper.planUpdate",gp);		
	}

	public int planDelete(GroupPlan gp) {
		return sqlSessionTemplate.update("groupMapper.planDelete",gp);		
	}

	public ArrayList<Member> searchNameAccount(GroupSearchName gSearch) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.searchNameAccount",gSearch);		
	}

	public ArrayList<GroupAccount> selectProList(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectProList",gInfo);		
	}

	public ArrayList<GroupAccount> selectExeList(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectExeList",gInfo);		
	}

	public ArrayList<GroupAccount> selectFeeList(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectFeeList",gInfo);		
	}

	public GroupAccount selectTotalProList(GroupAccount ga) {
		return sqlSessionTemplate.selectOne("groupMapper.selectTotalProList",ga);		
	}

	public GroupAccount selectTotalExeList(GroupAccount ga) {
		return sqlSessionTemplate.selectOne("groupMapper.selectTotalExeList",ga);		
	}

	public GroupAccount selectTotalFeeList(GroupAccount ga) {
		return sqlSessionTemplate.selectOne("groupMapper.selectTotalFeeList",ga);		
	}

	public int insertAccount(GroupAccount ga) {
		return sqlSessionTemplate.insert("groupMapper.insertAccount", ga);		
	}

	public int gaCurrval() {
		return sqlSessionTemplate.selectOne("groupMapper.gaCurrval");		
	}

	public int insertAccountMember(ArrayList<GroupAccountMember> gamList) {
		return sqlSessionTemplate.insert("groupMapper.insertAccountMember", gamList);		
	}

	public GroupAccount selectGa(String gaNo) {
		return sqlSessionTemplate.selectOne("groupMapper.selectGa", gaNo);		
	}

	public ArrayList<GroupAccountMember> selectGam(String gaNo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectGam",gaNo);		
	}

	public int selectTotalGa(String gaNo) {
		return sqlSessionTemplate.selectOne("groupMapper.selectTotalGa", gaNo);		
	}

	public ArrayList<GroupAccount> selectCheckList(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectCheckList",gInfo);		
	}

	public ArrayList<GroupAccountMember> selectMemberCheckList(GroupInfo gInfo) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.selectMemberCheckList",gInfo);		
	}

	public int updateSharing(String gaNo) {
		return sqlSessionTemplate.update("groupMapper.updateSharing", gaNo);		
	}

	public int checkGam(GroupAccountMember gam) {
		return sqlSessionTemplate.update("groupMapper.checkGam", gam);		
	}

	public int deleteAccount(String gaNo) {
		return sqlSessionTemplate.update("groupMapper.deleteAccount", gaNo);		
	}

	public ArrayList<Member> searchNameAccountUpdate(GroupSearchName gSearch) {
		return (ArrayList)sqlSessionTemplate.selectList("groupMapper.searchNameAccountUpdate", gSearch);		
	}

	
	
	
	
}
