package com.kh.finalProject.memo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.memo.model.vo.Memo;
import com.kh.finalProject.plan.model.vo.MPlan;

@Repository("mmDao")
public class MemoDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insertMemo(Memo m) {
		
		return sqlSessionTemplate.insert("memoMapper.insertMemo", m);
	}

	public int selectMemoNo(Memo m) {
		
		return sqlSessionTemplate.selectOne("memoMapper.selectMemoNo", m);
	}

	public int insertMPlan(MPlan mp) {
		
		return sqlSessionTemplate.insert("memoMapper.insertMPlan", mp);
	}

	public ArrayList<Memo> selectMemoList(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("memoMapper.selectMemoList", id);
	}

	public Memo selectMemo(Memo m) {
		
		return sqlSessionTemplate.selectOne("memoMapper.selectMemo", m);
	}

	public int deleteMemo(Memo m) {
		
		return sqlSessionTemplate.update("memoMapper.deleteMemo", m);
	}

	public int addMPlan(Memo m) {
	
		return sqlSessionTemplate.update("memoMapper.addMPlan", m);
	}

	public int updateMpEnd(Memo m) {
	
		return sqlSessionTemplate.update("memoMapper.updateMpEnd", m);
	}

	public int insertABook(AccountBook ab) {
		
		return sqlSessionTemplate.insert("memoMapper.insertABook", ab);
	}

	public int addABook(Memo m) {
		
		return sqlSessionTemplate.update("memoMapper.addABook", m);
	}

}
