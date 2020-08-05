package com.kh.finalProject.manager.model.service;

import java.util.ArrayList;

import com.kh.finalProject.manager.model.vo.MPageInfo;
import com.kh.finalProject.member.model.vo.Member;

public interface ManagerService {

	int getMemberCount(String id);

	ArrayList<Member> selectMList(MPageInfo mpi);

}
