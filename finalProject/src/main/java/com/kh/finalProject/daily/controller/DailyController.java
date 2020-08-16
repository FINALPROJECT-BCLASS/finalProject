package com.kh.finalProject.daily.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalProject.daily.model.service.DailyService;
import com.kh.finalProject.daily.model.vo.Bookmark;
import com.kh.finalProject.daily.model.vo.BookmarkMap;
import com.kh.finalProject.daily.model.vo.BookmarkUrl;
import com.kh.finalProject.daily.model.vo.DailyRecord;
import com.kh.finalProject.daily.model.vo.DailyRecordPhoto;
import com.kh.finalProject.daily.model.vo.Habit;
import com.kh.finalProject.daily.model.vo.HabitRecord;
import com.kh.finalProject.daily.model.vo.HabitSum;
import com.kh.finalProject.group.common.PageInfo;
import com.kh.finalProject.group.common.Pagination;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class DailyController {

	@Autowired
	private DailyService dailyService;
	
	// 습관 목록
	@RequestMapping("htList.do")
	public ModelAndView htList(ModelAndView mv, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		SimpleDateFormat dailySet = new SimpleDateFormat ("yy/MM/dd"); // 오늘 날짜 저장
		SimpleDateFormat monthlySet = new SimpleDateFormat ("yy/MM");
		
		Date date = new Date();
		
		String day = dailySet.format(date);
		String month = monthlySet.format(date); // 오늘 날짜
		
		
		System.out.println("오늘 날짜 : " + day);
		System.out.println("이번 달 : " + month);
		
		if(member != null) {
			String id = member.getId();
			
			Habit hs = new Habit();
			hs.setId(id);
			hs.setHt_start(day);
			
			Habit hsm = new Habit();
			hsm.setId(id);
			hsm.setHt_start(month);
			
//			System.out.println("daily habit : " + hs);
//			System.out.println("monthly habit : " + hsm);
			
			ArrayList<Habit> list = dailyService.selectHabitList(id);			// 전체 목록 조회
			ArrayList<HabitSum> sum = dailyService.selectHabitSumList(hs);		// daily 합계
			ArrayList<HabitSum> Wsum = dailyService.selectHabitWSumList(id);	// weekly 합계
			ArrayList<HabitSum> Msum = dailyService.selectHabitMSumList(hsm);	// monthly 합계
			
			
//			System.out.println("daily sum : " + sum);
//			System.out.println("weekly sum : " + Wsum);
//			System.out.println("monthly sum : " + Msum);
			
			ArrayList<Habit> hlist = new ArrayList<Habit>();
			
			for(Habit h : list) {
				
				if(h.getHt_cycle().equals("Daily")) {
					for(HabitSum hS : sum) {
						if(hS.getHt_no() == h.getHt_no()) {
							h.setHt_now(hS.getHt_now());
						}

					}
				}else if(h.getHt_cycle().equals("Weekly")) {
					for(HabitSum whS : Wsum) {
						if(whS.getHt_no() == h.getHt_no()) {
							h.setHt_now(whS.getHt_now());
						}
					}
					
				}else if(h.getHt_cycle().equals("Monthly")) {	
					
					for(HabitSum mhS : Msum) {
						if(mhS.getHt_no() == h.getHt_no()) {
							h.setHt_now(mhS.getHt_now());
						}
					}
				}
				
				hlist.add(h);
			}

			if(list != null) {
				mv.addObject("hlist", hlist);
				mv.setViewName("daily/habitTracker");
			} else {
				mv.addObject("message", "목록이 없습니다. 추가해 주세요.");
				mv.setViewName("daily/habitTracker");
			}
		
		}else {
			
			mv.addObject("msg","로그인 하셔야 이용할 수 있는 서비스 입니다.");
            mv.addObject("url","/memberLoginView.do");
			mv.setViewName("common/redirect");
		}
		
		return mv;
				
	}
	
	@RequestMapping("addHabitView.do")
	public String addHabitView() {
		
		return "daily/habitAdd";
	}
	

	@RequestMapping("insertHabit.do")
	public String insertHabit(Habit habit, Model model,
								HttpServletRequest request, HttpServletResponse response) throws IOException {
		

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String id = member.getId();
		
		habit.setId(member.getId()); // 세션에서 받아온 아이디 저장
		
		int result = dailyService.insertHabit(habit);
		
		if(result > 0) {
			
			return "redirect:htList.do";
			
		} else {
			//로그인 실패
            model.addAttribute("msg","습관 등록에 실패하셨습니다. 다시 시도해 주세요.");
            model.addAttribute("url","/insertHabit.do");
			
			return "common/redirect";
			
		}
		
	}
	
	// 습관 내용 불러오기
	@RequestMapping("habitContent.do")
	public void habitContent(Model model, Habit habit, int htNum, String htDate,
							HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		String id = member.getId();
		habit.setId(id);
		habit.setHt_no(htNum);
		
		HabitRecord hrc = new HabitRecord();
		hrc.setId(id);
		hrc.setHt_no(htNum);
		
		ArrayList<HabitRecord> hrcResult = dailyService.selectHabitRecordListC(hrc);
		
		JSONArray hrlist = new JSONArray();
		
		for(HabitRecord HRC : hrcResult) {
			
			JSONObject hrcl = new JSONObject();
			hrcl.put("htr_date", HRC.getHtr_date());
			
			hrlist.add(hrcl);
		}
		
		
		// 번호로 습관 조회하기
		Habit h = dailyService.selectHabitNum(habit);
		
		SimpleDateFormat dailySet = new SimpleDateFormat ("yy/MM/dd"); // 오늘 날짜 저장
		SimpleDateFormat monthlySet = new SimpleDateFormat ("yy/MM"); // 이번 달 저장
		
		Date date = new Date();
		
		String today = dailySet.format(date); // 오늘 날짜
		String month = monthlySet.format(date); // 이번 달
		
		JSONArray daily = new JSONArray();
		JSONArray weekly = new JSONArray();
		JSONArray monthly = new JSONArray();
		JSONObject sendJson = new JSONObject();
		
		HabitRecord hr = new HabitRecord();
		
		hr.setId(id);
		hr.setHt_no(h.getHt_no());
		hr.setHtr_date(today);
		
		
		if(h.getHt_cycle().equals("Daily")) {
		
		// 아이디, 습관 번호, 오늘 날짜 담기
		ArrayList<HabitRecord> hrDailyResult = dailyService.selectHabitRecordList(hr);
		
		// 오늘 날짜로 조회한 습관 기록 배열에 담기
		for(HabitRecord HR : hrDailyResult) {
			
			JSONObject jObject = new JSONObject();
			jObject.put("htr_no", HR.getHtr_no());
			jObject.put("htr_time", HR.getHtr_date());
			jObject.put("htr_now", HR.getHtr_now());
			jObject.put("htr_con", HR.getHtr_con());
			
			daily.add(jObject);
			
		}
		
		sendJson.put("recordDailyList", daily);
		
		}else if(h.getHt_cycle().equals("Weekly")) {
		
		
			ArrayList<HabitRecord> hrWeeklyResult = dailyService.selectHabitRecordListW(hr);
			
			// 이번 주로 조회한 습관 기록 배열에 담기
			for(HabitRecord HRW : hrWeeklyResult) {
				
				JSONObject jObjectW = new JSONObject();
				jObjectW.put("htr_no", HRW.getHtr_no());
				jObjectW.put("htr_month", HRW.getHtr_month());
				jObjectW.put("htr_time", HRW.getHtr_time());
				jObjectW.put("htr_now", HRW.getHtr_now());
				jObjectW.put("htr_con", HRW.getHtr_con());
				
				weekly.add(jObjectW);
				
			}
			
			sendJson.put("recordWeeklyList", weekly);
			
		}else {
			
				hr.setHtr_date(month);
			
			ArrayList<HabitRecord> hrMonthlyResult = dailyService.selectHabitRecordListM(hr);
			
			// 이번 달로 조회한 습관 기록 배열에 담기
			for(HabitRecord HRM : hrMonthlyResult) {
				
				JSONObject jObjectM = new JSONObject();
				jObjectM.put("htr_no", HRM.getHtr_no());
				jObjectM.put("htr_month", HRM.getHtr_month());
				jObjectM.put("htr_time", HRM.getHtr_time());
				jObjectM.put("htr_now", HRM.getHtr_now());
				jObjectM.put("htr_con", HRM.getHtr_con());
				
				monthly.add(jObjectM);
				
			}
			
			sendJson.put("recordMonthlyList", monthly);
		
		}
		
		// 전체 습관
		JSONObject jObj = new JSONObject();
		jObj.put("ht_title", h.getHt_title());
		jObj.put("ht_goal", h.getHt_goal());
		jObj.put("ht_unit", h.getHt_unit());
		jObj.put("ht_amount", h.getHt_amount());
		jObj.put("ht_cycle", h.getHt_cycle());
		jObj.put("ht_now", h.getHt_now());
		jObj.put("ht_con", h.getHt_con());
		jObj.put("ht_color", h.getHt_color());
		
		
		sendJson.put("hrclist", hrlist);
		sendJson.put("list", jObj);
		
		out.print(sendJson);
		out.flush();
		out.close();
			
	}
	
	@RequestMapping(value="insertHtr.do", method = RequestMethod.POST)
	public void insertHabitRecord(HttpServletRequest request, HttpServletResponse response, String[] htr) throws IOException, ParseException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		String id = member.getId();
		
		int ht_no = Integer.parseInt(htr[0]);
		String htr_now = htr[1];
		String htr_con = htr[2];
		String htr_date = htr[3];
		
		System.out.println("으잉?" + htr[3]);
		
		
		SimpleDateFormat dailySet = new SimpleDateFormat ("yyyy-MM-dd"); // 오늘 날짜 저장
		
		
		Date date = new Date();
		String day = dailySet.format(date);
		
		System.out.println("오늘 날짜 : " + day);
		
		
		HabitRecord hr = new HabitRecord();
		hr.setHt_no(ht_no);
		hr.setId(id);
		hr.setHtr_now(htr_now);
		hr.setHtr_con(htr_con);
		
		if(day.equals(htr_date)) {
			hr.setHtr_date("Today");
		}else {
			hr.setHtr_date(htr_date);
		}
	        
		System.out.println("확인" + hr);
		
	    int result = dailyService.insertHabitRecord(hr);
	    // 업데이트 된 습관기록 불러오기
//	    HabitRecord HR = dailyService.selectHabitRecord(hr);
//	    System.out.println("hr확인" + HR);
	    
	    if(result > 0) {
	    	out.print("success");
	    	out.flush();
	    	out.close();
	    } else {
	    	out.print("failed");
	    	out.flush();
	    	out.close();
	    }
	        
	        
	}
	
	// 습관 코멘트 삭제
	@RequestMapping(value="updateHabitComment.do", method=RequestMethod.POST)
	public void updateHabitComment(HttpServletRequest request, HttpServletResponse response, Habit habit) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
