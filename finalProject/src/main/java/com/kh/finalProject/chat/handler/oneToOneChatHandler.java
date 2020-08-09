package com.kh.finalProject.chat.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.chat.model.service.ChatService;
import com.kh.finalProject.member.model.vo.Member;

@Component
public class oneToOneChatHandler extends TextWebSocketHandler {
		
	
	  @Autowired ChatService cService;
	 
	//세션저장 ("co_no",co_no),("session",세션) - ...
		private List<Map<String,Object>> sessionList = new ArrayList<Map<String, Object>>();
		
		private static Logger logger = LoggerFactory.getLogger(oneToOneChatHandler.class);
		
		
		
		//클라이언트와 연결 된 후
		@Override
		public void afterConnectionEstablished(WebSocketSession session) {
		//채팅방 번호와 보낸이 아이디
			System.out.println("session uri? : "+ session.toString());
			Map<String,Object> sessionmap = session.getAttributes();
			
			Member m = (Member)sessionmap.get("loginUser");
			
			//co_no가져오기
			String co_no = String.valueOf(sessionmap.get("co_no"));
			System.out.println("co_no 에욱 :" + co_no);
			//list<map<string,object>>에 들어갈 map저장
			  Map<String, Object> map = new HashMap<String, Object>();
			  map.put("co_no",co_no);
			  map.put("session", session);
			  
			  Map<String,Object> map2 = new HashMap<String, Object>();
			  map2.put("co_no",co_no);
			  map2.put("id", m.getId());
			  
			  int result = cService.chatReadCheck(map2);
			  
			  System.out.println("session 접속 : " + sessionList);
			  
			  sessionList.add(map);
				logger.info("{} 연결됨", session.getId()); 
			//연결 완료.
		}
		
		//웹 소켓 서버로 데이터를 전송했을 경우
		 @Override
		 protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			 logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
			  
			   //JSON --> MAP으로 변환
			   ObjectMapper objectMapper = new ObjectMapper();
			   Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
			   
			   //이거 왜넣었을까?
			   HashMap<String, Object> map = new HashMap<String, Object>();
			   map.put("co_no", mapReceive.get("co_no"));
			   map.put("session", session);
			   
			   //같은방 인원수 체크
			   int count = 0;
			   for(int i=0;i<sessionList.size();i++) {
				   Map<String, Object> mapSessionList = sessionList.get(i);
				   String co_no = String.valueOf(mapSessionList.get("co_no"));
					WebSocketSession sess = (WebSocketSession)mapSessionList.get("session");
				   
					if(co_no.equals(mapReceive.get("co_no"))) {
						count++;
					}
			   }
			   String yn = "";
			   //메세지전송 (Y,N)체크해주기위한 IF문
			  if(count == 2) {
				  yn = "Y";
			  }else {
				  yn ="N";
			  }
			  
			  //db에 저장 준비
			  Map<String,Object> userIdmap = session.getAttributes();
				Member m = (Member)userIdmap.get("loginUser"); //세션 교체
				String loginid = m.getId();
			
			  map.put("yn", yn);
			  map.put("id", loginid);
			  map.put("message",String.valueOf(mapReceive.get("msg")));
			
			  int result = cService.insertChatmsg(map);//db저장
			  
			  System.out.println("sessionList 확인...:" + sessionList);
			  //메세지 뿌려주기
			   for(int i=0; i<sessionList.size(); i++) {
					Map<String, Object> mapSessionList = sessionList.get(i);
					
					//sessionList에 담긴 Map에 값 가져옴 
					String co_no = String.valueOf(mapSessionList.get("co_no"));
					WebSocketSession sess = (WebSocketSession)mapSessionList.get("session");
					System.out.println("sess : " + sess.getId()); //확인1 .
					System.out.println("session확인2 :" +  mapSessionList.get("session"));
					System.out.println("co_no" + co_no);
					
					//만약 Map값을 불러왔는데 방번호가 같다면?
					if(co_no.equals(mapReceive.get("co_no"))) {
						
						System.out.println("msg : " + mapReceive.get("msg"));
						String name = m.getName();
						
						String jsonStr2 = co_no + "|" +name+ "|" + mapReceive.get("msg")+"|" +mapReceive.get("img");						

						System.out.println("확인 에욱" + jsonStr2);
						sess.sendMessage(new TextMessage(jsonStr2)); //여기잠깐바꿈
						
					}
			   }
			
			 
		   }
		
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
			//여기서 Db를 등록하면 되지않을까?
			//List 삭제
				
			logger.info("{} 연결 끊김",session.getId());
			 
			 for (int i = 0; i < sessionList.size(); i++) {
					Map<String, Object> map = sessionList.get(i);
					String co_no = (String)map.get("co_no");
					WebSocketSession sess = (WebSocketSession)map.get("session");
					
					if(session.equals(sess)) {
						sessionList.remove(map);
					}
		}
			 	System.out.println("sessionList : " + sessionList);
		}
		
		
}
