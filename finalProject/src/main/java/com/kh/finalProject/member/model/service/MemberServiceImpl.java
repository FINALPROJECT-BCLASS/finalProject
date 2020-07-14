package com.kh.finalProject.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.member.model.dao.MemberDao;
import com.kh.finalProject.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
		
		return mDao.selectMember(m);
	}
	
}
