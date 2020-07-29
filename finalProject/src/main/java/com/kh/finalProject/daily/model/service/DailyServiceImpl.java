package com.kh.finalProject.daily.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.daily.model.dao.DailyDao;
import com.kh.finalProject.daily.model.vo.Habit;
import com.kh.finalProject.daily.model.vo.HabitRecord;
import com.kh.finalProject.daily.model.vo.HabitSum;

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



	

}
