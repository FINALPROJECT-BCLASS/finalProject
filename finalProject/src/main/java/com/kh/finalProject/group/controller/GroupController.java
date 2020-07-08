package com.kh.finalProject.group.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupController {

	// board main
		@RequestMapping("board.do")
		public String boardMain(Model model) {
			return "group/GNoticeMain";
		}
	
	// notice main
	@RequestMapping("group.do")
	public String noticeMain(Model model) {
		return "group/GNoticeMain";
	}
}
