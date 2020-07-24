package com.kh.finalProject.account.model.service;

import java.util.ArrayList;

import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.account.model.vo.ProfitSum;

public interface AccountService {

	int insertAccontBook(AccountBook a);

	ArrayList<ProfitSum> selectPSumList(String id);

}
