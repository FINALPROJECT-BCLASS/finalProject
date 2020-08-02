package com.kh.finalProject.memo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mmDao")
public class MemoDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

}
