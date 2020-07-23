package com.kh.finalProject.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.account.model.exception.AccountException;
import com.kh.finalProject.account.model.service.AccountService;
import com.kh.finalProject.account.model.vo.AccountBook;

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

}
