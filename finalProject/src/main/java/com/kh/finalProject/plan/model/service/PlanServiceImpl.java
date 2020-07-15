package com.kh.finalProject.plan.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.plan.model.dao.PlanDao;
import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;
import com.kh.finalProject.plan.model.vo.Menstrual;

@Service("pService")
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	PlanDao pDao;

	@Override
	public int checkInfo(String id) {
		
		return pDao.checkInfo(id);
	}

	@Override
	public int insertMenstrual(Menstrual m) {
		
		return pDao.insertMenstrual(m);
	}

	@Override
	public int insertMcRecord(String id) {
	
		return pDao.insertMcRecord(id);
	}

	@Override
	public int insertMcOvulation(String id) {
		
		return pDao.insertMcOvulation(id);
	}

	@Override
	public int updateMcLast(String id) {
		
		return pDao.updateMcLast(id);
	}

	@Override
	public ArrayList<McRecord> selectMcrList(String id) {
		
		return pDao.selectMcrList(id);
	}
	
	@Override
	public ArrayList<McOvulation> selectMcoList(String id) {
		
		return pDao.selectMcoList(id);
	}

	@Override
	public Menstrual selectMenstrual(String id) {
		
		return pDao.selectMenstrual(id);
	}

}
