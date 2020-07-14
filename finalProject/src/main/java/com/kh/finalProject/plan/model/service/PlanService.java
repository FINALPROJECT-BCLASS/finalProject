package com.kh.finalProject.plan.model.service;

import java.util.ArrayList;

import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;
import com.kh.finalProject.plan.model.vo.Menstrual;

public interface PlanService {

	int checkInfo(String id);

	int insertMenstrual(Menstrual m);

	int insertMcRecord(String id);

	int insertMcOvulation(String id);

	int updateMcLast(String id);
	
	ArrayList<McRecord> selectMcrList(String id);

	ArrayList<McOvulation> selectMcoList(String id);

}
