package com.kh.finalProject.Diet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.Diet.model.service.DietService;
import com.kh.finalProject.Diet.model.vo.Inbody;
import com.kh.finalProject.Diet.model.vo.diet;
import com.kh.finalProject.member.model.vo.Member;
import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;

@Controller
public class DietController {

	
	@Autowired
	DietService dService;

	
	@RequestMapping("DietCalendarView.do") 
	public String DietCalendarView() { 
	  return "Diet/DietCalendarView";
//		return "<script> alert('식당 추가에 실패했습니다.'); history.back(); </script>";
	  }
	 

	@RequestMapping("DietDetail.do")
	public ModelAndView DietDetail(ModelAndView mv, HttpSession session,
			@RequestParam(value = "currentdate", required = false) String date) {

		String today = date;

		Member loginUser = (Member) session.getAttribute("loginUser");
		// 로그인 유저의 아이디와 날짜를 넘기기 위한 map
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", loginUser.getId());
		map.put("date", today);
		//check1
		Inbody inbody = dService.selectInbody(map);


		ArrayList<diet> dietlist = dService.selectDiet(map);


		// 뿌려줄것 리스트 만들기
		diet totaldiet = new diet(); // 전체
		float breakfast = 0; // 아침
		float morningSnack = 0; // 아침간식
		float Lunch = 0; // 점심
		float Lunchsnack = 0; // 점심간식
		float Dinner = 0; // 저녁
		float Dinnersnack = 0; // 저녁간식

		
		float car = 0;
		float pro = 0;
		float fat = 0;
		float na = 0;
		for (int i = 0; i < dietlist.size(); i++) {
			diet samplediet = dietlist.get(i);

			car += Float.valueOf(samplediet.getDiCar());
			pro += Float.valueOf(samplediet.getDiPro());
			fat += Float.valueOf(samplediet.getDiFat());
			na  += Float.valueOf(samplediet.getDiNa());

			totaldiet.setDiCar(String.valueOf(car));
			totaldiet.setDiPro(String.valueOf(pro));
			totaldiet.setDiFat(String.valueOf(fat));
			totaldiet.setDiNa(String.valueOf(na));

			if (samplediet.getDtWhen().equals("아침")) {
				breakfast += Float.valueOf(samplediet.getDiKcal());
			} else if (samplediet.getDtWhen().equals("아침간식")) {
				morningSnack += Float.valueOf(samplediet.getDiKcal());
			} else if (samplediet.getDtWhen().equals("점심")) {
				Lunch += Float.valueOf(samplediet.getDiKcal());
			} else if (samplediet.getDtWhen().equals("점심간식")) {
				Lunchsnack += Float.valueOf(samplediet.getDiKcal());
			} else if (samplediet.getDtWhen().equals("저녁")) {
				Dinner += Float.valueOf(samplediet.getDiKcal());
			} else if (samplediet.getDtWhen().equals("저녁간식")) {
				Dinnersnack += Float.valueOf(samplediet.getDiKcal());
			}

		}

		mv.addObject("breakfast", breakfast).addObject("morningSnack", morningSnack).addObject("Lunch", Lunch)
				.addObject("Lunchsnack", Lunchsnack).addObject("Dinner", Dinner).addObject("Dinnersnack", Dinnersnack);
		mv.addObject("totaldiet", totaldiet).addObject("dietlist", dietlist).addObject("inbody", inbody)
				.addObject("today", today).setViewName("Diet/TodayDietDetail");

		return mv;
	}

	@RequestMapping("TodayDietInsertView.do")
	public ModelAndView TodayDietInsertView(ModelAndView mv,
			@RequestParam(value = "today", required = false) String date,
			@RequestParam(value = "dietwhen", required = false) String dietwhen) {

		String today = date;
		String dietwhentime = dietwhen;

		mv.addObject("dietwhentime", dietwhentime).addObject("today", today).setViewName("Diet/TodayDietInsertView");

		return mv;
	}

	@RequestMapping("InbodyInsertView.do")
	public ModelAndView InbodyInsertView(ModelAndView mv,
			@RequestParam(value = "today", required = false) String date) {


		String today = date;
		mv.addObject("today", today).setViewName("Diet/InbodyInsertView");
		return mv;
	}
	
	@RequestMapping("InbodyEditView.do")
	public ModelAndView InbodyEditView(ModelAndView mv,HttpSession session,
			@RequestParam(value = "today", required = false) String date) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		// 로그인 유저의 아이디와 날짜를 넘기기 위한 map
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", loginUser.getId());
		map.put("date", date);
		
		Inbody inbody = dService.selectInbody(map);

