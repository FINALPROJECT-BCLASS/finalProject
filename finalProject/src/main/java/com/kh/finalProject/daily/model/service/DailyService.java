package com.kh.finalProject.daily.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.finalProject.daily.model.vo.Bookmark;
import com.kh.finalProject.daily.model.vo.BookmarkMap;
import com.kh.finalProject.daily.model.vo.BookmarkUrl;
import com.kh.finalProject.daily.model.vo.DailyRecord;
import com.kh.finalProject.daily.model.vo.DailyRecordPhoto;
import com.kh.finalProject.daily.model.vo.Habit;
import com.kh.finalProject.daily.model.vo.HabitRecord;
import com.kh.finalProject.daily.model.vo.HabitSum;
import com.kh.finalProject.group.common.PageInfo;

public interface DailyService {

	int insertHabit(Habit habit);

	Habit selectHabit(Habit habit);

	ArrayList<Habit> selectHabitList(String id);

	Habit selectHabitContent(Habit habit);

	int insertHabitRecord(HabitRecord hr);

	Habit selectHabitNum(Habit habit);

	ArrayList<HabitRecord> selectHabitRecordList(HabitRecord hrd);

	ArrayList<HabitRecord> selectHabitRecordListW(HabitRecord hrw);

	ArrayList<HabitRecord> selectHabitRecordListM(HabitRecord hrm);

	ArrayList<HabitSum> selectHabitSumList(Habit hs);

	ArrayList<HabitSum> selectHabitMSumList(Habit hsm);

	ArrayList<HabitSum> selectHabitWSumList(String id);

	int updateHabitComment(Habit habit);

	int deleteHabitRecord(HabitRecord hr);

	int updateHabitRecord(HabitRecord hr);

	ArrayList<HabitRecord> selectHabitRecordListC(HabitRecord hr);

	ArrayList<HabitRecord> selectHabitRecordListD(HabitRecord hr);

	int deleteHabit(HashMap<String, String> map);

	HabitRecord selectHabitRecord(HabitRecord hr);

	ArrayList<Habit> selectGraphData(HashMap<String, String> map);

	int updateHabit(Habit habit);

	int insertBookmarkGroup(Bookmark bm);

	ArrayList<Bookmark> selectBookmarkGroupList(String id);

	int deleteBookmark(Bookmark bm);

	Bookmark selectBookmark(Bookmark bm);

	int updateBookmarkGroup(Bookmark bm);

	int insertBookmarkMap(BookmarkMap bmm);

	ArrayList<BookmarkMap> selectBookmarkMapList(BookmarkMap bm);

	BookmarkMap selectBookmarkMap(BookmarkMap bm);

	int updateBookmarkMap(BookmarkMap bm);

	int deleteBookmarkMap(BookmarkMap bm);

	ArrayList<BookmarkUrl> selectBookmarkUrlList(BookmarkUrl bu);

	int insertBookmarkUrl(BookmarkUrl ub);

	BookmarkUrl selectBookmarkUrl(BookmarkUrl bu);

	int updateBookmarkUrl(BookmarkUrl bu);

	int deleteBookmarkUrl(BookmarkUrl bu);

	ArrayList<DailyRecord> selectDailyRecordList(String id, PageInfo pi);

	ArrayList<DailyRecordPhoto> selectDailyRecordPhotoList(String dr_no);

	int insertDailyRecord(DailyRecord dr);

	int insertDailyRecordPhoto(DailyRecordPhoto drp);

	DailyRecord selectDailyRecord(HashMap<String, String> map);

	int updateDailyRecordThumbnail(DailyRecordPhoto drp);

	int updateDailyRecordPhoto(String drp_no);
	
	int updateDailyRecord(DailyRecord dr);

	int deleteDailyRecord(HashMap<String, String> map);

	ArrayList<DailyRecord> selectDailyRecordList_a(String id);

	int getListCount();



}
