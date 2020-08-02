package com.kh.finalProject.memo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
