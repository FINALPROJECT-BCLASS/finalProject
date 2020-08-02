package com.kh.finalProject.memo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.memo.model.service.MemoService;

@Controller
public class MemoController {
	
	@Autowired
	MemoService mmService;
	
	@RequestMapping("mmview.do")
	public String memoView() {
		
		return "memo/memo";
	}

}
