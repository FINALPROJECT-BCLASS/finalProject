package com.kh.finalProject.chat.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.chat.model.service.ChatService;
import com.kh.finalProject.member.model.vo.Member;

@Component
@Controller
public class openChatHandler extends TextWebSocketHandler {

	@Autowired
	ChatService cService;

	// 세션저장 ("cm_no",cm_no),("session",세션) - ...
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();

	private static Logger logger = LoggerFactory.getLogger(openChatHandler.class);

	// 로그인 유저 저장
	private List<Map<String, Object>> connectUserList = new ArrayList<Map<String, Object>>();

	// 클라이언트와 연결 된 후
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		// 채팅방 번호와 보낸이 아이디
		System.out.println("session uri? : " + session.toString());
		Map<String, Object> sessionmap = session.getAttributes();

		// cm_no가져오기
		String cm_no = String.valueOf(sessionmap.get("cm_no"));
		Member m = (Member) sessionmap.get("loginUser");

		System.out.println("cm_no 에욱 :" + cm_no);
		System.out.println("loginUser id : " + m.getId());
		// list<map<string,object>>에 들어갈 map저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cm_no", cm_no);
		map.put("session", session);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("cm_no", cm_no);
		map2.put("id", m.getNickname());
		
		int result = cService.joinchatroom(map2);

		System.out.println("session 접속 : " + session.getId());

