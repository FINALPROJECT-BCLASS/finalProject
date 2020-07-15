package com.kh.finalProject.plan.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.plan.model.vo.McOvulation;
import com.kh.finalProject.plan.model.vo.McRecord;
import com.kh.finalProject.plan.model.vo.Menstrual;

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

	public int deleteMcRecord(McRecord m) {
		
		return sqlSessionTemplate.delete("planMapper.deleteMcRecord", m);
	}

	public int deleteMcOvulation(McOvulation m) {
		
		return sqlSessionTemplate.delete("planMapper.deleteMcOvulation", m);
	}

	public int reMcLast(Menstrual m) {
		
		return sqlSessionTemplate.update("planMapper.reMcLast", m);
	}

	public String selectMcLast(Menstrual m) {
		
		return sqlSessionTemplate.selectOne("planMapper.selectMcLast", m);
	}

	public int firstMcLast(Menstrual m) {
		
		return sqlSessionTemplate.update("planMapper.firstMcLast", m);
	}

}
