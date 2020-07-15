package com.kh.finalProject.plan.model.service;

import java.util.ArrayList;

import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;
import com.kh.finalProject.plan.model.vo.Menstrual;

public interface PlanService {

	int checkInfo(String id);

	int insertMenstrual(Menstrual m);

	int insertMcRecord(Menstrual m);

	int insertMcOvulation(Menstrual m);

	int updateMcLast(Menstrual m);
	
	ArrayList<McRecord> selectMcrList(String id);

	ArrayList<McOvulation> selectMcoList(String id);

	Menstrual selectMenstrual(String id);

	int updateMenstrual(Menstrual m);

	ArrayList<McRecord> afterMcrList(Menstrual m);

	ArrayList<McOvulation> afterMcoList(Menstrual m);

	int deleteMcRecord(McRecord mcRecord);

	int deleteMcOvulation(McOvulation mcOvulation);

	int reMcLast(Menstrual m);

	String selectMcLast(Menstrual m);

	int firstMcLast(Menstrual m);

	int checkMcLast(Menstrual m);

}
