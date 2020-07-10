package com.kh.finalProject.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanController {
	
	@RequestMapping("mplist.do")
	public String monthlyView() {
		
		return "plan/monthlyPlanner";
	}
	
	@RequestMapping("ttlist.do")
	public String timetableView() {
		
		return "plan/timetable";
	}
	
	@RequestMapping("mclist.do")
	public String menstrualView() {
		
		return "plan/menstrualCalendar";
	}

}
