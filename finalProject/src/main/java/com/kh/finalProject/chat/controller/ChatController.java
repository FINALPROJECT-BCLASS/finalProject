package com.kh.finalProject.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.chat.model.service.ChatService;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	ChatService cService;

	@RequestMapping("chatview.do")
	public ModelAndView chatview(ModelAndView mv) {
		
		mv.setViewName("chat/chatview");
		
		return mv;
	}
	
	@RequestMapping("selectMember.do")
	public void selectMember(String name) {
		System.out.println("name : " +name);
		
		ArrayList<Member> member = cService.selectMember(name);
	}
	
}
