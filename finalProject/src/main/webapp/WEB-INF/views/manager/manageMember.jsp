<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Member</title>
    <script type="text/javascript"></script>
    
    <link href='resources/css/main.css' rel='stylesheet' />
    <script src='resources/lib/main.js'></script>
    
    <style>
    	#circle{
            width: 60px;
            height : 60px;
            background-color: #FBD14B;
            border-radius: 50%;
            display: inline-block;
        }

        #circleArea{
            width: 100%;
            display: flex;
            align-items: center;
            margin: 50px;
        }

        #manageLogo{
            margin-left: -35px;
            padding-top: 7px;
            font-size: 30px;
            color: rgba(72, 72, 72, 1);;
        }
        
        #searchArea{
        	width: 100%;
        	text-align: center;
        }
        
        #tableArea{
        	width: 100%;
        	margin-top: 50px;
        }
        
        #memberTable th{
        	border: 2px solid #F3F3F3;
        	text-align: center;
        	background-color: #F3F3F3;
        	height: 30px;
        }
        
        #memberTable td{
        	border: 2px solid #F3F3F3;
        	text-align: center;
        	height: 30px;
        }
        
        #paginationArea{
        	margin-top: 50px;
        	margin-bottom: 100px;
        	width: 100%;
        	text-align: center;
        }
        
        #search-btn {
			font-size: 15px;
		    font-weight: 600;
		    color: white;
			border-style: none;
		    border-radius: 8px;
		    height: 40px;
		    width: 80px;
		    background-color: #2860E1;
		}
		
		.chat_yn_td:hover {
			cursor: pointer;
		}
        
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    <section>
		<div id="circleArea">
            <div id="circle"></div>
            <b id="manageLogo">회원 관리</b>
        </div>
        
        <div id="searchArea">
        	<b>ID를 입력하세요 : </b>
        	<input type="text" id="searchID">
        	<button type="button" class="default-btn" id="search-btn">Search</button>
        </div>
        
        <div id="tableArea">
        	<h5 style="width: 100%; text-align: center;"><b>'채팅 가능'을 클릭하면 기능을 정지하거나 해제할 수 있습니다</b></h5>
        	<table id="memberTable" align="center">
        		<thead>
        			<tr>
        				<th style="width: 100px;">ID</th>
        				<th style="width: 100px;">이름</th>
        				<th style="width: 100px;">닉네임</th>
        				<th style="width: 200px;">이메일</th>
        				<th style="width: 120px;">전화번호</th>
        				<th style="width: 100px;">생년월일</th>
        				<th style="width: 300px;">주소</th>
        				<th style="width: 100px;">가입일</th>
        				<th style="width: 80px;">채팅 가능</th>
        				<th style="width: 80px;">회원 탈퇴</th>
        			</tr>
        		</thead>
        		<tbody>
        		<c:forEach var="m" items="${mlist }">
        			<tr>
        				<td style="width: 100px;">
        					<input type="hidden" class="id" value="${m.id }">
        					${m.id }
        				</td>
        				<td style="width: 100px;">${m.name }</td>
        				<td style="width: 100px;">${m.nickname }</td>
        				<td style="width: 200px;">${m.email }</td>
        				<td style="width: 120px;">${m.phone }</td>
        				<td style="width: 100px;">${m.birthday }</td>
        				<td style="width: 300px;">${m.address }</td>
        				<td style="width: 100px;">${m.join_date }</td>
        				<td style="width: 80px;" class="chat_yn_td">
        					<input type="hidden" class="chat_yn" value="${m.chat_yn }">
        					${m.chat_yn }
        				</td>
        				<td style="width: 80px;">${m.out_yn }</td>
        			</tr>
        		</c:forEach>
        		</tbody>
        	</table>
        </div>
        
        <c:if test="${!empty searchID }">
        	<script>
        		$("#searchID").val("${searchID }");
        	</script>
        </c:if>
        
        <div id="paginationArea">
        	<!-- [이전] -->
			<c:if test="${mpi.currentPage eq 1 }">
				[이전]&nbsp;
			</c:if>
			<c:if test="${mpi.currentPage gt 1 }">
				<c:url var="mlistBack" value="memberlist.do">
					<c:param name="page" value="${mpi.currentPage - 1 }"/>
					<c:param name="id" value="${searchID }"/>
				</c:url>
				<a href="${mlistBack }">[이전]</a>
			</c:if>
			<!-- [번호들] -->
			<c:forEach var="p" begin="${mpi.startPage }" end="${mpi.endPage }">
				<c:if test="${p eq mpi.currentPage }">
					<font color="#FBD14B" size="4"><b>[${p }]</b></font>
				</c:if>
				<c:if test="${p ne mpi.currentPage }">
					<c:url var="mlistCheck" value="memberlist.do">
						<c:param name="page" value="${p }"/>
						<c:param name="id" value="${searchID }"/>
					</c:url>
					<a href="${mlistCheck }">${p }</a>
				</c:if>
			</c:forEach>
			<!-- [다음] -->
			<c:if test="${mpi.currentPage eq mpi.maxPage }">
				[다음]&nbsp;
			</c:if>
			<c:if test="${mpi.currentPage ne mpi.maxPage }">
				<c:url var="mlistNext" value="memberlist.do">
					<c:param name="page" value="${mpi.currentPage + 1 }"/>
					<c:param name="id" value="${searchID }"/>
				</c:url>
				<a href="${mlistNext }">[다음]</a>
			</c:if>
        </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	$(function(){
    		$("#search-btn").click(function(){
    			var searchID = $("#searchID").val();
    			
    			location.href="memberlist.do?id="+searchID;
    		})
    		
    		$(".chat_yn_td").click(function(){
    			var selectID = $(this).parent().find(".id").val();
    			var chatYN = $(this).find(".chat_yn").val();
    			
    			if(chatYN == 'Y') {
	    			var deleteCheck = confirm("해당 사용자의 채팅 기능을 정지하시겠습니까?");
	    			if(deleteCheck == true){
	    				location.href="updatechatn.do?selectID="+selectID;
	    			}
	    			else if(deleteCheck == false){
	    				alert("작업을 취소합니다.");
	    			}    				    				
    			} else {
    				var deleteCheck = confirm("해당 사용자의 채팅 기능 정지를 해제하시겠습니까?");
	    			if(deleteCheck == true){
	    				location.href="updatechaty.do?selectID="+selectID;
	    			}
	    			else if(deleteCheck == false){
	    				alert("작업을 취소합니다.");
	    			}  
    			}
    			
    		})
    	})
    </script>	
    
</body>
</html>