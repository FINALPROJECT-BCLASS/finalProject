package com.kh.finalProject.manager.model.service;

import java.util.ArrayList;

import com.kh.finalProject.manager.model.vo.MPageInfo;
import com.kh.finalProject.manager.model.vo.Report;
import com.kh.finalProject.member.model.vo.Member;

public interface ManagerService {

	int getMemberCount(String id);

	ArrayList<Member> selectMList(MPageInfo mpi);

	int getReportCount(String id);

	ArrayList<Report> selectRList(MPageInfo mpi);

	int updateReport(Report r);

	int updateRpCount(String id);

	int updateChatYn(String id);

}
