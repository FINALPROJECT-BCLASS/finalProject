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

	public int insertMcRecord(String id) {
		
		return sqlSessionTemplate.insert("planMapper.insertMcRecord", id);
	}

	public int insertMcOvulation(String id) {
		
		return sqlSessionTemplate.insert("planMapper.insertMcOvulation", id);
	}

	public int updateMcLast(String id) {
		
		return sqlSessionTemplate.update("planMapper.updateMcLast", id);
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

}
