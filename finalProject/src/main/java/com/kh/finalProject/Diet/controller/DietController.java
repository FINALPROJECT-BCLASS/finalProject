package com.kh.finalProject.Diet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("DietDetail.do")
	public ModelAndView DietDetail(ModelAndView mv,
									@RequestParam(value="currentdate",required=false) String date) {
		System.out.println("에욱" + date);
		
		mv.setViewName("Diet/TodayDietDetail");
		
		return mv;
	}
	
	@RequestMapping("TodayDietInsertView.do")
	public ModelAndView TodayDietInsertView(ModelAndView mv) {
		
		mv.setViewName("Diet/TodayDietInsertView");
		return mv;
	}
	
	@RequestMapping("InbodyInsertView.do")
	public ModelAndView InbodyInsertView(ModelAndView mv) {
		mv.setViewName("Diet/InbodyInsertView");
		return mv;
	}
}
