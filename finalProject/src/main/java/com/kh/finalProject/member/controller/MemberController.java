package com.kh.finalProject.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.member.model.exception.MemberException;
import com.kh.finalProject.member.model.service.MemberService;
import com.kh.finalProject.member.model.vo.Member;
import com.sun.org.apache.xerces.internal.util.Status;


@SessionAttributes("loginUser")
@Controller
public class MemberController {

	
//	@RequestMapping("memberJoin.do")
//	public String memberJoin(Model model) {
//		return "member/join";
//	}
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("memberLoginView.do")
	public String memberLoginView(Model model) {
		return "member/login";
	}
	
	// 회원가입 폼으로 이동
	@RequestMapping("join.do")
	public String joinView() {
		return "member/join";
	}
	
	// 아이디 중복확인
	@RequestMapping(value = "checkId.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		mService.checkId(id, response);
	}
	
	// 회원가입
	@RequestMapping("minsert.do")
	public String memberInsert(Member m, Model model,
								HttpServletRequest request,
								@RequestParam("postcode") String postcode,
								@RequestParam("mainAddress") String mainAddress,
								@RequestParam("subAddress") String subAddress,
								@RequestParam(value="file", required=false) MultipartFile file) throws IOException {
		
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		
		m.setPwd(encPwd);
		m.setAddress(postcode+","+mainAddress+","+subAddress);
		
		
		int result =0;
		
		if(!file.getOriginalFilename().equals("")) {
			
			String renameFile = saveFile(file, m, request);
			
			System.out.println("오리진 파일 :" + file.getOriginalFilename());
			
			m.setOriginal_file(file.getOriginalFilename());
			m.setRename_file(renameFile);
			
		}
		
		result = mService.insertMember(m);
		
		
		if(result > 0) {
			return "member/login";
		}else {
			//로그인 실패
            model.addAttribute("msg","회원가입에 실패하셨습니다. 다시 시도해 주세요.");
            model.addAttribute("url","/join.do");
			
			return "common/redirect";
		}	
	}
	
	// 저장 파일 이름 변경
		
	public String saveFile(MultipartFile file, Member m, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "/muploadFiles/";
		
		File folder = new File(savePath);
		System.out.println(folder);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// 업로드 시간을 기준으로 파일명 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		
		String originFileName = file.getOriginalFilename();
		
		// 파일명 앞에 '사용자 아이디_' 추가
		String renameFileName = m.getId() + "_" + sdf.format(new java.sql.Date(System.currentTimeMillis()))
									+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String filePath = folder + "/" + renameFileName;
		
		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
		
	}
	
	// 로그인
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		
		try {
			
			Member user = mService.loginMember(m);
		
			if(bcryptPasswordEncoder.matches(m.getPwd(), user.getPwd())) {
				model.addAttribute("loginUser", user);
				return "home";
			
			} else {
				
				//로그인 실패
	            model.addAttribute("msg","로그인에 실패하셨습니다. 다시 시도해 주세요.");
	            model.addAttribute("url","/memberLoginView.do");
				
				return "common/redirect";
			}
		
		}catch (NullPointerException e) {

            //로그인 실패
            model.addAttribute("msg","입력하신 아이디가 존재하지 않습니다.");
            model.addAttribute("url","/memberLoginView.do");
            
            return "common/redirect";

        }
		
	}
	
	// 로그아웃
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "home";
	}
	
	
	
	
	
	
	
	
}
