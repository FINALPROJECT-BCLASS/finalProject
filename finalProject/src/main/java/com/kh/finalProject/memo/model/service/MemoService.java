package com.kh.finalProject.memo.model.service;

import com.kh.finalProject.memo.model.vo.Memo;
import com.kh.finalProject.plan.model.vo.MPlan;

public interface MemoService {

	int insertMemo(Memo m);

	int selectMemoNo(Memo m);

	int insertMPlan(MPlan mp);

}
