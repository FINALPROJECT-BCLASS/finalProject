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
		System.out.println("에욱" + date);
		String today = date;

		Member loginUser = (Member) session.getAttribute("loginUser");
		// 로그인 유저의 아이디와 날짜를 넘기기 위한 map
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", loginUser.getId());
		map.put("date", today);

		Inbody inbody = dService.selectInbody(map);

		System.out.println(inbody);
		ArrayList<diet> dietlist = dService.selectDiet(map);

		System.out.println(dietlist);
		// 뿌려줄것 리스트 만들기
		diet totaldiet = new diet(); // 전체
		int breakfast = 0; // 아침
		int morningSnack = 0; // 아침간식
		int Lunch = 0; // 점심
		int Lunchsnack = 0; // 점심간식
		int Dinner = 0; // 저녁
		int Dinnersnack = 0; // 저녁간식

		
		int car = 0;
		int pro = 0;
		int fat = 0;
		int na = 0;
		for (int i = 0; i < dietlist.size(); i++) {
			diet samplediet = dietlist.get(i);

			car += samplediet.getDiCar();
			pro += samplediet.getDiPro();
			fat += samplediet.getDiFat();
			na  += samplediet.getDiNa();

			totaldiet.setDiCar(car);
			totaldiet.setDiPro(pro);
			totaldiet.setDiFat(fat);
			totaldiet.setDiNa(na);

			if (samplediet.getDtWhen().equals("아침")) {
				breakfast += samplediet.getDiKcal();
			} else if (samplediet.getDtWhen().equals("아침간식")) {
				morningSnack += samplediet.getDiKcal();
			} else if (samplediet.getDtWhen().equals("점심")) {
				Lunch += samplediet.getDiKcal();
			} else if (samplediet.getDtWhen().equals("점심간식")) {
				Lunchsnack += samplediet.getDiKcal();
			} else if (samplediet.getDtWhen().equals("저녁")) {
				Dinner += samplediet.getDiKcal();
			} else if (samplediet.getDtWhen().equals("저녁간식")) {
				Dinnersnack += samplediet.getDiKcal();
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
		System.out.println("제발 가져와줭! " + date + " 에욱!! " + dietwhen);
		String today = date;
		String dietwhentime = dietwhen;

		mv.addObject("dietwhentime", dietwhentime).addObject("today", today).setViewName("Diet/TodayDietInsertView");

		return mv;
	}

	@RequestMapping("InbodyInsertView.do")
	public ModelAndView InbodyInsertView(ModelAndView mv,
			@RequestParam(value = "today", required = false) String date) {

		System.out.println("제발 가져와줭!" + date);
		String today = date;
		mv.addObject("today", today).setViewName("Diet/InbodyInsertView");
		return mv;
	}

	@RequestMapping("InbodyInsert.do")
	public String InbodyInsert(HttpSession session, HttpServletRequest request, Inbody inbody) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		inbody.setId(loginUser.getId());
//		System.out.println("인바디 객체에 담긴것 : " + inbody);

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
		diet.setDiKcal(diet.getDiKcal() * foodCount);
		diet.setDiCar(diet.getDiCar() * foodCount);
		diet.setDiPro(diet.getDiPro() * foodCount);
		diet.setDiFat(diet.getDiFat() * foodCount);
		diet.setDiNa(diet.getDiNa() * foodCount);

		// 수량
		String diAmount = foodCount +" "+ foodCountUnit;
		diet.setDiAmount(diAmount);

		// 유저 아이디가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		diet.setId(loginUser.getId());

		System.out.println("diet : " + diet);

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
		System.out.println("들어오니?" + today + "dtwhen" + dtwhen);
		
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
		System.out.println("today :" + today + "foodname " + str[0] + "amount" + str[1] + " foodwhen " + foodwhen );
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
		
		System.out.println("diet : " + diet);
		System.out.println("에욱 : " +diet.getDiCar());
		String[] str2 = diet.getDiAmount().split(" ");
		
		
		mv.addObject("foodCount", str2[0]).addObject("FoodCountUnit", str2[1]).addObject("diet", diet).setViewName("Diet/todayDietEditView");
		
		return mv;
	}
	
	@RequestMapping("DietEdit.do")
	public String DietEdit(HttpSession session, HttpServletRequest request, diet diet,
			@RequestParam(value = "foodCount", required = false) int foodCount,
			@RequestParam(value = "foodCountUnit", required = false) String foodCountUnit) {

		// 수량 갯수만큼 칼로리 등등을 곱해줌.
		diet.setDiKcal(diet.getDiKcal() * foodCount);
		diet.setDiCar(diet.getDiCar() * foodCount);
		diet.setDiPro(diet.getDiPro() * foodCount);
		diet.setDiFat(diet.getDiFat() * foodCount);
		diet.setDiNa(diet.getDiNa() * foodCount);

		// 수량
		String diAmount = foodCount +" "+ foodCountUnit;
		diet.setDiAmount(diAmount);

		// 유저 아이디가져옴
		Member loginUser = (Member) session.getAttribute("loginUser");
		diet.setId(loginUser.getId());

		System.out.println("diet : " + diet);

		int result = dService.DietEdit(diet);

		if (result > 0) {
			return "redirect:DietDetail.do?currentdate=" + diet.getDtDate();
		} else {
			return "<script> alert('식당 업데이트에 실패했습니다.'); history.back(); </script>";
		}

	}
	
	

}
