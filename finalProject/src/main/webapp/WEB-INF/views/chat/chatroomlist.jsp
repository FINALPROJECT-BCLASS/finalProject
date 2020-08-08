<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatroomlist</title>
<style type="text/css">
	.chatroom {
	    display: flex;
	    align-items: center;
	    width: 100%;
	    height: 17%;
	    background: white;
	    padding: 2%;
	    border-top: 1px solid #eaeaea;
	    border-bottom: 1px solid #eaeaea;
	    margin-top: -1px;
        position: relative;
	}
	
	.header {
		border-bottom: 1px solid #eaeaea !important;
	}
	
	.cahtroomlist {
	    height: 91.5%;
	    background: aliceblue;
	    overflow-y: scroll;
	}
	
	.cahtroomlist::-webkit-scrollbar {
    	display:none;
    }
    
    body::-webkit-scrollbar {
    	display:none;
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
	
	.profile-img > img {
		height: 100%;
	}
	
	.chatroom-con {
		
	}
	
	.chatroom-con > div:nth-child(1) {
		font-size: 13px;
		color: #a7a7a7;
		font-weight: 600;
	 	
	}
	
	.chatroom-con > div:nth-child(2) {
        font-size: 14px;
	    height: 34px;
	    display: flex;
	    align-items: center;
	    width: 350px;
	}
	.chatroom-con > div:nth-child(2) > p {
		display: inline-block;
	    vertical-align: middle;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    width: 100%;
	    margin: 0;
	}
	
	/* body::-webkit-scrollbar {
    	display:none;
    } */
    
    .chatroom-count {
   	    position: absolute;
	    top: 34px;
	    right: 20px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
    }
    
    .chatroom-count > span:nth-child(1) {
   	    font-weight: 600;
	    font-size: 15px;
	    color: white;
	    width: 23px;
	    height: 23px;
	    border-radius: 50%;
	    background: #f93535;
	    display: flex;
	    align-items: center;
	    justify-content: center;
    }
	
</style>
</head>
<body>
	<jsp:include page="../common/chatheader.jsp"/>
	
	<div class="cahtroomlist">	
		<c:forEach var="cl" items="${chroomlist}">
			<div class="chatroom chat">
				<input type="hidden" name="co_no" value="${cl.co_no }" class="co_no" id="co_no">
				<div class="profile-img">
					<img src='resources/images/icons/profile_white.png'>
				</div>
				<div class="chatroom-con">
					<div>${cl.id2 }</div>
					<div><p>여기에는 내용을 써야합니다. 알겠냐?</p></div>
					<div class="chatroom-count">
						<span>3</span>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>

<script type="text/javascript">

$(function(){
$(".chat").click(function(){
	var co_no = $(this).siblings(".co_no").val();
	
	console.log("제발 " + co_no);
	
	/* location.href="chatroomdetail.do?co_no="+co_no; */
})
	
})
</script>

</html>