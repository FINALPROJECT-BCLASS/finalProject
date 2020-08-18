package com.kh.finalProject.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.member.model.service.MemberService;
import com.kh.finalProject.member.model.vo.Member;


@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private JavaMailSender mailSender; // for 메일 전송
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 로그인 화면으로 이동
	@RequestMapping("memberLoginView.do")
	public String memberLoginView(Model model) {
		return "member/login";
	}
	
	// 회원가입 화면으로 이동
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
		m.setAddress(postcode+"_"+mainAddress+"_"+subAddress);
		
		
		if(!file.getOriginalFilename().equals("")) {
			
			String renameFile = saveFile(file, m, request);
			
			m.setOriginal_file(file.getOriginalFilename());
			m.setRename_file(renameFile);
			
		}
		
		int result = mService.insertMember(m);
		
		
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
				
				int main_no = user.getMain_no();
				
				if(!user.getId().equals("admin")) {
					
					switch(main_no){
					
					case 1: return "redirect:mpview.do";
					
					case 2: return "redirect:ttview.do";
					
					case 3: return "redirect:mcview.do";
					
					case 4: return "redirect:dailyRecordView.do";
					
					case 5: return "redirect:htList.do";
					
					case 6: return "redirect:bookmarkView.do";
					
					case 7: return "redirect:DietCalendarView.do";
					
					case 8: return "redirect:DietGraphView.do";
					
					case 9: return "redirect:mrview.do";
					
					case 10: return "redirect:psview.do";
					
					case 11: return "redirect:esview.do";
					
					case 12: return "redirect:ysview.do";
					
					default: return "home";
					
					}	
				} else {
					return "home";
				}
			
			} else {
				
				//로그인 실패
	            model.addAttribute("msg","로그인에 실패하셨습니다. 다시 시도해 주세요.");
	            model.addAttribute("url","/memberLoginView.do");
				
				return "common/redirect";
			}
		
		}catch (NullPointerException e) {

            // 아이디가 없을 경우 (db에 데이터가 없는 경우)
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
	
	// 회원정보 수정 화면
	@RequestMapping(value="myInfoView.do", method=RequestMethod.GET)
	public String myInfoView() {
		return "member/infoView";
	}
	
	// 회원정보 수정
	@RequestMapping("mupdate.do")
	public String memberUpdate(Member m, Model model,
								HttpServletRequest request,
								@RequestParam(value="postcode", required=false) String postcode,
								@RequestParam(value="mainAddress", required=false) String mainAddress,
								@RequestParam(value="subAddress", required=false) String subAddress,
								@RequestParam(value="file", required=false) MultipartFile file) {
		

		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		
		m.setPwd(encPwd);
		m.setAddress(postcode+"_"+mainAddress+"_"+subAddress);
		
		System.out.println(postcode+"_"+mainAddress+"_"+subAddress);
		
		// 세션값 가져오기 (저장된 파일 이름을 불러 오기 위함)
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String rFile = member.getRename_file();
		
		// 파일 경로 저장
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/muploadFiles/";
		
		// 프로필 사진 저장
		if(!file.getOriginalFilename().equals("")) {
			
			String renameFile = saveFile(file, m, request);
			
			m.setOriginal_file(file.getOriginalFilename());
			m.setRename_file(renameFile);
			
			if(rFile != null) { 
				
				File reFile = new File(savePath + rFile);
				reFile.delete();// 기존에 있던 사진파일 삭제
			}
			
		}else {
			// 기존 사진 파일 유지
			m.setOriginal_file(member.getOriginal_file());
			m.setRename_file(member.getRename_file());
		}

		
		int result = mService.updateMember(m);
		
		if(result > 0) {
			
			Member user = mService.loginMember(m);
			
			int main_no = user.getMain_no();
			
			// 회원 정보 수정 성공
			model.addAttribute("loginUser", m); // 홈으로 프로필 사진 보내기
			model.addAttribute("msg","개인정보가 수정되었습니다.");
			
			switch(main_no){
			
				case 1: model.addAttribute("url","/mpview.do"); return "common/redirect";
				
				case 2: model.addAttribute("url","/ttview.do"); return "common/redirect";
						
				case 3: model.addAttribute("url","/mcview.do"); return "common/redirect";
						
				case 4: model.addAttribute("url","/dailyRecordView.do"); return "common/redirect";
				
				case 5: model.addAttribute("url","/htList.do"); return "common/redirect";
				
				case 6: model.addAttribute("url","/bookmarkView.do"); return "common/redirect";
				
				case 7: model.addAttribute("url","/DietCalendarView.do"); return "common/redirect";
				
				case 8: model.addAttribute("url","/DietGraphView.do"); return "common/redirect";
				
				case 9: model.addAttribute("url","/mrview.do"); return "common/redirect";
				
				case 10: model.addAttribute("url","/psview.do"); return "common/redirect";
			
				case 11: model.addAttribute("url","/esview.do"); return "common/redirect";
			
				case 12: model.addAttribute("url","/ysview.do"); return "common/redirect";
			
				default: return "home";
					
			}	
			
			

//            model.addAttribute("url","/home.do");
//            
//			return "common/redirect";
//			
		}else {
			
			//회원가입 실패
            model.addAttribute("msg","개인정보 수정에 실패하셨습니다. 다시 시도해 주세요.");
            model.addAttribute("url","/myInfoView.do");
			
			return "common/redirect";
		}	
		
	}
	
	// 비밀번호 재설정 폼
	@RequestMapping("resetPwd.do")
	public String resetPwd() {
		
		return "member/resetPwd";
	}
	
	// 비밀번호 재설정
	@RequestMapping("findPwd.do")
	public void findPwd(Member m,
						Model model,
						HttpServletRequest request,
						HttpServletResponse response) throws IOException {
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Member member = mService.selectOne(m);
		
		if(member == null) {
			out.print("아이디가 없습니다.");
			out.close();
			
		}else if(!m.getEmail().equals(member.getEmail())) {
			out.print("입력하신 이메일과 아이디가 일치하지 않습니다.");
			out.close();
			
		}else {
			
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char)((Math.random() * 26) + 97);
			}
			
			// 생성한 임시 비밀번호 암호화 처리
			String encPwd = bcryptPasswordEncoder.encode(pw);
			m.setPwd(encPwd);
			
			int check = mService.updatePwd(m);
			
			if(check > 0) {
				String message = sendMail(m, pw); // 이메일 전송 메서드 실행
				out.print(message);
				out.close();
			}else {
				out.print("임시 비밀번호 발급 실패, 다시 시도해 주세요.");
				out.close();
			}	
		}	
	}
	
	public String sendMail(Member m, String pw) {
			
		String setfrom = "toadl21@naver.com";         
	    String tomail  = m.getEmail();     // 받는 사람 이메일
	    String title   = "LIFENOTE에서 임시 비밀번호를 보내드립니다.";     // 제목
	    String content = m.getId() + "님의 임시 비밀번호는 <h1>" + pw + "</h1>입니다. \n 로그인하여 비밀번호를 재설정해 주세요.";    // 내용
	    String alert = "";
	   
	    MimeMessage message = mailSender.createMimeMessage();

	    try {
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, false, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는 사람
	      messageHelper.setTo(tomail);     // 받는 사람 이메일
	      messageHelper.setSubject(title); // 메일 제목 (생략 가능)
	      messageHelper.setText(content, true);  // 메일 내용
	     
	      mailSender.send(message);
	      
	    } catch(Exception e){
	    	
	    	alert = "메일 발송 실패";
	    	return alert;
	    	
	    }
		
		alert = "메일로 임시 비밀번호가 발송되었습니다.";	
		return alert;
				
	}
	
	
	
	
	
	
	
	
}
