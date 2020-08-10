<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
  		<c:if test="${ groupTable.id eq gInfo.loginUserId}">
			<jsp:include page="../common/sidenaviGroupAdmin.jsp"/>
		</c:if>
		
		<c:if test="${ groupTable.id ne gInfo.loginUserId}">
			<jsp:include page="../common/sidenaviGroup.jsp"/>
		</c:if>
		
		 <div class="join-form-area">
			<jsp:include page="../common/groupNoticeHeader.jsp"/>
			gdgd
		</div>


  <jsp:include page="../common/footer.jsp"/>	 
</body>
</html>