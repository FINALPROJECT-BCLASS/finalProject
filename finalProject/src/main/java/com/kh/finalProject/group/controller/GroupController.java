package com.kh.finalProject.group.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
import com.kh.finalProject.group.common.PageInfo;
import com.kh.finalProject.group.common.Pagination;
import com.kh.finalProject.group.model.service.GroupService;
import com.kh.finalProject.group.model.vo.GroupBoard;
import com.kh.finalProject.group.model.vo.GroupBoardPhoto;
import com.kh.finalProject.group.model.vo.GroupInfo;
import com.kh.finalProject.group.model.vo.GroupLike;
import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupMemberList;
import com.kh.finalProject.group.model.vo.GroupNotice;
import com.kh.finalProject.group.model.vo.GroupReReply;
import com.kh.finalProject.group.model.vo.GroupReply;
import com.kh.finalProject.group.model.vo.GroupSearchName;
import com.kh.finalProject.group.model.vo.GroupTable;
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
//			
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
	public String groupWrite(Model model) {
		return "group/GGroupInsert";
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
			String savePath = saveFile(file, request);
			if (savePath != null) { // 파일이 잘 저장된 경우
				gt.setgOrigin(file.getOriginalFilename());
			}
		}

		// GROUP_TABLE INSERT
		int result = gService.groupInsert(gt);

		if (result > 0) { // 그룹 테이블 insert 성공시 그룹멤버 테이블 insert

			int groupNo = gService.groupNoSelect();

			if (groupId != null) {
				String[] groupIds = groupId.split(",");

				ArrayList<GroupMemberList> memberList = new ArrayList<>();

				for (int i = 0; i < groupIds.length; i++) {
					gmList = new GroupMemberList();
//					System.out.println("그룹 생성 id : " + System.identityHashCode(groupIds[i]));

					gmList.setGroupMemberId(groupIds[i]);
					gmList.setGroupNo(groupNo);

					memberList.add(gmList);
				}

				// 생성한 사람 GROUP_MEMBER INSERT
				gmList = new GroupMemberList();
				gmList.setGroupMemberId(m.getId());
				gmList.setGroupNo(groupNo);

				memberList.add(gmList);

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
	public String saveFile(MultipartFile file, HttpServletRequest request) {

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

	// ---------------------------------- 그룹 메인 & 생성 end
	// -------------------------------------------

	// ---------------------------------- 캘린더
	// ------------------------------------------------------
	// 캘린더 메인 (그룹번호 세션생성)
	@RequestMapping(value = "groupCalendarMain.do", method = RequestMethod.GET)
	public String CalendarMain(Model model, HttpSession session, Member m, @RequestParam("groupNo") int groupNo) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String id = loginUser.getId();

		gInfo.setLoginUserId(id);
		gInfo.setGroupNo(groupNo);

		int memberNo = gService.memberNoSelect(gInfo);
		gInfo.setGmNo(memberNo);

		session.setAttribute("gInfo", gInfo);
		System.out.println("gInfo : " + gInfo);
		return "group/GCalendarMain";

	}

	// ---------------------------------- 공지
	// ------------------------------------------------------
	// 공지 메인
	@RequestMapping(value = "noticeMain.do", method = RequestMethod.GET)
	public ModelAndView noticeMain(HttpServletResponse response, ModelAndView mv, HttpSession session,
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

		if (noticeList != null) {

			mv.addObject("noticeList", noticeList);
			mv.addObject("pi", pi);
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

	// ---------------------------------- 공지 end ------------------------------------------------------

	// ---------------------------------- 게시판 ------------------------------------------------------

	// 게시판 메인
	@RequestMapping(value = "boardMain.do", method = RequestMethod.GET)
	public ModelAndView boardMain(HttpSession session, ModelAndView mv,
			@RequestParam(value = "page", required = false) String page) {
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		System.out.println("게시판 메인 gInfo : " + gInfo);
		GroupNotice noticeList = gService.selectNoticeOne(gInfo);

		int currentPage = 1;
		if (page != null) {
			int Cpage = Integer.parseInt(page);
			currentPage = Cpage;
		}

		int listCount = gService.boardGetListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		mv.addObject("noticeList", noticeList);
		mv.addObject("pi", pi);
		mv.setViewName("group/GBoardMain");

		return mv;
	}

	// 게시판 메인 ajax
	@RequestMapping(value = "boardMainAjax.do", method = RequestMethod.GET)
	public void boardMainAjax(HttpServletResponse response, HttpSession session,
			@RequestParam(value = "page", required = false) String page) throws IOException {
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");

		int currentPage = 1;
		if (page != null) {
			int Cpage = Integer.parseInt(page);
			currentPage = Cpage;
		}

		int listCount = gService.boardGetListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		pi.setLoginUserId(gInfo.getLoginUserId());
		pi.setGroupNo(gInfo.getGroupNo());
		pi.setGmNo(gInfo.getGmNo());

		// 게시판 목록
		ArrayList<GroupBoard> boardList = gService.selectBoardList(pi);

		// 사진 목록
		ArrayList<GroupBoardPhoto> photoList = gService.selectPhotoList(pi);

		// 좋아요 total
		ArrayList<GroupLike> likeList = gService.totalLike();

		// 댓글 total
		ArrayList<GroupReply> replyList = gService.totalReply();

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
		GroupInfo gInfo = (GroupInfo) session.getAttribute("gInfo");
		String gmNo = Integer.toString(gInfo.getGmNo());

		GroupNotice noticeList = gService.selectNoticeOne(gInfo);
		
		// 조회수 증가
		int result = gService.plusgbCount(gbNo);

		GroupBoard boardList = gService.selectBoardDetail(gbNo);

		ArrayList<GroupBoardPhoto> photoList = gService.selectDetailPhotoList(gbNo);

		int totalLike = gService.totalLikeList(gbNo);

		gl.setGbNo(gbNo);
		gl.setGmNo(gmNo);
		GroupLike likeList = gService.selectLikeList(gl);

		int totalReply = gService.totalReplyList(gbNo);
		ArrayList<GroupReply> replyList = gService.selectReplyList(gbNo);
		
		mv.addObject("gInfoGmNo", gmNo);
		mv.addObject("noticeList", noticeList);
		mv.addObject("photoList", photoList);
		mv.addObject("boardList", boardList);
		mv.addObject("totalLike", totalLike);
		mv.addObject("totalReply", totalReply);
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
		
		// 댓글 insert
		int result = gService.replyInsert(gr);
		
		// 댓글 select
		ArrayList<GroupReply> replyList = gService.selectReplyList(gbNo);
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
	public void reReplyinsert(HttpServletResponse response, HttpSession session, GroupReReply grr)throws IOException {
		System.out.println("왔냐");
		System.out.println("grr : " + grr);
		String gbNo = Integer.toString(grr.getGbNo()); 
		
		// 댓글 insert
		int result = gService.reReplyInsert(grr);
		System.out.println("리댓글 result : " + result);
		
		// 댓글 select
		ArrayList<GroupReply> replyList = gService.selectReplyList(gbNo);
//		ArrayList<GroupReReply> reReplyList = gService.selectReReplyList(grr);
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
}
