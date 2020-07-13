<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Group Main</title>
 <style>
    body{background: #F3F3F3;}
    h1, h4{margin-top:20px; text-align:center;}
    
    #writeBtn { width:50px; height: 50px; margin-right:40px; margin-bottom:10px;}
    button {float:right; margin-bottom: 10px; margin-right:40px; background:none; border:0;}

    .groupTb {border-spacing: 20px; border-collapse: separate;}
    .groupTb td{padding:20px; margin:20px; border:2px solid lightgrey; border-radius: 7px; background:white;}
    
    a{background: #F3F3F3;}
    p{text-align:center; margin-top:5px;}
    img {width:300px; height:250px; cursor: pointer; border-radius: 5px;}

    /* tooltip 색상 변경 css */
    .tooltip.bs-tooltip-bottom .tooltip-inner { background:#2860E1 !important;}
    .tooltip .arrow:before { border-bottom-color:#2860E1 !important; border-top-color:#2860E1 !important; }
  </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	
	
  <!-- Container (Portfolio Section) -->

<div class="groupMain">
    <br>
    <h1>Group Diary</h1>
    <h4>What we have created</h4>

    <button id="groupWrite" onclick="location.href='groupInsertView.do'" ><img src="resources/images/write.png" id="writeBtn"></button>

    <div style="clear:both"></div>  
    
    	
	<c:if test="${empty list }">
		<br>
		<br>
		<h4 align="center">가입한 그룹이 없습니다.</h4>
	</c:if>  
    
    <div id="gropTbForm">
    <table class="groupTb" align="center">
        <tr>
        	<c:forEach var="g" items="${list }">
            <td>
                <a href="#" data-toggle="tooltip" data-placement="bottom" title="${g.gName }">
                     <img src="resources/images/${g.gOrigin}">
                </a>
                <p><b>${g.gTitle }</b></p>
                <p>${g.gCon }</p>
            </td>
            </c:forEach>
        </tr>
    </table>
</div>

<!-- tooltip 부트스트랩 -->
	<script>
	    $(document).ready(function(){
	      $('[data-toggle="tooltip"]').tooltip();   
	    });
    </script>
    
    	<jsp:include page="../common/footer.jsp"/>	
</body>
</html>