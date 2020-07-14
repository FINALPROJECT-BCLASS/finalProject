package com.kh.finalProject.plan.model.service;

import java.util.ArrayList;

import com.kh.finalProject.plan.model.vo.McRecord;
import com.kh.finalProject.plan.model.vo.Menstrual;

public interface PlanService {

	ArrayList<McRecord> selectMcrList(String id);

	int checkInfo(String id);

	int insertMenstrual(Menstrual m);

	int insertMcRecord(String id);

	int insertMcOvulation(String id);

	int updateMcLast(String id);

}
