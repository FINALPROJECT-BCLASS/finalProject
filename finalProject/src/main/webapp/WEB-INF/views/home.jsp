<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<style>
	
	</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>


	<jsp:include page="common/sidenaviGroup.jsp"/>

	 <button onclick="location.href='group.do'">이동하기</button>


	
	
	
<%-- 	<c:url var="memberJoin" value="memberJoin.do"></c:url>
	<button onclick="location.href='${memberJoin}'">이동하기</button> --%>
	
	hi
	

	<jsp:include page="common/footer.jsp"/>	
	
	
</body>
</html>
