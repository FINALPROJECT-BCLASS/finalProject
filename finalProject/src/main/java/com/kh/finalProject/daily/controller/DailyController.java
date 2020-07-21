package com.kh.finalProject.daily.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.daily.model.service.DailyService;
import com.kh.finalProject.daily.model.vo.Habit;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class DailyController {

	@Autowired
	private DailyService dailyService;
	
	// 습관 목록
	@RequestMapping("htList.do")
	public ModelAndView htList(ModelAndView mv, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		if(member != null) {
			String id = member.getId();
			
			ArrayList<Habit> list = dailyService.selectHabitList(id);
			
			if(list != null) {
				mv.addObject("hlist", list);
				mv.setViewName("daily/habitTracker");
			} else {
				mv.addObject("message", "목록이 없습니다. 추가해 주세요.");
				mv.setViewName("daily/habitTracker");
			}
		
		}else {
			
			mv.addObject("msg","로그인 하셔야 이용할 수 있는 서비스 입니다.");
            mv.addObject("url","/memberLoginView.do");
			mv.setViewName("common/redirect");
		}
		
		return mv;
				
	}
	
	@RequestMapping("addHabitView.do")
	public String addHabitView() {
		
		return "daily/habitAdd";
	}
	
	@RequestMapping("insertHabit.do")
	public String insertHabit(Habit habit, Model model,
								HttpServletRequest request, HttpServletResponse response) throws IOException {
		

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String id = member.getId();
		
		habit.setId(member.getId()); // 세션에서 받아온 아이디 저장
		
		int result = dailyService.insertHabit(habit);
//		Habit h = dailyService.selectHabit(id);
		
		if(result > 0) {
			
			model.addAttribute("habit", habit);
			return "redirect:htList.do";
			
		} else {
			//로그인 실패
            model.addAttribute("msg","습관 등록에 실패하셨습니다. 다시 시도해 주세요.");
            model.addAttribute("url","/insertHabit.do");
			
			return "common/redirect";
			
		}
		
	}
	
	// 습관 내용 불러오기
	@RequestMapping("habitContent.do")
	public void habitContent(Model model, Habit habit, String title,
							HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		String id = member.getId();
		
		habit.setId(id);
		habit.setHt_title(title);
		
		System.out.println(habit);
		
		
		Habit h = dailyService.selectHabitContent(habit);
		System.out.println(h);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("ht_title", h.getHt_title());
		jObj.put("ht_goal", h.getHt_goal());
		jObj.put("ht_unit", h.getHt_unit());
		jObj.put("ht_cycle", h.getHt_cycle());
		jObj.put("ht_now", h.getHt_now());
		jObj.put("ht_per", h.getHt_per());
		jObj.put("ht_con", h.getHt_con());
		jObj.put("ht_color", h.getHt_color());
		
		out.print(jObj);
		out.flush();
		out.close();
			
	}
	
}
