package com.kh.finalProject.account.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.account.model.dao.AccountDao;
import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.account.model.vo.AccountCategory;
import com.kh.finalProject.account.model.vo.Condition;
import com.kh.finalProject.account.model.vo.MSumCondition;
import com.kh.finalProject.account.model.vo.MonthlySum;
import com.kh.finalProject.account.model.vo.Sum;

@Service("aService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDao aDao;

	@Override
	public int insertAccountBook(AccountBook a) {
		
		return aDao.insertAccountBook(a);
	}

	@Override
	public ArrayList<Sum> selectPSumList(String id) {
		
		return aDao.selectPSumList(id);
	}

	@Override
	public ArrayList<Sum> selectESumList(String id) {
		
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
	public ArrayList<AccountBook> selectAbPNoList(Condition condition) {
		
		return aDao.selectAbPNoList(condition);
	}

	@Override
	public ArrayList<AccountBook> selectAbENoList(Condition condition) {
		
		return aDao.selectAbENoList(condition);
	}

	@Override
	public int selectAbAmount(int abNo) {
		
		return aDao.selectAbAmount(abNo);
	}

	@Override
	public ArrayList<MonthlySum> selectMPSumList(MSumCondition mc) {
		
		return aDao.selectMPSumList(mc);
	}

	@Override
	public ArrayList<MonthlySum> selectMESumList(MSumCondition mc) {
		
		return aDao.selectMESumList(mc);
	}

	@Override
	public ArrayList<AccountCategory> selectECList(Condition condition) {
		
		return aDao.selectECList(condition);
	}

	@Override
	public String getOverrun(Condition condition) {
		
		return aDao.getOverrun(condition);
	}

	@Override
	public ArrayList<AccountCategory> selectPCList(Condition condition) {
	
		return aDao.selectPCList(condition);
	}
	
}
