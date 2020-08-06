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
import com.kh.finalProject.chat.model.vo.Chat;
import com.kh.finalProject.chat.model.vo.openChat;
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
	
	@RequestMapping("ChatOneToOneView.do")
	public ModelAndView ChatOneToOneView(HttpSession session, ModelAndView mv,
											@RequestParam(value="id") String id) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id",loginUser.getId());
		map.put("friendId", id);
		
		Chat ch1 = new Chat();
			ch1 = cService.selectChatOnetoOne(map);
			System.out.println("검색결과 " + ch1);
			
		if( ch1 == null) {
			int result = cService.insertChatOnetoTOne(map);
			
			ch1 = cService.selectChatOnetoOne(map);
				if(result >0) {
					session.setAttribute("co_no", ch1.getCo_no());
					mv.addObject("ch", ch1).setViewName("chat/chatOneToOne");
				}//else문 추가해주기?
				
		}else {
			session.setAttribute("co_no", ch1.getCo_no());
			mv.addObject("ch", ch1).setViewName("chat/chatOneToOne");
		}
		
		
		
		/*
		 * System.out.println("받아온 아이디" +id); System.out.println("본인 아이디" +
		 * loginUser.getId());
		 */
		
		return mv;
		
	}
	
	@RequestMapping("chatroom.do")
	public ModelAndView chatroomView(ModelAndView mv,HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		
		ArrayList<Chat> ch = cService.selectchatroom(loginUser.getId());
		System.out.println("ch : " + ch);
		mv.addObject("chroomlist", ch).setViewName("chat/chatroomlist");
		return mv;
	}
	
	@RequestMapping("chatroomdetail.do")
	public ModelAndView chatroomdetail(ModelAndView mv,HttpSession session,
										@RequestParam(value="co_no") String co_no) {
		
		Chat ch = cService.selectchatroomdetail(co_no); //임시
		System.out.println("ch : " + ch);
		session.setAttribute("co_no", co_no);
		mv.addObject("ch", ch).setViewName("chat/chatOneToOne");
		
		return mv;
	}
	@RequestMapping("openchatroom.do")
	public ModelAndView openchatroomView(ModelAndView mv, HttpSession session) {
		
		ArrayList<openChat> oclist = new ArrayList<openChat>();
		
		oclist= cService.selectopenchatroomlist();
		if(oclist != null) {
			System.out.println("oc : " + oclist);
		}else {
		System.out.println("조회된 방이 없습니다.");
		}
		
		
		mv.addObject("oclist", oclist).setViewName("chat/openchatlist");
		
		return mv;
	}
	
	@RequestMapping("insertopenchatroom.do")
	public ModelAndView insertopenchatroomView(ModelAndView mv, HttpSession session) {
		
		mv.setViewName("chat/insertchatroom");
		
		return mv;
	}
	
	@RequestMapping("openchatroominsert.do")
	public String openchatroominser(HttpSession session,openChat openchat) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		openchat.setCm_id(loginUser.getId());
		
		int result = cService.openchatroominsert(openchat);
		
		if(result > 0 ) {
			
			int cm_no = cService.selectopenchatroom(openchat);
			
			return "redirect:openchatview.do?cm_no=" + cm_no;
		}else {
			System.out.println("방만들기 실패");
			return "<script> alert('방만들기에 실패하였습니다..'); history.back(); </script>";
		}
		
	}
	@RequestMapping("openchatview.do")
	public ModelAndView openchatView(ModelAndView mv,HttpSession session, int cm_no) {
		
		System.out.println("잘넘어왔습니까?" + cm_no);
		
		
		Member loginUser = (Member) session.getAttribute("loginUser");
			//추가할것.. 방인원..
		openChat openchat = cService.selectopenchatroomdetail(cm_no);
		System.out.println("openchat : " + openchat);
		ArrayList<openChat> chatlist = cService.selectchatlist(cm_no);
		
		System.out.println("chatlist : " + chatlist);
		
		
		session.setAttribute("cm_no", cm_no);
		
		mv.addObject("chatlist", chatlist).addObject("cm_no", cm_no).addObject("openchat", openchat).setViewName("chat/openChatroom");
		
		
		return mv;
		
		
	}
	
	@RequestMapping("passwordcheck.do")
	public void passwordcheck(HttpServletResponse response,String result,String cm_no) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		System.out.println("입력받은  password:" + result);
		System.out.println("방번호 cm_no : " + cm_no);
		HashMap<String,Object> check = new HashMap<String, Object>();
		check.put("cm_no", cm_no);
		check.put("pwd", result);
		
		openChat opcheck = cService.passwordcheck(check);
		System.out.println("opcheck : " + opcheck);
		String str = "";
		if(opcheck == null) {
			str="비밀번호가 일치하지 않습니다.";
		}else if (opcheck != null){
			str="비밀번호가 일치합니다.";
		}
		
		
		
		  PrintWriter out = response.getWriter();
		 
		  out.print(str);
		  out.flush();
		  out.close();
		
		
	
	}
	
	
}
