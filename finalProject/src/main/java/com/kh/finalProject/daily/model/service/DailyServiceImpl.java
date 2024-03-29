package com.kh.finalProject.daily.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.daily.model.dao.DailyDao;
import com.kh.finalProject.daily.model.vo.Bookmark;
import com.kh.finalProject.daily.model.vo.BookmarkMap;
import com.kh.finalProject.daily.model.vo.BookmarkUrl;
import com.kh.finalProject.daily.model.vo.DailyRecord;
import com.kh.finalProject.daily.model.vo.DailyRecordPhoto;
import com.kh.finalProject.daily.model.vo.Habit;
import com.kh.finalProject.daily.model.vo.HabitRecord;
import com.kh.finalProject.daily.model.vo.HabitSum;
import com.kh.finalProject.group.common.PageInfo;

@Service("dailyService")
public class DailyServiceImpl implements DailyService {
	
	@Autowired
	DailyDao dailyDao;

	@Override
	public int insertHabit(Habit habit) {
		
		return dailyDao.insertHabit(habit);
	}

	@Override
	public Habit selectHabit(Habit habit) {
		
		return dailyDao.selectHabit(habit);
	}
	
	// 아이디로 습관 목록 조회
	@Override
	public ArrayList<Habit> selectHabitList(String id) {
		
		return dailyDao.selectHabitList(id);
	}
	
	// 제목으로 습관 기록 조회
	@Override
	public Habit selectHabitContent(Habit habit) {
		
		return dailyDao.selectHabitContent(habit);
	}
	
	// 습관 생성
	@Override
	public int insertHabitRecord(HabitRecord hr) {
		return dailyDao.insertHabitRecord(hr);
	}
	
	// 습관 번호로 습관 조회
	@Override
	public Habit selectHabitNum(Habit habit) {

		return dailyDao.selectHabitNum(habit);
	}
	
	// 오늘 날짜로 습관 기록 조회(세부)
	@Override
	public ArrayList<HabitRecord> selectHabitRecordList(HabitRecord hrd) {

		return dailyDao.selectHabitRecordList(hrd);
	}

	@Override
	public ArrayList<HabitRecord> selectHabitRecordListW(HabitRecord hrw) {
		
		return dailyDao.selectHabitRecordListW(hrw);
	}
	
	// 해당 월로 습관 조회(세부)
	@Override
	public ArrayList<HabitRecord> selectHabitRecordListM(HabitRecord hrm) {

		return dailyDao.selectHabitRecordListM(hrm);
	}
	

	@Override
	public ArrayList<HabitSum> selectHabitSumList(Habit hs) {
		
		return dailyDao.selectHabitSumList(hs);
	}

	@Override
	public ArrayList<HabitSum> selectHabitMSumList(Habit hsm) {
		
		return dailyDao.selectHabitMSumList(hsm);
	}

	@Override
	public ArrayList<HabitSum> selectHabitWSumList(String id) {

		return dailyDao.selectHabitWSumList(id);
	}

	@Override
	public int updateHabitComment(Habit habit) {

		return dailyDao.updateHabitComment(habit);
	}

	@Override
	public int deleteHabitRecord(HabitRecord hr) {
		
		return dailyDao.deleteHabitRecord(hr);
	}

	@Override
	public int updateHabitRecord(HabitRecord hr) {

		return dailyDao.updateHabitRecord(hr);
	}

	@Override
	public ArrayList<HabitRecord> selectHabitRecordListC(HabitRecord hr) {

		return dailyDao.selectHabitRecordListC(hr);
	}

	@Override
	public ArrayList<HabitRecord> selectHabitRecordListD(HabitRecord hr) {

		return dailyDao.selectHabitRecordListD(hr);
	}

	@Override
	public int deleteHabit(HashMap<String, String> map) {
		
		return dailyDao.deleteHabit(map);
	}

	@Override
	public HabitRecord selectHabitRecord(HabitRecord hr) {

		return dailyDao.selectHabitRecord(hr);
	}
	
	// 그래프 데이터 가져오기
	@Override
	public ArrayList<Habit> selectGraphData(HashMap<String, String> map) {

		return dailyDao.selectGraphData(map);
	}

	// 습관 수정하기
	@Override
	public int updateHabit(Habit habit) {

		return dailyDao.updateHabit(habit);
	}

