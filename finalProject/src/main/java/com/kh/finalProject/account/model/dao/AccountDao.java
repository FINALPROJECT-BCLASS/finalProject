package com.kh.finalProject.account.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.account.model.vo.MSumCondition;
import com.kh.finalProject.account.model.vo.MonthlySum;
import com.kh.finalProject.account.model.vo.Sum;
import com.kh.finalProject.account.model.vo.SumCondition;

@Repository("aDao")
public class AccountDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insertAccountBook(AccountBook a) {
	
		return sqlSessionTemplate.insert("accountMapper.insertAccountBook", a);
	}

	public ArrayList<Sum> selectPSumList(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("accountMapper.selectPSumList", id);
	}

	public ArrayList<Sum> selectESumList(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("accountMapper.selectESumList", id);
	}

	public ArrayList<AccountBook> selectPList(AccountBook a) {
	
		return (ArrayList)sqlSessionTemplate.selectList("accountMapper.selectPList", a);
	}

	public ArrayList<AccountBook> selectEList(AccountBook a) {
		
		return (ArrayList)sqlSessionTemplate.selectList("accountMapper.selectEList", a);
	}

	public int deleteAccountBook(AccountBook a) {
		
		return sqlSessionTemplate.update("accountMapper.deleteAccountBook", a);
	}

	public ArrayList<AccountBook> selectAbPNoList(SumCondition sc) {
	
		return (ArrayList)sqlSessionTemplate.selectList("accountMapper.selectAbPNoList", sc);
	}

	public ArrayList<AccountBook> selectAbENoList(SumCondition sc) {
		
		return (ArrayList)sqlSessionTemplate.selectList("accountMapper.selectAbENoList", sc);
	}

	public int selectAbAmount(int abNo) {
		
		return sqlSessionTemplate.selectOne("accountMapper.selectAbAmount", abNo);
	}

	public ArrayList<MonthlySum> selectMPSumList(MSumCondition mc) {
	
		return (ArrayList)sqlSessionTemplate.selectList("accountMapper.selectMPSumList", mc);
	}

	public ArrayList<MonthlySum> selectMESumList(MSumCondition mc) {
	
		return (ArrayList)sqlSessionTemplate.selectList("accountMapper.selectMESumList", mc);
	}

}