//		System.out.println("나는 확인을 할 거야 : " +habit);
		int result = dailyService.updateHabitComment(habit);
		
		
		if(result > 0) {
			out.print("success");
			out.flush();
			out.close();
		} else {
			out.print("failed");
			out.flush();
			out.close();
		}
	}
	
	// 습관 코멘트 삭제
	@RequestMapping(value="deleteHabitRecord.do", method=RequestMethod.POST)
	public void deleteHabitRecord(HttpServletRequest request, HttpServletResponse response, String htr_no) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String[] htr_no_item = htr_no.split(",");
		
		HabitRecord hr = new HabitRecord();
		
		int result = 0;
		
		for(int i = 0 ; i < htr_no_item.length ; i++) {
			hr.setHtr_no(htr_no_item[i]);
			result = dailyService.deleteHabitRecord(hr);
		}
		
		if(result > 0) {
			out.print("success");
			out.flush();
			out.close();
		} else {
			out.print("failed");
			out.flush();
			out.close();
		}
	}
	
	// 습관 코멘트 업데이트
	@RequestMapping(value="updateHabitRecord.do", method=RequestMethod.POST)
	public void updateHabitRecord(HttpServletRequest request, HttpServletResponse response, HabitRecord hr) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int result = dailyService.updateHabitRecord(hr);
		
		if(result > 0) {
			out.print("success");
			out.flush();
			out.close();
		} else {
			out.print("failed");
			out.flush();
			out.close();
		}
	}

	// 캘린더에 이벤트 날짜 표시
	@RequestMapping(value="habitDateSelectList.do", method=RequestMethod.POST)
	public void selectHabitDateList(HttpServletRequest request,
									HttpServletResponse response,
									String htNum, String htDate, String htCycle) throws IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = member.getId();
		
		int ht_no = Integer.parseInt(htNum);
		
		HabitRecord hr = new HabitRecord();
		hr.setId(id);
		hr.setHt_no(ht_no);
		hr.setHtr_time(htCycle);
		hr.setHtr_date(htDate);
		
		ArrayList<HabitRecord> hArr = dailyService.selectHabitRecordListD(hr);
		
		JSONArray HabitRecordC = new JSONArray();
		
		// 이번 주로 조회한 습관 기록 배열에 담기
		for(HabitRecord hrc : hArr) {
			
			JSONObject jObj = new JSONObject();
			jObj.put("htr_no", hrc.getHtr_no());
			jObj.put("htr_month", hrc.getHtr_month());
			jObj.put("htr_time", hrc.getHtr_time());
			jObj.put("htr_now", hrc.getHtr_now());
			jObj.put("htr_con", hrc.getHtr_con());
			
			HabitRecordC.add(jObj);
			
		}
		
		JSONObject HRC = new JSONObject();
		
		HRC.put("hrc", HabitRecordC);
		
		out.print(HRC);
		out.flush();
		out.close();
		
		
	}
	
