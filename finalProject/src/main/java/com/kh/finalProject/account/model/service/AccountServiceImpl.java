package com.kh.finalProject.account.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.account.model.dao.AccountDao;
import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.account.model.vo.ExpenditureSum;
import com.kh.finalProject.account.model.vo.ProfitSum;
import com.kh.finalProject.account.model.vo.SumCondition;

@Service("aService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDao aDao;

	@Override
	public int insertAccountBook(AccountBook a) {
		
		return aDao.insertAccountBook(a);
	}

	@Override
	public ArrayList<ProfitSum> selectPSumList(String id) {
		
		return aDao.selectPSumList(id);
	}

	@Override
	public ArrayList<ExpenditureSum> selectESumList(String id) {
		
		return aDao.selectESumList(id);
	}

	@Override
	public ArrayList<AccountBook> selectPList(AccountBook a) {
	
		return aDao.selectPList(a);
	}

	@Override
	public ArrayList<AccountBook> selectEList(AccountBook a) {
		
		return aDao.selectEList(a);
	}

	@Override
	public int deleteAccountBook(AccountBook a) {
		
		return aDao.deleteAccountBook(a);
	}

	@Override
	public ArrayList<AccountBook> selectAbPNoList(SumCondition sc) {
		
		return aDao.selectAbPNoList(sc);
	}

	@Override
	public ArrayList<AccountBook> selectAbENoList(SumCondition sc) {
		
		return aDao.selectAbENoList(sc);
	}

	@Override
	public int selectAbAmount(int abNo) {
		
		return aDao.selectAbAmount(abNo);
	}
	
}
