package com.kh.finalProject.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.manager.model.service.ManagerService;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService mgService;
	
	@RequestMapping("managemview.do")
	public String manageMemberView() {
		
		return "manager/manageMember";
	}
	
	@RequestMapping("managerview.do") 
	public String manageReportView() {
		
		return "manager/manageReport";
	}

}
