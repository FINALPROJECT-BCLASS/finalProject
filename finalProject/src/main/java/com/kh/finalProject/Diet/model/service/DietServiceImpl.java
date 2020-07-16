package com.kh.finalProject.Diet.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.Diet.model.dao.DietDao;
import com.kh.finalProject.Diet.model.vo.Inbody;

@Service("dService")
public class DietServiceImpl implements DietService {

	@Autowired
	DietDao dDao;

	@Override
	public int InbodyInsert(Inbody inbody) {
		
		return dDao.InbodyInsert(inbody);
	}

	@Override
	public Inbody selectInbody(String today) {
		
		return dDao.selectInbody(today);
	}
}
