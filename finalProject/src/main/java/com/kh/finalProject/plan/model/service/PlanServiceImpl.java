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
	public int insertMcRecord(Menstrual m) {
	
		return pDao.insertMcRecord(m);
	}

	@Override
	public int insertMcOvulation(Menstrual m) {
		
		return pDao.insertMcOvulation(m);
	}

	@Override
	public int updateMcLast(Menstrual m) {
		
		return pDao.updateMcLast(m);
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

	@Override
	public int updateMenstrual(Menstrual m) {
		
		return pDao.updateMenstrual(m);
	}

	@Override
	public ArrayList<McRecord> afterMcrList(Menstrual m) {
		
		return pDao.afterMcrList(m);
	}

	@Override
	public ArrayList<McOvulation> afterMcoList(Menstrual m) {
	
		return pDao.afterMcoList(m);
	}

	@Override
	public int deleteMcRecord(McRecord m) {
		
		return pDao.deleteMcRecord(m);
	}

	@Override
	public int deleteMcOvulation(McOvulation m) {
		
		return pDao.deleteMcOvulation(m);
	}

	@Override
	public int reMcLast(Menstrual m) {
		
		return pDao.reMcLast(m);
	}

	@Override
	public String selectMcLast(Menstrual m) {
	
		return pDao.selectMcLast(m);
	}

	@Override
	public int firstMcLast(Menstrual m) {
		
		return pDao.firstMcLast(m);
	}

}
