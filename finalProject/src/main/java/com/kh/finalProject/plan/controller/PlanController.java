package com.kh.finalProject.plan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.plan.model.service.PlanService;
import com.kh.finalProject.plan.model.vo.McRecord;

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
	
//	@RequestMapping("mclist.do")
//	public String menstrualView() {
//		
//		Map<String, McRecord> javaMap = new HashMap<String, McRecord>();
//		 
//		javaMap.put("evt1", new McRecord("이벤트1", 1, "test", "2020-06-25", "2020-06-29", "N")); 
//		
//		return "plan/menstrualCalendar";
//	}
	
	@RequestMapping("mcview.do")
	public String menstrualView() {
		
		return "plan/menstrualCalendar";
	}
	
	@RequestMapping("mcrlist.do")
	public void menstrualView(HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		ArrayList<McRecord> mcrList = pService.selectMcrList();
		System.out.println("되니? : " + mcrList);
		
		JSONArray jArr = new JSONArray();
		
		
		for(McRecord m : mcrList) {
			JSONObject jObj = new JSONObject();
			jObj.put("eventTitle", "이벤트1");
			jObj.put("mcrNo", m.getMcrNo());
			jObj.put("id", m.getId());
			jObj.put("mcrStart", m.getMcrStart());
			jObj.put("mcrEnd", m.getMcrEnd());
			jObj.put("mcrDelete", m.getMcrDelete());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("mcrList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}

}
