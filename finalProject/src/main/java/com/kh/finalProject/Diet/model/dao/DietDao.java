package com.kh.finalProject.Diet.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.Diet.model.vo.Inbody;
import com.kh.finalProject.Diet.model.vo.diet;

@Repository("dDao")
public class DietDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int InbodyInsert(Inbody inbody) {
		
		return sqlSessionTemplate.insert("DietMapper.InsertInBody", inbody);
	}

	public Inbody selectInbody(Map map) {
			
		return sqlSessionTemplate.selectOne("DietMapper.selectInbody", map);
	}

	public int DietInsert(diet diet) {
		
		return sqlSessionTemplate.insert("DietMapper.InsertDiet", diet);
	}

	public ArrayList<diet> selectDiet(HashMap<String, String> map) {
		
		return (ArrayList)sqlSessionTemplate.selectList("DietMapper.selectDiet", map);
	}

	public ArrayList<diet> selectTodayDiet(HashMap<String, String> map) {
		
		return (ArrayList)sqlSessionTemplate.selectList("DietMapper.selectListDiet",map);
	}

	public diet fooddetail(HashMap<String, String> map) {
		
		return sqlSessionTemplate.selectOne("DietMapper.selectFoodDetail", map);
	}

	public int dietEdit(diet diet) {
		
		return sqlSessionTemplate.update("DietMapper.editDiet", diet);
	}

	public ArrayList<diet> selectAllDiet(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("DietMapper.selectAllDiet", id);
	}

	public ArrayList<Inbody> seletAllInbody(String id) {
	
		return (ArrayList)sqlSessionTemplate.selectList("DietMapper.selectAllInbody", id);
	}

}
