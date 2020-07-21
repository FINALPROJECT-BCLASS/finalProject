package com.kh.finalProject.daily.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.daily.model.vo.Habit;

@Repository("dailyDao")
public class DailyDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insertHabit(Habit habit) {
		
		return sqlSessionTemplate.insert("dailyMapper.insertHabit", habit);
	}

	public Habit selectHabit(String id) {
		
		return sqlSessionTemplate.selectOne("dailyMapper.selectHabit", id);
	}

	public ArrayList<Habit> selectHabitList(String id) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitList", id);
	}

	public Habit selectHabitContent(Habit habit) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectHabitContent", habit);
	}

}
