package com.kh.finalProject.account.model.service;

import java.util.ArrayList;

import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.account.model.vo.ExpenditureSum;
import com.kh.finalProject.account.model.vo.ProfitSum;

public interface AccountService {

	int insertAccountBook(AccountBook a);

	ArrayList<ProfitSum> selectPSumList(String id);

	ArrayList<ExpenditureSum> selectESumList(String id);

	ArrayList<AccountBook> selectPList(AccountBook a);

	ArrayList<AccountBook> selectEList(AccountBook a);

	int deleteAccountBook(AccountBook a);

	int selectPSum(AccountBook a);

}
