<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.chat-list-item {
        display: flex;
	    flex-direction: column;
	    justify-content: center;
	    width: 100%;
	    height: 18%;
	    background: white;
	    padding: 2%;
	    border-top: 1px solid #eaeaea;
	    border-bottom: 1px solid #eaeaea;
	}
	
	.chat-list-item > div:nth-child(1) {
		font-weight: bold;
	}
	
	.chat-list-item > div:nth-child(2) {
		font-size: 13px;
	}
	
	.chat-list-item > div:nth-child(3) {
		font-size: 13px;
	}
	
	.my-chat-list {
	   	height: 35%;
	}
	
	.my-chat-item {
	    display: inline-block;
	    width: 100px;
    	height: 100px;
	    padding: 1%;
	    border-radius: 10px;
        background: white;
    	border: 1px solid #ececec;
	    margin-right: 2%;
	}
	
	.chat-body {
		height: 89%;
    	background: aliceblue;
	}
	
	.btn-area {
		display: flex;
	    width: 100%;
	    justify-content: flex-end;
	    padding: 3%;
	}
	
	.add {	
    	width: 125px !important;
	    height: 31px !important;
	    background: lemonchiffon !important;
	}
	
	.item-wrap {
	    height: 125px;
	    padding-left: 3%;
	    overflow: hidden;
	    white-space: nowrap;
	}
	
	.item-wrap:hover {
		 overflow-x: scroll;
	}
	
	.chat-subject {
	    position: absolute;
	    top: 13.6%;
	    left: 4%;
	    font-size: 14px;
	    font-weight: 600;
	    color: gray;
	}
	.chattitle{
		 display: inline-block;
         vertical-align: middle;
         overflow: hidden;
         text-overflow: ellipsis;
         white-space: nowrap;
         width: 100%;
	}
	
	
	
	
</style>
</head>
<body>
<jsp:include page="../common/chatheader.jsp"/>
	<div class="chat-body">
		<div class="my-chat-list">
			<span class="chat-subject">나의 오픈 채팅방</span>
			<div class="btn-area">
				<button class="default-btn add" id="insertopenchatroom">채팅방 개설하기</button>
			</div>
			<div class="item-wrap">
				<c:forEach var="oc" items="${oclist }">
					<c:if test="${oc.cm_id eq loginUser.id}">
						<div class="my-chat-item">
							<div class="chattitle">${oc.cm_title }</div>
							<div>참가인원 : ${oc.cm_cot }</div>
							<input type="hidden" id="cm_no" value="${oc.cm_no }" name="cm_no">
					</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		
		<c:forEach var="oc" items="${oclist }">
			<c:if test="${oc.cm_id ne loginUser.id}">
				<div class="chat-list-item">
				<div class="blue">${oc.cm_title }</div>
				<div>방 소개 : ${oc.cm_con }</div>
				<div>참가인원 : ${oc.cm_cot }</div>
				<input type="hidden" id="cm_no" value="${oc.cm_no }" name="cm_no">
			</div>
			</c:if>
		</c:forEach>

	</div>	
</body>
<script>



$(function(){
	$("#insertopenchatroom").click(function(){
		location.href="insertopenchatroom.do";	
	})
})

$(function(){
	
	$(".my-chat-item").click(function(){
		var cm_no = $(this).find("input[type = hidden]").val();
		console.log("cm_no : " + cm_no);
		location.href="openchatview.do?cm_no=" + cm_no;
	})
	
	$(".chat-list-item").click(function(){
		var cm_no = $(this).find("input[type = hidden]").val();
		console.log("cm_no : " + cm_no);
		var result = prompt("패스워드를 입력하세요.");
		
		$.ajax({
			url:"passwordcheck.do",
			data:{result:result,cm_no:cm_no},
			success:function(data){
				
				console.log("data = " + data + "," + cm_no);
				check(data,cm_no);
			},
            error:function(request, status, errorData){
                alert("error code: " + request.status + "\n"
                      +"message: " + request.responseText
                      +"error: " + errorData);
           } 
		})
		//location.href="openchatview.do?cm_no=" + cm_no;
	})
})

function check(data,cm_no){
	console.log("에욱 : " + data + ", " + cm_no);
	if(data == "비밀번호가 일치하지 않습니다."){
		alert("비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
	}else{
		location.href="openchatview.do?cm_no=" + cm_no;
	}
}
</script>
</html>