@RequestMapping("graphView.do")
public ModelAndView graphView(ModelAndView mv, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		SimpleDateFormat dailySet = new SimpleDateFormat ("yy/MM/dd"); // 오늘 날짜 저장
		SimpleDateFormat monthlySet = new SimpleDateFormat ("yy/MM");
		
		Date date = new Date();
		
		String day = dailySet.format(date);
		String month = monthlySet.format(date); // 오늘 날짜
		
		
		System.out.println("오늘 날짜 : " + day);
		System.out.println("이번 달 : " + month);
		
		if(member != null) {
			String id = member.getId();
			
			Habit hs = new Habit();
			hs.setId(id);
			hs.setHt_start(day);
			
			Habit hsm = new Habit();
			hsm.setId(id);
			hsm.setHt_start(month);
			
			System.out.println("daily habit : " + hs);
			System.out.println("monthly habit : " + hsm);
			
			ArrayList<Habit> list = dailyService.selectHabitList(id);			// 전체 목록 조회
			ArrayList<HabitSum> sum = dailyService.selectHabitSumList(hs);		// daily 합계
			ArrayList<HabitSum> Wsum = dailyService.selectHabitWSumList(id);	// weekly 합계
			ArrayList<HabitSum> Msum = dailyService.selectHabitMSumList(hsm);	// monthly 합계
			
			
			System.out.println("daily sum : " + sum);
			System.out.println("weekly sum : " + Wsum);
			System.out.println("monthly sum : " + Msum);
			
			ArrayList<Habit> hlist = new ArrayList<Habit>();
			
			for(Habit h : list) {
				
				if(h.getHt_cycle().equals("Daily")) {
					for(HabitSum hS : sum) {
						if(hS.getHt_no() == h.getHt_no()) {
							h.setHt_now(hS.getHt_now());
						}

					}
				}else if(h.getHt_cycle().equals("Weekly")) {
					for(HabitSum whS : Wsum) {
						if(whS.getHt_no() == h.getHt_no()) {
							h.setHt_now(whS.getHt_now());
						}
					}
					
				}else if(h.getHt_cycle().equals("Monthly")) {	
					
					for(HabitSum mhS : Msum) {
						if(mhS.getHt_no() == h.getHt_no()) {
							h.setHt_now(mhS.getHt_now());
						}
					}
				}
				
				hlist.add(h);
			}
			
			System.out.println("목록 확인 :" + hlist);

			if(list != null) {
				mv.addObject("hlist", hlist);
				mv.setViewName("daily/habitTrackerGraph");
			} else {
				mv.addObject("message", "목록이 없습니다. 추가해 주세요.");
				mv.setViewName("daily/habitTrackerGraph");
			}
		
		}else {
			
			mv.addObject("msg","로그인 하셔야 이용할 수 있는 서비스 입니다.");
            mv.addObject("url","/memberLoginView.do");
			mv.setViewName("common/redirect");
		}
		
		return mv;
				
	}

@RequestMapping("deleteHabit.do")
public String deleteHabit(HttpServletRequest request,
								@RequestParam(value = "ht_no", required = false) String ht_no) {
	HttpSession session = request.getSession();
	Member member = (Member)session.getAttribute("loginUser");
	
	String id = member.getId();
	
	System.out.println("받아오니?" + id);
	System.out.println("넘어오니?" + ht_no);
	
	//map으로 가져가서 확인해주자
	HashMap<String, String> map = new HashMap<>();
	map.put("id", id);
	map.put("ht_no", ht_no);
	
	int result = dailyService.deleteHabit(map);
	
	if(result > 0) {
		return "redirect:htList.do";
	} else {
		return "redirect:htList.do";
	}
	
	
}

@RequestMapping("editHabitView.do")
public ModelAndView editHabitView(ModelAndView mv, HttpServletRequest request, @RequestParam(value = "ht_no", required = false) int ht_no) {

	HttpSession session = request.getSession();
	Member member = (Member)session.getAttribute("loginUser");
	
	String id = member.getId();
	
	Habit habit = new Habit();
	habit.setHt_no(ht_no);
	habit.setId(id);
	
	Habit h = dailyService.selectHabitNum(habit);
	
	System.out.println("잘 조회해 오나? " + h);

	if(h != null) {
		mv.addObject("habit", h);
		mv.setViewName("daily/habitEdit");
	} else {
		mv.addObject("msg","조회 실패");
        mv.addObject("url","/htList.do");
		mv.setViewName("common/redirect");
	}
	
	return mv;

}

