package com.kh.finalProject.memo.controller;

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

import com.kh.finalProject.member.model.vo.Member;
import com.kh.finalProject.memo.model.exception.MemoException;
import com.kh.finalProject.memo.model.service.MemoService;
import com.kh.finalProject.memo.model.vo.Memo;
import com.kh.finalProject.plan.model.vo.MPlan;

@Controller
public class MemoController {
	
	@Autowired
	MemoService mmService;
	
	@Autowired
	MPlan mp;
	
	@RequestMapping("mmview.do")
	public String memoView() {
		
		return "memo/memo";
	}
	
	@RequestMapping("mminsert.do")
	public String memoInsert(Memo m, MPlan mp, 
							@RequestParam("mainNo") int mainNo) throws MemoException {
		
		int result1 = mmService.insertMemo(m);
		
		int result2 = 0;
		if(result1 > 0 && m.getMainNo() == 1) {
			int memoNo = mmService.selectMemoNo(m);
			
			mp.setMemoNo(memoNo);
			
			result2 = mmService.insertMPlan(mp);
		}
		
		if(result1 > 0) {
			return "memo/memo";
		} else {
			throw new MemoException("메모 추가 실패");
		}
		
	}
	
	@RequestMapping("memolist.do")
	public void memoList(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		ArrayList<Memo> memoList = mmService.selectMemoList(id);
		
		ArrayList<Memo> totalList = new ArrayList<>();
		for(int i = 0; i < memoList.size(); i++) {
			
			Memo m = mmService.selectMemo(memoList.get(i));
			
			totalList.add(m);
		}
		
		JSONArray jArr = new JSONArray();
		
		for(Memo m : totalList) {
			JSONObject jObj = new JSONObject();
			
			jObj.put("main", m.getMainNo());
			jObj.put("no", m.getMemoNo());
			jObj.put("date", m.getMemoDate());
			jObj.put("content", m.getMemoCon());
			
			if(m.getMainNo() == 1) {
				jObj.put("mpTitle", m.getMpTitle());
				jObj.put("mpStart", m.getMpStart());
				jObj.put("mpEnd", m.getMpEnd());
				jObj.put("mpTime", m.getMpTime());
				jObj.put("mpMain", m.getMpMain());
				jObj.put("mpSub", m.getMpSub());
				jObj.put("mpMemo", m.getMpMemo());
			}
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("memoList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping("memodelete.do")
	public String memoDelete(Memo m) throws MemoException {
		
		int result = mmService.deleteMemo(m);
		
		if(result > 0) {
			return "memo/memo";
		} else {
			throw new MemoException("메모 삭제 실패");
		}
	}
	
	@RequestMapping("mpadd.do")
	public String mPlanAdd(Memo m) throws MemoException {
		
		int result1 = mmService.addMPlan(m);
		
		int result2 = 0;
		int result3 = 0;
		if(result1 > 0) {
			result2 = mmService.deleteMemo(m);
			
			if(result2 > 0) {
				result3 = mmService.updateMpEnd(m);
			}
		}
		
		if(result3 > 0) {
			return "memo/memo";
		} else {
			throw new MemoException("일정에 추가 실패");
		}
	}

}
