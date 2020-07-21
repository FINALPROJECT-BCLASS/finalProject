package com.kh.finalProject.daily.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.daily.model.dao.DailyDao;
import com.kh.finalProject.daily.model.vo.Habit;

@Service("dailyService")
public class DailyServiceImpl implements DailyService {
	
	@Autowired
	DailyDao dailyDao;

	@Override
	public int insertHabit(Habit habit) {
		
		return dailyDao.insertHabit(habit);
	}

	@Override
	public Habit selectHabit(String id) {
		
		return dailyDao.selectHabit(id);
	}

	@Override
	public ArrayList<Habit> selectHabitList(String id) {
		
		return dailyDao.selectHabitList(id);
	}

	@Override
	public Habit selectHabitContent(Habit habit) {
		
		return dailyDao.selectHabitContent(habit);
	}
	
	

}
