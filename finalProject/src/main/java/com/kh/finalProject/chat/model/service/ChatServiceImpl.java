package com.kh.finalProject.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.chat.model.dao.ChatDao;
import com.kh.finalProject.member.model.vo.Member;

@Service("sService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao cDao;

	@Override
	public ArrayList<Member> selectMember(String name) {
		
		return cDao.selectMember(name);
	}

	@Override
	public int insertFriendList(HashMap<String, String> map) {
		
		return cDao.insertFriendList(map);
	}

	@Override
	public ArrayList<Member> selectFriendList(String id) {
	
		return cDao.selectFriendList(id);
	}
	
}
