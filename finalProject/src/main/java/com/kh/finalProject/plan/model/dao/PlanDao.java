package com.kh.finalProject.plan.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.plan.model.vo.DTodolist;
import com.kh.finalProject.plan.model.vo.MPlan;
import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;
import com.kh.finalProject.plan.model.vo.Menstrual;
import com.kh.finalProject.plan.model.vo.Timetable;

@Repository("pDao")
public class PlanDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int checkInfo(String id) {
		
		return sqlSessionTemplate.selectOne("planMapper.checkInfo", id);
	}

	public int insertMenstrual(Menstrual m) {
	
		return sqlSessionTemplate.insert("planMapper.insertMenstrual", m);
	}

	public int insertMcRecord(Menstrual m) {
		
		return sqlSessionTemplate.insert("planMapper.insertMcRecord", m);
	}

	public int insertMcOvulation(Menstrual m) {
		
		return sqlSessionTemplate.insert("planMapper.insertMcOvulation", m);
	}

	public int updateMcLast(Menstrual m) {
		
		return sqlSessionTemplate.update("planMapper.updateMcLast", m);
	}

	public ArrayList<McRecord> selectMcrList(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("planMapper.selectMcrList", id);
	}
	
	public ArrayList<McOvulation> selectMcoList(String id) {
	
		return (ArrayList)sqlSessionTemplate.selectList("planMapper.selectMcoList", id);
	}

	public Menstrual selectMenstrual(String id) {
		
		return sqlSessionTemplate.selectOne("planMapper.selectMenstrual", id);
	}

	public int updateMenstrual(Menstrual m) {
		
		return sqlSessionTemplate.update("planMapper.updateMenstrual", m);
	}

	public ArrayList<McRecord> afterMcrList(Menstrual m) {
		
		return (ArrayList)sqlSessionTemplate.selectList("planMapper.afterMcrList", m);
	}

	public ArrayList<McOvulation> afterMcoList(Menstrual m) {
	
		return (ArrayList)sqlSessionTemplate.selectList("planMapper.afterMcoList", m);
	}

	public int checkMcLast(Menstrual m) {
	
		return sqlSessionTemplate.selectOne("planMapper.checkMcLast", m);
	}

	public int selectGap(String id) {
		
		return sqlSessionTemplate.selectOne("planMapper.selectGap", id);
	}
	
	public int updateMcrStart(McRecord m) {

		return sqlSessionTemplate.update("planMapper.updateMcrStart", m);
	}

	public int updateMcrEnd(McRecord m) {
	
		return sqlSessionTemplate.update("planMapper.updateMcrEnd", m);
	}

	public int updateMcOvulation(McOvulation m) {
		
		return sqlSessionTemplate.update("planMapper.updateMcOvulation", m);
	}
	
	public int deleteMcRecord(String id) {
		
		return sqlSessionTemplate.delete("planMapper.deleteMcRecord", id);
	}
	
	public int deleteMcOvulation(String id) {
		
		return sqlSessionTemplate.delete("planMapper.deleteMcOvulation", id);
	}
	
	public int deleteMenstrual(String id) {
		
		return sqlSessionTemplate.delete("planMapper.deleteMenstrual", id);
	}

	public int insertTimetable(Timetable t) {
		
		return sqlSessionTemplate.insert("planMapper.insertTimetable", t);
	}

	public ArrayList<Timetable> selectTtList(Timetable t) {
		
		return (ArrayList)sqlSessionTemplate.selectList("planMapper.selectTtList", t);
	}

	public int deleteTimetable(int ttNo) {
	
		return sqlSessionTemplate.delete("planMapper.deleteTimetable", ttNo);
	}

	public int insertDTodolist(DTodolist dt) {
		
		return sqlSessionTemplate.insert("planMapper.insertDTodolist", dt);
	}

	public int deleteDTodolist(DTodolist dt) {
		
		return sqlSessionTemplate.delete("planMapper.deleteDTodolist", dt);
	}

	public ArrayList<DTodolist> selectDtList(DTodolist dt) {
		
		return (ArrayList)sqlSessionTemplate.selectList("planMapper.selectDtList", dt);
	}

	public int insertMPlan(MPlan m) {
		
		return sqlSessionTemplate.insert("planMapper.insertMPlan", m);
	}

	public MPlan selectLastMPlan(MPlan m) {
		
		return sqlSessionTemplate.selectOne("planMapper.selectLastMPlan", m);
	}

	public int updateMpEnd(MPlan m) {
		
		return sqlSessionTemplate.update("planMapper.updateMpEnd", m);
	}
	
	public ArrayList<MPlan> selectMpList(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("planMapper.selectMpList", id);
	}

	public MPlan selectMPlan(MPlan m) {
		
		return sqlSessionTemplate.selectOne("planMapper.selectMPlan", m);
	}

	public int deleteMPlan(int no) {
		
		return sqlSessionTemplate.update("planMapper.deleteMPlan", no);
	}

	public int updateMPlan(MPlan m) {
		
		return sqlSessionTemplate.update("planMapper.updateMPlan", m);
	}

}
