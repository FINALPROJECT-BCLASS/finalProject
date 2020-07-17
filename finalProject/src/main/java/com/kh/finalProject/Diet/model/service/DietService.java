package com.kh.finalProject.Diet.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.finalProject.Diet.model.vo.Inbody;
import com.kh.finalProject.Diet.model.vo.diet;

public interface DietService {

	int InbodyInsert(Inbody inbody);

	Inbody selectInbody(HashMap<String, String> map);

	int DietInsert(diet diet);

	ArrayList<diet> selectDiet(HashMap<String, String> map);

	ArrayList<diet> selectTodayDiet(HashMap<String, String> map);

	diet fooddetail(HashMap<String, String> map);

	int DietEdit(diet diet);

}
