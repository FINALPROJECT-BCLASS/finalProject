<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>     
<head>
<meta charset="UTF-8">
    <title>Report</title>
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
        
        #reportTable th{
        	border: 2px solid #F3F3F3;
        	text-align: center;
        	background-color: #F3F3F3;
        	height: 30px;
        }
        
        #reportTable td{
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
		
		.save-btn {
			font-size: 15px;
		    font-weight: 700;
			border-style: none;
		    border-radius: 8px;
		    height: 40px;
		    width: 80px;
		    /* background-color: #2860E1; */
		    background: none;
		}
		
		.no-btn {
			font-size: 15px;
		    font-weight: 700;
			border-style: none;
		    border-radius: 8px;
		    height: 40px;
		    width: 80px;
		    /* background-color: #2860E1; */
		    background: none;
		}
		
		#btnArea {
			width: 100%;
			text-align: right;
			margin-bottom: 10px;
		}
		
		.select-btn {
			font-size: 15px;
		    font-weight: 700;
			border-style: none;
		    border-radius: 8px;
		    height: 30px;
		    width: 80px;
		    background-color: #484848;
		    color: white;
		}
        
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    <section>
		<div id="circleArea">
            <div id="circle"></div>
            <b id="manageLogo">신고 관리</b>
        </div>
        
        <div id="searchArea">
        	<b>ID를 입력하세요 : </b>
        	<input type="text" id="searchID">
        	<button type="button" class="default-btn" id="search-btn">Search</button>
        </div>
        
        <div id="tableArea">
        	<div id="btnArea">
        		<button type="button" class="select-btn" onclick="location.href='reportlist.do'">전체 보기</button>&nbsp;
        		<input type="hidden" name="rprNo" value="1">
	        	<button type="button" class="select-btn rprNo-btn">처리 전</button>&nbsp;
	        	<input type="hidden" name="rprNo" value="2">
	        	<button type="button" class="select-btn rprNo-btn">접수 완료</button>&nbsp;
	        	<input type="hidden" name="rprNo" value="3">
	        	<button type="button" class="select-btn rprNo-btn">계정 정지</button>&nbsp;
	        	<input type="hidden" name="rprNo" value="4">
	        	<button type="button" class="select-btn rprNo-btn">보류</button><br>
	        </div>
        	<table id="reportTable" align="center">
        		<thead>
        			<tr>
        				<th style="width: 80px;">신고 번호</th>
        				<th style="width: 100px;">신고자</th>
        				<th style="width: 100px;">신고 대상</th>
        				<th style="width: 100px;">신고 날짜</th>
        				<th style="width: 300px;">신고 내용</th>
        				<th style="width: 300px;">대화 내용</th>
        				<th style="width: 100px;">처리 결과</th>
        				<th style="width: 100px;">처리 날짜</th>
        				<th style="width: 100px;">누적 횟수</th>
        				<th style="width: 100px;">저장</th>
        			</tr>
        		</thead>
        		<tbody>
        		<c:forEach var="r" items="${rlist }">
        			<tr>
        				<td style="width: 80px;">
        					<input type="hidden" class="rpNo" value="${r.rpNo }">
        					${r.rpNo }
        				</td>
        				<td style="width: 100px;">
        					<input type="hidden" class="rpId" value="${r.reportId }">
        					${r.reportId }
        				</td>
        				<td style="width: 100px;">
        					<input type="hidden" class="rpedId" value="${r.reportedId }">
        					${r.reportedId }
        				</td>
        				<td style="width: 100px;">${r.rpDate }</td>
        				<td style="width: 300px;">${r.rpCon }</td>
        				<td style="width: 300px;">${r.rpChat }</td>
        			<c:if test="${r.rprNo eq 1}">
        				<td style="width: 100px;">
        					<select class="rprNo" name="rprNo">
        						<option value="1" selected>처리 전</option>
        						<option value="2">접수 완료</option>
        						<option value="3">계정 정지</option>
        						<option value="4">보류</option>
        					</select>
        				</td>        			
        			</c:if>
        			<c:if test="${r.rprNo eq 2}">
        				<td style="width: 100px;">
        					<select class="rprNo" name="rprNo">
        						<option value="1">처리 전</option>
        						<option value="2" selected>접수 완료</option>
        						<option value="3">계정 정지</option>
        						<option value="4">보류</option>
        					</select>
        				</td>        			
        			</c:if>
        			<c:if test="${r.rprNo eq 3}">
        				<td style="width: 100px;">
        					<select class="rprNo" name="rprNo">
        						<option value="1">처리 전</option>
        						<option value="2">접수 완료</option>
        						<option value="3" selected>계정 정지</option>
        						<option value="4">보류</option>
        					</select>
        				</td>        			
        			</c:if>
        			<c:if test="${r.rprNo eq 4}">
        				<td style="width: 100px;">
        					<select class="rprNo" name="rprNo">
        						<option value="1">처리 전</option>
        						<option value="2">접수 완료</option>
        						<option value="3">계정 정지</option>
        						<option value="4" selected>보류</option>
        					</select>
        				</td>        			
        			</c:if>
        				<td style="width: 100px;">${r.rpRDate }</td>
        				<td style="width: 100px;">${r.rpCount }</td>
        			<c:if test="${empty r.rpRDate }">
        				<td style="width: 100px;"><button type="button" class="save-btn">Save</button></td>
        			</c:if>
        			<c:if test="${!empty r.rpRDate }">
        				<td style="width: 100px;"><button type="button" class="no-btn" onclick="viewAlert()">Save</button></td>
        			</c:if>
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
			<c:if test="${rpi.currentPage eq 1 }">
				[이전]&nbsp;
			</c:if>
			<c:if test="${rpi.currentPage gt 1 }">
				<c:url var="rlistBack" value="reportlist.do">
					<c:param name="page" value="${rpi.currentPage - 1 }"/>
					<c:param name="id" value="${searchID }"/>
					<c:param name="rprNo" value="${selectRprNo }"/>
				</c:url>
				<a href="${rlistBack }">[이전]</a>
			</c:if>
			<!-- [번호들] -->
			<c:forEach var="p" begin="${rpi.startPage }" end="${rpi.endPage }">
				<c:if test="${p eq rpi.currentPage }">
					<font color="#FBD14B" size="4"><b>[${p }]</b></font>
				</c:if>
				<c:if test="${p ne rpi.currentPage }">
					<c:url var="rlistCheck" value="reportlist.do">
						<c:param name="page" value="${p }"/>
						<c:param name="id" value="${searchID }"/>
						<c:param name="rprNo" value="${selectRprNo }"/>
					</c:url>
					<a href="${rlistCheck }">${p }</a>
				</c:if>
			</c:forEach>
			<!-- [다음] -->
			<c:if test="${rpi.currentPage eq rpi.maxPage }">
				[다음]&nbsp;
			</c:if>
			<c:if test="${rpi.currentPage ne rpi.maxPage }">
				<c:url var="rlistNext" value="reportlist.do">
					<c:param name="page" value="${rpi.currentPage + 1 }"/>
					<c:param name="id" value="${searchID }"/>
					<c:param name="rprNo" value="${selectRprNo }"/>
				</c:url>
				<a href="${rlistNext }">[다음]</a>
			</c:if>
        </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	function updateReport(rpNo, rprNo, rpedId) {
    		var updateCheck = confirm("저장 하시겠습니까? 한 번 저장하면 수정이 불가합니다.");
			if(updateCheck == true){
				location.href="updatereport.do?rpNo="+rpNo+"&rprNo="+rprNo+"&rpedId="+rpedId;
			}
			else if(updateCheck == false){
				alert("작업을 취소합니다.");
			}
    	}
    	
    	function viewAlert() {
    		alert("저장된 내용을 변경할 수 없습니다.");
    		window.location.reload();
    	}
    	
    	$(function(){
    		$("#search-btn").click(function(){
    			var searchID = $("#searchID").val();
    			
    			location.href="reportlist.do?id="+searchID;
    		})
    		
    		$(".save-btn").click(function(){
    			var rpNo = $(this).parent().parent().find(".rpNo").val();
    			var rprNo = $(this).parent().parent().find(".rprNo").val();
    			var rpedId = $(this).parent().parent().find(".rpedId").val();

    			updateReport(rpNo, rprNo, rpedId);
    		})
    		
    		$(".rprNo-btn").click(function(){
    			var rprNo = $(this).prev().val();
    			
    			location.href="reportlist.do?rprNo="+rprNo;
    		})
    	})    	
    </script>	
    
</body>
</html>