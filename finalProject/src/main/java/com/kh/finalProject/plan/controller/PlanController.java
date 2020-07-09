package com.kh.finalProject.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanController {
	
	@RequestMapping("mplist.do")
	public String enrollView() {
		
		return "plan/monthlyPlanner";
	}

}
