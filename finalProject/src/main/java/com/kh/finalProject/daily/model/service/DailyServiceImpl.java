package com.kh.finalProject.daily.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.daily.model.dao.DailyDao;

@Service("dailyService")
public class DailyServiceImpl implements DailyService {
	
	@Autowired
	DailyDao dailyDao;
	
	

}
