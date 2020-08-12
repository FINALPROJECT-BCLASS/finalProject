package com.kh.finalProject.memo.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.daily.model.vo.Bookmark;
import com.kh.finalProject.daily.model.vo.BookmarkMap;
import com.kh.finalProject.daily.model.vo.BookmarkUrl;
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

	@Override
	public int updateMpEnd(Memo m) {
		
		return mmDao.updateMpEnd(m);
	}

	@Override
	public int insertABook(AccountBook ab) {
		
		return mmDao.insertABook(ab);
	}

	@Override
	public int addABook(Memo m) {
	
		return mmDao.addABook(m);
	}

	@Override
	public ArrayList<Bookmark> selectBmList(String id) {
	
		return mmDao.selectBmList(id);
	}

	@Override
	public int insertBMap(BookmarkMap bm) {
		
		return mmDao.insertBMap(bm);
	}

	@Override
	public int insertBUrl(BookmarkUrl bu) {
		
		return mmDao.insertBUrl(bu);
	}

	@Override
	public int addBookmark(Memo m) {
		
		return mmDao.addBookmark(m);
	}

	@Override
	public int updateAbDate(AccountBook a) {
		
		return mmDao.updateAbDate(a);
	}

}
