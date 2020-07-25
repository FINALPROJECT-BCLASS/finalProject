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
import com.kh.finalProject.account.model.vo.ExpenditureSum;
import com.kh.finalProject.account.model.vo.ProfitSum;
import com.kh.finalProject.account.model.vo.SumCondition;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class AccountController {
	
	@Autowired
	AccountService aService;
	
	@Autowired
	SumCondition sc;
	
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
		
		ArrayList<ProfitSum> pSumList = aService.selectPSumList(id);
		
		ArrayList<ExpenditureSum> eSumList = aService.selectESumList(id);
		
		JSONArray jArr = new JSONArray();
		
		for(ProfitSum p : pSumList) {
			JSONObject jObj = new JSONObject();
			jObj.put("eventTitle", p.getSum());
			jObj.put("date", p.getDate());
			jObj.put("color", "blue");
			jObj.put("type", "profit");
			
			jArr.add(jObj);
		}
		
		for(ExpenditureSum e : eSumList) {
			JSONObject jObj = new JSONObject();
			jObj.put("eventTitle", e.getSum());
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
		
		for(AccountBook p : pList) {
			JSONObject jObj = new JSONObject();
			
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
			jObj.put("amount", p.getAbAmount());
			jObj.put("memo", p.getAbMemo());
			
			jArr.add(jObj);
		}
		
		for(AccountBook e : eList) {
			JSONObject jObj = new JSONObject();
			
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
			jObj.put("amount", e.getAbAmount());
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
		
		sc.setId(id);
		sc.setYear(year);
		sc.setMonth(month);
		
		ArrayList<AccountBook> abPNoList = aService.selectAbPNoList(sc);
		
		ArrayList<AccountBook> abENoList = aService.selectAbENoList(sc);
		
		int pSum = 0;
		for(int i = 0; i < abPNoList.size(); i++) {
			pSum += aService.selectAbAmount(abPNoList.get(i).getAbNo());
		}
		
		int eSum = 0;
		for(int i = 0; i < abENoList.size(); i++) {
			eSum += aService.selectAbAmount(abENoList.get(i).getAbNo());
		}
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("pSum", pSum);
		jObj.put("eSum", eSum);
		
		PrintWriter out = response.getWriter();
		out.print(jObj);
		out.flush();
		out.close();
	}

}
