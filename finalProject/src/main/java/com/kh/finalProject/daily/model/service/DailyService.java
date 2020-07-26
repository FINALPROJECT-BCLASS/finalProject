package com.kh.finalProject.daily.model.service;

import java.util.ArrayList;

import com.kh.finalProject.daily.model.vo.Habit;
import com.kh.finalProject.daily.model.vo.HabitRecord;
import com.kh.finalProject.daily.model.vo.HabitSum;

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



}
