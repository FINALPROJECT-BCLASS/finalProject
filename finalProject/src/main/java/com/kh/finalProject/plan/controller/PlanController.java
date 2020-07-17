package com.kh.finalProject.plan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.member.model.vo.Member;
import com.kh.finalProject.plan.model.exception.PlanException;
import com.kh.finalProject.plan.model.service.PlanService;
import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;
import com.kh.finalProject.plan.model.vo.Menstrual;

@Controller
public class PlanController {
	
	@Autowired
	PlanService pService;
	
	@RequestMapping("mplist.do")
	public String monthlyView() {
		
		return "plan/monthlyPlanner";
	}
	
	@RequestMapping("ttlist.do")
	public String timetableView() {
		
		return "plan/timetable";
	}
	
	@RequestMapping("mcview.do")
	public ModelAndView menstrualView(HttpSession session, ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		int check = pService.checkInfo(id);
		
		if(check > 0) {
			Menstrual m = pService.selectMenstrual(id);
			
			int lastCheck = pService.checkMcLast(m);
			
			int result1 = 0;
			int result2 = 0;
			int result3 = 0;
			
			while(lastCheck <= 2) {
				m = pService.selectMenstrual(id);
				
				result1 += pService.insertMcRecord(m);
				result2 += pService.insertMcOvulation(m);
				result3 += pService.updateMcLast(m);
				
				lastCheck = pService.checkMcLast(m);
			}
			
			if(result1 > 0) {
				mv.addObject("msg", "예정일이 업데이트 되었습니다.");				
			}
			
			m = pService.selectMenstrual(id);
			
			mv.addObject("menstrual", m);
		}
		
		mv.addObject("check", check);
		mv.setViewName("plan/menstrualCalendar");
		
		return mv;
	}
	
	@RequestMapping("mcinsert.do")
	public String menstrualInsert(Model model, Menstrual menstrual) throws PlanException {
		
		int result1 = pService.insertMenstrual(menstrual);
		
		if(result1 > 0) {
			
			for(int i = 0; i < 4; i ++) {
				Menstrual m = pService.selectMenstrual(menstrual.getId());
				
				int result2 = pService.insertMcRecord(m);
				int result3 = pService.insertMcOvulation(m);
				int result4 = pService.updateMcLast(m);
			}
			
			return "redirect:mcview.do";
		} else {
			throw new PlanException("생리달력 등록 실패");
		}
		
	}
	
	@RequestMapping("mclist.do")
	public void mcRecordList(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		ArrayList<McRecord> mcrList = pService.selectMcrList(id);
		ArrayList<McOvulation> mcoList = pService.selectMcoList(id);
		
		JSONArray jArr = new JSONArray();
		
		for(McRecord m : mcrList) {
			JSONObject jObj = new JSONObject();
			jObj.put("eventTitle", "생리예정일");
			jObj.put("no", m.getMcrNo());
			jObj.put("id", m.getId());
			jObj.put("start", m.getMcrStart());
			jObj.put("end", m.getMcrEnd());
			jObj.put("color", "#F781BE");
			
			jArr.add(jObj);
		}
		
		for(McOvulation m : mcoList) {
			JSONObject jObj = new JSONObject();
			jObj.put("eventTitle", "가임기");
			jObj.put("no", m.getMcoNo());
			jObj.put("id", m.getId());
			jObj.put("start", m.getMcoStart());
			jObj.put("end", m.getMcoEnd());
			jObj.put("color", "#00CC66");
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("mcList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping("mcupdate.do")
	public String menstrualUpdate(HttpSession session, Model model, Menstrual menstrual) throws PlanException {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		int result1 = pService.updateMenstrual(menstrual);
		
		Menstrual m = pService.selectMenstrual(id);
		
		if(result1 > 0) {
			
			int gap = pService.selectGap(id);
			
			ArrayList<McRecord> afterMcrList = pService.afterMcrList(m);
			
			ArrayList<McOvulation> afterMcoList = pService.afterMcoList(m);
			
			for(int i = 0; i < afterMcrList.size(); i++) {
				afterMcrList.get(i).setGap(gap*(i+1));
				
				int result2 = 0;
				result2 += pService.updateMcrStart(afterMcrList.get(i));
				
				int result3 = 0;
				result3 += pService.updateMcrEnd(afterMcrList.get(i));
			}
			
			for(int i = 0; i < afterMcoList.size(); i++) {
				afterMcoList.get(i).setGap(gap*(i+1));
				
				int result4 = 0;
				result4 += pService.updateMcOvulation(afterMcoList.get(i));
			}
			
			return "redirect:mcview.do";
		} else {
			throw new PlanException("생리달력 수정 실패");
		}
		
	}

}
