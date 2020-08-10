package com.kh.finalProject.account.controller;

import java.io.IOException;
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
import com.kh.finalProject.account.model.vo.AccountCategory;
import com.kh.finalProject.account.model.vo.Condition;
import com.kh.finalProject.account.model.vo.MSumCondition;
import com.kh.finalProject.account.model.vo.MonthlySum;
import com.kh.finalProject.account.model.vo.Sum;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class AccountController {
	
	@Autowired
	AccountService aService;
	
	@Autowired
	Condition condition;
	
	@RequestMapping("mrview.do")
	public String monthlyRecordView() {
		
		return "account/monthlyRecord";
	}
	
	@RequestMapping("abinsert.do")
	public String accountBookInsert(AccountBook a, @RequestParam(value="type") String type) throws AccountException {
		
		if(type.equals("profit")) {
			a.setAecNo(0);
		} else {
			a.setApcNo(0);
		}
		
		int result = aService.insertAccountBook(a);
		
		if(result > 0) {
			return "redirect:mrview.do";
		} else {
			throw new AccountException("가계부 등록 실패");
		}
	}
	
	@RequestMapping("sumlist.do")
	public void AccoutBookList(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		ArrayList<Sum> pSumList = aService.selectPSumList(id);
		
		ArrayList<Sum> eSumList = aService.selectESumList(id);
		
		JSONArray jArr = new JSONArray();
		
		for(Sum p : pSumList) {
			JSONObject jObj = new JSONObject();
			
			String formatSum = String.format("%,d", p.getSum());
			jObj.put("eventTitle", formatSum);
			jObj.put("date", p.getDate());
			jObj.put("color", "blue");
			jObj.put("type", "profit");
			
			jArr.add(jObj);
		}
		
		for(Sum e : eSumList) {
			JSONObject jObj = new JSONObject();
			
			String formatSum = String.format("%,d", e.getSum());
			jObj.put("eventTitle", formatSum);
			jObj.put("date", e.getDate());
			jObj.put("color", "red");
			jObj.put("type", "expenditure");
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("sumList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping("abdetail.do")
	public void AccoutBookDetail(HttpSession session, HttpServletResponse response, AccountBook a) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		a.setId(id);
		
		String date = a.getAbDate().substring(0, 10);
		a.setAbDate(date);
		
		ArrayList<AccountBook> pList= aService.selectPList(a);

		ArrayList<AccountBook> eList = aService.selectEList(a);
		
		JSONArray jArr = new JSONArray();
		
		int i = 0;
		for(AccountBook p : pList) {
			JSONObject jObj = new JSONObject();
			
			i = i + 1;
			
			jObj.put("index", i);
			
			switch(p.getApcNo()) {
				case 1: jObj.put("category", "월급"); break;
				case 2: jObj.put("category", "주급"); break;
				case 3: jObj.put("category", "일급"); break;
				case 4: jObj.put("category", "용돈"); break;
				case 5: jObj.put("category", "이월"); break;
				case 6: jObj.put("category", "자산인출"); break;
				case 7: jObj.put("category", "기타"); break;
				default: jObj.put("category", "해당사항 없음"); break;
			}
			
			jObj.put("type", "profit");
			jObj.put("no", p.getAbNo());
			jObj.put("date", p.getAbDate());
			
			String formatAmount = String.format("%,d", p.getAbAmount());
			jObj.put("amount", formatAmount);
			
			jObj.put("memo", p.getAbMemo());
			
			jArr.add(jObj);
		}
		
		for(AccountBook e : eList) {
			JSONObject jObj = new JSONObject();
			
			i = i + 1;
			
			jObj.put("index", i);
			
			switch(e.getAecNo()) {
				case 1: jObj.put("category", "식비"); break;
				case 2: jObj.put("category", "교통비"); break;
				case 3: jObj.put("category", "문화생활"); break;
				case 4: jObj.put("category", "생필품"); break;
				case 5: jObj.put("category", "의류"); break;
				case 6: jObj.put("category", "미용"); break;
				case 7: jObj.put("category", "의료"); break;
				case 8: jObj.put("category", "교육"); break;
				case 9: jObj.put("category", "통신비"); break;
				case 10: jObj.put("category", "회비"); break;
				case 11: jObj.put("category", "경조사"); break;
				case 12: jObj.put("category", "저축"); break;
				case 13: jObj.put("category", "가전"); break;
				case 14: jObj.put("category", "공과금"); break;
				case 15: jObj.put("category", "카드대금"); break;
				case 16: jObj.put("category", "기타"); break;
				default: jObj.put("category", "해당사항 없음"); break;
			}
			
			jObj.put("type", "expenditure");
			jObj.put("no", e.getAbNo());
			jObj.put("date", e.getAbDate());
			
			String formatAmount = String.format("%,d", e.getAbAmount());
			jObj.put("amount", formatAmount);
			
			jObj.put("memo", e.getAbMemo());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("abList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping("abdelete.do")
	public String accountBookDelete(AccountBook a) throws AccountException {
		
		int result = aService.deleteAccountBook(a);
		
		if(result > 0) {
			return "redirect:mrview.do";
		} else {
			throw new AccountException("가계부 사가제 실패");
		}
	
	}
	
	@RequestMapping("sumview.do")
	public void AccoutBookSum(HttpSession session, HttpServletResponse response, AccountBook a) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		String year = a.getAbDate().substring(0, 4);
		String month = a.getAbDate().substring(5);
		
		condition.setId(id);
		condition.setYear(year);
		condition.setMonth(month);
		
		ArrayList<AccountBook> abPNoList = aService.selectAbPNoList(condition);
		
		ArrayList<AccountBook> abENoList = aService.selectAbENoList(condition);
		
		int pSum = 0;
		for(int i = 0; i < abPNoList.size(); i++) {
			pSum += aService.selectAbAmount(abPNoList.get(i).getAbNo());
		}
		
		int eSum = 0;
		for(int i = 0; i < abENoList.size(); i++) {
			eSum += aService.selectAbAmount(abENoList.get(i).getAbNo());
		}
		
		String formatPSum = String.format("%,d", pSum);
		String formatESum = String.format("%,d", eSum);
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("pSum", formatPSum);
		jObj.put("eSum", formatESum);
		
		PrintWriter out = response.getWriter();
		out.print(jObj);
		out.flush();
		out.close();
	}
	
	@RequestMapping("ysview.do")
	public String yearlyStatisticsView() {
		
		return "account/yearlyStatistics";
	}
	
	@RequestMapping("mslist.do")
	public void monthlySumList(HttpSession session, HttpServletResponse response, MSumCondition mc) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		mc.setId(id);
		
		ArrayList<MonthlySum> mpsList = aService.selectMPSumList(mc);
		
		ArrayList<MonthlySum> mesList = aService.selectMESumList(mc);
		
		JSONArray jArr = new JSONArray();
		
		for(MonthlySum p : mpsList) {
			JSONObject jObj = new JSONObject();

			jObj.put("type", "profit");
			jObj.put("year", mc.getYear());
			jObj.put("month", p.getMonth());
			jObj.put("amount", p.getSum());
			
			jArr.add(jObj);
		}
		
		for(MonthlySum e : mesList) {
			JSONObject jObj = new JSONObject();

			jObj.put("type", "expenditure");
			jObj.put("year", mc.getYear());
			jObj.put("month", e.getMonth());
			jObj.put("amount", e.getSum());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("msList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
		
	}
	
	@RequestMapping("esview.do")
	public String MonthlyStatisticsView() {
		
		return "account/expenditureStatistics";
	}
	
	@RequestMapping("eclist.do")
	public void expCategoryList(HttpSession session, HttpServletResponse response, String date) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		String year = date.substring(0, 4);
		String month = date.substring(5);
		
		condition.setId(id);
		condition.setYear(year);
		condition.setMonth(month);
		
		ArrayList<AccountBook> abPNoList = aService.selectAbPNoList(condition);
		
		ArrayList<AccountBook> abENoList = aService.selectAbENoList(condition);
		
		int pSum = 0;
		for(int i = 0; i < abPNoList.size(); i++) {
			pSum += aService.selectAbAmount(abPNoList.get(i).getAbNo());
		}
		
		int eSum = 0;
		for(int i = 0; i < abENoList.size(); i++) {
			eSum += aService.selectAbAmount(abENoList.get(i).getAbNo());
		}
		
		String maxExp = "";
		if(eSum > pSum) {
			maxExp = aService.getOverrun(condition);			
		}
		
		int gapAmount = pSum - eSum;
		String gap = "";
		if(gapAmount > 0) {
			gap = "plus";
		} else {
			gap = "minus";
		}
		
		ArrayList<AccountCategory> ecList = aService.selectECList(condition);
		
		JSONArray jArr = new JSONArray();
		
		for(AccountCategory e : ecList) {
			JSONObject jObj = new JSONObject();

			jObj.put("year", condition.getYear());
			jObj.put("month", condition.getMonth());
			
			switch(e.getNo()) {
				case 1: jObj.put("category", "meal"); break;
				case 2: jObj.put("category", "transition"); break;
				case 3: jObj.put("category", "culture"); break;
				case 4: jObj.put("category", "life"); break;
				case 5: jObj.put("category", "clothes"); break;
				case 6: jObj.put("category", "beauty"); break;
				case 7: jObj.put("category", "health"); break;
				case 8: jObj.put("category", "education"); break;
				case 9: jObj.put("category", "phone"); break;
				case 10: jObj.put("category", "membership"); break;
				case 11: jObj.put("category", "occasion"); break;
				case 12: jObj.put("category", "saving"); break;
				case 13: jObj.put("category", "machine"); break;
				case 14: jObj.put("category", "utility"); break;
				case 15: jObj.put("category", "card"); break;
				case 16: jObj.put("category", "etc"); break;
				default: System.out.println("해당 사항 없음"); break;
			}
			
			jObj.put("title", e.getTitle());
			jObj.put("amount", e.getSum());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		
		String formatPSum = String.format("%,d", pSum);
		sendJson.put("pSum", pSum);
		sendJson.put("formatPSum", formatPSum);
		
		String formatESum = String.format("%,d", eSum);
		sendJson.put("eSum", eSum);
		sendJson.put("formatESum", formatESum);
		
		sendJson.put("ecList", jArr);
		sendJson.put("maxExp", maxExp);
		sendJson.put("gap", gap);
		
		String formatGap = String.format("%,d", gapAmount);
		sendJson.put("gapAmount", formatGap);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
		
	}
	
	@RequestMapping("psview.do")
	public String ProfitStatisticsView() {
		
		return "account/profitStatistics";
	}
	
	@RequestMapping("pclist.do")
	public void proCategoryList(HttpSession session, HttpServletResponse response, String date) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		String year = date.substring(0, 4);
		String month = date.substring(5);
		
		condition.setId(id);
		condition.setYear(year);
		condition.setMonth(month);
		
		ArrayList<AccountBook> abPNoList = aService.selectAbPNoList(condition);
		
		ArrayList<AccountBook> abENoList = aService.selectAbENoList(condition);
		
		int pSum = 0;
		for(int i = 0; i < abPNoList.size(); i++) {
			pSum += aService.selectAbAmount(abPNoList.get(i).getAbNo());
		}
		
		int eSum = 0;
		for(int i = 0; i < abENoList.size(); i++) {
			eSum += aService.selectAbAmount(abENoList.get(i).getAbNo());
		}
		
		String maxExp = "";
		if(eSum > pSum) {
			maxExp = aService.getOverrun(condition);			
		}
		
		int gapAmount = pSum - eSum;
		String gap = "";
		if(gapAmount > 0) {
			gap = "plus";
		} else {
			gap = "minus";
		}
		
		ArrayList<AccountCategory> pcList = aService.selectPCList(condition);
		
		JSONArray jArr = new JSONArray();
		
		for(AccountCategory p : pcList) {
			JSONObject jObj = new JSONObject();

			jObj.put("year", condition.getYear());
			jObj.put("month", condition.getMonth());
			
			switch(p.getNo()) {
				case 1: jObj.put("category", "monthly"); break;
				case 2: jObj.put("category", "weekly"); break;
				case 3: jObj.put("category", "daily"); break;
				case 4: jObj.put("category", "allowance"); break;
				case 5: jObj.put("category", "over"); break;
				case 6: jObj.put("category", "withdrawal"); break;
				case 7: jObj.put("category", "etc"); break;
				default: System.out.println("해당 사항 없음"); break;
			}
			
			jObj.put("title", p.getTitle());
			jObj.put("amount", p.getSum());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		
		String formatPSum = String.format("%,d", pSum);
		sendJson.put("pSum", pSum);
		sendJson.put("formatPSum", formatPSum);
		
		String formatESum = String.format("%,d", eSum);
		sendJson.put("eSum", eSum);
		sendJson.put("formatESum", formatESum);
		
		sendJson.put("pcList", jArr);
		sendJson.put("maxExp", maxExp);
		sendJson.put("gap", gap);
		
		String formatGap = String.format("%,d", gapAmount);
		sendJson.put("gapAmount", formatGap);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
		
	}

}
