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
    
    
    button {float:right; margin-bottom: 10px; margin-right:40px; background:none; border:0;}

    .groupTb {border-spacing: 20px; border-collapse: separate;}
    .groupTb td{display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    width: 310px;
    height: 326px;
    padding: 20px;
    margin: 20px;
    border: 1px solid lightgrey;
    border-radius: 7px;
    background: white;}
    
    #gropTbForm{margin-bottom:70px;}
    
    a{background: #F3F3F3;}
    p{/* text-align:center; margin-top:5px; */ margin:0;}
    .groupImg {    width: 195px;
    /* height: 250px; */
    cursor: pointer;
    border-radius: 6px;}

	/* 글쓰기 버튼 */
	.writeBtn{margin-right:30px;color:#aeaeae !important; font-size:50px !important; cursor:pointer; padding:0 !important;}
    .writeBtn:hover{margin-right:30px;color:#2860E1 !important; font-size:50px !important; cursor:pointer; padding:0 !important;}
	

    /* tooltip 색상 변경 css */
    .tooltip .bs-tooltip-bottom .tooltip-inner { background:#2860E1 !important;}
    .tooltip .arrow:before { border-bottom-color:#2860E1 !important; border-top-color:#2860E1 !important; }
  
  tr {
	    display: flex !important;
	}
	
	.groupMain {
		padding: 70px 0;
	}
  
  </style>
  
  
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	
	
  <!-- Container (Portfolio Section) -->
<c:if test="${empty loginUser}">
	<script>
		alert("로그인을 해주세요.");
		location.href = "home.do";
	</script>
</c:if>

<c:if test="${!empty loginUser }">
	<c:if test="${empty list }">
		<br>
	    <h1>Group Diary</h1>
	    <h4>What we have created</h4>
		<br>
		<br>
	    <button id="groupWrite" onclick="location.href='groupInsertView.do'" ><span class="material-icons writeBtn">create</span></button>
	    <div style="clear:both"></div>  
		<br>
		<h4>가입한 그룹이 없습니다.</h4>
		<br>
		<br>
		<br>
		<br>
	</c:if>  
	
	<c:if test="${!empty list }">
	
	<div class="groupMain">
	    <br>
	    <h1>Group Diary</h1>
	    
	    <h4>What we have created</h4>
	
	    <button id="groupWrite"  class="writeBtn" onclick="location.href='groupInsertView.do'" ><span class="material-icons writeBtn">create</span></button>
	
	    <div style="clear:both"></div>

		    <div id="gropTbForm">
		    <table class="groupTb" align="center">
		        <tr>
		        	<c:forEach var="g" items="${list }" varStatus="status">
		        	<c:if test="${status.index%4 ==0 }">
		        		<tr></tr>
		        	</c:if>
		        	
		            <td style="box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.048);">
		            	<c:url var="groupCalendar" value="sessionCreate.do">
								<c:param name="loginUser" value="${sessionScope.loginUser}"/>
								<c:param name="groupNo" value="${g.gNo}"/>
						</c:url>
						
		                <a href="${groupCalendar }" data-toggle="tooltip" data-placement="bottom" title="${g.gName }">
		                	<c:if test="${empty g.gOrigin }">
		                		<img class="groupImg" src="resources/groupMainFiles/group1.png">
		                	</c:if>
		                	<c:if test="${!empty g.gOrigin  }">
		                    	 <img class="groupImg" src="resources/groupMainFiles/${g.gOrigin}">
		                    </c:if>
		                </a>
		                <p><b>${g.gTitle }</b></p>
		                <p>${g.gCon }</p>
		                <p>${g.gName }</p>
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
	    
	</c:if> <!-- list가 있을 때 -->	        
</c:if>	<!-- loginUser 있을 때 -->
    	<jsp:include page="../common/footer.jsp"/>	
</body>
</html>