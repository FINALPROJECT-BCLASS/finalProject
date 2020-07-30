package com.kh.finalProject.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.finalProject.chat.model.vo.Chat;
import com.kh.finalProject.member.model.vo.Member;

public interface ChatService {

	ArrayList<Member> selectMember(String name);

	int insertFriendList(HashMap<String, String> map);

	ArrayList<Member> selectFriendList(String id);

	int insertChatOnetoTOne(HashMap<String, String> map);

	Chat selectChatOnetoOne(HashMap<String, String> map);

	int insertChatmsg(HashMap<String, Object> dbmap);

	ArrayList<Chat> selectchatroom(String id);

	Chat selectchatroomdetail(String co_no);

}
