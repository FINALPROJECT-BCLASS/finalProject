package com.kh.finalProject.group.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupController {

	// notice main
	@RequestMapping("group.do")
	public String memberJoin(Model model) {
		return "group/GNoticeMain";
	}
}
