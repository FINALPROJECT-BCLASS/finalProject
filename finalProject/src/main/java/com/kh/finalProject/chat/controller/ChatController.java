package com.kh.finalProject.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.chat.model.service.ChatService;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	ChatService cService;

	@RequestMapping("chatview.do")
	public ModelAndView chatview(ModelAndView mv,HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		System.out.println("로그인 아이디" + loginUser.getId());
		
		ArrayList<Member> member = new ArrayList();
		
		member = cService.selectFriendList(loginUser.getId());
		
		System.out.println("member(친구정보) : " + member);
		mv.addObject("freindList", member).setViewName("chat/chatview");
		
		return mv;
	}
	
	@RequestMapping("selectMember.do")
	public void selectMember(HttpServletResponse response,String name) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		System.out.println("name : " +name);
		
		ArrayList<Member> member = new ArrayList();
		
		member =cService.selectMember(name);
		
		System.out.println("member : " + member);
		
		JSONArray jarr = new JSONArray();
		
		for(Member m : member) {
			JSONObject jMember = new JSONObject();
			
			jMember.put("name", m.getName());
			jMember.put("Rename_file", m.getRename_file());
			jMember.put("nickname", m.getNickname());
			jMember.put("id", m.getId());
			
			jarr.add(jMember);
		}
		JSONObject sendJson = new JSONObject();
		
		sendJson.put("list",jarr);
		
		PrintWriter out = response.getWriter();
		
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	
	@RequestMapping("insertFriendList.do")
	public String insertFriendList(HttpSession session,
						@RequestParam(value = "id")String id ) {
		System.out.println(" 받아온 아이디" + id);
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		System.out.println("로그인 아이디" + loginUser.getId());
		
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", loginUser.getId());
		map.put("friend_id", id);
		
		int result = 0;
		
		result = cService.insertFriendList(map);
		
		if(result >0) {
			return "redirect:chatview.do";
		}else {
			return "<script> alert('친구 추가에 실패했습니다.'); history.back(); </script>";
		}
		
	}
	
}
