<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
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
        	<table id="memberTable" align="center">
        		<thead>
        			<tr>
        				<th style="width: 80px;">신고 번호</th>
        				<th style="width: 100px;">ID</th>
        				<th style="width: 100px;">신고 날짜</th>
        				<th style="width: 400px;">신고 내용</th>
        				<th style="width: 100px;">처리 결과</th>
        				<th style="width: 100px;">처리 날짜</th>
        				<th style="width: 100px;">누적 횟수</th>
        			</tr>
        		</thead>
        		<tbody>
        		<c:forEach var="r" items="${rlist }">
        			<tr>
        				<td style="width: 80px;">${r.rpNo }</td>
        				<td style="width: 100px;">${r.id }</td>
        				<td style="width: 100px;">${r.rpDate }</td>
        				<td style="width: 400px;">${r.rpCon }</td>
        				<td style="width: 100px;">${r.rpResult }</td>
        				<td style="width: 100px;">${r.rpRDate }</td>
        				<td style="width: 100px;">${r.rpCount }</td>
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
				<c:url var="rlistBack" value="reportlist.do">
					<c:param name="page" value="${mpi.currentPage - 1 }"/>
					<c:param name="id" value="${searchID }"/>
				</c:url>
				<a href="${rlistBack }">[이전]</a>
			</c:if>
			<!-- [번호들] -->
			<c:forEach var="p" begin="${mpi.startPage }" end="${mpi.endPage }">
				<c:if test="${p eq mpi.currentPage }">
					<font color="#FBD14B" size="4"><b>[${p }]</b></font>
				</c:if>
				<c:if test="${p ne mpi.currentPage }">
					<c:url var="rlistCheck" value="reportlist.do">
						<c:param name="page" value="${p }"/>
						<c:param name="id" value="${searchID }"/>
					</c:url>
					<a href="${rlistCheck }">${p }</a>
				</c:if>
			</c:forEach>
			<!-- [다음] -->
			<c:if test="${mpi.currentPage eq mpi.maxPage }">
				[다음]&nbsp;
			</c:if>
			<c:if test="${mpi.currentPage ne mpi.maxPage }">
				<c:url var="rlistNext" value="reportlist.do">
					<c:param name="page" value="${mpi.currentPage + 1 }"/>
					<c:param name="id" value="${searchID }"/>
				</c:url>
				<a href="${rlistNext }">[다음]</a>
			</c:if>
        </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	$(function(){
    		$("#search-btn").click(function(){
    			var searchID = $("#searchID").val();
    			
    			location.href="reportlist.do?id="+searchID;
    		})
    	})
    </script>	
    
</body>
</html>