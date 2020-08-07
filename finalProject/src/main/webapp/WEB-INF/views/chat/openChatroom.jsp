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
	body {
		background: aliceblue !important;
	}

	#message{
	    height: 70%;
	    width: 71%;
	    border-radius: 5px;
	    border: none;
	    resize: none;
	    padding: 15px;
	    
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
    	background: #ffed95;
	}
	
	.tri-left {
	    height: 11px;
	    width: 11px;
	    background: #ffed95;
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
	    background: #ffed95;
	    border-radius: 10px;
	    padding: 12px;
	    font-size: 14px;
	    border: 1px solid #e8e8e8;
	    
	}
	
	.text-con-someone {
		width: 100%;
	    background: white;
	    border-radius: 10px;
	    padding: 12px;
	    font-size: 14px;
	    border: 1px solid #e8e8e8;
	}
	
	.chat-area {
	height: 100%;
    background: aliceblue;
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
		background: white;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    border-bottom: 1px solid #ececec;
	    border-top: 1px solid #ececec;
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
        border-bottom: 10px solid aliceblue;
	    height: 61%;
	    position: relative;
	    display: flex;
	    flex-direction: column;
	    overflow-y: scroll;
	    background: aliceblue;
	}
	
	.big-area::-webkit-scrollbar {
    	display:none;
    }
    
    .text-con-area {
   	    width: 50%;
    }
    
    .text-con-area > div:nth-child(1) {
   	    font-size: 13px;
	    color: gray;
	    font-weight: 600;
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
		<c:forEach var="cl" items="${chatlist }">
			<c:if test="${cl.id eq loginUser.id}">
			<div id="chatdata">
				<div class="text-con"><span>${cl.ml_cont }</span></div>
				<div class="tri-left"></div>
				<div class="profile-img">
				<c:if test="${!empty loginUser.rename_file }">
				<img src='resources/muploadFiles/${loginUser.rename_file}'>
				</c:if>
				
				<c:if test="${empty loginUser.rename_file }">
				<img src='resources/images/icons/profile_white.png'>
				</c:if>
				</div>
			</div>
			</c:if>
			<c:if test="${cl.id ne loginUser.id}">
				<div id="chatdata" class="left">	<!--  받는사람한테 class="left" 추가 -->
				<div class="profile-img">
				<c:if test="${empty cl.rename_file }">
				<img src='resources/images/icons/profile_white.png'>
				</c:if>
				<c:if test="${!empty cl.rename_file }">
				<img src='resources/muploadFiles/${cl.rename_file}'>
				</c:if>
				</div>
					<div class="tri-right"></div>
				<div class="text-con-area">
					<div>${cl.nickname }</div>
					<div class="text-con-someone">${cl.ml_cont }</div>
				</div>
			</div>
			</c:if>
		</c:forEach>
		</div>
	</div>
		<div class="send-area">
			<textarea id="message"></textarea>
			<input type="button" id="sendBtn" class="default-btn" value="전송"/>
				<input type="hidden" value="${loginUser.nickname }" id="loginuser">
				<input type="hidden" value="${cm_no }" id="cm_no">
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
				user_id : "${loginUser.nickname}",
				cm_no : $("#cm_no").val(),
				msg : "입장하셨습니다.",
				join : "join",
		};
		
		//websocket으로 메시지를 보내겠다.
		var jsonData = JSON.stringify(msgData);//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
		sock.send(jsonData);    
	} 
	//메세지 전송버튼 클릭 메소드
		
	$("#message").keypress(function(event) {
		if (event.which == 13) {
			$("#sendBtn").click();
			return false;
		}
	});

	$("#sendBtn").click(function() {
		sendMessage();
		console.log('send message...');
		$("#message").val('');
	});

	//메세지 전송 메소드
	function sendMessage() {
		var user = $("#loginuser").val();
		var msgData = {
			user_id : $("#loginuser").val(),
			cm_no : $("#cm_no").val(),
			msg : $("#message").val(),
			img : "${loginUser.rename_file}"
		};

		/* 	if(login == "존재합니다"){
				console.log("재밌넹");
			}else{
				location.href=login;
			 }*/

		//websocket으로 메시지를 보내겠다.
		var jsonData = JSON.stringify(msgData);//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
		sock.send(jsonData);
	
	}

	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt) { //변수 안에 function자체를 넣음.
		var data = evt.data;
		var sessionid = null;
		var message = null;
		var cm_no = null;
		console.log("확인용 : " + evt.data);
		//문자열을 splite//
		var strArray = data.split('|');

		if (strArray.length == 5) {
			memberList(strArray);
			return;
		}

		for (var i = 0; i < strArray.length; i++) {
			console.log('str[' + i + ']: ' + strArray[i]);
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
		img = strArray[3];
		var $printHTML;
		console.log("img : " +img);
		//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
		if (sessionid == currentuser_session) {
			var check = "${loginUser.rename_file}";
			if(check == "" ){
				printHTML = "<div id='chatdata'>"
					+ "<div class='text-con'><span>"
					+ message
					+ "</span></div>"
					+ "<div class='tri-left'></div>"
					+ "<div class='profile-img'><img src='resources/images/icons/profile_white.png'>"
					+ "</div>" + "</div>";
				
			}else{
				printHTML = "<div id='chatdata'>"
					+ "<div class='text-con'><span>"
					+ message
					+ "</span></div>"
					+ "<div class='tri-left'></div>"
					+ "<div class='profile-img'><img src='resources/muploadFiles/${loginUser.rename_file}'>"
					+ "</div>" + "</div>";
				
			}
			$(".chat-area").append(printHTML);
		} else {
			
			if(img == ""){
				printHTML = "<div id='chatdata' class='left'>"
					+ "<div class='profile-img'><img src='resources/images/icons/profile_white.png'></div>"
					+ "<div class='tri-right'></div>"
					+"<div class='text-con-area'>"
					+"<div>" + sessionid+"</div>"
					+"<div class='text-con-someone'>"+message+"</div>";
					+"</div>";
				
			}else{
				printHTML = "<div id='chatdata' class='left'>"
					+ "<div class='profile-img'><img src='resources/muploadFiles/"+img+"'></div>"
					+ "<div class='tri-right'></div>"
					+"<div class='text-con-area'>"
					+"<div>" + sessionid+"</div>"
					+"<div class='text-con-someone'>"+message+"</div>";
					+"</div>";
			}
			
				
			$(".chat-area").append(printHTML);
		}

		console.log('chatting data: ' + data);
		$(".big-area").scrollTop($(".big-area")[0].scrollHeight);

		/* sock.close(); */
	}

	function onClose(evt) {
		var msgData = {
			user_id : "${loginUser.nickname}",
			cm_no : $("#cm_no").val(),
			msg : "퇴장하셨습니다.",
			out : "out"
		};
		var jsonData = JSON.stringify(msgData);	//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
		sock.send(jsonData);
	}

	function memberList(strArray) {
		for (var i = 0; i < strArray.length; i++) {
			console.log('str[' + i + ']: ' + strArray[i]);
		}

		var currentuser_session = $("#loginuser").val();
		console.log('loginuser id: ' + currentuser_session);
		var current_cm_no = $("#cm_no").val();
		console.log("current_cm_no : " + current_cm_no);

		//String jsonStr2 = co_no + "|" +loginid+ "|" + mapReceive.get("msg");	
		var cm_no = strArray[0];
		var connectid = strArray[1]; //현재 메세지를 보낸 사람의 세션 등록//
		var message = strArray[2]; //현재 메세지를 저장//
		var joinORout = strArray[3];
		console.log("joinORout : " + joinORout);
		console.log("sessionid : " + connectid);

		var connectidArray = connectid.split(',');

		console.log("에욱" + connectidArray[1]);

		var $printHTML;
		var count;
		var string = "";

		for (var i = 0; i < connectidArray.length - 1; i++) {

			string += "<li class="+connectidArray[i]+">" + connectidArray[i]
					+ "</li>";

		}
		printHTML = string;
		$(".member-list").html("");
		$(".member-list").append(printHTML);

		count = $(".member-list").find("li").length;
		console.log("count : " + count);

		$(".listcount").html(count);
		
		
	}

	$(function() {
		$(".Toback").click(function() {
			location.href = "openchatroom.do";
		})
	})
</script>
</html>