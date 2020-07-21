package com.kh.finalProject.daily.model.service;

import java.util.ArrayList;

import com.kh.finalProject.daily.model.vo.Habit;

public interface DailyService {

	int insertHabit(Habit habit);

	Habit selectHabit(String id);

	ArrayList<Habit> selectHabitList(String id);

	Habit selectHabitContent(Habit habit);


}
