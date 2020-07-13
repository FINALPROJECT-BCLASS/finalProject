package com.kh.finalProject.Diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dDao")
public class DietDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
}
