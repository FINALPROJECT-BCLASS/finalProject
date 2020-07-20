package com.kh.finalProject.plan.model.service;

import java.util.ArrayList;

import com.kh.finalProject.plan.model.vo.DTodolist;
import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;
import com.kh.finalProject.plan.model.vo.Menstrual;
import com.kh.finalProject.plan.model.vo.Timetable;

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

	int checkMcLast(Menstrual m);

	int selectGap(String id);
	
	int updateMcrStart(McRecord m);

	int updateMcrEnd(McRecord m);

	int updateMcOvulation(McOvulation m);

	int insertTimetable(Timetable t);

	ArrayList<Timetable> selectTtList(Timetable t);

	int deleteTimetable(int ttNo);

	int insertDTodolist(DTodolist dt);
	
	int deleteDTodolist(DTodolist dt);

	ArrayList<DTodolist> selectDtList(DTodolist dt);

}
