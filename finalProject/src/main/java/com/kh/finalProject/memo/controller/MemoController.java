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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.daily.model.vo.Bookmark;
import com.kh.finalProject.daily.model.vo.BookmarkMap;
import com.kh.finalProject.daily.model.vo.BookmarkUrl;
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
	public String memoView(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		ArrayList<Bookmark> bmList = mmService.selectBmList(id);
		
		model.addAttribute("bmList", bmList);
		
		return "memo/memo";
	}
	
	@RequestMapping("mminsert.do")
	public String memoInsert(Memo m, MPlan mp, AccountBook ab, Bookmark b, BookmarkMap bm, BookmarkUrl bu,
							@RequestParam("mainNo") int mainNo,
							@RequestParam(value="mb_main", required=false) String mbMain,
							@RequestParam(value="mb_sub", required=false) String mbSub,
							@RequestParam(value="type", required=false) String type) throws MemoException {
		
		int result1 = mmService.insertMemo(m);
		
		int result2 = 0;
		if(result1 > 0 && m.getMainNo() == 1) {
			int memoNo = mmService.selectMemoNo(m);
			
			mp.setMemoNo(memoNo);
			
			result2 = mmService.insertMPlan(mp);
			
		} else if(result1 > 0 && m.getMainNo() == 9) {
			int memoNo = mmService.selectMemoNo(m);
			
			ab.setMemoNo(memoNo);
			
			if(type.equals("profit")) {
				ab.setAecNo(0);
			} else {
				ab.setApcNo(0);
			}
			
			result2 = mmService.insertABook(ab);
			
		} else if(result1 > 0 && m.getMainNo() == 6) {
			int memoNo = mmService.selectMemoNo(m);
			
			if(m.getMemoType().equals("map")) {
				String address = mbMain + " " + mbSub;

				bm.setMemo_no(memoNo);
				bm.setMb_address(address);
				
				result2 = mmService.insertBMap(bm);
			} else {
				bu.setMemo_no(memoNo);
				
				result2 = mmService.insertBUrl(bu);
			}
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
			jObj.put("type", m.getMemoType());
			
			if(m.getMainNo() == 1) {
				jObj.put("mpTitle", m.getMpTitle());
				jObj.put("mpStart", m.getMpStart());
				jObj.put("mpEnd", m.getMpEnd());
				jObj.put("mpTime", m.getMpTime());
				jObj.put("mpMain", m.getMpMain());
				jObj.put("mpSub", m.getMpSub());
				jObj.put("mpMemo", m.getMpMemo());
			}
			
			if(m.getMainNo() == 9) {
				jObj.put("abDate", m.getAbDate());
				jObj.put("apcTitle", m.getApcTitle());
				jObj.put("aecTitle", m.getAecTitle());
				
				String formatAmount = String.format("%,d", m.getAbAmount());
				jObj.put("abAmount", formatAmount);
				
				jObj.put("abMemo",m.getAbMemo());
			}
			
			if(m.getMainNo() == 6) {
				jObj.put("blTitle", m.getBlTitle());
				
				if(m.getMemoType().equals("map")) {
					jObj.put("mbTitle", m.getMbTitle());
					jObj.put("mbPhone", m.getMbPhone());
					jObj.put("mbTime", m.getMbTime());
					jObj.put("mbMemo", m.getMbMemo());
					jObj.put("mbAddress", m.getMbAddress());
				} else {
					jObj.put("ubTitle", m.getUbTitle());
					jObj.put("ubCon", m.getUbCon());
					jObj.put("ubUrl", m.getUbUrl());
				}
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
	public String mPlanAdd(Memo m, MPlan mp) throws MemoException {
		
		int result1 = 0;
		if(m.getMemoType() != null && m.getMemoType().equals("noDate")) {
			int result = mmService.updateMpDate(mp);
			
			if(result > 0) {
				result1 = mmService.addMPlan(m);
			}
		} else {
			result1 = mmService.addMPlan(m);
		}
		
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
	
	@RequestMapping("abadd.do")
	public String aBookAdd(Memo m, AccountBook a) throws MemoException {
		
		int result1 = 0;
		if(m.getMemoType() != null && m.getMemoType().equals("noDate")) {
			int result = mmService.updateAbDate(a);
			
			if(result > 0) {
				result1 = mmService.addABook(m);
			}
		} else {
			result1 = mmService.addABook(m);
		}
		
		int result2 = 0;
		if(result1 > 0) {
			result2 = mmService.deleteMemo(m);
		}
		
		if(result2 > 0) {
			return "memo/memo";
		} else {
			throw new MemoException("가계부에 추가 실패");
		}
	}
	
	@RequestMapping("bmadd.do")
	public String bookmarkAdd(Memo m) throws MemoException {
		
		int result1 = mmService.addBookmark(m);
		
		int result2 = 0;
		if(result1 > 0) {
			result2 = mmService.deleteMemo(m);
		}
		
		if(result2 > 0) {
			return "memo/memo";
		} else {
			throw new MemoException("북마크에 추가 실패");
		}
	}
	
	@RequestMapping("mmupdate.do")
	public String memoUpdate(Memo m, MPlan mp) throws MemoException {
		
		int result = 0;
		if(m.getMainNo() == 0) {
			result = mmService.updateMemo(m);			
		} else if(m.getMainNo() == 1) {
			result = mmService.updateMPlan(mp);
		}
		
		if(result > 0) {
			return "memo/memo";
		} else {
			throw new MemoException("메모 수정 실패");
		}
	}

}
