package com.kh.finalProject.memo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.memo.model.dao.MemoDao;
import com.kh.finalProject.memo.model.vo.Memo;
import com.kh.finalProject.plan.model.vo.MPlan;

@Service("mmService")
public class MemoServiceImpl implements MemoService {
	
	@Autowired
	MemoDao mmDao;

	@Override
	public int insertMemo(Memo m) {
	
		return mmDao.insertMemo(m);
	}

	@Override
	public int selectMemoNo(Memo m) {
		
		return mmDao.selectMemoNo(m);
	}

	@Override
	public int insertMPlan(MPlan mp) {
	
		return mmDao.insertMPlan(mp);
	}

}
