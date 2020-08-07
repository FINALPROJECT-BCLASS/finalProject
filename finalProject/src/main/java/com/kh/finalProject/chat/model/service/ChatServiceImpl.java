package com.kh.finalProject.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.chat.model.dao.ChatDao;
import com.kh.finalProject.chat.model.vo.Chat;
import com.kh.finalProject.chat.model.vo.openChat;
import com.kh.finalProject.member.model.vo.Member;

@Service("sService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao cDao;

	@Override
	public ArrayList<Member> selectMember(HashMap<String, Object> map) {
		
		return cDao.selectMember(map);
	}

	@Override
	public int insertFriendList(HashMap<String, String> map) {
		
		return cDao.insertFriendList(map);
	}

	@Override
	public ArrayList<Member> selectFriendList(String id) {
	
		return cDao.selectFriendList(id);
	}

	@Override
	public int insertChatOnetoTOne(HashMap<String, String> map) {
	
		return cDao.insertChatOneToOne(map);
	}

	@Override
	public Chat selectChatOnetoOne(HashMap<String, String> map) {
		
		return cDao.selectChatOnetoOne(map);
	}

	@Override
	public int insertChatmsg(HashMap<String, Object> dbmap) {
		
		return cDao.insertChatmsg(dbmap);
	}

	@Override
	public ArrayList<Chat> selectchatroom(String id) {

		return cDao.selectchatroom(id);
	}

	@Override
	public Chat selectchatroomdetail(String co_no) {
		
		return cDao.selectchatroomdetail(co_no);
	}

	@Override
	public int openchatroominsert(openChat openchat) {
		
		return cDao.openchatroominsert(openchat);
	}

	@Override
	public int selectopenchatroom(openChat openchat) {
	
		return cDao.selectopenchatroom(openchat);
	}

	@Override
	public openChat selectopenchatroomdetail(int cm_no) {
	
		return cDao.selectopenchatroomdetail(cm_no);
	}

	@Override
	public int insertOpenChatmsg(HashMap<String, Object> dbmap) {
		
		return cDao.insertOpenChatmsg(dbmap);
	}

	@Override
	public ArrayList<openChat> selectopenchatroomlist() {
		
		return cDao.selectopenchatroomlist();
	}

	@Override
	public ArrayList<openChat> selectchatlist(int cm_no) {
	
		return cDao.selectchatlist(cm_no);
	}

	@Override
	public openChat passwordcheck(HashMap<String, Object> check) {
	
		return cDao.passwordcheck(check);
	}

	@Override
	public int openchatroomOut(Map<String, Object> map2) {
		
		return cDao.openchatroomOut(map2);
	}

	@Override
	public int joinchatroom(Map<String, Object> map2) {

		return cDao.joinchatroom(map2);
	}

	@Override
	public int deletefriend(HashMap<String, Object> map) {
	
		return cDao.deletefriend(map);
	}

	
}
