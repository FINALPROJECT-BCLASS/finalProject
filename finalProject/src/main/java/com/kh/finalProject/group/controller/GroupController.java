package com.kh.finalProject.group.controller;
 
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.finalProject.group.common.BoardPagination;
import com.kh.finalProject.group.common.PageInfo;
import com.kh.finalProject.group.common.Pagination;
import com.kh.finalProject.group.model.service.GroupService;
import com.kh.finalProject.group.model.vo.GroupAccount;
import com.kh.finalProject.group.model.vo.GroupAccountMember;
import com.kh.finalProject.group.model.vo.GroupBoard;
import com.kh.finalProject.group.model.vo.GroupBoardPhoto;
import com.kh.finalProject.group.model.vo.GroupInfo;
import com.kh.finalProject.group.model.vo.GroupLike;
import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupMemberList;
import com.kh.finalProject.group.model.vo.GroupNotice;
import com.kh.finalProject.group.model.vo.GroupPlan;
import com.kh.finalProject.group.model.vo.GroupReReply;
import com.kh.finalProject.group.model.vo.GroupReply;
import com.kh.finalProject.group.model.vo.GroupSearchName;
import com.kh.finalProject.group.model.vo.GroupTable;
import com.kh.finalProject.group.model.vo.GroupVote;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class GroupController {

	@Autowired 
	GroupService gService;

	@Autowired
	GroupMember gm;

	@Autowired
	GroupMemberList gmList;

	@Autowired
	GroupInfo gInfo;

	@Autowired
	GroupSearchName gSearch;

	@Autowired
	PageInfo pi;

	@Autowired
	GroupLike gl;
	

	// 그룹 번호 세션 삭제
	@RequestMapping(value = "groupSessionDelete.do", method = RequestMethod.GET)
	public String groupSessionDelete(Model model, HttpSession session) {
		session.removeAttribute("gInfo");

		return "redirect:groupMain.do";
	}

	// 그룹 메인
	@RequestMapping(value = "groupMain.do", method = RequestMethod.GET)
	public ModelAndView groupMain(ModelAndView mv, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser != null) {
			String loginUserId = loginUser.getId();
			ArrayList<GroupTable> list = gService.selectGroup(loginUserId);

			mv.addObject("list", list);
			mv.setViewName("group/GGroupMain");
		} else {
//			mv.setViewName("<script> alert('로그인을 해주세요.'); history.back(); </script>");
			mv.setViewName("group/GGroupMain");
		}

		return mv;
	}

	// 그룹생성 View
	@RequestMapping(value = "groupInsertView.do", method = RequestMethod.GET)
	public ModelAndView groupWrite(ModelAndView mv, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		
		mv.addObject("m", m);
		mv.setViewName("group/GGroupInsert");
		return mv;
	}

	// 그룹생성 이름검색
	@RequestMapping(value = "searchName.do", method = RequestMethod.GET)
	public void searchNameList(HttpSession session, HttpServletResponse response, String searchName)
			throws JsonIOException, IOException {
		Member loginUser = (Member) session.getAttribute("loginUser");
		gSearch.setLoginUserId(loginUser.getId());
		gSearch.setSearchName(searchName);

		ArrayList<Member> list = gService.searchNameList(gSearch);

		System.out.println("그룹생성 검색 : " + list);

		response.setContentType("application/json;charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
		gson.toJson(list, response.getWriter());

	}
	
	// 그룹생성 전체 이름검색
	@RequestMapping(value = "searchTotalName.do", method = RequestMethod.GET)
	public void searchTotalName(HttpSession session, HttpServletResponse response, String searchName)
			throws JsonIOException, IOException {
		Member loginUser = (Member) session.getAttribute("loginUser");
		gSearch.setLoginUserId(loginUser.getId());
		gSearch.setSearchName(searchName);

		ArrayList<Member> list = gService.searchTotalName(gSearch);

		System.out.println("그룹 전체 검색 : " + list);

		response.setContentType("application/json;charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
		gson.toJson(list, response.getWriter());

	}

	// 그룹생성
	@RequestMapping(value = "groupInsert.do", method = RequestMethod.POST)
	public String groupInsert(Model model, HttpSession session, HttpServletRequest request, GroupTable gt,
			@RequestParam(value = "groupName", required = false) String groupName,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file,
			@RequestParam(value = "groupId", required = false) String groupId) {

		Member m = (Member) session.getAttribute("loginUser");
		System.out.println("그룹 생성 loginId : " + m.getId());
		System.out.println("그룹 생성  groupName: " + groupName);
		System.out.println("그룹 생성 groupId : " + groupId);
		System.out.println("그룹 생성 file: " + file);

//		gt.setgName(groupName);

		gt.setgDelete("N");
		gt.setId(m.getId());

		System.out.println("그룹생성 gt : " + gt);

		// 사진 파일 저장
		if (!file.getOriginalFilename().contentEquals("")) { // 빈파일이 아니라면
			String savePath = SaveFile(file, request);
			if (savePath != null) { // 파일이 잘 저장된 경우
				gt.setgOrigin(file.getOriginalFilename());
			}
		}

		// GROUP_TABLE INSERT
		int result = gService.groupInsert(gt);

		if (result > 0) { // 그룹 테이블 insert 성공시 그룹멤버 테이블 insert

			int groupNo = gService.groupNoSelect();

			if (groupId != null) {
				System.out.println("그룹아이디 : " + groupId);
				String[] groupIds = groupId.split(",");
				
				ArrayList<GroupMemberList> memberList = new ArrayList<>();

				for (int i = 0; i < groupIds.length; i++) {
					gmList = new GroupMemberList();
//					System.out.println("그룹 생성 id : " + System.identityHashCode(groupIds[i]));

					gmList.setGroupMemberId(groupIds[i]);
					gmList.setGroupNo(groupNo);

					memberList.add(gmList);
					System.out.println("gmList : " + gmList);
				}

				System.out.println("그룹 생성 memberList : " + memberList);
				
				// GROUP_MEMBER INSERT
				int memberResult = gService.groupMemberInsert(memberList);

			}
			return "redirect:groupMain.do";
		} else {
			return "redirect:groupMain.do";
		}
	}

	// 사진 파일 저장
	public String SaveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\groupMainFiles";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		String filePath = folder + "\\" + file.getOriginalFilename();

		try {
			file.transferTo(new File(filePath));

		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		return filePath;
	}
	
	// 그룹 삭제
	@RequestMapping(value = "deleteGroup.do", method = RequestMethod.GET)
	public ModelAndView deleteGroup(ModelAndView mv, HttpSession session,
			@RequestParam(value="groupNo", required = false ) String groupNo) {
		GroupInfo gInfo = (GroupInfo)session.getAttribute("gInfo");
		System.out.println("groupNo : " + groupNo);

		int result = gService.deleteGroup(groupNo);
		System.out.println("그룹삭제 result : " + result);
		mv.setViewName("redirect:groupSessionDelete.do");
		return mv;
	}
	
	
	// 그룹 사진 삭제
	public void deleteGroupFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
	
		String savePath = root + "\\groupMainFiles";
	
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	// 그룹 수정
		@RequestMapping(value = "groupUpdate.do", method = RequestMethod.POST)
		public String groupUpdate(Model model, HttpSession session, HttpServletRequest request, GroupTable gt,
				
				@RequestParam(name = "uploadFile", required = false) MultipartFile file,
				@RequestParam(value = "groupId", required = false) String groupId,
				@RequestParam(value = "groupName", required = false) String groupName,
				@RequestParam(value = "member", required = false) String member,
				@RequestParam(value = "gmNo", required = false) String gmNo,
				@RequestParam(value = "beforeImg", required = false) String beforeImg,
				@RequestParam(value = "originImg", required = false) String originImg) {
			System.out.println("수정 gm:" + gm);
			Member m = (Member) session.getAttribute("loginUser");
			System.out.println("그룹 수정 loginId : " + m.getId());
			System.out.println("그룹 수정  groupName: " + groupName);
			System.out.println("그룹 수정 groupId : " + groupId);
			System.out.println("그룹 수정 file: " + file);

//			gt.setgName(groupName);

			gt.setgDelete("N");
			gt.setId(m.getId());

			
			System.out.println("originImg : " + originImg);
			System.out.println("beforeImg : " + beforeImg);
			// 사진 삭제
			
			if(originImg == null) {
				String savePath = SaveFile(file, request);
				if (savePath != null) { // 파일이 잘 저장된 경우
					gt.setgOrigin(file.getOriginalFilename());
				}
			}else if(originImg.equals("Y")) {
				deleteGroupFile(beforeImg, request);
				
				// 사진 파일 저장
				if (!file.getOriginalFilename().contentEquals("")) { // 빈파일이 아니라면
					String savePath = SaveFile(file, request);
					if (savePath != null) { // 파일이 잘 저장된 경우
						gt.setgOrigin(file.getOriginalFilename());
					}
				}
			}else {
				System.out.println("기존 사진이 없습니다.");
				gt.setgOrigin(beforeImg);
			}
			
			
			System.out.println("그룹 수정 gt : " + gt);
			// GROUP_TABLE UPDATE
			int result = gService.groupUpdate(gt);
			
			System.out.println("그룹 테이블 수정 : " + result);
			
			if (result > 0) { // 그룹 테이블 insert 성공시 그룹멤버 테이블 insert

				int groupNo = gt.getgNo();
//				int deleteMember = gService.deleteMemberList(groupNo);
//				System.out.println("그룹 삭제 : " + deleteMember);
				
				
				System.out.println("그룹 수정 groupId : " + groupId);
				System.out.println("그룹 수정 groupName : " + groupName);
				System.out.println("그룹 수정 member : " + member);
				System.out.println("그룹 수정 gmNo : " + gmNo);
				if (groupId != null && groupName != null && member != null ) {
					
					
					String[] groupIds = groupId.split(",");
					String[] groupNames = groupName.split(",");
					String[] members = member.split(",");
					String[] gmNos = gmNo.split(",");
					
					
					ArrayList<GroupMemberList> memberList = new ArrayList<>();
					

					for (int i = 0; i < groupIds.length; i++) {
						gm = new GroupMember();
//						System.out.println("그룹 생성 id : " + System.identityHashCode(groupIds[i]));

						gm.setGmId(groupIds[i]);
						gm.setName(groupNames[i]);
						
						if(members[i].equals("plus")) {
							members[i] = "N";
						}else if(members[i].equals("minus")) {
							members[i] = "Y";
						}
						gm.setGmDelete(members[i]);
						gm.setgNo(String.valueOf(groupNo));
						if(!gmNos[i].equals("x")) {
							
							gm.setGmNO(Integer.valueOf(gmNos[i]));
							System.out.println("gm : " + gm);
						}else {
							System.out.println("새로 인서트 해야함");
							System.out.println("인서트 해야하는 gm : " + gm);
							int newresult = gService.insertNewMember(gm);
							System.out.println("newresult : " + newresult);
						}

						int updateResult = gService.updateMember(gm);
						System.out.println("updateResult : " + updateResult);
					}
				}
				return "group/GCalendarMain";
			} else {
				return "redirect:groupMain.do";
			}
		}
	
		// 그룹 수정
		@RequestMapping(value = "voteSettings.do", method = RequestMethod.GET)
		public ModelAndView voteSettings(ModelAndView mv, HttpSession session) {
			GroupInfo gInfo = (GroupInfo)session.getAttribute("gInfo");

			// 원래는 selectOne이었음
			GroupTable gt = gService.selectOneGroup(gInfo);
			System.out.println("수정가지전 gt : " + gt);
			
			ArrayList<GroupMember> memberList = gService.selectGroupMemberList(gInfo);
			
			System.out.println("수정가기전 memberList :" + memberList);
			mv.addObject("gInfo", gInfo);
			mv.addObject("memberList", memberList);
			mv.addObject("groupTable", gt);
			mv.setViewName("group/GGroupUpdate");
			return mv;
		}
		
	// ---------------------------------- 그룹 메인 & 생성 end// -------------------------------------------

	// ---------------------------------- 캘린더// ------------------------------------------------------
	// 세션 생성 (그룹번호 세션생성)
	@RequestMapping(value = "sessionCreate.do", method = RequestMethod.GET)
	public ModelAndView sessionCreate(ModelAndView mv, HttpSession session, Member m, @RequestParam("groupNo") int groupNo) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String id = loginUser.getId();
		System.out.println("gInfo : " + groupNo);
		gInfo.setLoginUserId(id);
		gInfo.setGroupNo(groupNo);
		
		int memberNo = gService.memberNoSelect(gInfo);
		gInfo.setGmNo(memberNo);
		 
		session.setAttribute("gInfo", gInfo);
		GroupTable gt = gService.selectOneGroup(gInfo);

		System.out.println("세션 생성 loginUser: " + loginUser);
		System.out.println("세션 생성 gInfo: " + gInfo);
		
		mv.addObject("gInfo", gInfo);
		mv.addObject("groupTable", gt);

		mv.setViewName("redirect:groupCalendarMain.do");
		return mv;

	}
	
	// 캘린더 메인 
		@RequestMapping(value = "groupCalendarMain.do", method = RequestMethod.GET)
		public ModelAndView CalendarMain(ModelAndView mv, HttpSession session, Member m) {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			GroupNotice noticeList = gService.selectNoticeOne(gInfo);
			System.out.println("메인 gInfo :  " + gInfo);
			mv.addObject("noticeList", noticeList);
			mv.addObject("gInfo", gInfo);
			mv.addObject("groupTable", gt);

			mv.setViewName("group/GCalendarMain");
			return mv;

		}
		
	// 캘린더 작성
	@RequestMapping(value = "insertPlan.do", method = RequestMethod.POST)
	public ModelAndView insertPlan(ModelAndView mv, HttpSession session, GroupPlan gp,
			 @RequestParam(value="coordY", required = false ) String coordY,
			 @RequestParam(value="coordX", required = false ) String coordX){
		Member loginUser = (Member) session.getAttribute("loginUser");
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		
		
		System.out.println("coordY : " + coordY );
		System.out.println("coordX : " + coordX );
		
		System.out.println("gp : " + gp);
		gp.setGpCoordY(coordY);
		gp.setGpCoordX(coordX);
		int result = gService.planInsert(gp);
		System.out.println("캘린더 result : " + result);
		mv.setViewName("redirect:groupCalendarMain.do");
		return mv;
	}
	
	// 캘린더 목록
	@RequestMapping("selectPlan.do")
	public void selectPlan(HttpSession session, HttpServletResponse response) throws IOException {
		Member loginUser = (Member) session.getAttribute("loginUser");
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		response.setContentType("application/json;charset=utf-8");
		
		ArrayList<GroupPlan> planList = gService.selectPlanList(gInfo);
		System.out.println("캘린더 : " + planList);
		JSONArray jArr = new JSONArray();
		
		for(GroupPlan p : planList) {
			JSONObject jObj = new JSONObject();
			jObj.put("gpNo", p.getGpNo());
			jObj.put("gNo", p.getgNo());
			jObj.put("gmNo", p.getGmNo());
			jObj.put("gpTitle", p.getGpTitle());
			jObj.put("gpCon", p.getGpCon());
			jObj.put("gpStart", p.getGpStart());
			jObj.put("gpEnd", p.getGpEnd());
			jObj.put("address1", p.getAddress1());
			jObj.put("address2", p.getAddress2());
			jObj.put("color", p.getColor());
			jObj.put("gpDelete", p.getGpDelete());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("planList", jArr);
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	// 캘린더 상세
	@RequestMapping("detailPlan.do")
	public void detailPlan(HttpSession session, HttpServletResponse response, GroupPlan gp) throws IOException {
		Member loginUser = (Member) session.getAttribute("loginUser");
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		response.setContentType("application/json;charset=utf-8");
		System.out.println("상세 gp : " + gp);
		
		GroupPlan p = gService.detailPlan(gp);
		System.out.println("캘린더 상세: " + p);
	
		JSONObject jObj = new JSONObject();
		jObj.put("gpNo", p.getGpNo());
		jObj.put("gNo", p.getgNo());
		jObj.put("gmNo", p.getGmNo());
		jObj.put("gpTitle", p.getGpTitle());
		jObj.put("gpCon", p.getGpCon());
		jObj.put("gpStart", p.getGpStart());
		jObj.put("gpEnd", p.getGpEnd());
		jObj.put("address1", p.getAddress1());
		jObj.put("address2", p.getAddress2());
		jObj.put("color", p.getColor());
		jObj.put("gpDelete", p.getGpDelete());
		
		jObj.put("name", p.getName());
		
		PrintWriter out = response.getWriter();
		out.print(jObj);
		out.flush();
		out.close();
	}

	
	// 캘린더 수정
	@RequestMapping(value = "updatePlan.do", method = RequestMethod.POST)
	public ModelAndView updatePlan(ModelAndView mv, HttpSession session, GroupPlan gp) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");

		int result = gService.planUpdate(gp);

		mv.setViewName("redirect:groupCalendarMain.do");
		return mv;
	}
	
	// 캘린더 삭제
	@RequestMapping(value = "deletePlan.do", method = RequestMethod.GET)
	public ModelAndView deletePlan(ModelAndView mv, HttpSession session, GroupPlan gp) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
	
		System.out.println("삭제 gp : " + gp);
		int result = gService.planDelete(gp);
		System.out.println("캘린더 삭제 : " + result);
		mv.setViewName("redirect:groupCalendarMain.do");
		return mv;
	}

	// ---------------------------------- 공지// ------------------------------------------------------
	// 공지 메인
	@RequestMapping(value = "noticeMain.do", method = RequestMethod.GET)
	public ModelAndView noticeMain(HttpServletResponse response, ModelAndView mv, HttpSession session,
			@RequestParam(value = "page", required = false) String page) throws JsonIOException, IOException {

		Member loginUser = (Member) session.getAttribute("loginUser");
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		GroupTable gt = gService.selectOneGroup(gInfo);
		int currentPage = 1;
		if (page != null) {
			int Cpage = Integer.parseInt(page);
			currentPage = Cpage;
		}

		int listCount = gService.getListCount(gInfo);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		pi.setLoginUserId(gInfo.getLoginUserId());
		pi.setGroupNo(gInfo.getGroupNo());
		pi.setGmNo(gInfo.getGmNo());

		ArrayList<GroupNotice> noticeList = gService.selectNoticeList(pi);

		if (noticeList != null) {

			mv.addObject("noticeList", noticeList);
			mv.addObject("pi", pi);
			mv.addObject("groupTable", gt);
			mv.addObject("gInfo", gInfo);
			mv.setViewName("group/GNoticeMain");

		} else {
			mv.setViewName("group/GNoticeMain");
//			mv.setViewName("<script> alert('공지사항 등록이 실패하였습니다.'); history.back(); </script>");
		}

		return mv;
	}

	// 공지 메인 ajax
	@RequestMapping(value = "noticeMain2.do", method = RequestMethod.GET)
	public void noticeMain2(HttpServletResponse response, HttpSession session,
			@RequestParam(value = "page", required = false) String page) throws JsonIOException, IOException {

		Member loginUser = (Member) session.getAttribute("loginUser");
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");

		int currentPage = 1;
		if (page != null) {
			int Cpage = Integer.parseInt(page);
			currentPage = Cpage;
		}

		int listCount = gService.getListCount(gInfo);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		pi.setLoginUserId(gInfo.getLoginUserId());
		pi.setGroupNo(gInfo.getGroupNo());
		pi.setGmNo(gInfo.getGmNo());

		ArrayList<GroupNotice> noticeList = gService.selectNoticeList(pi);

		response.setContentType("application/json;charset=utf-8");

		JSONArray jArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		if (noticeList != null) {
			for (GroupNotice n : noticeList) {
				JSONObject jObj = new JSONObject();
				n.setPage(currentPage);

				jObj.put("page", n.getPage());

				jObj.put("gnNo", n.getGnNo());
				jObj.put("gmNo", n.getGmNo());
				jObj.put("gNo", n.getgNo());
				jObj.put("gnTitle", n.getGnTitle());
				jObj.put("gnCon", n.getGnCon());
				jObj.put("gnDate", n.getGnDate());
				jObj.put("gnDelete", n.getGnDelete());
				jObj.put("gnCount", n.getGnCount());
				jObj.put("name", n.getName());
				jObj.put("renameFile", n.getRenameFile());

				jArr.add(jObj);
			}

			JSONObject sendJson = new JSONObject();
			sendJson.put("noticeList", jArr);

			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();

		} else {
			System.out.println("공지 ajax 로드 실패");

			/* mv.setViewName("group/GNoticeMain"); */
//				mv.setViewName("<script> alert('공지사항 등록이 실패하였습니다.'); history.back(); </script>");
		}

		/* return mv; */
	}

	// 공지 작성
	@RequestMapping(value = "gNoticeWrite.do", method = RequestMethod.POST)
	public String gNoticeWrite(Model model, HttpSession session, GroupNotice gn) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		System.out.println("공지작성 loginUser : " + loginUser);
		System.out.println("공지작성 gInfo : " + gInfo);

		gn.setgNo(gInfo.getGroupNo());
		gn.setGmNo(gInfo.getGmNo());

		int result = gService.noticeInsert(gn);

		return "redirect:noticeMain.do";
	}

	// 공지 수정
	@RequestMapping(value = "gNoticeUpdate.do", method = RequestMethod.POST)
	public String gNoticeUpdate(Model model, HttpSession session, GroupNotice gn,
			@RequestParam("gnNoName") String gnNo) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		System.out.println("gnNo" + gnNo);
		gn.setGnNo(gnNo);
		gn.setgNo(gInfo.getGroupNo());
		gn.setGmNo(gInfo.getGroupNo());

		System.out.println("gn : " + gn);
		int result = gService.noticeUpdate(gn);

		System.out.println("공지 작성 result : " + result);
		return "redirect:noticeMain.do";
	}

	// 공지 삭제
	@RequestMapping(value = "deleteNotice.do", method = RequestMethod.GET)
	public String deleteNotice( HttpServletResponse response, @RequestParam(value = "gnNo") String gnNo) {
		
		int result = gService.deleteNotice(gnNo);
		System.out.println("게시글 삭제  : " + result);

		return "redirect:noticeMain.do";
	}
	// ---------------------------------- 공지 end ------------------------------------------------------

	// ---------------------------------- 게시판 ------------------------------------------------------

	// 게시판 메인
	@RequestMapping(value = "boardMain.do", method = RequestMethod.GET)
	public ModelAndView boardMain(HttpSession session, ModelAndView mv,
			@RequestParam(value = "page", required = false) String page, GroupBoard gb,
			@RequestParam(value = "searchKind", required = false) String searchKind,
			@RequestParam(value = "searchCon", required = false) String searchCon) {
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		GroupNotice noticeList = gService.selectNoticeOne(gInfo);
		GroupTable gt = gService.selectOneGroup(gInfo);
		
		int currentPage = 1;
		if (page != null) {
			int Cpage = Integer.parseInt(page);
			currentPage = Cpage;
		}
		  
		String kind = "";
		if(searchKind != null) {
			kind = searchKind;
			gb.setSearchKind(kind);
			
		}
		
		String content = "";
		if(searchCon != null) {
			content = searchCon;
			gb.setSearchCon(content);
		}
		
		gb.setCurrentGmNo(gInfo.getGmNo());
		gb.setCurrentGroupNo(gInfo.getGroupNo());
		int listCount = gService.boardGetListCount(gb);
		
		System.out.println("listCount : " + listCount);
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, searchCon);
		pi.setSearchCon(content);
		
		mv.addObject("searchCon", content);
		mv.addObject("gInfo", gInfo);
		mv.addObject("groupTable", gt);
		mv.addObject("noticeList", noticeList);
		mv.addObject("pi", pi);
		mv.setViewName("group/GBoardMain");

		return mv;
	}

	// 게시판 메인 ajax
	@RequestMapping(value = "boardMainAjax.do", method = RequestMethod.GET)
	public void boardMainAjax(HttpServletResponse response, HttpSession session,GroupBoard gb,
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "searchKind", required = false) String searchKind,
			@RequestParam(value = "searchCon", required = false) String searchCon) throws IOException {
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		System.out.println("page : " + page);
		
		int currentPage = 1;
		if (page != null) {
			int Cpage = Integer.parseInt(page);
			currentPage = Cpage;
		}
		
		gb.setCurrentGmNo(gInfo.getGmNo());
		gb.setCurrentGroupNo(gInfo.getGroupNo());
		String kind = "";
		if(searchKind != null) {
			kind = searchKind;
			gb.setSearchKind(kind);
			
		}
		
		String content = "";
		if(searchCon != null) {
			content = searchCon;
			gb.setSearchKind(content);
		}
		
		int listCount = gService.boardGetListCount(gb);
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, searchCon);
		
		pi.setLoginUserId(gInfo.getLoginUserId());
		pi.setGroupNo(gInfo.getGroupNo());
		pi.setGmNo(gInfo.getGmNo());
		pi.setSearchCon(content);
		
		System.out.println("pi : " + pi);
		// 게시판 목록
		ArrayList<GroupBoard> boardList = gService.selectBoardList(pi);
		
		// 사진 목록
		ArrayList<GroupBoardPhoto> photoList = gService.selectPhotoList(pi);
		
		// 좋아요 total
		ArrayList<GroupLike> likeList = gService.totalLike();
		
		// 댓글 total
		ArrayList<GroupReply> replyList = gService.totalReply();
		ArrayList<GroupReReply> reReplyList = gService.totalReReply();
		 
		if(!replyList.isEmpty()) {
			for(GroupReply r : replyList) {
				if(!reReplyList.isEmpty()) {
					for(GroupReReply rr : reReplyList) {
						if(r.getGbNo() == rr.getGbNo()) {			
							int replyTotal = Integer.parseInt(r.getTotalReply());
							int reReplyTotal = Integer.parseInt(rr.getTotalReReply());
							String totalReply = Integer.toString(replyTotal + reReplyTotal);
							
							r.setTotalReply(totalReply);
						}						
					}
				}
			}
		}
		
		response.setContentType("application/json;charset=utf-8");
		
		
		JSONArray jArr = new JSONArray();
		JSONArray pArr = new JSONArray();
		JSONArray lArr = new JSONArray();
		JSONArray rArr = new JSONArray();
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if (boardList != null) {
			for (GroupBoard b : boardList) {
				JSONObject jObj = new JSONObject();
				b.setPage(currentPage);

				jObj.put("page", b.getPage());

				jObj.put("gbNo", b.getGbNo());
				jObj.put("gmNo", b.getGmNo());
				jObj.put("gNo", b.getgNo());
				jObj.put("gbTitle", b.getGbTitle());
				jObj.put("gbCon", b.getGbCon());
				jObj.put("gbDate", b.getGbDate());
				jObj.put("gbDelete", b.getGbDelete());
				jObj.put("gbCount", b.getGbCount());
				jObj.put("name", b.getName());
				jObj.put("renameFile", b.getRenameFile());

				jArr.add(jObj);
			}

			if (photoList != null) {
				for (GroupBoardPhoto b : photoList) {
					JSONObject jObj = new JSONObject();

					jObj.put("gbpNo", b.getGbpNo());
					jObj.put("gbNo", b.getGbNo());
					jObj.put("gmNo", b.getGmNo());
					jObj.put("gNo", b.getgNo());
					jObj.put("gbpOrigin", b.getGbpOrigin());
					jObj.put("gbpRename", b.getGbpRename());

					pArr.add(jObj);
				}

				if(replyList != null) {
					for (GroupReply r : replyList) {
						JSONObject jObj = new JSONObject();

						jObj.put("grNo", r.getGrNo());
						jObj.put("gbNo", r.getGbNo());
						jObj.put("gmNo", r.getGmNo());
						jObj.put("grCon", r.getGrCon());
						jObj.put("grDate", r.getGrDate());
						jObj.put("grDelete", r.getGrDelete());
						jObj.put("totalReply", r.getTotalReply());

						rArr.add(jObj);
					}
					

					if (likeList != null) {
						for (GroupLike l : likeList) {
							JSONObject jObj = new JSONObject();

							jObj.put("gbNo", l.getGbNo());
							jObj.put("gmNo", l.getGmNo());
							jObj.put("totalLike", l.getTotalLike());

							lArr.add(jObj);
						}

						JSONObject sendJson = new JSONObject();
						sendJson.put("boardList", jArr);
						sendJson.put("photoList", pArr);
						sendJson.put("likeList", lArr);
						sendJson.put("replyList", rArr);
						
						
						PrintWriter out = response.getWriter();
						out.print(sendJson);
						out.flush();
						out.close();

					} else {
						/* mv.setViewName("group/GBoardMain"); */
//			mv.setViewName("<script> alert('공지사항 등록이 실패하였습니다.'); history.back(); </script>");
					}

				}
			}
		}
		
	}

	// 게시판 상세
	@RequestMapping(value = "detailBoard.do", method = RequestMethod.GET)
	public ModelAndView boardDetail(ModelAndView mv, HttpSession session, @RequestParam("gbNo") String gbNo) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		String gmNo = Integer.toString(gInfo.getGmNo());
		GroupTable gt = gService.selectOneGroup(gInfo);
		GroupNotice noticeList = gService.selectNoticeOne(gInfo);
		
		// 조회수 증가
		int result = gService.plusgbCount(gbNo);

		GroupBoard boardList = gService.selectBoardDetail(gbNo);

		ArrayList<GroupBoardPhoto> photoList = gService.selectDetailPhotoList(gbNo);
		
		
		int totalLike = gService.totalLikeList(gbNo);

		gl.setGbNo(gbNo);
		gl.setGmNo(gmNo);
		GroupLike likeList = gService.selectLikeList(gl);

		ArrayList<GroupReply> replyList = gService.selectReplyList(gbNo);
		ArrayList<GroupReReply> reReplyList = gService.selectReReplyList(gbNo);

		int totalReply = gService.totalReplyList(gbNo);
		int totalReReply = gService.totalReReplyList(gbNo);
		int totalRe = totalReply + totalReReply;
		
		mv.addObject("gInfo", gInfo);
		mv.addObject("groupTable", gt);
		mv.addObject("memberPhoto", loginUser.getRename_file());
		mv.addObject("gInfoGmNo", gmNo);
		mv.addObject("noticeList", noticeList);
		mv.addObject("photoList", photoList);
		mv.addObject("boardList", boardList);
		mv.addObject("totalLike", totalLike);
		mv.addObject("totalReply", totalRe);
		mv.addObject("reReplyList", reReplyList);
		if (likeList != null) {
			mv.addObject("likeList", likeList);
		}
		mv.addObject("replyList", replyList);
		mv.setViewName("group/GBoardDetail");
		return mv;
	}

	// 좋아요 ajax
	@RequestMapping(value = "likeAjax.do", method = RequestMethod.GET)
	public void likeUpdate(HttpServletResponse response, HttpSession session, @RequestParam(value = "gmNo") String gmNo,
			@RequestParam(value = "gbNo") String gbNo, @RequestParam(value = "heart") String heart) throws IOException {
	
		
		gl.setGbNo(gbNo);
		gl.setGmNo(gmNo);
		
		if(heart.equals("favorite")) {
			int insertResult = gService.insertHeart(gl); 
		
		} else if(heart.equals("favorite_border")) {
			int deleteResult = gService.deletetHeart(gl); 
		
		}
		
		int totalLike = gService.totalLikeList(gbNo);
		
		response.setContentType("application/json;charset=utf-8");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		JSONObject sendJson = new JSONObject();
		sendJson.put("totalLike", totalLike);

		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();

	}
	
	// 댓글 ajax
	@RequestMapping(value = "replyAjax.do", method = RequestMethod.GET)
	public void replyinsert(HttpServletResponse response, HttpSession session, GroupReply gr )throws IOException {
		String gbNo = Integer.toString(gr.getGbNo()); 
		System.out.println("댓글 생성 gr : " + gr);
		// 댓글 insert
		int result = gService.replyInsert(gr);
		
		int replyCurrval = gService.replyCurrval();
		
		// 댓글 select
		ArrayList<GroupReply> replyList = gService.selectOneReplyList(replyCurrval);
//		ArrayList<GroupReply> replyList = gService.selectReplyList(gbNo);
		int totalReply = gService.totalReplyList(gbNo);
		
		response.setContentType("application/json;charset=utf-8");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		JSONArray rArr = new JSONArray();
		JSONArray tArr = new JSONArray();
		tArr.add(totalReply);
		
		if (replyList != null) {
			for (GroupReply r : replyList) {
				JSONObject jObj = new JSONObject();

				jObj.put("grNo", r.getGrNo());
				jObj.put("gbNo", r.getGbNo());
				jObj.put("gmNo", r.getGmNo());
				jObj.put("grCon", r.getGrCon());
				jObj.put("grDate", r.getGrDate());
				jObj.put("grDelete", r.getGrDelete());
				jObj.put("totalReply", r.getTotalReply());
				jObj.put("name", r.getName());

				rArr.add(jObj);
			}

			JSONObject sendJson = new JSONObject();

			sendJson.put("replyList", rArr);
			sendJson.put("totalReply", tArr);
			
			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();

		}else {
			System.out.println("댓글 ajax 실패하였습니다.");
		}
	}

	// 대댓글 ajax
	@RequestMapping(value = "reReplyAjax.do", method = RequestMethod.GET)
	public void reReplyinsert(HttpServletResponse response, HttpSession session, GroupReReply grr
							)throws IOException {
		String gbNo = Integer.toString(grr.getGbNo()); 

		// 댓글 insert
		int result = gService.reReplyInsert(grr);
		
		// 댓글 select
		ArrayList<GroupReply> replyList = gService.selectReplyList(gbNo);
//		ArrayList<GroupReReply> reReplyList = gService.selectReReplyList(grr);
		
		int reReplyCurrval = gService.reReplyCurrval();
		
		ArrayList<GroupReReply> reReplyList = gService.selectOneReReplyList(reReplyCurrval);
		
		int totalReply = gService.totalReplyList(gbNo);

		response.setContentType("application/json;charset=utf-8");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		JSONArray rArr = new JSONArray();
		JSONArray tArr = new JSONArray();
		JSONArray rrArr = new JSONArray();
		
		tArr.add(totalReply);
		
		if (replyList != null) {
			for (GroupReply r : replyList) {
				JSONObject jObj = new JSONObject();

				jObj.put("grNo", r.getGrNo());
				jObj.put("gbNo", r.getGbNo());
				jObj.put("gmNo", r.getGmNo());
				jObj.put("grCon", r.getGrCon());
				jObj.put("grDate", r.getGrDate());
				jObj.put("grDelete", r.getGrDelete());
				jObj.put("totalReply", r.getTotalReply());
				jObj.put("name", r.getName());

				rArr.add(jObj);
			}

			if (reReplyList != null) {
				for (GroupReReply r : reReplyList) {
					JSONObject jObj = new JSONObject();

					jObj.put("grrNo", r.getGrrNo());
					jObj.put("gmNo", r.getGmNo());
					jObj.put("gbNo", r.getGbNo());
					jObj.put("grNo", r.getGrNo());
					jObj.put("grrCon", r.getGrrCon());
					jObj.put("grrDate", r.getGrrDate());
					jObj.put("grrDelete", r.getGrrDelete());
					jObj.put("name", r.getName());

					rrArr.add(jObj);
				}

				JSONObject sendJson = new JSONObject();

				sendJson.put("replyList", rArr);
				sendJson.put("totalReply", tArr);
				sendJson.put("reReplyList", rrArr);
				
				PrintWriter out = response.getWriter();
				out.print(sendJson);
				out.flush();
				out.close();

			}
		}else {
			System.out.println("댓글 ajax 실패하였습니다.");
		}
	}
	
		// 댓글 삭제
		@RequestMapping(value = "replyDelete.do", method = RequestMethod.GET)
		public void deleteReply(HttpServletResponse response, @RequestParam(value = "grNo") String grNo) throws IOException {
			System.out.println("댓글삭제  grNo :" + grNo);
			int replyDelete = gService.deleteReply(grNo);
			/* int reReplyDelete = gService.deleteReReply(grNo); */
			System.out.println("댓글삭제 result : " + replyDelete);
			
			response.setContentType("application/json;charset=utf-8");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			PrintWriter out = response.getWriter();
			out.print("댓글 삭제 성공");
			out.flush();
			out.close();
			

			
		}
		
		// 대댓글 삭제
		@RequestMapping(value = "reReplyDelete.do", method = RequestMethod.GET)
		public void deleteReReply(HttpServletResponse response, @RequestParam(value = "grrNo") String grrNo) throws IOException {

			int reReplyDelete = gService.deleteReReply(grrNo);
			
			System.out.println("대댓글삭제 result : " + reReplyDelete);
			
			response.setContentType("application/json;charset=utf-8");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			PrintWriter out = response.getWriter();
			out.print("대댓글 삭제 성공");
			out.flush();
			out.close();
	
				}
		
		// 게시판 작성 view
		@RequestMapping(value = "boardInsertView.do", method = RequestMethod.GET)
		public ModelAndView boardInsertView(ModelAndView mv, HttpSession session, GroupNotice gn) {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			
			mv.addObject("groupTable",gt);
			mv.addObject("gInfo",gInfo);
			mv.setViewName("group/GBoardInsert");
			
			return mv;
		}
		
		
		// 게시판 사진 파일 저장 메소드
		public String boardSaveFile(MultipartFile file, HttpServletRequest request) {

			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\groupBoardFiles";

			File folder = new File(savePath);

			if (!folder.exists()) {
				folder.mkdirs();
			}

			String filePath = folder + "\\" + file.getOriginalFilename();

			try {
				file.transferTo(new File(filePath));

			} catch (Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
			}

			return filePath;
		}
		
		
		// 게시판 작성
		@RequestMapping(value = "boardInsert.do", method = RequestMethod.POST)
		public String boardInsert(HttpSession session, GroupBoard gb, HttpServletRequest request,
				@RequestParam(value="file", required=false) List<MultipartFile> file) {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			
			gb.setGmNo(gInfo.getGmNo());
			gb.setgNo(gInfo.getGroupNo());
			
			System.out.println("게시판 작성하기 gb : " + gb);
			
			int gbInsertResult = gService.insertBoard(gb);
			
			System.out.println("게시판 생성 gbInsertResult : " + gbInsertResult);
			ArrayList<GroupBoardPhoto> photoList = new ArrayList<>();
			
			// 최근 게시판 시퀀스 조회
			int gbNo = gService.selectGbNo();
			System.out.println("게시판 작성 gbNo : " + gbNo);
			
			// 게시판 사진 파일 저장 
			if(!file.isEmpty()) {
				
				for(MultipartFile mf : file) {
					String originFileName = mf.getOriginalFilename();
					String savePath = boardSaveFile(mf, request);
					if (savePath != null) { // 파일이 잘 저장된 경우
						GroupBoardPhoto gbp = new GroupBoardPhoto(); 
						gbp.setGbNo(gbNo);
						gbp.setGmNo(gInfo.getGmNo());
						gbp.setgNo(gInfo.getGroupNo());
						gbp.setGbpOrigin(originFileName);
						gbp.setGbpRename(originFileName);
						
						System.out.println("게시판 작성 gbp : "+ gbp);
						int boardPhotoInsert = gService.insertBoardPhoto(gbp);
						System.out.println("boardPhotoInsert : " + boardPhotoInsert);
					}
					
				}
				
			}

			
			return "redirect:boardMain.do";
			
			}

		// 게시판 수정  View
		@RequestMapping(value = "boardUpdateView.do", method = RequestMethod.GET)
		public ModelAndView updateBoardView(HttpSession session, ModelAndView mv, HttpServletResponse response, @RequestParam(value = "gbNo") String gbNo) {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupBoard gbList = gService.selectBoardDetail(gbNo);
			ArrayList<GroupBoardPhoto> photoList = gService.selectDetailPhotoList(gbNo);
			GroupTable gt = gService.selectOneGroup(gInfo);
			
			mv.addObject("groupTable", gt);
			mv.addObject("gInfo", gInfo);
			mv.addObject("boardList", gbList);
			mv.addObject("photoList", photoList);
			mv.setViewName("group/GUpdateBoard");
		
			return mv;
	}
		// 게시판 사진 삭제
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
		
			String savePath = root + "\\groupBoardFiles";
		
			File f = new File(savePath + "\\" + fileName);
			if(f.exists()) {
				f.delete();
			}
		}
		
		
		
		// 게시판 수정
		@RequestMapping(value = "updateBoard.do", method = RequestMethod.POST)
		public String boardUpdate(HttpSession session, GroupBoard gb, HttpServletRequest request,
				@RequestParam(value="file", required=false) List<MultipartFile> file,
				@RequestParam(value="beforeFile", required=false) List<MultipartFile> beforeFile) {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			
			
			int boardUpdateResult = gService.updateBoard(gb);
			
			
				String gbNo = gb.getGbNo();
				ArrayList<GroupBoardPhoto> photoList = gService.selectDetailPhotoList(gbNo);
				
			
			
			for(GroupBoardPhoto p : photoList) {
				if(p.getGbpOrigin() != null) {
					deleteFile(p.getGbpOrigin() , request);
				}
			}
			
			
			int photoResult = gService.deletePhoto(gbNo);
			System.out.println("게시판 수정 사진삭제 : " + photoResult);
			
			photoList.removeAll(photoList);

			// 게시판 사진 파일 저장 
			if(!file.isEmpty()) {
			for(MultipartFile mf : file) {
				String originFileName = mf.getOriginalFilename();
				String savePath = boardSaveFile(mf, request);
				if (savePath != null) { // 파일이 잘 저장된 경우
					GroupBoardPhoto gbp = new GroupBoardPhoto(); 
					gbp.setGbNo(Integer.valueOf(gb.getGbNo()));
					gbp.setGmNo(gInfo.getGmNo());
					gbp.setgNo(gInfo.getGroupNo());
					gbp.setGbpOrigin(originFileName);
					gbp.setGbpRename(originFileName);
					
					System.out.println("게시판 작성 gbp : "+ gbp);
					int boardPhotoInsert = gService.insertBoardPhoto(gbp);
					System.out.println("boardPhotoInsert : " + boardPhotoInsert);
				}
				
			}
				
			
			}
			
			return "redirect:boardMain.do";
			
			}
		
		// 게시판 삭제
		@RequestMapping(value = "deleteBoard.do", method = RequestMethod.GET)
		public String deleteBoard( HttpServletResponse response, @RequestParam(value = "gbNo") String gbNo) {
			
			int result = gService.deleteBoard(gbNo);
			System.out.println("게시글 삭제  : " + result);

			return "redirect:boardMain.do";
		}
	// ---------------------------------게시판 end--------------------------------
	//---------------------------------투표 start --------------------------------
		// 투표 메인
		@RequestMapping(value = "voteMain.do", method = RequestMethod.GET)
		public ModelAndView voteMain(HttpSession session, ModelAndView mv, 
				@RequestParam(value = "page", required = false) String page) {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupNotice noticeList = gService.selectNoticeOne(gInfo);
			GroupTable gt = gService.selectOneGroup(gInfo);
			int currentPage = 1;
			if (page != null) {
				int Cpage = Integer.parseInt(page);
				currentPage = Cpage;
			}

			int listCount = gService.voteGetListCount(gInfo.getGroupNo());
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			mv.addObject("gInfo", gInfo);
			mv.addObject("groupTable", gt);
			mv.addObject("pi", pi);
			mv.addObject("noticeList", noticeList);
			mv.setViewName("group/GVoteMain");

			return mv;
		}

		// 투표 메인 ajax
		@RequestMapping(value = "voteMainAjax.do", method = RequestMethod.GET)
		public void voteAjax(HttpServletResponse response, HttpSession session, GroupVote gv,
				@RequestParam(value = "page", required = false) String page) throws IOException {
			
			System.out.println("투표 ajax : " + page);
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			int gmNo = gInfo.getGmNo();
			Member loginUser = (Member) session.getAttribute("loginUser");
			int currentPage = 1;
			if (page != null) {
				int Cpage = Integer.parseInt(page);
				currentPage = Cpage;
			} 

			int listCount = gService.voteGetListCount(gInfo.getGroupNo());

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			pi.setLoginUserId(gInfo.getLoginUserId());
			pi.setGroupNo(gInfo.getGroupNo());
			pi.setGmNo(gInfo.getGmNo());
			
			ArrayList<GroupVote> voteList = gService.selectVoteList(pi);
			
			System.out.println("ajax voteList : " + voteList);
			ArrayList<GroupVote> itemList = gService.selectItemList(gInfo);
			ArrayList<GroupVote> voteMemberList = gService.selectVoteMemberLsit(gInfo);
			
			response.setContentType("application/json;charset=utf-8");
			
			JSONArray vArr = new JSONArray();
			JSONArray iArr = new JSONArray();
			JSONArray gArr = new JSONArray();
			JSONArray mArr = new JSONArray();
			
			
			gArr.add(gmNo);
			
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (voteList != null) {
				for (GroupVote v : voteList) {
					JSONObject jObj = new JSONObject();
					jObj.put("page", gv.getPage());
					
					jObj.put("gvNo", v.getGvNo());
					jObj.put("gNo", v.getgNo());
					jObj.put("gmNo", v.getGmNo());
					jObj.put("gvTitle", v.getGvTitle());
					jObj.put("gvCon", v.getGvCon());
					jObj.put("gvStart", v.getGvStart());
					jObj.put("gvEnd", v.getGvEnd());
					jObj.put("gvAno", v.getGvAno());
					jObj.put("gvDelete", v.getGvDelete());
					
					jObj.put("name", v.getName());
					jObj.put("renameFile", v.getRenameFile());
				
					vArr.add(jObj);
				}
				
				if (itemList != null) {
					for (GroupVote v : itemList) {
						JSONObject jObj = new JSONObject();

						jObj.put("gvNo", v.getGvNo());
						jObj.put("gNo", v.getgNo());
						
						jObj.put("gviNo", v.getGviNo());
						jObj.put("gviItem", v.getGviItem());
						jObj.put("totalGviNo", v.getTotalGviNo());
					

						iArr.add(jObj);
					}
					
				if (voteMemberList != null) {
					for (GroupVote v : voteMemberList) {
						JSONObject jObj = new JSONObject();

						jObj.put("gvmNo", v.getGvmNo());
						jObj.put("gvNo", v.getGvNo());
						
						jObj.put("gNo", v.getgNo());
						jObj.put("gmNo", v.getGmNo());
						jObj.put("gviNo", v.getGviNo());
					

						mArr.add(jObj);
					}	

				JSONObject sendJson = new JSONObject();
				sendJson.put("voteList", vArr);
				sendJson.put("itemList", iArr);
				sendJson.put("gInfoGmNo", gArr);
				sendJson.put("voteMemberList", mArr);
				
				PrintWriter out = response.getWriter();
				out.print(sendJson);
				out.flush();
				out.close();

			} else {
				
			}
				}
			}		
		}
		
		// 투표 상세
		@RequestMapping(value = "voteDetail.do", method = RequestMethod.GET)
		public ModelAndView voteDetail(ModelAndView mv,HttpSession session,  GroupVote gv) throws IOException {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			
			gv.setGmNo(String.valueOf(gInfo.getGmNo()));
			gv.setgNo(String.valueOf(gInfo.getGroupNo()));
			GroupNotice noticeList = gService.selectNoticeOne(gInfo);
			
			GroupVote voteList = gService.selectOneVote(gv);
			System.out.println("투표 목록: " + voteList);
			ArrayList<GroupVote> itemList = gService.selectOneItem(gv);
			
			
			GroupVote voteTotalList = gService.selectTotalItem(gv);
			System.out.println("투표 전체 : " + voteTotalList);
			
			
			
			ArrayList<GroupVote> memberList = gService.selectMemberList(gv);
			System.out.println("투표 상세 memberList : " + memberList);
			
			mv.addObject("gvNo", gv.getGvNo());
			mv.addObject("noticeList", noticeList);
			mv.addObject("gInfo", gInfo);
			mv.addObject("groupTable", gt);
			mv.addObject("voteList", voteList);
			mv.addObject("itemList", itemList);
			mv.addObject("voteTotalList", voteTotalList);
			mv.addObject("memberList", memberList);
			mv.setViewName("group/GVoteDetail");
			return mv;
	 
		}
		
		// 투표하기
		@RequestMapping(value = "toVote.do", method = RequestMethod.GET)
		public String voteAjax( HttpSession session, HttpServletResponse response, GroupVote gv) throws IOException {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			int gmNo = gInfo.getGmNo();
			int gNo = gInfo.getGroupNo();
			String gvNo = gv.getGvNo();

			
			gv.setGmNo(String.valueOf(gInfo.getGmNo()));
			gv.setgNo(String.valueOf(gInfo.getGroupNo()));
			
			int deleteResult = gService.deleteVote(gv);
			int insertResult = gService.insertVote(gv);
			ArrayList<GroupVote> itemList = gService.selectOneItem(gv);

			

			return "redirect:voteDetail.do?gvNo="+gvNo;
	
		}
		
		// 투표 종료
		@RequestMapping(value = "endVote.do", method = RequestMethod.GET)
		public String endVote(HttpSession session,  GroupVote gv) throws IOException {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			
			gv.setGmNo(String.valueOf(gInfo.getGmNo()));
			gv.setgNo(String.valueOf(gInfo.getGroupNo()));
			
			int result = gService.endVote(gv); 

			return "redirect:voteMain.do";
	 
		}
		
		// 투표 삭제
		@RequestMapping(value = "removeVote.do", method = RequestMethod.GET)
		public String removeVote(HttpSession session,  GroupVote gv) throws IOException {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			
			gv.setGmNo(String.valueOf(gInfo.getGmNo()));
			gv.setgNo(String.valueOf(gInfo.getGroupNo()));
			
			int result = gService.removeVote(gv);
			
			return "redirect:voteMain.do";
	 
		}
		
		// 투표 종료 메인
		@RequestMapping(value = "finishedVote.do", method = RequestMethod.GET)
		public ModelAndView finishedVote(HttpSession session, ModelAndView mv, GroupVote gv,
				@RequestParam(value = "page", required = false) String page) {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupNotice noticeList = gService.selectNoticeOne(gInfo);
			GroupTable gt = gService.selectOneGroup(gInfo);
			int currentPage = 1;
			if (page != null) {
				int Cpage = Integer.parseInt(page);
				currentPage = Cpage;
			}

			int listCount = gService.finishedVoteGetListCount(gInfo.getGroupNo());

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			mv.addObject("gInfo", gInfo);
			mv.addObject("groupTable", gt);
			mv.addObject("noticeList", noticeList);
			mv.addObject("pi", pi);
			mv.setViewName("group/GVoteFinished");

			return mv;
		}

		// 투표 종료 메인 ajax
		@RequestMapping(value = "finishedVoteMainAjax.do", method = RequestMethod.GET)
		public void finishedVoteMainAjax(HttpServletResponse response, HttpSession session,GroupVote gv,
				@RequestParam(value = "page", required = false) String page) throws IOException {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			int gmNo = gInfo.getGmNo();
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			int currentPage = 1;
			if (page != null) {
				int Cpage = Integer.parseInt(page);
				currentPage = Cpage;
			}
			
			int listCount = gService.finishedVoteGetListCount(gInfo.getGroupNo());

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			pi.setLoginUserId(gInfo.getLoginUserId());
			pi.setGroupNo(gInfo.getGroupNo());
			pi.setGmNo(gInfo.getGmNo());
		
			ArrayList<GroupVote> voteList = gService.selectfinishedVoteList(pi);
			System.out.println("finished voteList : " + voteList);
			ArrayList<GroupVote> itemList = gService.selectfinishedItemList(gInfo);
			ArrayList<GroupVote> voteMemberList = gService.selectfinishedVoteMemberLsit(gInfo);
			
			response.setContentType("application/json;charset=utf-8");
			
			JSONArray vArr = new JSONArray();
			JSONArray iArr = new JSONArray();
			JSONArray gArr = new JSONArray();
			JSONArray mArr = new JSONArray();
			
			
			gArr.add(gmNo);
			
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (voteList != null) {
				for (GroupVote v : voteList) {
					JSONObject jObj = new JSONObject();
					
					jObj.put("page", page);
					
					jObj.put("gvNo", v.getGvNo());
					jObj.put("gNo", v.getgNo());
					jObj.put("gmNo", v.getGmNo());
					jObj.put("gvTitle", v.getGvTitle());
					jObj.put("gvCon", v.getGvCon());
					jObj.put("gvStart", v.getGvStart());
					jObj.put("gvEnd", v.getGvEnd());
					jObj.put("gvAno", v.getGvAno());
					jObj.put("gvDelete", v.getGvDelete());
					
					jObj.put("name", v.getName());
					jObj.put("renameFile", v.getRenameFile());
				
					vArr.add(jObj);
				}
				
				if (itemList != null) {
					for (GroupVote v : itemList) {
						JSONObject jObj = new JSONObject();

						jObj.put("gvNo", v.getGvNo());
						jObj.put("gNo", v.getgNo());
						
						jObj.put("gviNo", v.getGviNo());
						jObj.put("gviItem", v.getGviItem());
						jObj.put("totalGviNo", v.getTotalGviNo());
					

						iArr.add(jObj);
					}
					
				if (voteMemberList != null) {
					for (GroupVote v : voteMemberList) {
						JSONObject jObj = new JSONObject();

						jObj.put("gvmNo", v.getGvmNo());
						jObj.put("gvNo", v.getGvNo());
						
						jObj.put("gNo", v.getgNo());
						jObj.put("gmNo", v.getGmNo());
						jObj.put("gviNo", v.getGviNo());
					

						mArr.add(jObj);
					}	

				JSONObject sendJson = new JSONObject();
				sendJson.put("voteList", vArr);
				sendJson.put("itemList", iArr);
				sendJson.put("gInfoGmNo", gArr);
				sendJson.put("voteMemberList", mArr);
				
				PrintWriter out = response.getWriter();
				out.print(sendJson);
				out.flush();
				out.close();

			} else {
				
			}
				}
			}		
		}
		
		// 투표 작성 View
		@RequestMapping(value = "voteWrite.do", method = RequestMethod.GET)
		public String voteWrite(Model model) {
			return "group/GVoteInsert";
		}
		
		// 투표 작성 
		@RequestMapping(value = "voteInsert.do", method = RequestMethod.POST)
		public String voteInsert(HttpSession session,GroupVote gv,
				@RequestParam(value = "anno", required = false) String anno,
				@RequestParam(value = "itemList", required = false) String itemList) {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			String[] items = itemList.split(",");
			
			ArrayList<GroupVote> voteItemList = new ArrayList<>();
			
			gv.setgNo(String.valueOf(gInfo.getGroupNo()));
			gv.setGmNo(String.valueOf(gInfo.getGmNo()));

			if(anno == null) {
				gv.setGvAno("N");
			}else if(anno.equals("anno")) {
				gv.setGvAno("Y");
			}else if(anno.equals("no")){
				gv.setGvAno("N");
			}

			int InsertResult = gService.insertNewVote(gv);
			int voteCurrval = gService.voteCurrval();
			
			for(String i : items) {
				gv = new GroupVote();
				gv.setgNo(String.valueOf(gInfo.getGroupNo()));
				gv.setGvNo(String.valueOf(voteCurrval));
				gv.setGviItem(i);
				
				voteItemList.add(gv);
 
			}
						
			int InsertItem = gService.insertNewItem(voteItemList);
			
			return "redirect:voteMain.do";
		}
		
		// ------------------------- 가계부 --------------------------
		// 가계부 메인 
		@RequestMapping(value = "accountMain.do", method = RequestMethod.GET)
		public ModelAndView accountMain(ModelAndView mv, HttpSession session) {
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			GroupNotice noticeList = gService.selectNoticeOne(gInfo);
			ArrayList<GroupAccount> checkList = gService.selectCheckList(gInfo);
			ArrayList<GroupAccountMember> checkMemberList = gService.selectMemberCheckList(gInfo);

			System.out.println("checkList : " + checkList);
			System.out.println("checkMemberList : " + checkMemberList);
			mv.addObject("checkList", checkList);
			mv.addObject("checkMemberList", checkMemberList);
			mv.addObject("noticeList", noticeList);
			mv.addObject("gInfo", gInfo);
			mv.addObject("groupTable", gt);
			mv.setViewName("group/GAccountMain");
			return mv;
 
		}
		
		// 가계부 작성 view
		@RequestMapping(value = "insertAccountView.do", method = RequestMethod.GET)
		public ModelAndView insertAccountView(ModelAndView mv, HttpSession session, 
				@RequestParam(value = "clickDate", required = false) String clickDate) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			mv.addObject("gInfo", gInfo);
			mv.addObject("groupTable", gt);
			mv.addObject("clickDate", clickDate);
			mv.setViewName("group/GAccountInsert");
			return mv;
		}
		
		// 가계부생성 이름검색
		@RequestMapping(value = "searchNameAccount.do", method = RequestMethod.GET)
		public void searchNameAccount(HttpSession session, HttpServletResponse response, String searchName)
				throws JsonIOException, IOException {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
					
			gSearch.setLoginUserId(loginUser.getId());
			gSearch.setSearchName(searchName);
			gSearch.setgNo(gInfo.getGroupNo());
			ArrayList<Member> list = gService.searchNameAccount(gSearch);

			System.out.println("가계부 생성 검색 : " + list);

			response.setContentType("application/json;charset=utf-8");

			Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
			gson.toJson(list, response.getWriter());

		}
		
		// 가계부생성 전체  이름검색
		@RequestMapping(value = "searchNameAccountTotal.do", method = RequestMethod.GET)
		public void searchNameAccountTotal(HttpSession session, HttpServletResponse response, String searchName)
				throws JsonIOException, IOException {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
					
			gSearch.setLoginUserId(loginUser.getId());
			gSearch.setSearchName(searchName);
			gSearch.setgNo(gInfo.getGroupNo());
			
			ArrayList<Member> list = gService.searchNameAccountTotal(gSearch);
	
			System.out.println("가계부 전체 검색 : " + list);
	
			response.setContentType("application/json;charset=utf-8");
	
			Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
			gson.toJson(list, response.getWriter());
	
		}
		
		// 가계부 메인 금액
		@RequestMapping("accountList.do")
		public void accountList(HttpSession session, HttpServletResponse response) throws IOException {
			response.setContentType("application/json;charset=utf-8");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			DecimalFormat formatter = new DecimalFormat("###,###");
			ArrayList<GroupAccount> proList = gService.selectProList(gInfo);
			ArrayList<GroupAccount> expList = gService.selectExeList(gInfo);
			ArrayList<GroupAccount> feeList = gService.selectFeeList(gInfo);
			
			System.out.println("proList : " + proList);
			System.out.println("expList : " + expList);
			System.out.println("feeList : " + feeList);
			JSONArray jArr = new JSONArray();
			
			for(GroupAccount p : proList) {
				JSONObject jObj = new JSONObject();
				String gaAmount = formatter.format(p.getGaAmount());

				jObj.put("eventTitle",gaAmount);
				jObj.put("date", p.getGaDate());
				jObj.put("color", "#2860E1");
				jObj.put("type", "profit");
				jObj.put("gaNo", p.getGaNo());
				
				jArr.add(jObj);
			}
			
			for(GroupAccount p : expList) {
				JSONObject jObj = new JSONObject();
				String gaAmount = formatter.format(p.getGaAmount());

				jObj.put("eventTitle",gaAmount);
				jObj.put("date", p.getGaDate());
				jObj.put("color", "#ee1212d0");
				jObj.put("type", "expense");
				jObj.put("gaNo", p.getGaNo());
				
				jArr.add(jObj);
			}
			
			for(GroupAccount p : feeList) {
				JSONObject jObj = new JSONObject();
				String gaAmount = formatter.format(p.getGaAmount());

				jObj.put("eventTitle",gaAmount);
				jObj.put("date", p.getGaDate());
				jObj.put("color", "#FBD14B");
				jObj.put("type", "fee");
				jObj.put("gaNo", p.getGaNo());
				
				jArr.add(jObj);
			}

			JSONObject sendJson = new JSONObject();
			sendJson.put("accountList", jArr);
			
			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();
		}
		
		// 가계부 합계
		@RequestMapping("totalAccountList.do")
		public void totalAccountList(HttpSession session, HttpServletResponse response,
				GroupAccount ga) throws IOException {
			response.setContentType("application/json;charset=utf-8");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			DecimalFormat formatter = new DecimalFormat("###,###");
			
			String year = ga.getGaDate().substring(0, 4);
			String month = ga.getGaDate().substring(5);
			System.out.println("year : " + year);
			System.out.println("month : " + month);
			ga.setYear(year);
			ga.setMonth(month);
			ga.setgNo(gInfo.getGroupNo());
			ga.setGmNo(gInfo.getGmNo());
			
			
			GroupAccount proTotalList = gService.selectTotalProList(ga);
			GroupAccount expTotalList = gService.selectTotalExeList(ga);
			GroupAccount feeTotalList = gService.selectTotalFeeList(ga);

			response.setContentType("application/json;charset=utf-8");

			

			
			JSONObject sendJson = new JSONObject();
			
			
			
			if(proTotalList != null) {
			String gaAmount = formatter.format(proTotalList.getTotalAmount());
			sendJson.put("proTotalList", gaAmount);
			}else {
				int defaultZero = 0;
				sendJson.put("proTotalList", defaultZero);
			}
			
			if(expTotalList != null) {
				String gaAmount = formatter.format(expTotalList.getTotalAmount());
				sendJson.put("expTotalList",  gaAmount);
				}else if(expTotalList == null) {
					int defaultZero = 0;
					sendJson.put("expTotalList", defaultZero);
				}
			
			if(feeTotalList != null) {
				String gaAmount = formatter.format(feeTotalList.getTotalAmount());
				sendJson.put("feeTotalList", gaAmount);
				}else {
					int defaultZero = 0;
					sendJson.put("feeTotalList", defaultZero);
				}
	
			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();
		}
		
		// 가계부 작성
		@RequestMapping(value = "accountInsert.do", method = RequestMethod.POST)
		public ModelAndView accountInsert(ModelAndView mv, HttpSession session, 
				GroupAccount ga, GroupAccountMember gam,
				@RequestParam(value = "gasYn", required = false) String gasYn,
				@RequestParam(value = "gmNo", required = false) String gmNo,
				@RequestParam(value = "gamAmount", required = false) String amount) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			ga.setgNo(gInfo.getGroupNo());
			ga.setGmNo(gInfo.getGmNo());
			
			int result = gService.insertAccount(ga);
			int gaCurrval = gService.gaCurrval();
			
			String[] gmNos = gmNo.split(",");
			String[] amounts = amount.split(",");
			ArrayList<GroupAccountMember> gamList = new ArrayList<>();
			for (int i = 0; i < gmNos.length; i++) {
				gam = new GroupAccountMember();
				
				gam.setgNo(gInfo.getGroupNo());
				gam.setGaNo(gaCurrval);
				gam.setGamAmount(amounts[i]);
				gam.setGmNo(Integer.valueOf(gmNos[i]));
				gam.setGamDelete("N");
				gam.setGamYn("N");

				gamList.add(gam);
			}
			int memberResult = gService.insertAccountMember(gamList);			

			mv.setViewName("redirect:accountMain.do");
			return mv;
		}
		
		// 가계부 상세
		@RequestMapping(value = "detailAccount.do", method = RequestMethod.GET)
		public ModelAndView accountInsert(ModelAndView mv, HttpSession session, 
				GroupAccount ga, GroupAccountMember gam,
				@RequestParam(value = "gaNo", required = false) String gaNo) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			
			GroupAccount gaList = gService.selectGa(gaNo);
			ArrayList<GroupAccountMember> gamList = gService.selectGam(gaNo);
			int totalAmount = gService.selectTotalGa(gaNo);
			
			System.out.println("상세 view gaList :" + gaList);
			System.out.println("상세 view gamList :" + gamList);
			System.out.println("상세 view totalAmount :" + totalAmount);
			
			
			
			mv.addObject("gInfo", gInfo);
			mv.addObject("totalAmount", totalAmount);
			mv.addObject("groupTable", gt);
			mv.addObject("gaList", gaList);
			mv.addObject("gamList", gamList);
			mv.setViewName("group/GAccountDetail");
			return mv;
		}
		
		// 가계부 메인 메모 삭제
		@RequestMapping(value = "cansleSharing.do", method = RequestMethod.GET)
		public ModelAndView cansleSharing(ModelAndView mv, HttpSession session, 
				@RequestParam(value = "gaNo", required = false) String gaNo) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			
			int result = gService.updateSharing(gaNo);
			mv.setViewName("redirect:accountMain.do");
					return mv;
				}
		 
		// 가계부 이름 체크
		@RequestMapping(value = "gamCheckYn.do", method = RequestMethod.GET)
		public void gamCheckYn(HttpSession session, HttpServletResponse response, GroupAccountMember gam)
				throws JsonIOException, IOException {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			
			int result = gService.checkGam(gam);
			
			response.setContentType("application/json;charset=utf-8");

			Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
			gson.toJson("체크성공", response.getWriter());

		}
		
		// 가계부 삭제
		@RequestMapping(value = "accountDelete.do", method = RequestMethod.GET)
		public ModelAndView accountDelete(ModelAndView mv, HttpSession session, 
				@RequestParam(value = "gaNo", required = false) String gaNo) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			
			int result = gService.deleteAccount(gaNo);
			mv.setViewName("redirect:accountMain.do");
				
			return mv;
		}
		

		// 가계부 수정 View
		@RequestMapping(value = "accountUpdateView.do", method = RequestMethod.GET)
		public ModelAndView accountUpdateView(ModelAndView mv, HttpSession session, 
				@RequestParam(value = "gaNo", required = false) String gaNo) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			
			GroupAccount gaList = gService.selectGa(gaNo);
			ArrayList<GroupAccountMember> gamList = gService.selectGam(gaNo);
			int totalAmount = gService.selectTotalGa(gaNo);

			mv.addObject("gInfo", gInfo);
			mv.addObject("totalAmount", totalAmount);
			mv.addObject("groupTable", gt);
			mv.addObject("gaList", gaList);
			mv.addObject("gamList", gamList);
			mv.setViewName("group/GAccoutUpdate");
				
			return mv;
		}
		
		// 가계부 수정
		@RequestMapping(value = "accountUpdate.do", method = RequestMethod.POST)
		public ModelAndView accountUpdate(ModelAndView mv, HttpSession session, 
				GroupAccount ga, GroupAccountMember gam,
				@RequestParam(value = "gasYn", required = false) String gasYn,
				@RequestParam(value = "gmNo", required = false) String gmNo,
				@RequestParam(value = "gamAmount", required = false) String amount,
				@RequestParam(value = "gauAmount", required = false) String gauAmount) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			ga.setgNo(gInfo.getGroupNo());
			ga.setGmNo(gInfo.getGmNo());
			ga.setGaAmount(Integer.valueOf(gauAmount));
			System.out.println("gauAmount : " +  gauAmount);
			System.out.println("수정 ga : " + ga);
			int result = gService.updateAccount(ga);
			System.out.println("수정 result : " + result);
			int deleteDam = gService.deleteAccountMember(ga);
			System.out.println("수정 deleteDam : " + deleteDam);
			
			String[] gmNos = gmNo.split(",");
			String[] amounts = amount.split(",");
			ArrayList<GroupAccountMember> gamList = new ArrayList<>();
			for (int i = 0; i < gmNos.length; i++) {
				gam = new GroupAccountMember();
				
				gam.setgNo(gInfo.getGroupNo());
				gam.setGaNo(ga.getGaNo());
				gam.setGamAmount(amounts[i]);
				gam.setGmNo(Integer.valueOf(gmNos[i]));
				gam.setGamDelete("N");
				gam.setGamYn("N");

				gamList.add(gam);
			}
			System.out.println("수정 gamList : "+ gamList);
			
			int memberResult = gService.insertAccountMember(gamList);			
			System.out.println("수정 memberResult : " + memberResult);
			mv.setViewName("redirect:accountMain.do");
			return mv;
		}
		
		// 가계부수정 이름검색
		@RequestMapping(value = "searchNameAccountUpdate.do", method = RequestMethod.GET)
		public void searchNameAccountUpdate(HttpSession session, HttpServletResponse response, String searchName, String gaNo)
				throws JsonIOException, IOException {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			
			gSearch.setLoginUserId(loginUser.getId());
			gSearch.setSearchName(searchName);
			gSearch.setgNo(gInfo.getGroupNo());
			gSearch.setGaNo(gaNo);
			
			ArrayList<Member> list = gService.searchNameAccountUpdate(gSearch);

			response.setContentType("application/json;charset=utf-8");

			Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
			gson.toJson(list, response.getWriter());

		}
		
		
		//------------------------------------------------ 가계부 end ---------------------------------------
		// 사다리
		@RequestMapping(value = "ladderMain.do", method = RequestMethod.GET)
		public ModelAndView ladderMain(ModelAndView mv, HttpSession session, 
				@RequestParam(value = "gaNo", required = false) String gaNo) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			GroupNotice noticeList = gService.selectNoticeOne(gInfo);
			mv.addObject("noticeList",noticeList);
			mv.addObject("gInfo",gInfo);
			mv.addObject("groupTable",gt);
			mv.setViewName("group/GLadderMain");
				
			return mv;
		}
		
		//------------------------------------------------ 사다리 end ---------------------------------------
		
		// 발자취
		@RequestMapping(value = "footPrintMain.do", method = RequestMethod.GET)
		public ModelAndView footPrintMain(ModelAndView mv, HttpSession session, 
				@RequestParam(value = "gaNo", required = false) String gaNo) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
			GroupTable gt = gService.selectOneGroup(gInfo);
			GroupNotice noticeList = gService.selectNoticeOne(gInfo);
			ArrayList<GroupPlan> planList = gService.selectPlanList(gInfo);
			System.out.println("planList : " + planList);
			
			
			mv.addObject("planList",planList);
			mv.addObject("noticeList",noticeList);
			mv.addObject("gInfo",gInfo);
			mv.addObject("groupTable",gt);
			mv.setViewName("group/GFootPrintMain");
				
			return mv;
		}
}
