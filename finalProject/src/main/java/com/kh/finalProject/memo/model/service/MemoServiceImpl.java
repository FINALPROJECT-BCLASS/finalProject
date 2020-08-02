package com.kh.finalProject.memo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.memo.model.dao.MemoDao;

@Service("mmService")
public class MemoServiceImpl implements MemoService {
	
	@Autowired
	MemoDao mmDao;

}
