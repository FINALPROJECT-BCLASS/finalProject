package com.kh.finalProject.account.model.service;

import java.util.ArrayList;

import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.account.model.vo.MSumCondition;
import com.kh.finalProject.account.model.vo.MonthlySum;
import com.kh.finalProject.account.model.vo.Sum;
import com.kh.finalProject.account.model.vo.SumCondition;

public interface AccountService {

	int insertAccountBook(AccountBook a);

	ArrayList<Sum> selectPSumList(String id);

	ArrayList<Sum> selectESumList(String id);

	ArrayList<AccountBook> selectPList(AccountBook a);

	ArrayList<AccountBook> selectEList(AccountBook a);

	int deleteAccountBook(AccountBook a);

	ArrayList<AccountBook> selectAbPNoList(SumCondition sc);

	ArrayList<AccountBook> selectAbENoList(SumCondition sc);

	int selectAbAmount(int abNo);

	ArrayList<MonthlySum> selectMPSumList(MSumCondition mc);

	ArrayList<MonthlySum> selectMESumList(MSumCondition mc);

}
