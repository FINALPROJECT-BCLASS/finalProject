<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#message{
	    height: 100px;
	    width: 71%;
	    border-radius: 5px;
	    border: none;
	}
	
	.send-area {
		position: absolute;
   		bottom: 0;
	  	display: flex;
	    align-items: center;
	    justify-content: center;
	    width: 100%;
	    height: 150px;
	    background: #f3f3f3;
			
	}
	
	.default-btn {
		margin-left: 20px;
    	height: 100px !important;
	}
	
	.tri-left {
	    width: 0px;
	    height: 0px;
	    border-top: 7px solid transparent;
	    border-left: 10px solid yellow;
	    border-bottom: 7px solid transparent;
	}
	
	.tri-right {
	    width: 0px;
	    height: 0px;
	    border-top: 7px solid transparent;
	    border-right: 10px solid yellow;
	    border-bottom: 7px solid transparent;
	}
	
	.text-con {
		width: 70%;
	    height: 60%;
	    background: yellow;
	    border-radius: 10px;
	}
	
	#chatdata {
		display: flex;
	    align-items: center;
	    justify-content: flex-end;
	    height: 100px;
	}
	
	.profile-img {
		width: 50px;
	    height: 50px;
	    background: gray;
	    border-radius: 50%;
	    margin: 0 20px;
	}
	
	.left{
		justify-content: flex-start !important;
	}
	
</style>
<body>
	<jsp:include page="../common/chatheader.jsp"/>
	<div class="chat-area">
		<div id="chatdata">
			<div class="text-con"></div>
			<div class="tri-left"></div>
			<div class="profile-img"></div>
		</div>
		
		<div id="chatdata" class="left">	<!--  받는사람한테 class="left" 추가 -->
			<div class="profile-img"></div>
			<div class="tri-right"></div>
			<div class="text-con"></div>
		</div>
	</div>
	<div class="send-area">
		<input type="text" id="message" />
		<input type="button" id="sendBtn" class="default-btn b-yell" value="전송"/>
			<input type="hidden" value="${loginUser.id }" id="loginuser">
			<input type="hidden" value="${ch.co_no }" id="co_no">
	</div>
</body>


<script type="text/javascript">

	let sock = new SockJS("<c:url value="/echoroom"/>"); 	//웹소켓 연결 - sevlet-context에서 웹소켓 핸들러
	
	//websocket 에서 메세지를 받을떄 실행되는 메소드
	sock.onmessage = onMessage;
	//websocket 과 연결이 끊길때 실행하는 메소드
	sock.onclose = onClose;
	
	//메세지 전송버튼 클릭 메소드
	$(function(){
		$("#sendBtn").click(function(){
	        sendMessage();
			console.log('send message...');
			$("#message").val('');
	    });
	});
	        
	//메세지 전송 메소드
	function sendMessage(){     
		var msgData = {
				user_id : $("#loginuser").val(),
				co_no : $("#co_no").val(),
				msg : $("#message").val()
		};
		
		//websocket으로 메시지를 보내겠다.
		var jsonData = JSON.stringify(msgData);//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
		sock.send(jsonData);    
	}
	           
	
	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt){  //변수 안에 function자체를 넣음.
		var data = evt.data;
		var sessionid = null;
		var message = null;
		var co_no = null;
		
		//문자열을 splite//
		 var strArray = data.split('|'); 
		
		for(var i=0; i<strArray.length; i++){
			console.log('str['+i+']: ' + strArray[i]);
		}
		
		//current session id//
		var currentuser_session = $("#loginuser").val();
		console.log('loginuser id: ' + currentuser_session);
		var current_co_no = $("#co_no").val();
		consoel.log("current_co_no : " + current_co_no);
		
		//String jsonStr2 = co_no + "|" +loginid+ "|" + mapReceive.get("msg");	
		co_no = strArray[0];
		sessionid = strArray[1]; //현재 메세지를 보낸 사람의 세션 등록//
		message = strArray[2]; //현재 메세지를 저장//
		
		//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
		if(sessionid == currentuser_session){
			var printHTML =  "<div id='chatdata'>"
							 + "<div class='text-con'>"+message+"</div>"
							 + "<div class='tri-left'></div>"
							 + "<div class='profile-img'><img src='resources/muploadFiles/${loginUser.rename_file}"+"</div>"
							 + "</div>";
			$("#chat-area").append(printHTML);
		} else{
			var printHTML = "<div id='chatdata' class='left'>"
							+"<div class='profile-img'></div>"
							+"<div class='tri-right'></div>"
							+"<div class='text-con'>"+message+"</div>";
							+"</div>"		
			$("#chat-area").append(printHTML);
		}
		
		console.log('chatting data: ' + data);
		
	  	/* sock.close(); */
	}
	    
	function onClose(evt){
		$("#data").append("연결 끊김");
	}  
</script>

</html>