@RequestMapping(value="selectGraphData.do" , method=RequestMethod.POST)
public void selectGraphData(HttpServletResponse response, HttpServletRequest request, String ht_no, String ht_cycle, String today) throws IOException {
		System.out.println(ht_no + ht_cycle + today);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		String id = member.getId();
		
		
		HashMap<String,String> map = new HashMap();
		map.put("id", id);
		map.put("ht_no", ht_no);
		map.put("ht_cycle",ht_cycle);
		map.put("today", today);
		
		ArrayList<Habit> habit = new ArrayList<Habit>();
		
		habit = dailyService.selectGraphData(map);
		
		System.out.println("잘 되는가요?"+habit);
		JSONArray HabitData = new JSONArray();
			
			// 이번 주로 조회한 습관 기록 배열에 담기
			for(Habit hd : habit) {
				
				JSONObject jObj = new JSONObject();
				jObj.put("ht_now", hd.getHt_now());
				jObj.put("ht_date", hd.getHt_start());
				
				HabitData.add(jObj);
				
			}
			
			JSONObject hdl = new JSONObject();
			
			hdl.put("hd", HabitData);
			
			out.print(hdl);
			out.flush();
			out.close();
			
	}
	
	// 습관 수정
	@RequestMapping("updateHabit.do")
	public String updateHabit(Habit habit, Model model,
			HttpServletRequest request, HttpServletResponse response) throws IOException {


		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String id = member.getId();
		
		habit.setId(id); // 세션에서 받아온 아이디 저장
		
		System.out.println("확인" + habit);
		int result = dailyService.updateHabit(habit);
		
		if(result > 0) {
		
		return "redirect:htList.do";
		
		} else {
	
		model.addAttribute("msg","습관 등록에 실패하셨습니다. 다시 시도해 주세요.");
		model.addAttribute("url","/htList.do");
		
		return "common/redirect";
		
		}

	}
	
	// 북마크 리스트 불러오기
	@RequestMapping("bookmarkView.do")
	public ModelAndView bookmarkView(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
									@RequestParam(value="bl_no", required=false) String blNum,
									@RequestParam(value="mb_no", required=false) String mbNum,
									@RequestParam(value="ub_no", required=false) String ubNum) {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		ArrayList<Bookmark> bookmark = new ArrayList();
		
		bookmark = dailyService.selectBookmarkGroupList(id);
		
		System.out.println("잘 불러옵니까?" + bookmark);
		
		if(bookmark != null) {
			
			mv.addObject("ubNum", ubNum);
			mv.addObject("mbNum", mbNum);
			mv.addObject("blNum", blNum);
			mv.addObject("bm", bookmark);
			mv.setViewName("daily/bookmarkList");
		} else {
			mv.addObject("message", "목록이 없습니다. 추가해 주세요.");
			mv.setViewName("daily/bookmarkList");
		}
		
		return mv;
	}
	
	@RequestMapping("addBookmarkView.do")
	public String addbookmarkView() {
		
		return "daily/bookmarkGroupAdd";
	}
	
	// 북마크 그룹 생성
	@RequestMapping("insertBookmark.do")
	public String insertBookmark(Bookmark bm, Model model,
								HttpServletRequest request, HttpServletResponse response,
								@RequestParam(value="file", required=false) MultipartFile file) {
		
		System.out.println("받아온 bm" + bm);
		
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String id = member.getId();
		bm.setId(id);
		
		if(!file.getOriginalFilename().equals("")) {
			
			String renameFile = saveFile(file, bm, request);
			
			bm.setBl_origin(file.getOriginalFilename());
			bm.setBl_rename(renameFile);
			
//			System.out.println("새로 세팅한 bm :" + bm);
		}
		
		int result = dailyService.insertBookmarkGroup(bm);
		
		
		if(result > 0) {
			
			return "redirect:bookmarkView.do";
			
		}else {
			
            model.addAttribute("msg","북마크 등록 실패, 다시 시도해 주세요.");
            model.addAttribute("url","/addBookmarkView.do");
			
			return "common/redirect";
		}
		
	}
	
	// 저장 파일 이름 변경
	public String saveFile(MultipartFile file, Bookmark bm, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "/bluploadFiles/";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// 업로드 시간을 기준으로 파일명 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		
		String originFileName = file.getOriginalFilename();
		
		// 파일명 앞에 '사용자 아이디_' 추가
		String renameFileName = bm.getId() + "_" + sdf.format(new java.sql.Date(System.currentTimeMillis()))
									+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String filePath = folder + "/" + renameFileName;
		
		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
		
	}
	
	// 북마크 그룹 삭제
	@RequestMapping("deleteBookmark.do")
	public String deleteBookmark(HttpServletRequest request, HttpServletResponse response, Model model,
			 					@RequestParam(value = "bl_no", required = false) String bl_no) {
		
	
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String id = member.getId();
		
		Bookmark bm = new Bookmark();
		bm.setId(id);
		bm.setBl_no(bl_no);
		
		int result = dailyService.deleteBookmark(bm);
		
		System.out.println(result);
		if(result > 0) {
			
			return "redirect:bookmarkView.do";
			
		}else {
			
			model.addAttribute("msg","북마크 삭제 실패, 다시 시도해 주세요.");
            model.addAttribute("url","/BookmarkView.do");
			
			return "common/redirect";
			
		}
			
	}
	
	// 북마크 그룹 수정 페이지
	@RequestMapping("editBookmarkView.do")
	public String editBookmark(HttpServletRequest request, HttpServletResponse response, Model model,
			 					@RequestParam(value = "bl_no", required = false) String bl_no) { // 리다이렉트시 넘어온 값 받기
		
	
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String id = member.getId();
		
		Bookmark bm = new Bookmark();
		bm.setId(id);
		bm.setBl_no(bl_no);
		
		Bookmark result = dailyService.selectBookmark(bm);
		
		System.out.println(result);
		
		if(result != null) {
		
			model.addAttribute("bm", result);
			return "daily/bookmarkGroupEdit";
			
		}else {
			
			model.addAttribute("msg","북마크 삭제 실패, 다시 시도해 주세요.");
            model.addAttribute("url","/BookmarkView.do");
			
			return "common/redirect";
			
		}
			
	}
	
	@RequestMapping("editBookmark.do")
	public String updateBookmark(Bookmark bm, Model model,
								HttpServletRequest request, HttpServletResponse response,
								@RequestParam(value="file", required=false) MultipartFile file) {
		
		
//		System.out.println("받아온 bm " + bm);
//		System.out.println("file " + file);
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String id = member.getId();
		bm.setId(id);
		
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/bluploadFiles/";
		
		String rFile = bm.getBl_rename();
		String oFile = bm.getBl_origin();
		
//		System.out.println("원래 리네임 파일" + rFile);
//		System.out.println("원래 오리진 파일" + oFile);
		
		// 프로필 사진 저장
		if(!file.getOriginalFilename().equals("")) {
			
			String renameFile = saveFile(file, bm, request);
			
			bm.setBl_origin(file.getOriginalFilename());
			bm.setBl_rename(renameFile);
			
			System.out.println("세팅한 bm" + bm);
			
			if(rFile != null) { 
				
				File reFile = new File(savePath + rFile);
				reFile.delete();// 기존에 있던 사진파일 삭제
			}
			
		}else {
			// 기존 사진 파일 유지
			bm.setBl_origin(oFile);
			bm.setBl_rename(rFile);
		}
		
		
		int result = dailyService.updateBookmarkGroup(bm);
		
		
		if(result > 0) {
			
			return "redirect:bookmarkView.do";
			
		}else {
			
            model.addAttribute("msg","북마크 수정 실패, 다시 시도해 주세요.");
            model.addAttribute("url","/editBookmarkView.do");
			
			return "common/redirect";
		}
		
	}
	
	// 지도 북마크 폼으로 이동
	@RequestMapping("addBookmarkMapView.do")
	public String addMapView(Model model, @RequestParam(value="bl_no", required=true) String bl_no) {
		
		model.addAttribute("bl_no", bl_no);
		return "daily/bookmarkMapAdd";
	}
	
	// 링크 북마크 폼으로 이동
	@RequestMapping("addBookmarkUrlView.do")
	public String addUrlView(Model model, @RequestParam(value="bl_no", required=true) String bl_no) {
		
		model.addAttribute("bl_no", bl_no);
		return "daily/bookmarkUrlAdd";
	}
	
	// 지도 북마크 추가
	@RequestMapping("addBookmarkMap.do")
	public String addBookrmarkMap(BookmarkMap bmm, Model model,
									HttpServletRequest request, HttpServletResponse response,
									RedirectAttributes redirectAttributes,
									@RequestParam(value="mainAddress", required=true) String mainAddress,
									@RequestParam(value="subAddress", required=false) String subAddress) {
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String id = member.getId();
		
		bmm.setId(id);
		bmm.setMb_address(mainAddress+"_"+subAddress);
		
		System.out.println("값 어떻게 들어오나? :" + bmm);
		
		
		int result = dailyService.insertBookmarkMap(bmm);
		
		
		if(result > 0) {
			
			redirectAttributes.addAttribute("bl_no", bmm.getBl_no()); // 리다이렉트시 값 넘기기
			return "redirect:bookmarkView.do";
		}else {
			
			model.addAttribute("msg","지도 북마크 등록 실패, 다시 시도해 주세요.");
            model.addAttribute("url","/addBookmarkMapView.do");
			
			return "common/redirect";
			
		}
		
	
	}
	
	// 링크 북마크 추가
	@RequestMapping("addBookmarkUrl.do")
	public String addBookrmarkUrl(BookmarkUrl ub, Model model,
									HttpServletRequest request,
									RedirectAttributes redirectAttributes) {
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String id = member.getId();
		
		ub.setId(id);
		
//		System.out.println("ub 값 어떻게 들어오나? :" + ub);
		
		int result = dailyService.insertBookmarkUrl(ub);
		
		if(result > 0) {
			
			redirectAttributes.addAttribute("bl_no", ub.getBl_no());
			return "redirect:bookmarkView.do";
		}else {
			
			model.addAttribute("msg","지도 북마크 등록 실패, 다시 시도해 주세요.");
            model.addAttribute("url","/addBookmarkMapView.do");
			
			return "common/redirect";
			
		}
		
	}
	
	// 지도 북마크 리스트 뿌려주기
	@RequestMapping("selectBookmarkMapList.do")
	public void SelectBookmarkMapList(Model model,
			HttpServletRequest request, HttpServletResponse response, String bl_no) throws IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		BookmarkMap bm = new BookmarkMap();
		bm.setBl_no(bl_no);
		bm.setId(id);
		
		ArrayList<BookmarkMap> mblist = dailyService.selectBookmarkMapList(bm);
		