	@Override
	public int insertBookmarkGroup(Bookmark bm) {

		return dailyDao.insertBookmarkGroup(bm);
	}

	@Override
	public ArrayList<Bookmark> selectBookmarkGroupList(String id) {

		return dailyDao.selectBookmarkGroupList(id);
	}

	@Override
	public int deleteBookmark(Bookmark bm) {

		return dailyDao.deleteBookmark(bm);
	}

	@Override
	public Bookmark selectBookmark(Bookmark bm) {

		return dailyDao.selectBookmark(bm);
	}

	@Override
	public int updateBookmarkGroup(Bookmark bm) {

		return dailyDao.updateBookmark(bm);
	}

	@Override
	public int insertBookmarkMap(BookmarkMap bmm) {

		return dailyDao.insertBookmarkMap(bmm);
	}

	@Override
	public ArrayList<BookmarkMap> selectBookmarkMapList(BookmarkMap bm) {

		return dailyDao.selectBookmarkMapList(bm);
	}

	@Override
	public BookmarkMap selectBookmarkMap(BookmarkMap bm) {

		return dailyDao.selectBookmarkMap(bm);
	}

	@Override
	public int updateBookmarkMap(BookmarkMap bm) {

		return dailyDao.updateBookmarkMap(bm);
	}

	@Override
	public int deleteBookmarkMap(BookmarkMap bm) {

		return dailyDao.deleteBookmarkMap(bm);
	}

	@Override
	public ArrayList<BookmarkUrl> selectBookmarkUrlList(BookmarkUrl bu) {

		return dailyDao.selectBookmarkUrlList(bu);
	}

	@Override
	public int insertBookmarkUrl(BookmarkUrl ub) {

		return dailyDao.insertBookmarkUrl(ub);
	}

	@Override
	public BookmarkUrl selectBookmarkUrl(BookmarkUrl bu) {

		return dailyDao.selectBookmarkUrl(bu);
	}

	@Override
	public int updateBookmarkUrl(BookmarkUrl bu) {

		return dailyDao.updateBookmarkUrl(bu);
	}

	@Override
	public int deleteBookmarkUrl(BookmarkUrl bu) {

		return dailyDao.deleteBookmarkUrl(bu);
	}

	@Override
	public ArrayList<DailyRecord> selectDailyRecordList(String id, PageInfo pi) {

		return dailyDao.selectDailyRecordList(id, pi);
	}

	@Override
	public ArrayList<DailyRecordPhoto> selectDailyRecordPhotoList(String dr_no) {

		return dailyDao.selectDailyRecordPhotoList(dr_no);
	}

	@Override
	public int insertDailyRecord(DailyRecord dr) {

		return dailyDao.insertDailyRecord(dr);
	}

	@Override
	public int insertDailyRecordPhoto(DailyRecordPhoto drp) {

		return dailyDao.insertDailyRecordPhoto(drp);
	}

	@Override
	public DailyRecord selectDailyRecord(HashMap<String, String> map) {
		
		return dailyDao.selectDailyRecord(map);
	}

	@Override
	public int updateDailyRecordThumbnail(DailyRecordPhoto drp) {

		return dailyDao.updateDailyRecordThumbnail(drp);
	}

	@Override
	public int updateDailyRecordPhoto(String drp_no) {

		return dailyDao.updateDailyRecordPhoto(drp_no);
	}

	@Override
	public int updateDailyRecord(DailyRecord dr) {
		
		return dailyDao.updateDailyRecord(dr);
	}

	@Override
	public int deleteDailyRecord(HashMap<String, String> map) {

		return dailyDao.deleteDailyRecord(map);
	}

	@Override
	public ArrayList<DailyRecord> selectDailyRecordList_a() {

		return dailyDao.selectDailyRecordList_a();
	}

	@Override
	public int getListCount(String id) {

		return dailyDao.getListCount(id);
	}

	@Override
	public int getListCountSearch(HashMap<String, String> map) {

		return dailyDao.getListCountSearch(map);
	}

	@Override
	public ArrayList<DailyRecord> selectDailyRecordSearchList(HashMap<String, String> map, PageInfo pi) {
		
		return dailyDao.selectDailyRecordSearchList(map, pi);
	}
	




	


	

}
