package com.kh.finalProject.group.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.finalProject.group.model.service.GroupService;
import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupTable;
import com.kh.finalProject.member.model.vo.Member;


@Controller
public class GroupController {
	
	@Autowired
	GroupService gService;
	
	@Autowired
	GroupMember gm;
	
	// 그룹 메인
	@RequestMapping(value="groupMain.do", method=RequestMethod.GET)
	public ModelAndView groupMain(ModelAndView mv, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");		
		
//		System.out.println("groupMain loginUser : " + loginUser);
		
		if(loginUser != null) {
			String loginUserId = loginUser.getId();
			ArrayList<GroupTable> list = gService.selectGroup(loginUserId);
//			System.out.println("groupMain list : " + list);
			
//			ArrayList<GroupMember> memberList = gService.selectGroupMember();
//			System.out.println("groupMain memberList : " + memberList);
			
			mv.addObject("list" , list);
//			mv.addObject("memberList", memberList); 
			mv.setViewName("group/GGroupMain");
		}else {
			mv.setViewName("group/GGroupMain");
		}
				
		
		
		
		return mv;
	}
	
	// 그룹생성 View
	@RequestMapping(value="groupInsertView.do", method=RequestMethod.GET)
	public String groupWrite(Model model) {
		return "group/GGroupInsert";
	}
	
	// 그룹생성 이름검색
	@RequestMapping(value="searchName.do", method=RequestMethod.GET)
	public void searchNameList(HttpServletResponse response, String searchName) throws JsonIOException, IOException {
//		System.out.println("searchName : " + searchName);
		ArrayList<Member> list = gService.searchNameList(searchName);
		
//		System.out.println("searchName list : " + list);
		response.setContentType("application/json;charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	// 그룹생성
	@RequestMapping(value="groupInsert.do", method=RequestMethod.POST)
	public String groupInsert(Model model, GroupTable gt , @RequestParam(value="groupName", required=false) String groupName,
								@RequestParam(value="groupProfil", required=false) String groupProfil,
								@RequestParam(value="groupId", required=false) String groupId) {
		
		
		
		System.out.println("그룹 생성  groupName: " + groupName);
		System.out.println("그룹 생성  groupProfil: " + groupProfil);
		System.out.println("그룹 생성 groupId : " + groupId);

		gt.setgName(groupName);
		gt.setgOrigin(groupProfil);
		gt.setgDelete("N");
		
//		System.out.println("그룹 생성  gt: " + gt);
		
		
		int result = gService.groupInsert(gt);
//		System.out.println("그룹생성 result : " + result);
		if(result > 0) {
			if(groupId != null) {
				String[] groupIds = groupId.split(",");
				ArrayList memberList = new ArrayList<>();

				for(String id : groupIds) {
					System.out.println("그룹 생성  id: " + id);
					memberList.add(id);
				}
				System.out.println("그룹생성 memberList : " + memberList);
				int memberResult = gService.groupMemberInsert(memberList);
			}
			return "redirect:groupMain.do";			
		}else { 
			return "redirect:groupMain.do";
		}
	}
	
	
	// 게시판 메인
	@RequestMapping(value="boardMain.do", method=RequestMethod.GET)
	public String boardMain(Model model) {
		return "group/GBoardMain";
	}

	// 공지 메인
	@RequestMapping(value="noticeMain.do", method=RequestMethod.GET)
	public String noticeMain(Model model) {
		return "group/GNoticeMain";
	}
}
