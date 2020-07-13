package com.kh.finalProject.group.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.group.model.service.GroupService;
import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupTable;

@Controller
public class GroupController {
	
	@Autowired
	GroupService gService;
	
	// group main
	@RequestMapping("groupMain.do")
	public String groupMain(Model model) {
		ArrayList<GroupTable> list = gService.selectGroup();
		System.out.println("groupMain list : " + list);
		
		ArrayList<GroupMember> memberList = gService.selectGroupMember();
		System.out.println("groupMain memberList : " + memberList);
		
		return "group/GGroupMain";
	}
	
	// group write
	@RequestMapping("groupWrite.do")
	public String groupWrite(Model model) {
		return "group/GGroupMain";
	}
	
	// board main
	@RequestMapping("boardMain.do")
	public String boardMain(Model model) {
		return "group/GBoardMain";
	}

	// notice main
	@RequestMapping("noticeMain.do")
	public String noticeMain(Model model) {
		return "group/GNoticeMain";
	}
}