		mv.addObject("inbody", inbody).addObject("today", date).setViewName("Diet/InbodyEditView");
		return mv;
	}
	
	@RequestMapping("InbodyInsert.do")
	public String InbodyInsert(HttpSession session, HttpServletRequest request, Inbody inbody) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		inbody.setId(loginUser.getId());


		int result = dService.InbodyInsert(inbody);

		if (result > 0) {
			return "redirect:DietDetail.do?currentdate=" + inbody.getInDate();
		} else {
			return "<script> alert('인바디 등록이 실패했습니다.'); history.back(); </script>";
		}
	}

	@RequestMapping("DietInsert.do")
	public String DietInsert(HttpSession session, HttpServletRequest request, diet diet,
			@RequestParam(value = "foodCount", required = false) int foodCount,
			@RequestParam(value = "foodCountUnit", required = false) String foodCountUnit) {

		// 수량 갯수만큼 칼로리 등등을 곱해줌.
		diet.setDiKcal(String.valueOf((Float.valueOf(diet.getDiKcal()) * foodCount)));
		diet.setDiCar(String.valueOf((Float.valueOf(diet.getDiCar()) * foodCount)));
		diet.setDiPro(String.valueOf((Float.valueOf(diet.getDiPro()) * foodCount)));
		diet.setDiFat(String.valueOf((Float.valueOf(diet.getDiFat()) * foodCount)));
		diet.setDiNa(String.valueOf((Float.valueOf(diet.getDiNa()) * foodCount)));

		// 수량
		String diAmount = foodCount +" "+ foodCountUnit;
		diet.setDiAmount(diAmount);

		// 유저 아이디가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		diet.setId(loginUser.getId());



		int result = dService.DietInsert(diet);

		if (result > 0) {
			return "redirect:DietDetail.do?currentdate=" + diet.getDtDate();
		} else {
			return "<script> alert('식당 추가에 실패했습니다.'); history.back(); </script>";
		}

	}
	
	//ajax
	@RequestMapping("todayDietDetailAjax.do")
	public void todayDietDetailAjax(HttpSession session
										,HttpServletResponse response,
										String today, String dtwhen) throws IOException {
		response.setContentType("application/json;charset=utf-8");

		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", loginUser.getId());
		map.put("today", today);
		map.put("dtwhen",dtwhen);
		
		ArrayList<diet> diet = new ArrayList();
		
		diet = dService.selectTodayDiet(map);
		
		
		JSONArray jarr = new JSONArray();
		for(diet dt: diet) {
			JSONObject jDiet = new JSONObject();
//			이름, 칼로리  ( 더 넣어주고 싶은 내용있으면 여기서 추가해주자.)
			jDiet.put("diNo",dt.getDiNo());
			jDiet.put("foodname",dt.getDiFood());
			jDiet.put("kcal",dt.getDiKcal());
			jDiet.put("amount", dt.getDiAmount());
			
			jarr.add(jDiet);
		}
		JSONObject sendJson = new JSONObject();
		
		sendJson.put("list",jarr);
		
		PrintWriter out = response.getWriter();
		
		out.print(sendJson);
		out.flush();
		out.close();
		
		
		
	}
	
	@RequestMapping("fooddetail.do")
	public ModelAndView fooddetail(ModelAndView mv,HttpSession session,
								@RequestParam(value = "today", required = false) String today
									,@RequestParam(value = "foodname", required = false) String foodname
									,@RequestParam(value = "foodwhen", required = false) String foodwhen) {
		String[] str = foodname.split(" ");	//음식이름과 양을 나눠주자

		String amount = str[1]+ " " + str[2];
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//map으로 가져가서 확인해주자
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", loginUser.getId());
		map.put("today", today);
		map.put("foodname", str[0]);
		map.put("amount", amount);
		map.put("foodwhen", foodwhen);

		diet diet = dService.fooddetail(map);
		

		String[] str2 = diet.getDiAmount().split(" ");
		
		
		mv.addObject("foodCount", str2[0]).addObject("FoodCountUnit", str2[1]).addObject("diet", diet).setViewName("Diet/todayDietEditView");
		
		return mv;
	}
	
	@RequestMapping("DietEdit.do")
	public String DietEdit(HttpSession session, HttpServletRequest request, diet diet,
			@RequestParam(value = "foodCount", required = false) int foodCount,
			@RequestParam(value = "foodCountUnit", required = false) String foodCountUnit) {

		// 수량 갯수만큼 칼로리 등등을 곱해줌.
		diet.setDiKcal(String.valueOf((Float.valueOf(diet.getDiKcal()) * foodCount)));
		diet.setDiCar(String.valueOf((Float.valueOf(diet.getDiCar()) * foodCount)));
		diet.setDiPro(String.valueOf((Float.valueOf(diet.getDiPro()) * foodCount)));
		diet.setDiFat(String.valueOf((Float.valueOf(diet.getDiFat()) * foodCount)));
		diet.setDiNa(String.valueOf((Float.valueOf(diet.getDiNa()) * foodCount)));
		
		
		// 수량
		String diAmount = foodCount +" "+ foodCountUnit;
		diet.setDiAmount(diAmount);

		// 유저 아이디가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		diet.setId(loginUser.getId());



		int result = dService.DietEdit(diet);

		if (result > 0) {
			return "redirect:DietDetail.do?currentdate=" + diet.getDtDate();
		} else {
			return "<script> alert('식당 업데이트에 실패했습니다.'); history.back(); </script>";
		}

	}
	
	@RequestMapping("eventDiet.do")
	public void eventDiet(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=utf-8");

		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		ArrayList<diet> Diet= dService.selectAllDiet(id);

		
		ArrayList<Inbody> Inbody = dService.selectAllInbody(id);

		JSONArray jArr = new JSONArray();
		
		for(diet m : Diet) {
			JSONObject jObj = new JSONObject();
			jObj.put("kinds","diet");
			jObj.put("eventTitle", m.getDiKcal());
			jObj.put("date", m.getDtDate());
			
			jArr.add(jObj);
		}
		
		for(Inbody i : Inbody) {
			JSONObject jObj = new JSONObject();
			jObj.put("kinds","inbody");
			jObj.put("eventTitle", i.getInWeight());
			jObj.put("date", i.getInDate());
			
			jArr.add(jObj);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("DietList", jArr);
		

		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	
	@RequestMapping("DietGraphView.do")
	public ModelAndView DietGraphView(ModelAndView mv,HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		ArrayList<Inbody> Inbody = dService.selectAllInbody(id);
		


		
		mv.addObject("dataPointsList", Inbody).setViewName("Diet/DietGraphView");
		
		
		
		return mv;
	}
	
	@RequestMapping("todayDietAjax.do")
	public void todayDietAjax(HttpSession session, HttpServletResponse response,
									String currentdate) throws IOException {
		response.setContentType("application/json;charset=utf-8");

		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", loginUser.getId());
		map.put("date", currentdate);

		ArrayList<diet> Diet= dService.selectDiet(map);

		
		// 뿌려줄것 리스트 만들기
				float breakfast = 0; // 아침
				float morningSnack = 0; // 아침간식
				float Lunch = 0; // 점심
				float Lunchsnack = 0; // 점심간식
				float Dinner = 0; // 저녁
				float Dinnersnack = 0; // 저녁간식



				for (int i = 0; i < Diet.size(); i++) {
					diet samplediet = Diet.get(i);


					if (samplediet.getDtWhen().equals("아침")) {
						breakfast += Float.valueOf(samplediet.getDiKcal());
					} else if (samplediet.getDtWhen().equals("아침간식")) {
						morningSnack += Float.valueOf(samplediet.getDiKcal());
					} else if (samplediet.getDtWhen().equals("점심")) {
						Lunch += Float.valueOf(samplediet.getDiKcal());
					} else if (samplediet.getDtWhen().equals("점심간식")) {
						Lunchsnack += Float.valueOf(samplediet.getDiKcal());
					} else if (samplediet.getDtWhen().equals("저녁")) {
						Dinner += Float.valueOf(samplediet.getDiKcal());
					} else if (samplediet.getDtWhen().equals("저녁간식")) {
						Dinnersnack += Float.valueOf(samplediet.getDiKcal());
					}

				}
				
			
					JSONObject jDiet = new JSONObject();
//					이름, 칼로리  ( 더 넣어주고 싶은 내용있으면 여기서 추가해주자.)
					jDiet.put("breakfast",breakfast);
					jDiet.put("morningSnack",morningSnack);
					jDiet.put("Lunch", Lunch);
					jDiet.put("Lunchsnack", Lunchsnack);
					jDiet.put("Dinner", Dinner);
					jDiet.put("Dinnersnack", Dinnersnack);
					
				
				JSONObject sendJson = new JSONObject();
				
				sendJson.put("list",jDiet);
				
				PrintWriter out = response.getWriter();
				
				out.print(sendJson);
				out.flush();
				out.close();				
				
		
	}

	@RequestMapping("deleteAjax.do")
	public String deleteAjax(HttpSession session
			,HttpServletResponse response,String chknum,String currentdate) throws IOException {
		response.setContentType("application/json;charset=utf-8");		

		
		String[] arr = chknum.split(",");
		
		for(int i =0;i < arr.length ; i++) {
		System.out.println("arr : " + arr[i]);
		int result = dService.deletDiet(arr[i]);
		}
		
		return "redirect:DietDetail.do?currentdate=" + currentdate;
		
		
		
	}
	
	@RequestMapping("InbodyEdit.do")
	public String InbodyEdit(HttpSession session, HttpServletRequest request, Inbody inbody) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		inbody.setId(loginUser.getId());
		
		int result = dService.InbodyEdit(inbody);
		
		if(result >0) {
			return "redirect:DietDetail.do?currentdate=" +  inbody.getInDate(); 
		}else {
			return "<script> alert('인바디 등록이 실패했습니다.'); history.back(); </script>";
		}
	}
	
}
