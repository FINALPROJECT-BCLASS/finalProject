package com.kh.finalProject.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.manager.model.exception.ManagerException;
import com.kh.finalProject.manager.model.service.ManagerService;
import com.kh.finalProject.manager.model.vo.MPageInfo;
import com.kh.finalProject.manager.model.vo.MPagination;
import com.kh.finalProject.manager.model.vo.RPageInfo;
import com.kh.finalProject.manager.model.vo.RPagination;
import com.kh.finalProject.manager.model.vo.Report;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService mgService;
	
	@Autowired
	Report r;
	
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
						@RequestParam(value="id", required=false) String id,
						@RequestParam(value="rprNo", required=false) String rprNo) throws ManagerException {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		String searchID = "";
		if(id != null) {
			searchID = id;
		}
		
		int selectRprNo = 0;
		if(rprNo != null) {
			selectRprNo = Integer.parseInt(rprNo);
		}
		
		int listCount = mgService.getReportCount(searchID);
		
		RPageInfo rpi = RPagination.getPageInfo(currentPage, listCount, searchID, selectRprNo);
		
		ArrayList<Report> rlist = mgService.selectRList(rpi);
		
		if(rlist != null) {
			mv.addObject("rlist", rlist);
			mv.addObject("rpi", rpi);
			mv.addObject("searchID", id);
			mv.addObject("selectRprNo", rprNo);
			mv.setViewName("manager/manageReport");
		} else {
			throw new ManagerException("신고 전체 조회 실패");
		}
		
		return mv;
		
	}
	
	@RequestMapping("updatereport.do")
	public String reportUpdate(@RequestParam("rpNo") int rpNo,
							@RequestParam("rprNo") int rprNo,
							@RequestParam("rpId") String rpId) throws ManagerException {
		
		r.setRpNo(rpNo);
		r.setRprNo(rprNo);
		
		int result1 = 0;
		result1 = mgService.updateReport(r);
		
		int result2 = 0;
		int result3 = 0;
		if(result1 > 0) {
			if(rprNo == 2 || rprNo ==3) {
				result2 = mgService.updateRpCount(rpId);
				
				if(rprNo == 3) {
					result3 = mgService.updateChatYn(rpId);
				}
			}
		}
		
		if(result1 > 0) {
			return "redirect:reportlist.do";
		} else {
			throw new ManagerException("신고 수정 실패");
		}
	}

}