//		System.out.println("널인지?" + mblist);
		
		JSONArray mbList = new JSONArray();
			
			// 이번 주로 조회한 습관 기록 배열에 담기
			for(BookmarkMap mb : mblist) {
				
				JSONObject jObj = new JSONObject();
				jObj.put("mb_title", mb.getMb_title());
				jObj.put("mb_phone", mb.getMb_phone());
				jObj.put("mb_no", mb.getMb_no());
				
				mbList.add(jObj);
				
			}
			
			JSONObject mbl = new JSONObject();
			
			mbl.put("mbl", mbList);
			
			out.print(mbl);
			out.flush();
			out.close();
		
		
	}
	
	
	// 지도 북마크 리스트
	@RequestMapping("selectBookmarkMap.do")
	public void selectBookmarkMap(HttpServletRequest request, HttpServletResponse response,
									String mb_no) throws IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		BookmarkMap bm = new BookmarkMap();
		bm.setMb_no(mb_no);
		bm.setId(id);
		
		BookmarkMap bmMap = dailyService.selectBookmarkMap(bm);
		
//		String mb_address[] = bmMap.getMb_address().split("_");
//        
//        for(int i=0 ; i<mb_address.length ; i++) {
//            System.out.println("mb_address["+i+"] : "+mb_address[i]);
//        }
		
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("mb_title", bmMap.getMb_title());
		jObj.put("mb_phone", bmMap.getMb_phone());
		jObj.put("mb_no", bmMap.getMb_no());
		jObj.put("mb_address", bmMap.getMb_address());
		jObj.put("mb_time", bmMap.getMb_time());
		jObj.put("mb_memo", bmMap.getMb_memo());

		out.print(jObj);
		out.flush();
		out.close();
		
		
	}
	
	
	// 지도 북마크 수정 폼
	@RequestMapping("editBookmarkMapView.do")
	public String editBookmarkMapView(Model model,
					HttpServletRequest request, HttpServletResponse response,
					String mb_no) throws IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		BookmarkMap bm = new BookmarkMap();
		bm.setMb_no(mb_no);
		bm.setId(id);
		
		BookmarkMap bmMap = dailyService.selectBookmarkMap(bm);
		
		if(bmMap != null) {
			
			model.addAttribute("bmMap", bmMap);
			
			return "daily/bookmarkMapEdit";
			
		}else {
			
			model.addAttribute("msg","오류 발생, 다시 시도해 주세요.");
            model.addAttribute("url","/bookmarkView.do");
			
			return "common/redirect";
			
		}
		
	}
	
	
	// 지도 북마크 수정
	@RequestMapping("editBookmarkMap.do")
	public String editBookmarkMap(Model model, HttpServletRequest request, HttpServletResponse response,
									RedirectAttributes redirectAttributes, BookmarkMap bm,
									@RequestParam(value="mainAddress", required=false) String mainAddress,
									@RequestParam(value="subAddress", required=false) String subAddress) throws IOException {
		

		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		bm.setId(id);
		bm.setMb_address(mainAddress + "_" + subAddress);
		
		int result = dailyService.updateBookmarkMap(bm);
		
		if(result > 0) {
			
			redirectAttributes.addAttribute("bl_no", bm.getBl_no());
			redirectAttributes.addAttribute("mb_no", bm.getMb_no());
			return "redirect:bookmarkView.do";
			
		}else {

			model.addAttribute("msg","오류 발생, 다시 시도해 주세요.");
            model.addAttribute("url","/bookmarkView.do");
			
			return "common/redirect";
		}
		
		
	}
	
	// 지도 북마크 삭제
	@RequestMapping("deleteBookmarkMap.do")
	public void deleteBookmarkMap(Model model, HttpServletRequest request, HttpServletResponse response,
									RedirectAttributes redirectAttributes, BookmarkMap bm) throws IOException{
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		bm.setId(id);
		
//		System.out.println("bm : " + bm);
		
		int result = dailyService.deleteBookmarkMap(bm);
		
		System.out.println(result);
		 
		if(result > 0) {
	    	out.print("success");
	    	out.flush();
	    	out.close();
	    } else {
	    	out.print("failed");
	    	out.flush();
	    	out.close();
	    }
	}
	
	
	
	
	@RequestMapping("selectBookmarkUrlList.do")
	public void SelectBookmarkUrlList(Model model,
			HttpServletRequest request, HttpServletResponse response, String bl_no) throws IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		BookmarkUrl bu = new BookmarkUrl();
		bu.setBl_no(bl_no);
		bu.setId(id);
		
		ArrayList<BookmarkUrl> ublist = dailyService.selectBookmarkUrlList(bu);
		
		System.out.println("ublist? : " +ublist);
		
		JSONArray ubList = new JSONArray();
			
			for(BookmarkUrl ub : ublist) {
				
				JSONObject jObj = new JSONObject();
				jObj.put("ub_no", ub.getUb_no());
				jObj.put("ub_title", ub.getUb_title());
				jObj.put("ub_con", ub.getUb_con());
				jObj.put("ub_url", ub.getUb_url());
				
				ubList.add(jObj);
				
			}
			
			JSONObject ubl = new JSONObject();
			
			ubl.put("ubl", ubList);
			
			out.print(ubl);
			out.flush();
			out.close();
		
	}
	
	// 지도 북마크 수정 폼
	@RequestMapping("editBookmarkUrlView.do")
	public String editBookmarkUrlView(Model model,
					HttpServletRequest request, HttpServletResponse response,
					String ub_no) throws IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		BookmarkUrl bu = new BookmarkUrl();
		bu.setUb_no(ub_no);
		bu.setId(id);
		
		BookmarkUrl bmUrl = dailyService.selectBookmarkUrl(bu);
		
		if(bmUrl != null) {
			
			model.addAttribute("bmUrl", bmUrl);
			
			return "daily/bookmarkUrlEdit";
			
		}else {
			
			model.addAttribute("msg","오류 발생, 다시 시도해 주세요.");
            model.addAttribute("url","/bookmarkView.do");
			
			return "common/redirect";
			
		}
		
	}
	
	
	// 지도 북마크 수정
	@RequestMapping("editBookmarkUrl.do")
	public String editBookmarkUrl(Model model, HttpServletRequest request, HttpServletResponse response,
									RedirectAttributes redirectAttributes, BookmarkUrl bu) throws IOException {
		

		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		bu.setId(id);
		
		System.out.println("북마크 링크 편집 : " + bu);
		
		
		int result = dailyService.updateBookmarkUrl(bu);
		
		if(result > 0) {
			
			redirectAttributes.addAttribute("bl_no", bu.getBl_no());
			redirectAttributes.addAttribute("ub_no", bu.getUb_no());
			return "redirect:bookmarkView.do";
			
		}else {

			model.addAttribute("msg","오류 발생, 다시 시도해 주세요.");
            model.addAttribute("url","/editBookmarkUrlView.do");
			
			return "common/redirect";
		}
		
		
	}
	
	
	// 지도 북마크 삭제
	@RequestMapping("deleteBookmarkUrl.do")
	public void deleteBookmarkUrl(Model model, HttpServletRequest request, HttpServletResponse response,
									RedirectAttributes redirectAttributes, BookmarkUrl bu) throws IOException{
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		bu.setId(id);
		
		System.out.println("bu : " + bu);
		
		int result = dailyService.deleteBookmarkUrl(bu);
		
		System.out.println(result);
		 
		if(result > 0) {
	    	out.print("success");
	    	out.flush();
	    	out.close();
	    } else {
	    	out.print("failed");
	    	out.flush();
	    	out.close();
	    }
	}
	
	// 일기 목록
	@RequestMapping("dailyRecordView.do")
	public ModelAndView dailyRecordView(ModelAndView mv, HttpServletRequest request, HttpServletResponse response
							, @RequestParam(value="page", required=false) Integer page) {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = dailyService.getListCount(id);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<DailyRecord> drlist = dailyService.selectDailyRecordList(id, pi);
		
		System.out.println("1페이지 : " + drlist);
		
		if(drlist != null) {
			
			mv.addObject("pi", pi);
			mv.addObject("drlist", drlist);
			mv.setViewName("daily/dailyRecordBoard");
			
		}else {
			
//			mv.addObject("drlist", drlist);
//			mv.setViewName("daily/dailyRecordBoard");
			
		}
		
		return mv;
	}
	
	
	@RequestMapping("addDailyRecordView.do")
	public String addDailyRecordView(Model model, @RequestParam(value="dr_no", required=false) String dr_no) {
		
		model.addAttribute("dr_no", dr_no);
		return "daily/dailyRecordAdd";
	}
	
	
	@RequestMapping("addDailyRecord.do")
	public String addDailyRecord(Model model, HttpServletRequest request, DailyRecord dr
								, @RequestParam(value="file", required=false) List<MultipartFile> file
								, @RequestParam(value="dr_no", required=false) String dr_no_before) {
		
//		System.out.println("dr_no ?? :" + dr_no_before);
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/druploadFiles/";
		
		System.out.println(savePath);
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		System.out.println("dr : " + dr);
		
		dr.setId(id);
		
		String dr_no = "";
		
		ArrayList<DailyRecord> drlist = dailyService.selectDailyRecordList_a(id);

		if(dr_no_before.equals("undefined")) {	
			
			if(!drlist.isEmpty()) {
				
				int dr_no_after = Integer.parseInt(drlist.get(drlist.size()-1).getDr_no()) + 1;
				dr_no = Integer.toString(dr_no_after);
				
			}else {
				
				dr_no = "1";
			}
			
			
		}else {
			
			int dr_no_after = Integer.parseInt(drlist.get(drlist.size()-1).getDr_no()) + 1;
			dr_no = Integer.toString(dr_no_after);
			
		}
		
		int result = dailyService.insertDailyRecord(dr);
		
		ArrayList<DailyRecordPhoto> drplist  = new ArrayList<>();
		
		
		if(result > 0) {
				
				for(MultipartFile mf : file) {
					
					String originFileName = mf.getOriginalFilename();
						
						if(!mf.getOriginalFilename().equals("")) {
						
						// 파일명 앞에 '사용자 아이디_' 추가
						String renameFileName = id + "_" + System.currentTimeMillis()
													+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
						
						String filePath = folder + "/" + renameFileName;
						
						DailyRecordPhoto drp = new DailyRecordPhoto();
						drp.setDrp_origin(originFileName);
						drp.setDrp_rename(renameFileName);
						drp.setDr_no(dr_no);
						
						int result_drp = dailyService.insertDailyRecordPhoto(drp);
						
						try {
							mf.transferTo(new File(filePath));
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						drplist.add(drp);
						
						}
					
				}
				
				if(!drplist.isEmpty()) {
					int pResult = dailyService.updateDailyRecordThumbnail(drplist.get(drplist.size()-1));
				}
				
				return "redirect:dailyRecordView.do";
			
			
		} else {
		
			model.addAttribute("msg","글쓰기 실패, 다시 시도해 주세요.");
            model.addAttribute("url","/addDailyRecordView.do");
			
			return "common/redirect";
		}
	}
	
	
	@RequestMapping("dailyRecordDetailView.do")
	public ModelAndView dailyRecordDetailView(ModelAndView mv, HttpServletRequest request
										, @RequestParam(value="dr_no", required=true) String dr_no) {
		
//		System.out.println(dr_no);
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		
		String id = member.getId();
		
		//map으로 가져가서 확인해주자
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("dr_no", dr_no);
		
		DailyRecord dr = dailyService.selectDailyRecord(map);
		ArrayList<DailyRecordPhoto> drplist = dailyService.selectDailyRecordPhotoList(dr_no);
		
//		System.out.println("dr : " + dr);
//		System.out.println("drplist : " + drplist);
		
		
		mv.addObject("drplist", drplist);
		mv.addObject("dr", dr);
		mv.setViewName("daily/dailyRecordDetail");
		
		return mv; 
	}
	
	
	@RequestMapping("editDailyRecordView.do")
	public ModelAndView EditdailyRecordView(ModelAndView mv, HttpServletRequest request
										, DailyRecord dr
										, @RequestParam(value="drp_rename", required=false) String drp_rename
										, @RequestParam(value="drp_no", required=false) String drp_no) {
		
//		System.out.println("drp_rename" + drp_rename);
//		System.out.println("drp_no" + drp_no);
//		System.out.println("dr : " + dr);

		mv.addObject("drp_no", drp_no);
		mv.addObject("drp_rename", drp_rename);
		mv.addObject("dr", dr);
		mv.setViewName("daily/dailyRecordEdit");
		
		return mv;
	}
	
	@RequestMapping("editDailyRecord.do")
	public String EditDailyRecord(Model model, DailyRecord dr, HttpServletRequest request
										, @RequestParam(value="drp_left", required=false) String left_name
										, @RequestPart(value="file", required=false) List<MultipartFile> file
										, @RequestParam(value="remove_no", required=false) String remove_no) {
		
//		System.out.println("dr : " + dr);
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String id = member.getId();
		dr.setId(id);
		
		// 인서트
		int result = dailyService.updateDailyRecord(dr);
		
		if(result > 0) {
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/druploadFiles/";
			
			System.out.println(savePath);
			
			File folder = new File(savePath);
			
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			String remove_no_[] = remove_no.split(","); // 삭제된 파일 번호
			String left_no_[] = left_name.split(","); // 남은 파일 이름
			
			if(!remove_no.equals("")) {
				
				for(int i = 0 ; i < remove_no_.length ; i++) {
					
					System.out.println(remove_no_[i]);
					
					// 사진 파일 삭제
					int drp_update = dailyService.updateDailyRecordPhoto(remove_no_[i]);
					
					if(drp_update > 0) {
						
						File reFile = new File(savePath + remove_no_[i]);
						reFile.delete();// 기존에 있던 사진파일 삭제
						
					}else {
						
						model.addAttribute("msg","수정 실패, 다시 시도해 주세요.");
			            model.addAttribute("url","/dailyRecordView.do");
						
						return "common/redirect";
						
					}
					
				}
				
				if(!left_name.equals("")) {
				
					DailyRecordPhoto drp_thumbnail = new DailyRecordPhoto();
					drp_thumbnail.setDr_no(dr.getDr_no());
					drp_thumbnail.setDrp_rename(left_no_[0]);
					
					int dr_thumbname_re = dailyService.updateDailyRecordThumbnail(drp_thumbnail);
				}
				
			}
			
			ArrayList<DailyRecordPhoto> drplist  = new ArrayList<>();
		
			for(MultipartFile mf : file) {
				
				String originFileName = mf.getOriginalFilename();
				
				if(!mf.getOriginalFilename().equals("")) {
				
						// 파일명 앞에 '사용자 아이디_' 추가
						String renameFileName = id + "_" + System.currentTimeMillis()
													+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
						
						String filePath = folder + "/" + renameFileName;
						
						DailyRecordPhoto drp = new DailyRecordPhoto();
						drp.setDrp_origin(originFileName);
						drp.setDrp_rename(renameFileName);
						drp.setDr_no(dr.getDr_no());
						
//						System.out.println("drp : "  + drp);
						
						int result_drp = dailyService.insertDailyRecordPhoto(drp);
						
						try {
							mf.transferTo(new File(filePath));
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						drplist.add(drp);
					}
				}
			
				// 기존 사진을 전부 지우고, 올린 사진이 있을 경우
				if(!drplist.isEmpty() && left_name.equals("")) {
					
					int pResult = dailyService.updateDailyRecordThumbnail(drplist.get(drplist.size()-1));
					
				} else if(drplist.isEmpty() && left_name.equals("")) {
					

					DailyRecordPhoto drp = new DailyRecordPhoto();
					drp.setDrp_rename("");
					drp.setDr_no(dr.getDr_no());
					
					int pResult = dailyService.updateDailyRecordThumbnail(drp);
					
				}
			
				
				System.out.println("drplist : " + drplist);
						
				return "redirect:dailyRecordDetailView.do?dr_no=" + dr.getDr_no();
			
		}else {
			
			model.addAttribute("msg","수정 실패, 다시 시도해 주세요.");
			model.addAttribute("url","/dailyRecordView.do");
		
			return "common/redirect";
		}
		
	}
	
	@RequestMapping("deleteDailyRecord.do")
	public String deleteDailyRecord(HttpServletRequest request, Model model,
									@RequestParam(value = "dr_no", required = false) String dr_no) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		String id = member.getId();
		
//		System.out.println("dr_no : " + dr_no);
		
		//map으로 가져가서 확인해주자
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("dr_no", dr_no);
		
		int result = dailyService.deleteDailyRecord(map);
		
		if(result > 0) {
			
			return "redirect:dailyRecordView.do";
			
		} else {
			model.addAttribute("msg","수정 실패, 다시 시도해 주세요.");
			model.addAttribute("url","/dailyRecordView.do");
		
			return "common/redirect";
		}
		
		
	}
	
	
	@RequestMapping("deleteDailyRecordC.do")
	public void deleteDailyRecordC(HttpServletRequest request, HttpServletResponse response,
									@RequestParam(value = "dr_no", required = false) String[] dr_no) throws IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		String id = member.getId();
		
//		System.out.println("에이작스 : " + dr_no);
		
		int result = 0;
		
		for(String dr_no_a : dr_no) {
			
			System.out.println("dr_no_a : " + dr_no_a);
			
			HashMap<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("dr_no", dr_no_a);
			
			result = dailyService.deleteDailyRecord(map);
			
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.print("success");
			out.flush();
			out.close();
		} else {
			out.print("failed");
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping("searchDailyRecordView.do")
	public ModelAndView searchDailyRecordView(ModelAndView mv, HttpServletRequest request
												, @RequestParam(value="select_item", required=false) String select_item
												, @RequestParam(value="title", required=false) String title
												, @RequestParam(value="date", required=false) String date
												, @RequestParam(value="page", required=false) Integer page) {
		
		System.out.println("select_item : " + select_item);
		System.out.println("title : " + title);
		System.out.println("date : " + date);
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String id = member.getId();
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("select_item", select_item);
		map.put("title", title);
		map.put("date", date);
		
		int listCount = dailyService.getListCountSearch(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<DailyRecord> drlist = dailyService.selectDailyRecordSearchList(map, pi);
		
		System.out.println("1페이지 : " + drlist);
		
		if(drlist != null) {
			
			mv.addObject("pi", pi);
			mv.addObject("drlist", drlist);
			mv.setViewName("daily/dailyRecordBoard");
			
		}else {
			
//			mv.addObject("drlist", drlist);
//			mv.setViewName("daily/dailyRecordBoard");
			
		}
		
		return mv;
	}
}
