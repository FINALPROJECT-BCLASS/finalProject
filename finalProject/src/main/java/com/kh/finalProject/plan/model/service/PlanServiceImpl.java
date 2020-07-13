package com.kh.finalProject.plan.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.plan.model.dao.PlanDao;
import com.kh.finalProject.plan.model.vo.McRecord;

@Service("pService")
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	PlanDao pDao;

	@Override
	public ArrayList<McRecord> selectMcrList() {
		
		return pDao.selectMcrList();
	}

}
