package com.kh.finalProject.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.chat.model.vo.Chat;
import com.kh.finalProject.member.model.vo.Member;

@Repository("cDao")
public class ChatDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Member> selectMember(String name) {
		
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectMember",name);
	}

	public int insertFriendList(HashMap<String, String> map) {
		
		return sqlSessionTemplate.insert("chatMapper.insertFriendList", map);
	}

	public ArrayList<Member> selectFriendList(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectFriend", id);
	}

	public int insertChatOneToOne(HashMap<String, String> map) {
	
		return sqlSessionTemplate.insert("chatMapper.insertChatOneToOne", map);
	}

	public Chat selectChatOnetoOne(HashMap<String, String> map) {
		
		return sqlSessionTemplate.selectOne("chatMapper.selectChatOnetoOne", map);
		
	}
}
