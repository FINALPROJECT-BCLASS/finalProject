package com.kh.finalProject.manager.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mgDao")
public class ManagerDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

}
