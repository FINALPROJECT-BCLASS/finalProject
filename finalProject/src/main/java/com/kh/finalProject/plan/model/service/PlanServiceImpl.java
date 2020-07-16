package com.kh.finalProject.plan.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.plan.model.dao.PlanDao;
import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;
import com.kh.finalProject.plan.model.vo.Menstrual;
import com.kh.finalProject.plan.model.vo.Timetable;

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
	public int checkMcLast(Menstrual m) {
	
		return pDao.checkMcLast(m);
	}

	@Override
	public int selectGap(String id) {
		
		return pDao.selectGap(id);
	}
	
	@Override
	public int updateMcrStart(McRecord m) {
		
		return pDao.updateMcrStart(m);
	}

	@Override
	public int updateMcrEnd(McRecord m) {
		
		return pDao.updateMcrEnd(m);
	}

	@Override
	public int updateMcOvulation(McOvulation m) {
		
		return pDao.updateMcOvulation(m);
	}

	@Override
	public int insertTimetable(Timetable t) {
		
		return pDao.insertTimetable(t);
	}

	@Override
	public ArrayList<Timetable> selectTtList(String id) {
	
		return pDao.selectTtList(id);
	}

}
