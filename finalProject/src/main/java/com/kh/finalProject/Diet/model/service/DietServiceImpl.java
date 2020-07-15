package com.kh.finalProject.Diet.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.Diet.model.dao.DietDao;

@Service("dService")
public class DietServiceImpl implements DietService {

	@Autowired
	DietDao dDao;
}
