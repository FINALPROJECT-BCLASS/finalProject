package com.kh.finalProject.account.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.account.model.dao.AccountDao;
import com.kh.finalProject.account.model.vo.AccountBook;

@Service("aService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDao aDao;

	@Override
	public int insertAccontBook(AccountBook a) {
		
		return aDao.insertAccountBook(a);
	}
	
}
