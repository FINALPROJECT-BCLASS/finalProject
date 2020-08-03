package com.kh.finalProject.memo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

}
