package com.kh.finalProject.Diet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.Diet.model.service.DietService;

@Controller
public class DietController {
	
	@Autowired
	DietService dService;
	
	@RequestMapping("DietCalendarView.do")
	public String DietCalendarView() {
		
		return "Diet/DietCalendarView";
	}

}
