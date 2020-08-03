package com.kh.finalProject.memo.model.service;

import java.util.ArrayList;

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

	@Override
	public ArrayList<Memo> selectMemoList(String id) {
		
		return mmDao.selectMemoList(id);
	}

	@Override
	public Memo selectMemo(Memo m) {
		
		return mmDao.selectMemo(m);
	}

	@Override
	public int deleteMemo(Memo m) {
		
		return mmDao.deleteMemo(m);
	}

	@Override
	public int addMPlan(Memo m) {
		
		return mmDao.addMPlan(m);
	}

}
