package com.kh.finalProject.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	
	@RequestMapping("memberJoin.do")
	public String memberJoin(Model model) {
		return "member/join";
	}
	
	@RequestMapping("memberLogin.do")
	public String memberLogin(Model model) {
		return "member/login";
	}
}
