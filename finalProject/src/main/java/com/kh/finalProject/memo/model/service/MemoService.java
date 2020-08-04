package com.kh.finalProject.memo.model.service;

import java.util.ArrayList;

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

}
