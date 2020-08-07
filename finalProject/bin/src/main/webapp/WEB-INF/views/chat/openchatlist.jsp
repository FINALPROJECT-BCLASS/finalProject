<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/chatheader.jsp"/>
	
	<table>
		<tr>
			<td>제목란</td>
			<td>소개란</td>
			<td>인원</td>
		</tr>
	</table>
	<button id="insertopenchatroom">개설하기</button>
</body>
<script>

$(function(){
	$("#insertopenchatroom").click(function(){
		location.href="insertopenchatroom.do";	
	})
})
</script>
</html>