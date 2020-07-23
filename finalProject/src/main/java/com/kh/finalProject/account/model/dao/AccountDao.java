package com.kh.finalProject.account.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.account.model.vo.AccountBook;

@Repository("aDao")
public class AccountDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insertAccountBook(AccountBook a) {
	
		return sqlSessionTemplate.insert("accountMapper.insertAccountBook", a);
	}

}
