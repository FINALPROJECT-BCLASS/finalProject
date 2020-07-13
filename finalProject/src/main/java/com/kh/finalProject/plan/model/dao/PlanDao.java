package com.kh.finalProject.plan.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.plan.model.vo.McRecord;

@Repository("pDao")
public class PlanDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<McRecord> selectMcrList() {
		
		return (ArrayList)sqlSessionTemplate.selectList("planMapper.selectMcrList");
	}

}
