package com.kh.finalProject.chat.model.service;

import java.util.ArrayList;

import com.kh.finalProject.member.model.vo.Member;

public interface ChatService {

	ArrayList<Member> selectMember(String name);

}
