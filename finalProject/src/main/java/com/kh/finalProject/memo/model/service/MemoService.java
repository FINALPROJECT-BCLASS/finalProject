package com.kh.finalProject.memo.model.service;

import java.util.ArrayList;

import com.kh.finalProject.account.model.vo.AccountBook;
import com.kh.finalProject.daily.model.vo.Bookmark;
import com.kh.finalProject.daily.model.vo.BookmarkMap;
import com.kh.finalProject.daily.model.vo.BookmarkUrl;
import com.kh.finalProject.memo.model.vo.Memo;
import com.kh.finalProject.plan.model.vo.MPlan;

public interface MemoService {

	int insertMemo(Memo m);

	int selectMemoNo(Memo m);

	int insertMPlan(MPlan mp);

	ArrayList<Memo> selectMemoList(String id);

	Memo selectMemo(Memo m);

	int deleteMemo(Memo m);

	int addMPlan(Memo m);

	int updateMpEnd(Memo m);

	int insertABook(AccountBook ab);

	int addABook(Memo m);

	ArrayList<Bookmark> selectBmList(String id);

	int insertBMap(BookmarkMap bm);

	int insertBUrl(BookmarkUrl bu);

	int addBookmark(Memo m);

	int updateAbDate(AccountBook a);

	int updateMpDate(MPlan mp);

	int updateMemo(Memo m);

	int updateMPlan(MPlan mp);

	int updateABook(AccountBook ab);

	int updateBMap(BookmarkMap bm);

	int updateBUrl(BookmarkUrl bu);

	BookmarkMap selectBMap(Memo m);

	int updateBmAddress(BookmarkMap bm);

}
