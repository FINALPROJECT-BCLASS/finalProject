package com.kh.finalProject.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.manager.model.dao.ManagerDao;

@Service("mgService")
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	ManagerDao mgDao;

}
