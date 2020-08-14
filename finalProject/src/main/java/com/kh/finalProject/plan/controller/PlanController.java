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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.member.model.vo.Member;
import com.kh.finalProject.plan.model.exception.PlanException;
import com.kh.finalProject.plan.model.service.PlanService;
import com.kh.finalProject.plan.model.vo.DTodolist;
import com.kh.finalProject.plan.model.vo.MPlan;
import com.kh.finalProject.plan.model.vo.MTodolist;
import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;
import com.kh.finalProject.plan.model.vo.Menstrual;
import com.kh.finalProject.plan.model.vo.Timetable;

@Controller
public class PlanController {
	
	@Autowired
	PlanService pService;
	
	// MenstrualCalendar 시작
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
			jObj.put("start", m.getMcrStart());
			jObj.put("end", m.getMcrEnd());
			jObj.put("color", "#F781BE");
			
			jArr.add(jObj);
		}
		
		for(McOvulation m : mcoList) {
			JSONObject jObj = new JSONObject();
			jObj.put("eventTitle", "가임기");
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
	
	@RequestMapping("mcdelete.do")
	public String menstrualDelete(Model model, HttpSession session) throws PlanException {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		int result1 = pService.deleteMcRecord(id);
		
		int result2 = pService.deleteMcOvulation(id);
		
		int result3 = 0;
		if(result1 > 0 && result2 > 0) {			
			result3 = pService.deleteMenstrual(id);
		}
		
		if(result3 > 0) {
			return "redirect:mcview.do";
		} else {
			throw new PlanException("생리달력 삭제 실패");
		}
		
	}
	
	
	// Timetable 시작
	@RequestMapping("ttview.do")
	public String timetableView() {
		
		return "plan/timetable";
	}
	
	@RequestMapping("ttlist.do")
	public void timetableList(HttpSession session, HttpServletResponse response, Timetable tt) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		tt.setId(id);
		
		ArrayList<Timetable> ttList = pService.selectTtList(tt);
		
		JSONArray jArr = new JSONArray();
		
		for(Timetable t : ttList) {
			int startHour = Integer.parseInt(t.getTtStart().substring(0, 2));
			int startMinute = Integer.parseInt(t.getTtStart().substring(3));
			int endHour = Integer.parseInt(t.getTtEnd().substring(0,2));
			int endMinute = Integer.parseInt(t.getTtEnd().substring(3));
			
			if(endHour == 0) {
				endHour = 24;
				t.setTtEnd("24:"+t.getTtStart().substring(3));
			}
			
			int gap = endHour - startHour;
			
			JSONObject jObj = new JSONObject();
			jObj.put("title", t.getTtTitle());
			jObj.put("start", t.getTtStart());
			jObj.put("end", t.getTtEnd());
			jObj.put("startHour", startHour);
			jObj.put("startMinute", startMinute);
			jObj.put("endHour", endHour);
			jObj.put("endMinute", endMinute);
			jObj.put("gap", gap);
			jObj.put("color", t.getTtColor());
			jObj.put("memo", t.getTtMemo());
			jObj.put("no", t.getTtNo());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("ttList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping("ttinsert.do")
	public String timetableInsert(Model model, Timetable t) throws PlanException {
		
		int result = pService.insertTimetable(t);
		
		if(result > 0) {
			return "redirect:ttview.do";
		} else {
			throw new PlanException("시간표 등록 실패");
		}
		
	}
	
	@RequestMapping("ttdelete.do")
	public String timetableDelete(@RequestParam(value="ttNo") String no) throws PlanException {

		int ttNo = 0;
		
		try {
			ttNo = Integer.parseInt(no);
		} catch(NumberFormatException e) {
			e.getStackTrace();
		}
		
		int result = pService.deleteTimetable(ttNo);
		
		if(result > 0) {
			return "redirect:ttview.do";
		} else {
			throw new PlanException("시간표 삭제 실패");
		}
		
	}
	
	@RequestMapping("dtinsert.do")
	public String dTodolistInsert(Model model, HttpSession session, DTodolist dt
								, @RequestParam(value="listContent") String[] dtConArr
								, @RequestParam(value="checkResult") String[] dtComArr
								, @RequestParam(value="dtDate") String dtDate) throws PlanException {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		dt.setId(id);
		
		pService.deleteDTodolist(dt);
		
		int result = 0;
		
		for(int i = 0; i < dtConArr.length; i++) {
			if(!dtConArr[i].equals("")) {
				DTodolist insertDt = new DTodolist();
				
				insertDt.setDtNo(i+1);
				insertDt.setDtDate(dtDate);
				insertDt.setId(id);
				insertDt.setDtCon(dtConArr[i]);
				insertDt.setDtComplete(dtComArr[i]);
				
				result += pService.insertDTodolist(insertDt);
			}
		}				
		
		return "redirect:ttview.do";
		
	}
	
	@RequestMapping("dtlist.do")
	public void dTodolistList(HttpSession session, HttpServletResponse response, DTodolist dt) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		dt.setId(id);
		
		ArrayList<DTodolist> dtList = pService.selectDtList(dt);
		
		JSONArray jArr = new JSONArray();
		
		for(DTodolist d : dtList) {
			JSONObject jObj = new JSONObject();
			jObj.put("content", d.getDtCon());
			jObj.put("complete", d.getDtComplete());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("dtList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	
	// MonthlyPlan 시작
	@RequestMapping("mpview.do")
	public String monthlyView() {
		
		return "plan/monthlyPlanner";
	}
	
	@RequestMapping("mpinsert.do")
	public String mPlanInsert(MPlan m) throws PlanException {
		
		int result1 = pService.insertMPlan(m);
		
		MPlan insertM = pService.selectLastMPlan(m);
		
		int result2 = 0;
		if(result1 > 0) {
			result2 = pService.updateMpEnd(insertM);
		}
		
		if(result1 > 0 && result2 > 0)	{
			return "redirect:mpview.do";
		} else {
			throw new PlanException("일정 추가 실패");
		}
		
	}
	
	@RequestMapping("mplist.do")
	public void mPlanList(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		ArrayList<MPlan> mpList = pService.selectMpList(id);
		
		JSONArray jArr = new JSONArray();
		
		for(MPlan m : mpList) {
			JSONObject jObj = new JSONObject();
			jObj.put("no", m.getMpNo());
			jObj.put("eventTitle", m.getMpTitle());
			jObj.put("start", m.getMpStart());
			jObj.put("end", m.getMpEnd());
			jObj.put("time", m.getMpTime());
			jObj.put("main", m.getMpMain());
			jObj.put("sub", m.getMpSub());
			jObj.put("memo", m.getMpMemo());
			jObj.put("color", m.getMpColor());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("mpList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping("mpdetail.do")
	public void mPlanDetail(HttpSession session, HttpServletResponse response, Model model, MPlan m) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		MPlan mp = pService.selectMPlan(m);
		
		String address = "";
		if(mp.getMpMain() != null) {
			if(mp.getMpSub() != null) {
				address = mp.getMpMain() + " " + mp.getMpSub();				
			} else {
				address = mp.getMpMain();
			}
		}
		
		if(address.length() > 0) {
			model.addAttribute("locationCheck");
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("no", mp.getMpNo());
		jObj.put("eventTitle", mp.getMpTitle());
		jObj.put("start", mp.getMpStart());
		jObj.put("end", mp.getMpEnd());
		jObj.put("time", mp.getMpTime());
		jObj.put("main", mp.getMpMain());
		jObj.put("sub", mp.getMpSub());
		jObj.put("location", address);
		jObj.put("memo", mp.getMpMemo());
		jObj.put("map", mp.getMpMain());
		
		PrintWriter out = response.getWriter();
		out.print(jObj);
		out.flush();
		out.close();
	}
	
	@RequestMapping("mpdelete.do")
	public String mPlanDelete(@RequestParam(value="mpNo") String no) throws PlanException {
		
		int mpNo = Integer.parseInt(no);
		
		int result = pService.deleteMPlan(mpNo);
		
		if(result > 0) {
			return "redirect:mpview.do";
		} else {
			throw new PlanException("일정 삭제 실패");
		}
		
	}
	
	@RequestMapping("mpupdate.do")
	public String mPlanUpdate(MPlan m) throws PlanException {
		int result1 = pService.updateMPlan(m);
		
		int result2 = 0;
		if(result1 > 0) {
			result2 = pService.updateMpEnd(m);
		}
		
		if(result2 > 0) {
			return "redirect:mpview.do";
		} else {
			throw new PlanException("일정 수정 실패");
		}
	}
	
	@RequestMapping("mtinsert.do")
	public String mTodolistInsert(Model model, HttpSession session, MTodolist mt
								, @RequestParam(value="listContent") String[] mtConArr
								, @RequestParam(value="checkResult") String[] mtComArr
								, @RequestParam(value="mtDate") String mtDate) throws PlanException {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		mt.setId(id);
		
		pService.deleteMTodolist(mt);
		
		int result = 0;
		
		for(int i = 0; i < mtConArr.length; i++) {
			if(!mtConArr[i].equals("")) {
				MTodolist insertMt = new MTodolist();
				
				insertMt.setMtNo(i+1);
				insertMt.setMtDate(mtDate);
				insertMt.setId(id);
				insertMt.setMtCon(mtConArr[i]);
				insertMt.setMtComplete(mtComArr[i]);
				
				result += pService.insertMTodolist(insertMt);
			}
		}				
		
		
		return "redirect:mpview.do";

	}
	
	@RequestMapping("mtlist.do")
	public void mTodolistList(HttpSession session, HttpServletResponse response, MTodolist mt) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		mt.setId(id);
		
		ArrayList<MTodolist> mtList = pService.selectMtList(mt);
		
		JSONArray jArr = new JSONArray();
		
		for(MTodolist m : mtList) {
			JSONObject jObj = new JSONObject();
			jObj.put("content", m.getMtCon());
			jObj.put("complete", m.getMtComplete());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("mtList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}

}
