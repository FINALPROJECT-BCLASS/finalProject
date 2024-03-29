package com.kh.finalProject.daily.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.daily.model.vo.Bookmark;
import com.kh.finalProject.daily.model.vo.BookmarkMap;
import com.kh.finalProject.daily.model.vo.BookmarkUrl;
import com.kh.finalProject.daily.model.vo.DailyRecord;
import com.kh.finalProject.daily.model.vo.DailyRecordPhoto;
import com.kh.finalProject.daily.model.vo.Habit;
import com.kh.finalProject.daily.model.vo.HabitRecord;
import com.kh.finalProject.daily.model.vo.HabitSum;
import com.kh.finalProject.group.common.PageInfo;

@Repository("dailyDao")
public class DailyDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insertHabit(Habit habit) {
		
		return sqlSessionTemplate.insert("dailyMapper.insertHabit", habit);
	}

	public Habit selectHabit(Habit habit) {
		
		return sqlSessionTemplate.selectOne("dailyMapper.selectHabit", habit);
	}

	public ArrayList<Habit> selectHabitList(String id) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitList", id);
	}

	public Habit selectHabitContent(Habit habit) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectHabitContent", habit);
	}

	public int insertHabitRecord(HabitRecord hr) {

		return sqlSessionTemplate.insert("dailyMapper.insertHabitRecord", hr);
	}

	public Habit selectHabitNum(Habit habit) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectHabitNum", habit);
	}

	public ArrayList<HabitRecord> selectHabitRecordList(HabitRecord hrd) {
		
		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordList", hrd);
	}

	public ArrayList<HabitRecord> selectHabitRecordListW(HabitRecord hrw) {

		return  (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordListW", hrw);
	}

	public ArrayList<HabitRecord> selectHabitRecordListM(HabitRecord hrm) {
		
		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordListM", hrm);
	}

	
	public ArrayList<HabitRecord> selectHabitRecordListDaily(HabitRecord habit) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordListDaily", habit);
	}

	public ArrayList<HabitSum> selectHabitSumList(Habit hs) {
		
		return  (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitSumList", hs);
	}

	public ArrayList<HabitSum> selectHabitMSumList(Habit hsm) {

		return  (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitMSumList", hsm);
	}

	public ArrayList<HabitSum> selectHabitWSumList(String id) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitWSumList", id);
	}

	public int updateHabitComment(Habit habit) {

		return sqlSessionTemplate.update("dailyMapper.updateHabitComment", habit);
	}

	public int deleteHabitRecord(HabitRecord hr) {

		return sqlSessionTemplate.update("dailyMapper.deleteHabitRecord", hr);
	}

	public int updateHabitRecord(HabitRecord hr) {

		return sqlSessionTemplate.update("dailyMapper.updateHabitRecord", hr);
	}

	public ArrayList<HabitRecord> selectHabitRecordListC(HabitRecord hr) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordListC", hr);
	}

	public ArrayList<HabitRecord> selectHabitRecordListD(HabitRecord hr) {
		
		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordListD", hr);
	}

	public int deleteHabit(HashMap<String, String> map) {

		return sqlSessionTemplate.update("dailyMapper.deleteHabit", map);
	}

	public HabitRecord selectHabitRecord(HabitRecord hr) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectHabitRecord", hr);
	}

	public ArrayList<Habit> selectGraphData(HashMap<String, String> map) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitGraphData", map);
	}

	public int updateHabit(Habit habit) {

		return sqlSessionTemplate.update("dailyMapper.updateHabit", habit);
	}

	public int insertBookmarkGroup(Bookmark bm) {

		return sqlSessionTemplate.insert("dailyMapper.insertBookmarkGroup", bm);
	}

	public ArrayList<Bookmark> selectBookmarkGroupList(String id) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectBookmarkGroupList", id);
	}

	public int deleteBookmark(Bookmark bm) {

		return sqlSessionTemplate.update("dailyMapper.deleteBookmarkGroup", bm);
	}

	public Bookmark selectBookmark(Bookmark bm) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectBookmarkGroup", bm);
	}

	public int updateBookmark(Bookmark bm) {

		return sqlSessionTemplate.update("dailyMapper.updateBookmarkGroup", bm);
	}

	public int insertBookmarkMap(BookmarkMap bmm) {

		return sqlSessionTemplate.insert("dailyMapper.insertBookmarkMap", bmm);
	}

	public ArrayList<BookmarkMap> selectBookmarkMapList(BookmarkMap bm) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectBookmarkMapList", bm);
	}

	public BookmarkMap selectBookmarkMap(BookmarkMap bm) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectBookmarkMap", bm);
	}

	public int updateBookmarkMap(BookmarkMap bm) {

		return sqlSessionTemplate.update("dailyMapper.updateBookmarkMap", bm);
	}

	public int deleteBookmarkMap(BookmarkMap bm) {

		return sqlSessionTemplate.update("dailyMapper.deleteBookmarkMap", bm);
	}

	public ArrayList<BookmarkUrl> selectBookmarkUrlList(BookmarkUrl bu) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectBookmarkUrlList", bu);
	}

	public int insertBookmarkUrl(BookmarkUrl ub) {

		return sqlSessionTemplate.insert("dailyMapper.insertBookmarkUrl", ub);
	}

	public BookmarkUrl selectBookmarkUrl(BookmarkUrl bu) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectBookmarkUrl", bu);
	}

	public int updateBookmarkUrl(BookmarkUrl bu) {

		return sqlSessionTemplate.update("dailyMapper.updateBookmarkUrl", bu);
	}

	public int deleteBookmarkUrl(BookmarkUrl bu) {

		return sqlSessionTemplate.delete("dailyMapper.deleteBookmarkUrl", bu);
	}

	public ArrayList<DailyRecord> selectDailyRecordList(String id, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectDailyRecordList", id, rowBounds);
	}

	public ArrayList<DailyRecordPhoto> selectDailyRecordPhotoList(String dr_no) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectDailyRecordPhotoList", dr_no);
	}

	public int insertDailyRecord(DailyRecord dr) {

		return sqlSessionTemplate.insert("dailyMapper.insertDailyRecord", dr);
	}

	public String selectDailyRecordNo(DailyRecord dr) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectDailyRecordNo", dr);
	}

	public int insertDailyRecordPhoto(DailyRecordPhoto drp) {

		return sqlSessionTemplate.insert("dailyMapper.insertDailyRecordPhoto", drp);
	}

	public DailyRecord selectDailyRecord(HashMap<String, String> map) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectDailyRecord", map);
	}

	public int updateDailyRecordThumbnail(DailyRecordPhoto drp) {

		return sqlSessionTemplate.update("dailyMapper.updateDailyRecordThumbnail", drp);
	}

	public int updateDailyRecordPhoto(String drp_no) {

		return sqlSessionTemplate.update("dailyMapper.updateDailyRecordPhoto", drp_no);
	}

	public int updateDailyRecord(DailyRecord dr) {

		return sqlSessionTemplate.update("dailyMapper.updateDailyRecord", dr);
	}

	public int deleteDailyRecord(HashMap<String, String> map) {

		return sqlSessionTemplate.update("dailyMapper.deleteDailyRecord", map);
	}

	public ArrayList<DailyRecord> selectDailyRecordList_a() {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectDailyRecordList_a");
	}

	public int getListCount(String id) {
		
		return sqlSessionTemplate.selectOne("dailyMapper.getListCount", id);
	}

	public int getListCountSearch(HashMap<String, String> map) {

		return sqlSessionTemplate.selectOne("dailyMapper.getListCountSearch", map);
	}

	public ArrayList<DailyRecord> selectDailyRecordSearchList(HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectDailyRecordSearchList", map, rowBounds);
	}

}
