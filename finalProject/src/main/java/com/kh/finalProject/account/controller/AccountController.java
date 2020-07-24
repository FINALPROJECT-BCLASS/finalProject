package com.kh.finalProject.account.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.account.model.exception.AccountException;
import com.kh.finalProject.account.model.service.AccountService;
import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.account.model.vo.ProfitSum;
import com.kh.finalProject.member.model.vo.Member;
import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;

@Controller
public class AccountController {
	
	@Autowired
	AccountService aService;
	
	@RequestMapping("mrview.do")
	public String monthlyRecordView() {
		
		return "account/monthlyRecord";
	}
	
	@RequestMapping("abinsert.do")
	public String accontBookInsert(AccountBook a, @RequestParam(value="type") String type) throws AccountException {
		
		if(type.equals("profit")) {
			a.setAbPro(1);
			a.setAecNo(0);
		} else {
			a.setAbExp(1);
			a.setApcNo(0);
		}
		
		int result = aService.insertAccontBook(a);
		
		if(result > 0) {
			return "redirect:mrview.do";
		} else {
			throw new AccountException("가계부 등록 실패");
		}
	}
	
//	@RequestMapping("ablist.do")
//	public void AccoutBookList(HttpSession session, HttpServletResponse response) {
//		response.setContentType("application/json;charset=utf-8");
//		
//		Member loginUser = (Member)session.getAttribute("loginUser");
//		String id = loginUser.getId();
//		
//		ArrayList<ProfitSum> = aService.selectPSumList(id);
//		
//		JSONArray jArr = new JSONArray();
//		
//		for(McRecord m : mcrList) {
//			JSONObject jObj = new JSONObject();
//			jObj.put("eventTitle", "생리예정일");
//			jObj.put("start", m.getMcrStart());
//			jObj.put("end", m.getMcrEnd());
//			jObj.put("color", "#F781BE");
//			
//			jArr.add(jObj);
//		}
//		
//		for(McOvulation m : mcoList) {
//			JSONObject jObj = new JSONObject();
//			jObj.put("eventTitle", "가임기");
//			jObj.put("start", m.getMcoStart());
//			jObj.put("end", m.getMcoEnd());
//			jObj.put("color", "#00CC66");
//			
//			jArr.add(jObj);
//		}
//		
//		JSONObject sendJson = new JSONObject();
//		sendJson.put("mcList", jArr);
//		
//		PrintWriter out = response.getWriter();
//		out.print(sendJson);
//		out.flush();
//		out.close();
//	}

}
