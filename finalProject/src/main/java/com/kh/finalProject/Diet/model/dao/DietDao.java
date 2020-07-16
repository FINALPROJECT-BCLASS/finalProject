package com.kh.finalProject.Diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.Diet.model.vo.Inbody;

@Repository("dDao")
public class DietDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int InbodyInsert(Inbody inbody) {
		
		return sqlSessionTemplate.insert("DietMapper.InsertInBody", inbody);
	}

	public Inbody selectInbody(String today) {
		
		return sqlSessionTemplate.selectOne("DietMapper.selectInbody", today);
	}
}
