<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatroomlist</title>
</head>
<body>
	<jsp:include page="../common/chatheader.jsp"/>
	
	<div class="cahtroomlist">	
		<c:forEach var="cl" items="${chroomlist}">
			<div class="chatroom">
				<input type="hidden" name="co_no" value="${cl.co_no }" class="co_no" id="co_no">
				<div>${cl.id2 }</div>
				<div>${cl.id } 에욱 test</div>
				<button type="button" class="chat">입장하기</button>
			</div>
		</c:forEach>
	</div>
</body>

<script type="text/javascript">

$(function(){
$(".chat").click(function(){
	var co_no = $(this).siblings(".co_no").val();
	
	console.log("제발 " + co_no);
	
	location.href="chatroomdetail.do?co_no="+co_no;
})
	
})
</script>

</html>