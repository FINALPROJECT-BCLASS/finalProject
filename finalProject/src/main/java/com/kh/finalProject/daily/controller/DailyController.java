package com.kh.finalProject.daily.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.daily.model.service.DailyService;

@Controller
public class DailyController {

	@Autowired
	private DailyService dailyService;
	
	@RequestMapping("htlist.do")
	public String htList() {
		
		return "daily/habitTracker";
				
	}
	
	
}
