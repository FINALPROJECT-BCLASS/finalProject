package com.kh.finalProject.manager.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonIOException;
import com.kh.finalProject.group.common.PageInfo;
import com.kh.finalProject.group.common.Pagination;
import com.kh.finalProject.group.model.vo.GroupInfo;
import com.kh.finalProject.group.model.vo.GroupNotice;
import com.kh.finalProject.manager.model.exception.ManagerException;
import com.kh.finalProject.manager.model.service.ManagerService;
import com.kh.finalProject.manager.model.vo.MPageInfo;
import com.kh.finalProject.manager.model.vo.MPagination;
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
		System.out.println(id);
		
		int listCount = mgService.getMemberCount(searchID);
		
		MPageInfo mpi = MPagination.getPageInfo(currentPage, listCount, searchID);
		
		ArrayList<Member> mlist = mgService.selectMList(mpi);
		
		JSONArray jArr = new JSONArray();
		
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
	
//	public void noticeMain2(HttpServletResponse response, HttpSession session,
//			@RequestParam(value = "page", required = false) String page) throws JsonIOException, IOException {
//
//		Member loginUser = (Member) session.getAttribute("loginUser");
//		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
//
//		int currentPage = 1;
//		if (page != null) {
//			int Cpage = Integer.parseInt(page);
//			currentPage = Cpage;
//		}
//
//		int listCount = gService.getListCount(gInfo);
//
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//
//		pi.setLoginUserId(gInfo.getLoginUserId());
//		pi.setGroupNo(gInfo.getGroupNo());
//		pi.setGmNo(gInfo.getGmNo());
//
//		ArrayList<GroupNotice> noticeList = gService.selectNoticeList(pi);
//
//		response.setContentType("application/json;charset=utf-8");
//
//		JSONArray jArr = new JSONArray();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//
//		if (noticeList != null) {
//			for (GroupNotice n : noticeList) {
//				JSONObject jObj = new JSONObject();
//				n.setPage(currentPage);
//
//				jObj.put("page", n.getPage());
//
//				jObj.put("gnNo", n.getGnNo());
//				jObj.put("gmNo", n.getGmNo());
//				jObj.put("gNo", n.getgNo());
//				jObj.put("gnTitle", n.getGnTitle());
//				jObj.put("gnCon", n.getGnCon());
//				jObj.put("gnDate", n.getGnDate());
//				jObj.put("gnDelete", n.getGnDelete());
//				jObj.put("gnCount", n.getGnCount());
//				jObj.put("name", n.getName());
//				jObj.put("renameFile", n.getRenameFile());
//
//				jArr.add(jObj);
//			}
//
//			JSONObject sendJson = new JSONObject();
//			sendJson.put("noticeList", jArr);
//
//			PrintWriter out = response.getWriter();
//			out.print(sendJson);
//			out.flush();
//			out.close();
//
//		} else {
//			System.out.println("공지 ajax 로드 실패");
//		}
//
//	}

}
