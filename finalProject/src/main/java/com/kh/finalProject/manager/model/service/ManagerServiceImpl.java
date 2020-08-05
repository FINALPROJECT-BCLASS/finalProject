package com.kh.finalProject.manager.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.manager.model.dao.ManagerDao;
import com.kh.finalProject.manager.model.vo.MPageInfo;
import com.kh.finalProject.member.model.vo.Member;

@Service("mgService")
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	ManagerDao mgDao;

	@Override
	public int getMemberCount(String id) {
		
		return mgDao.getMemberCount(id);
	}

	@Override
	public ArrayList<Member> selectMList(MPageInfo mpi) {
		
		return mgDao.selectMList(mpi);
	}

}
