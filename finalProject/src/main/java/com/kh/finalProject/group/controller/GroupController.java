package com.kh.finalProject.group.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.kh.finalProject.group.model.service.GroupService;
import com.kh.finalProject.group.model.vo.GroupMember;
import com.kh.finalProject.group.model.vo.GroupMemberList;
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
	
	// 그룹 메인
	@RequestMapping(value="groupMain.do", method=RequestMethod.GET)
	public ModelAndView groupMain(ModelAndView mv, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");		
		
		if(loginUser != null) {
			String loginUserId = loginUser.getId();
			ArrayList<GroupTable> list = gService.selectGroup(loginUserId);

			mv.addObject("list" , list);
			mv.setViewName("group/GGroupMain");
		}else {
			mv.setViewName("group/GGroupMain");
		}
				
		
		
		
		return mv;
	}
	
	// 그룹생성 View
	@RequestMapping(value="groupInsertView.do", method=RequestMethod.GET)
	public String groupWrite(Model model) {
		return "group/GGroupInsert";
	}
	
	// 그룹생성 이름검색
	@RequestMapping(value="searchName.do", method=RequestMethod.GET)
	public void searchNameList(HttpServletResponse response, String searchName) throws JsonIOException, IOException {

		ArrayList<Member> list = gService.searchNameList(searchName);
		
		response.setContentType("application/json;charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	// 그룹생성
	@RequestMapping(value="groupInsert.do", method=RequestMethod.POST)
	public String groupInsert(Model model, HttpServletRequest request, GroupTable gt , 
								@RequestParam(value="groupName", required=false) String groupName,
								@RequestParam(name="uploadFile", required=false) MultipartFile file,
								@RequestParam(value="groupId", required=false) String groupId) {
		
		System.out.println("그룹 생성  groupName: " + groupName);
		System.out.println("그룹 생성 groupId : " + groupId);
		System.out.println("그룹 생성 file: " + file);
		
		gt.setgName(groupName);
		gt.setgDelete("N");
		
		// 사진 파일 저장
		if(!file.getOriginalFilename().contentEquals("")) {	// 빈파일이 아니라면
			String savePath = saveFile(file, request); 				
			if(savePath != null) {	 						// 파일이 잘 저장된 경우
				gt.setgOrigin(file.getOriginalFilename()); 
			}	
		}
		
		// GROUP_TABLE INSERT
		int result = gService.groupInsert(gt);
		
		
		if(result > 0) {	// 그룹 테이블 insert 성공시 그룹멤버 테이블 insert

			int groupNo =  gService.groupNoSelect();

			if(groupId != null) {
				String[] groupIds = groupId.split(",");

				ArrayList<GroupMemberList> memberList = new ArrayList<>();
				
				
				for(int i = 0 ; i < groupIds.length; i++) {
					gmList = new GroupMemberList();
//					System.out.println("그룹 생성 id : " + System.identityHashCode(groupIds[i]));
					
					gmList.setGroupMemberId(groupIds[i]);
					gmList.setGroupNo(groupNo);
					
					memberList.add(gmList);
				}

				// GROUP_MEMBER INSERT
				int memberResult = gService.groupMemberInsert(memberList);

			}
			return "redirect:groupMain.do";			
		}else { 
			return "redirect:groupMain.do";
		}
	}
	
	// 사진 파일 저장 
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\groupMainFiles";

		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String filePath = folder + "\\" + file.getOriginalFilename();


		try {
			file.transferTo(new File(filePath));
			
		}catch(Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		} 
				
		return filePath;
	}
	

	// 게시판 메인
	@RequestMapping(value="boardMain.do", method=RequestMethod.GET)
	public String boardMain(Model model) {
		return "group/GBoardMain";
	}

	// 공지 메인
	@RequestMapping(value="noticeMain.do", method=RequestMethod.GET)
	public String noticeMain(Model model) {
		return "group/GNoticeMain";
	}
}
