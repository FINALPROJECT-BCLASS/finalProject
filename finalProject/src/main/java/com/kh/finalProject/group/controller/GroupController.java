package com.kh.finalProject.group.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.group.model.service.GroupService;
import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupTable;
import com.kh.finalProject.group.model.vo.Member;

@Controller
public class GroupController {
	
	@Autowired
	GroupService gService;
	
	// 그룹 메인
	@RequestMapping("groupMain.do")
	public ModelAndView groupMain(ModelAndView mv) {
		ArrayList<GroupTable> list = gService.selectGroup();
		System.out.println("groupMain list : " + list);
		
		ArrayList<GroupMember> memberList = gService.selectGroupMember();
		System.out.println("groupMain memberList : " + memberList);
		
		
		mv.addObject("list" , list);
		mv.addObject("memberList", memberList); 
		mv.setViewName("group/GGroupMain");
		
		
		return mv;
	}
	
	// 그룹생성 View
	@RequestMapping("groupInsertView.do")
	public String groupWrite(Model model) {
		return "group/GGroupInsert";
	}
	
	// 그룹생성
	@RequestMapping("searchName.do")
	public void searchNameList(HttpServletResponse response, String searchName) {
		System.out.println("searchName : " + searchName);
		ArrayList<Member> list = gService.searchNameList(searchName);
		
		System.out.println("searchName list : " + list);
		response.setContentType("application/json;charset=utf-8");
		
	}
	
	
	
	// 게시판 메인
	@RequestMapping("boardMain.do")
	public String boardMain(Model model) {
		return "group/GBoardMain";
	}

	// 공지 메인
	@RequestMapping("noticeMain.do")
	public String noticeMain(Model model) {
		return "group/GNoticeMain";
	}
}
