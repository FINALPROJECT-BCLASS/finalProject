package com.kh.finalProject.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.member.model.service.MemberService;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class MemberController {

	
//	@RequestMapping("memberJoin.do")
//	public String memberJoin(Model model) {
//		return "member/join";
//	}
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("memberLoginView.do")
	public String memberLoginView(Model model) {
		return "member/login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, HttpSession session, Model model) {
		
		// 확인
		System.out.println("ID : " + m.getId());
		System.out.println("PWD : " + m.getPwd());
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "home";
		} else {
			return "member/login";
		}
	
	}
	
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "home";
	}
	
	@RequestMapping("join.do")
	public String joinView() {
		return "member/join";
	}
	
	@RequestMapping(value = "checkId.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		mService.checkId(id, response);
	}
	
	
	
	
	
}
