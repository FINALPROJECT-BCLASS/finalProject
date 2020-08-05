package com.kh.finalProject.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.manager.model.exception.ManagerException;
import com.kh.finalProject.manager.model.service.ManagerService;
import com.kh.finalProject.manager.model.vo.MPageInfo;
import com.kh.finalProject.manager.model.vo.MPagination;
import com.kh.finalProject.manager.model.vo.Report;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService mgService;
	
	@RequestMapping("managerview.do") 
	public String manageReportView() {
		
		return "manager/manageReport";
	}
	
	@RequestMapping("memberlist.do")
	public ModelAndView memberList(HttpServletResponse response, ModelAndView mv,
						@RequestParam(value="page", required=false) String page,
						@RequestParam(value="id", required=false) String id) throws ManagerException {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		String searchID = "";
		if(id != null) {
			searchID = id;
		}
		
		int listCount = mgService.getMemberCount(searchID);
		
		MPageInfo mpi = MPagination.getPageInfo(currentPage, listCount, searchID);
		
		ArrayList<Member> mlist = mgService.selectMList(mpi);
		
		if(mlist != null) {
			mv.addObject("mlist", mlist);
			mv.addObject("mpi", mpi);
			mv.addObject("searchID", id);
			mv.setViewName("manager/manageMember");
		} else {
			throw new ManagerException("멤버 전체 조회 실패");
		}
		
		return mv;
		
	}
	
	@RequestMapping("reportlist.do")
	public ModelAndView reportList(HttpServletResponse response, ModelAndView mv,
						@RequestParam(value="page", required=false) String page,
						@RequestParam(value="id", required=false) String id) throws ManagerException {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		String searchID = "";
		if(id != null) {
			searchID = id;
		}
		
		int listCount = mgService.getReportCount(searchID);
		
		MPageInfo mpi = MPagination.getPageInfo(currentPage, listCount, searchID);
		
		ArrayList<Report> rlist = mgService.selectRList(mpi);
		
		if(rlist != null) {
			mv.addObject("rlist", rlist);
			mv.addObject("mpi", mpi);
			mv.addObject("searchID", id);
			mv.setViewName("manager/manageReport");
		} else {
			throw new ManagerException("신고 전체 조회 실패");
		}
		
		return mv;
		
	}

}
