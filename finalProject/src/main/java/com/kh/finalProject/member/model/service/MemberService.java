package com.kh.finalProject.member.model.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.kh.finalProject.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	
	public void checkId(String id, HttpServletResponse response) throws IOException;

	int insertMember(Member m);

	int updateMember(Member m);
	
}
