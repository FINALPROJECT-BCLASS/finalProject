package com.kh.finalProject.Diet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.Diet.model.service.DietService;
import com.kh.finalProject.Diet.model.vo.Inbody;
import com.kh.finalProject.Diet.model.vo.diet;
import com.kh.finalProject.member.model.vo.Member;

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
		String today = date;
		
		Inbody inbody = dService.selectInbody(today);
		System.out.println(inbody);
			mv.addObject("inbody", inbody).addObject("today",today).setViewName("Diet/TodayDietDetail");
			
		
		return mv;
	}
	
	@RequestMapping("TodayDietInsertView.do")
	public ModelAndView TodayDietInsertView(ModelAndView mv,
											@RequestParam(value="today",required=false) String date
											,@RequestParam(value="dietwhen",required=false) String dietwhen) {
		System.out.println("제발 가져와줭! " + date +" 에욱!! " + dietwhen);
		String today= date;
		String dietwhentime= dietwhen;
		
		mv.addObject("dietwhentime", dietwhentime).addObject("today", today).setViewName("Diet/TodayDietInsertView");
		
		return mv;
	}
	
	@RequestMapping("InbodyInsertView.do")
	public ModelAndView InbodyInsertView(ModelAndView mv,
											@RequestParam(value="today",required=false) String date) {
		
		System.out.println("제발 가져와줭!" + date);
		String today = date;
		mv.addObject("today", today).setViewName("Diet/InbodyInsertView");
		return mv;
	}
	@RequestMapping("InbodyInsert.do")
	public String InbodyInsert(HttpSession session
								,HttpServletRequest request
								,Inbody inbody) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		inbody.setId(loginUser.getId());
//		System.out.println("인바디 객체에 담긴것 : " + inbody);
		
		
		int result = dService.InbodyInsert(inbody);
		
		if(result >0) {
			return "redirect:DietDetail.do?currentdate="+inbody.getInDate();
		}else {
			return "<script> alert('채팅방 생성이 실패했습니다.'); history.back(); </script>";
		}
	}
	
	@RequestMapping("DietInsert.do")
	public String InbodyInsert(HttpSession session
								,HttpServletRequest request
								,diet diet
								,@RequestParam(value="foodCount",required=false) String foodCount
								,@RequestParam(value="foodCountUnit",required=false) String foodCountUnit) {

		String diAmount = foodCount +  foodCountUnit;
		diet.setDiAmount(diAmount);
		System.out.println(diAmount);
		Member loginUser = (Member)session.getAttribute("loginUser");
		diet.setId(loginUser.getId());
		System.out.println("diet" + diet);
		
		
		
		return null;
	}
}
