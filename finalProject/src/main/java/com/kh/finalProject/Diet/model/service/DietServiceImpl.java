package com.kh.finalProject.Diet.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.Diet.model.dao.DietDao;
import com.kh.finalProject.Diet.model.vo.Inbody;
import com.kh.finalProject.Diet.model.vo.diet;

@Service("dService")
public class DietServiceImpl implements DietService {

	@Autowired
	DietDao dDao;

	@Override
	public int InbodyInsert(Inbody inbody) {
		
		return dDao.InbodyInsert(inbody);
	}

	@Override
	public Inbody selectInbody(HashMap map) {
		
		return dDao.selectInbody(map);
	}

	@Override
	public int DietInsert(diet diet) {
	
		return dDao.DietInsert(diet);
	}

	@Override
	public ArrayList<diet> selectDiet(HashMap<String, String> map) {
		
		return dDao.selectDiet(map);
	}

	@Override
	public ArrayList<diet> selectTodayDiet(HashMap<String, String> map) {
		
		return dDao.selectTodayDiet(map);
	}

	@Override
	public diet fooddetail(HashMap<String, String> map) {
		
		return dDao.fooddetail(map);
	}

	@Override
	public int DietEdit(diet diet) {

		return dDao.dietEdit(diet);
	}

	


}
