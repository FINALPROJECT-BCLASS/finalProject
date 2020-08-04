<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<style>
	#message{
	    height: 70%;
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
	    height: 22%;
	    background: #f3f3f3;
	        border-top: 1px solid #e1e1e1;
			
	}
	
	.default-btn {
		margin-left: 20px;
    	height: 70% !important;
	}
	
	.tri-left {
	    height: 11px;
	    width: 11px;
	    background: white;
	    border-top: 1px solid #e8e8e8;
	    border-right: 1px solid #e8e8e8;
	    position: absolute;
	    transform: rotate(45deg);
	    right: 84px;
	}
	
	.tri-right {
	    height: 11px;
	    width: 11px;
	    background: white;
	    border-bottom: 1px solid #e8e8e8;
	    border-left: 1px solid #e8e8e8;
	    position: absolute;
	    transform: rotate(45deg);
	    left: 85px;
	}
	
	.text-con {
		width: 50%;
	    background: white;
	    border-radius: 10px;
	    padding: 12px;
	    font-size: 14px;
	    border: 1px solid #e8e8e8;
	}
	
	.chat-area {
		    height: 100%;
    background: aliceblue;
    overflow-y: scroll;
	}
	
	.chat-area::-webkit-scrollbar {
    	display:none;
    }
	
	#chatdata {
	    display: flex;
	    align-items: center;
	    justify-content: flex-end;
	    margin-top: 10px;
	    position: relative;
	}
	
	.profile-img {
		width: 50px;
	    height: 50px;
	    background: gray;
	    border-radius: 50%;
	    margin: 0 20px;
	    overflow: hidden;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.left{
		justify-content: flex-start !important;
	}
	.roomtitle{
        font-size: 17px;
	    padding: 10px;
	    font-weight: 600;
	}
	
	.title-area {
		display: flex;
	    justify-content: center;
	    align-items: center;
	    border-bottom: 1px solid #ececec;
	    position: relative;
	}
	
	.title-area > div:nth-child(1) {
	    position: absolute;
	    left: 4%;
	    font-weight: 900;
	    font-size: 25px;
	    margin-top: -6px;
	}
	
	.member-count {
		    font-size: 14px;
    position: absolute;
    right: 4%;
    display: flex;
    align-items: center;
    top: 2%;
    width: 44px;
    height: 44px;
	}
	
	.profile-img > img {
		height: 100%;
	}
	
	.member-list {
	   	position: absolute;
	    right: 20px;
	    top: 43px;
	    padding-left: 0;
	    background: lightblue;
	    align-items: center;
	    z-index: 1;
	    list-style: none;
	    font-size: 14px;
	    box-shadow: 1px 1px 14px -6px #808080;
	    opacity:0;

	}
	
	.member-count-area:hover > .member-list {
		opacity:1;
	}
	
	.member-count-area:hover li {
		height:100%;
	}
	
	.member-list li {
		padding: 5px 10px;
	    background: white;
	    margin-top: -1px;
	    border: 1px solid #ececec;
	    height: 0;

	}
	
	.member-list li:hover {
		background: #FBD14B;
		

	}
	
	.big-area {
		height: 100%;
    	position: relative;
    	display: flex;
    flex-direction: column;
	}
	
</style>
<body>
	
	<jsp:include page="../common/chatheader.jsp"/>
	<div class="title-area">
		<div class="Toback">
			<
		</div>	
		<div class="roomtitle ble">
			${openchat.cm_title}
		</div>
		<div class="member-count-area">
			<div class="member-count">
				<span class="material-icons">group</span>&nbsp; <a class="listcount"></a>
			</div>
			<ul class="member-list">
			</ul>
		</div>
	</div>
	<div class="big-area">
		<div class="chat-area">
			<div id="chatdata">
				<div class="text-con"></div>
				<div class="tri-left"></div>
				<div class="profile-img"></div>
			</div>
			<div id="chatdata" class="left">	<!--  받는사람한테 class="left" 추가 -->
				<div class="profile-img"></div>
				<div class="tri-right"></div>
				<div class="text-con">안아ㅓ리ㅏ어령</div>
			</div>
		</div>
		<div class="send-area">
			<input type="text" id="message" />
			<input type="button" id="sendBtn" class="default-btn b-yell" value="전송"/>
				<input type="hidden" value="${loginUser.id }" id="loginuser">
				<input type="hidden" value="${cm_no }" id="cm_no">
		</div>
	</div>
</body>


<script type="text/javascript">

	//웹소켓 연결 - sevlet-context에서 웹소켓 핸들러
	let sock = new SockJS("<c:url value="/echoroom"/>"); 
	
	//WebSocket하고 연결될떄 실행됨
	sock.onopen = onOpen;
	//websocket 에서 메세지를 받을떄 실행되는 메소드
	sock.onmessage = onMessage;
	//websocket 과 연결이 끊길때 실행하는 메소드
	sock.onclose = onClose;
	
	
	//연결될시 시작되는 메소드
 	function onOpen(){
		var msgData = {
				user_id : $("#loginuser").val(),
				cm_no : $("#cm_no").val(),
				msg : "입장하셨습니다.",
				join : "join"
		};
		
		//websocket으로 메시지를 보내겠다.
		var jsonData = JSON.stringify(msgData);//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
		sock.send(jsonData);    
	} 
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
				cm_no : $("#cm_no").val(),
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
		var cm_no = null;
		console.log("확인용 : " + evt.data);
		//문자열을 splite//
		 var strArray = data.split('|'); 
		
		if(strArray.length == 4){
			memberList(strArray);
			return;
		}
		
		for(var i=0; i<strArray.length; i++){
			console.log('str['+i+']: ' + strArray[i]);
		}
		
		//current session id//
		var currentuser_session = $("#loginuser").val();
		console.log('loginuser id: ' + currentuser_session);
		var current_cm_no = $("#cm_no").val();
		console.log("current_cm_no : " + current_cm_no);
		
		//String jsonStr2 = co_no + "|" +loginid+ "|" + mapReceive.get("msg");	
		cm_no = strArray[0];
		sessionid = strArray[1]; //현재 메세지를 보낸 사람의 세션 등록//
		message = strArray[2]; //현재 메세지를 저장//
		var $printHTML;
		//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
		if(sessionid == currentuser_session){
			printHTML =  "<div id='chatdata'>"
							 + "<div class='text-con'><span>"+message+"</span></div>"
							 + "<div class='tri-left'></div>"
							 + "<div class='profile-img'><img src='resources/muploadFiles/${loginUser.rename_file}'>"+"</div>"
							 + "</div>";
			$(".chat-area").append(printHTML);
		} else{
			printHTML = "<div id='chatdata' class='left'>"
							+"<div class='profile-img'></div>"
							+"<div class='tri-right'></div>"
							+"<div class='text-con'>"+message+"</div>";
							+"</div>"		
			$(".chat-area").append(printHTML);
		}
		
		console.log('chatting data: ' + data);
		
	  	/* sock.close(); */
	}
	    
	function onClose(evt){
		$("#data").append("연결 끊김");
	}  
	
	function memberList(strArray){
		for(var i=0; i<strArray.length; i++){
			console.log('str['+i+']: ' + strArray[i]);
		}
		
		var currentuser_session = $("#loginuser").val();
		console.log('loginuser id: ' + currentuser_session);
		var current_cm_no = $("#cm_no").val();
		console.log("current_cm_no : " + current_cm_no);
		
		//String jsonStr2 = co_no + "|" +loginid+ "|" + mapReceive.get("msg");	
		cm_no = strArray[0];
		sessionid = strArray[1]; //현재 메세지를 보낸 사람의 세션 등록//
		message = strArray[2]; //현재 메세지를 저장//
		joinORout = strArray[3];
		console.log("joinORout : " + joinORout)
			
		
		var $printHTML;
		var count;
		if(joinORout == "join"){
			
			printHTML =  "<li class="+sessionid+">"+sessionid+"</li>";
			
			$(".member-list").append(printHTML);

			count = $(".member-list").find("li").length;
			console.log("count : " + count);
			
			$(".listcount").html(count);
		}else if(joinORout == "out"){
			$("."+sessionid).remove();
		}
		
	}
	$(function(){
		$(".Toback").click(function(){
			location.href="openchatroom.do";
		})
	})
</script>
</html>