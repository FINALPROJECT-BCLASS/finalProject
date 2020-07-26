package com.kh.finalProject.daily.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.daily.model.service.DailyService;
import com.kh.finalProject.daily.model.vo.Habit;
import com.kh.finalProject.daily.model.vo.HabitRecord;
import com.kh.finalProject.daily.model.vo.HabitSum;
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
		
		SimpleDateFormat dailySet = new SimpleDateFormat ("yy/MM/dd"); // 오늘 날짜 저장
		SimpleDateFormat monthlySet = new SimpleDateFormat ("yy/MM");
		
		Date date = new Date();
		
		String day = dailySet.format(date);
		String month = monthlySet.format(date); // 오늘 날짜
		
		
		System.out.println("오늘 날짜 : " + day);
		System.out.println("이번 달 : " + month);
		
		if(member != null) {
			String id = member.getId();
			
			Habit hs = new Habit();
			hs.setId(id);
			hs.setHt_start(day);
			
			Habit hsm = new Habit();
			hsm.setId(id);
			hsm.setHt_start(month);
			
			System.out.println("daily habit : " + hs);
			System.out.println("monthly habit : " + hsm);
			
			ArrayList<Habit> list = dailyService.selectHabitList(id);			// 전체 목록 조회
			ArrayList<HabitSum> sum = dailyService.selectHabitSumList(hs);		// daily 합계
			ArrayList<HabitSum> Wsum = dailyService.selectHabitWSumList(id);	// weekly 합계
			ArrayList<HabitSum> Msum = dailyService.selectHabitMSumList(hsm);	// monthly 합계
			
			
			System.out.println("daily sum : " + sum);
			System.out.println("weekly sum : " + Wsum);
			System.out.println("monthly sum : " + Msum);
			
			ArrayList<Habit> hlist = new ArrayList<Habit>();
			
			for(Habit h : list) {
				
				if(h.getHt_cycle().equals("Daily")) {
					for(HabitSum hS : sum) {
						if(hS.getHt_no() == h.getHt_no()) {
							h.setHt_now(hS.getHt_now());
						}

					}
				}else if(h.getHt_cycle().equals("Weekly")) {
					for(HabitSum whS : Wsum) {
						if(whS.getHt_no() == h.getHt_no()) {
							h.setHt_now(whS.getHt_now());
						}
					}
					
				}else if(h.getHt_cycle().equals("Monthly")) {	
					
					for(HabitSum mhS : Msum) {
						if(mhS.getHt_no() == h.getHt_no()) {
							h.setHt_now(mhS.getHt_now());
						}
					}
				}
				
				hlist.add(h);
			}
			
			System.out.println("목록 확인 :" + hlist);

			if(list != null) {
				mv.addObject("hlist", hlist);
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
		
		if(result > 0) {
			
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
	public void habitContent(Model model, Habit habit, int htNum,
							HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		String id = member.getId();
		
		habit.setId(id);
		habit.setHt_no(htNum);
		
		// 번호로 습관 조회하기
		Habit h = dailyService.selectHabitNum(habit);
		
		SimpleDateFormat dailySet = new SimpleDateFormat ("yy/MM/dd"); // 오늘 날짜 저장
		SimpleDateFormat monthlySet = new SimpleDateFormat ("yy/MM"); // 이번 달 저장
		
		Date date = new Date();
		
		String today = dailySet.format(date); // 오늘 날짜
		String month = monthlySet.format(date); // 이번 달
		
		JSONArray daily = new JSONArray();
		JSONArray weekly = new JSONArray();
		JSONArray monthly = new JSONArray();
		JSONObject sendJson = new JSONObject();
		
		if(h.getHt_cycle().equals("Daily")) {
		
		// 아이디, 습관 번호, 오늘 날짜 담기
		HabitRecord hrd = new HabitRecord();
		hrd.setId(id);
		hrd.setHt_no(h.getHt_no());
		hrd.setHtr_date(today);
		ArrayList<HabitRecord> hrDailyResult = dailyService.selectHabitRecordList(hrd);
		
		// 오늘 날짜로 조회한 습관 기록 배열에 담기
		for(HabitRecord HR : hrDailyResult) {
			
			JSONObject jObject = new JSONObject();
			jObject.put("htr_no", HR.getHtr_no());
			jObject.put("htr_time", HR.getHtr_date());
			jObject.put("htr_now", HR.getHtr_now());
			jObject.put("htr_con", HR.getHtr_con());
			
			daily.add(jObject);
			
		}
		
		sendJson.put("recordDailyList", daily);
		
		}else if(h.getHt_cycle().equals("Weekly")) {
		
			HabitRecord hrw = new HabitRecord();
			hrw.setId(id);
			hrw.setHt_no(h.getHt_no());
			ArrayList<HabitRecord> hrWeeklyResult = dailyService.selectHabitRecordListW(hrw);
			
			// 이번 주로 조회한 습관 기록 배열에 담기
			for(HabitRecord HRW : hrWeeklyResult) {
				
				JSONObject jObjectW = new JSONObject();
				jObjectW.put("htr_no", HRW.getHtr_no());
				jObjectW.put("htr_month", HRW.getHtr_month());
				jObjectW.put("htr_time", HRW.getHtr_time());
				jObjectW.put("htr_now", HRW.getHtr_now());
				jObjectW.put("htr_con", HRW.getHtr_con());
				
				weekly.add(jObjectW);
				
			}
			
			sendJson.put("recordWeeklyList", weekly);
			System.out.println("주 리스트 확인 : "+ hrWeeklyResult);
			
		}else {
		
			// 아이디, 습관 번호, 오늘 날짜 담기
			HabitRecord hrm = new HabitRecord();
			hrm.setId(id);
			hrm.setHt_no(h.getHt_no());
			hrm.setHtr_date(month);
			ArrayList<HabitRecord> hrMonthlyResult = dailyService.selectHabitRecordListM(hrm);
			
			// 이번 달로 조회한 습관 기록 배열에 담기
			for(HabitRecord HRM : hrMonthlyResult) {
				
				JSONObject jObjectM = new JSONObject();
				jObjectM.put("htr_no", HRM.getHtr_no());
				jObjectM.put("htr_month", HRM.getHtr_month());
				jObjectM.put("htr_time", HRM.getHtr_time());
				jObjectM.put("htr_now", HRM.getHtr_now());
				jObjectM.put("htr_con", HRM.getHtr_con());
				
				monthly.add(jObjectM);
				
			}
			
			sendJson.put("recordMonthlyList", monthly);
			System.out.println("월 확인 : " + hrMonthlyResult);
		
		}
		
		// 전체 습관
		JSONObject jObj = new JSONObject();
		jObj.put("ht_title", h.getHt_title());
		jObj.put("ht_goal", h.getHt_goal());
		jObj.put("ht_unit", h.getHt_unit());
		jObj.put("ht_amount", h.getHt_amount());
		jObj.put("ht_cycle", h.getHt_cycle());
		jObj.put("ht_now", h.getHt_now());
		jObj.put("ht_con", h.getHt_con());
		jObj.put("ht_color", h.getHt_color());
		
		
		sendJson.put("list", jObj);
		
		out.print(sendJson);
		out.flush();
		out.close();
			
	}
	
	@RequestMapping(value="insertHtr.do", method = RequestMethod.POST)
	public void insertHabitRecord(HttpServletRequest request, HttpServletResponse response, String[] htr) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		String id = member.getId();
		
		int ht_no = Integer.parseInt(htr[0]);
		String htr_now = htr[1];
		String htr_con = htr[2];
		
		HabitRecord hr = new HabitRecord();
		hr.setHt_no(ht_no);
		hr.setId(id);
		hr.setHtr_now(htr_now);
		hr.setHtr_con(htr_con);
	        
		System.out.println(hr);
		
		
	    int result = dailyService.insertHabitRecord(hr);
	    
	    if(result > 0) {
	    	out.print("success");
	    	out.flush();
	    	out.close();
	    } else {
	    	out.print("failed");
	    	out.flush();
	    	out.close();
	    }
	        
	        
	}
	
	// 습관 코멘트 삭제
	@RequestMapping(value="updateHabitComment.do", method=RequestMethod.POST)
	public void updateHabitComment(HttpServletRequest request, HttpServletResponse response, Habit habit) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
//		System.out.println("나는 확인을 할 거야 : " +habit);
		int result = dailyService.updateHabitComment(habit);
		
		
		if(result > 0) {
			out.print("success");
			out.flush();
			out.close();
		} else {
			out.print("failed");
			out.flush();
			out.close();
		}
	}
	
	// 습관 코멘트 삭제
	@RequestMapping(value="deleteHabitRecord.do", method=RequestMethod.POST)
	public void deleteHabitRecord(HttpServletRequest request, HttpServletResponse response, String htr_no) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String[] htr_no_item = htr_no.split(",");
		
		HabitRecord hr = new HabitRecord();
		
		int result = 0;
		
		for(int i = 0 ; i < htr_no_item.length ; i++) {
			hr.setHtr_no(htr_no_item[i]);
			result = dailyService.updateHabitRecord(hr);
		}
		
		if(result > 0) {
			out.print("success");
			out.flush();
			out.close();
		} else {
			out.print("failed");
			out.flush();
			out.close();
		}
	}
	
	
	
}