		sessionList.add(map);
		connectUserList.add(map2);
		logger.info("{} 연결됨", session.getId());
		// 연결 완료.
	}

	// 웹 소켓 서버로 데이터를 전송했을 경우
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());

		// JSON --> MAP으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);

		// 채팅방 처음 입장시 join이라는 key값을가진것을 보내고 그것이 포함되어있는지 확인
		if (mapReceive.containsKey("join")) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("cm_no", mapReceive.get("cm_no"));
			map.put("session", session);// 세션을 httpsession의 로그인아이디 로 교체 작업도중 끝
			String joinUser = "";

			  
			for(int i=0; i<connectUserList.size(); i++) {
				  Map<String,Object> connectUserListMap = connectUserList.get(i); 
			  
			   String cm_no = String.valueOf(connectUserListMap.get("cm_no")); //세션리스트에 담긴번호
			   String connectid = String.valueOf(connectUserListMap.get("id"));
			   
			   //세션리스트에 담긴 세션
			   if(cm_no.equals(mapReceive.get("cm_no"))) {
				   joinUser += connectid +",";
				   } 
			   }
			 
				System.out.println("접속해있는 유저 아이디 : " + joinUser);
				
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);

				// sessionList에 담긴 Map에 값 가져옴
				String cm_no = String.valueOf(mapSessionList.get("cm_no")); // 세션리스트에 담긴번호
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session"); // 세션리스트에 담긴 세션
				System.out.println("sess : " + sess.getId()); // 확인1 .
				System.out.println("session확인2 :" + mapSessionList.get("session"));
				System.out.println("cm_no" + cm_no);
				// 만약 Map값을 불러왔는데 방번호가 같다면?
				if (cm_no.equals(mapReceive.get("cm_no"))) {

					//Map<String, Object> userIdmap = session.getAttributes();
					//Member m = (Member) userIdmap.get("loginUser"); // 세션 교체

					//String nickname = m.getNickname();

					String jsonStr2 = cm_no + "|" + joinUser + "|" + mapReceive.get("msg") + "|" + mapReceive.get("join")+"|"+"join";

					System.out.println("확인 에욱" + jsonStr2);
					sess.sendMessage(new TextMessage(jsonStr2)); // 여기잠깐바꿈

				}
			}

			return;
		}

		//채팅 메세지 보내기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cm_no", mapReceive.get("cm_no"));
		map.put("session", session);// 세션을 httpsession의 로그인아이디 로 교체 작업도중 끝

		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> mapSessionList = sessionList.get(i);

			// sessionList에 담긴 Map에 값 가져옴
			String cm_no = String.valueOf(mapSessionList.get("cm_no"));
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
			System.out.println("sess : " + sess.getId()); // 확인1 .
			System.out.println("session확인2 :" + mapSessionList.get("session"));
			System.out.println("cm_no" + cm_no);
			// 만약 Map값을 불러왔는데 방번호가 같다면?
			if (cm_no.equals(mapReceive.get("cm_no"))) {

				Map<String, Object> userIdmap = session.getAttributes();
				Member m = (Member) userIdmap.get("loginUser"); // 세션 교체

				String loginid = m.getId();
				System.out.println("msg : " + mapReceive.get("msg"));
				HashMap<String, Object> dbmap = new HashMap<String, Object>();
				dbmap.put("cm_no", cm_no);
				dbmap.put("id", loginid);
				dbmap.put("message", String.valueOf(mapReceive.get("msg")));

				int result = cService.insertOpenChatmsg(dbmap);// db저장
				// int result =1;
				if (result > 0) {

					String nickname =m.getNickname();
					
					String jsonStr2 = cm_no + "|" + nickname + "|" + mapReceive.get("msg")+ "|" +mapReceive.get("img");

					System.out.println("확인 에욱" + jsonStr2);
					sess.sendMessage(new TextMessage(jsonStr2)); // 여기잠깐바꿈

				} else {
					String nickname =m.getNickname();
					
					String jsonStr2 = cm_no + "|" + nickname+ "|" + mapReceive.get("msg")+"|" +mapReceive.get("img");

					System.out.println("db저장 실패");
					sess.sendMessage(new TextMessage(jsonStr2));
				}
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws IOException {
		// 여기서 Db를 등록하면 되지않을까?
		// List 삭제

		logger.info("{} 연결 끊김", session.getId());

		ObjectMapper objectMapper = new ObjectMapper();
		
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			Map<String, Object> map2 = connectUserList.get(i);
			String cm_no = (String)map.get("cm_no");
			WebSocketSession sess = (WebSocketSession)map.get("session");
			String userid = String.valueOf(map2.get("id"));
			
			if (session.equals(sess)) {
				
				int result = cService.openchatroomOut(map2);
				
				sessionList.remove(map);
				connectUserList.remove(map2);
			}
		}
		
		//현재 세션 담아주자
		String joinUser = "";
		
		Map<String, Object> map = session.getAttributes();
		String sessioncm_no = String.valueOf(map.get("cm_no")); // 세션 교체
		
		for(int i=0; i<connectUserList.size(); i++) {
			  Map<String,Object> connectUserListMap = connectUserList.get(i); 
		  
		   String cm_no = String.valueOf(connectUserListMap.get("cm_no")); //세션리스트에 담긴번호
		   String connectid = String.valueOf(connectUserListMap.get("id"));
		   
		   //세션리스트에 담긴 세션
		   if(cm_no.equals(sessioncm_no)) {
			   joinUser += connectid +",";
			   } 
		   }
		
			System.out.println("접속해있는 유저 아이디 : " + joinUser);
			
			
		//리스트 갱신 메시지 보내주자
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);

				// sessionList에 담긴 Map에 값 가져옴
				String cm_no = String.valueOf(mapSessionList.get("cm_no")); // 세션리스트에 담긴번호
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session"); // 세션리스트에 담긴 세션
				System.out.println("sess : " + sess.getId()); // 확인1 .
				System.out.println("session확인2 :" + mapSessionList.get("session"));
				System.out.println("cm_no" + cm_no);
				// 만약 Map값을 불러왔는데 방번호가 같다면?
				if (cm_no.equals(sessioncm_no)) {

					Map<String, Object> userIdmap = session.getAttributes();
					Member m = (Member) userIdmap.get("loginUser"); // 세션 교체

					String nickname = m.getNickname();

					String jsonStr2 = cm_no + "|" + joinUser + "|" + "퇴장하셨습니다." + "|" + "out" + "|"+"퇴장";

					System.out.println("확인 에욱" + jsonStr2);
					sess.sendMessage(new TextMessage(jsonStr2)); // 여기잠깐바꿈

				}
			}
			
			
		
		System.out.println("sessionList : " + sessionList);
	}

}
