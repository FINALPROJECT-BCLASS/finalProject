<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Header</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- 구글 아이콘 링크 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="resources/css/Header.css">
<body>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
    <header class="header">
        <nav class="mainNav">
            <div class="logo-area" onclick="location.href='home.do'">
                <a class="blue">LIFE</a>NOTE
            </div>
            
            <c:url var="loginView" value="memberLoginView.do"></c:url>
            
            <c:if test="${empty sessionScope.loginUser }">
	            <ul class = "navi-area">
	                <li>Plan
	                	<ul class="sub-navi">
	                        <li><a href="${loginView}">Monthly Planner</a></li>
	                        <li><a href="${loginView}">Timetable</a></li>
	                        <li class="b-radius"><a href="${loginView}">Menstrual Calendar</a></li>
	                	</ul>
	                </li>
	                <li>Daily
	                    <ul class="sub-navi">
		                    <li><a href="${loginView}">Daily Record</a></li>
		                    <li><a href="${loginView}">Habit Tracker</a></li>
		                    <li class="b-radius"><a href="${loginView}">Bookmark</a></li>
	                    </ul>
	                </li>
	                <li>Diet
	                    <ul class="sub-navi">
                            <li><a href="${loginView}">Calendar</a></li>
                            <li class="b-radius"><a href="${loginView}">Graph</a></li>
	                    </ul>
	                </li>
	                <li>Account
	                	<ul class="sub-navi">
	                        <li><a href="${loginView}">Monthly Record</a></li>
	                        <li><a href="${loginView}">Monthly Statistics</a></li>
	                        <li class="b-radius"><a href="${loginView}">Yealy Statistics</a></li>
	                    </ul>
	                </li>
	                <li><a href="${loginView}" class="groupA">Group</a></li>
	            </ul>
            </c:if>
            
            <c:if test="${!empty sessionScope.loginUser }">
            	<c:if test="${sessionScope.loginUser.id eq 'admin' }">
            		<ul class = "navi-area">
            			<c:url var="managemview" value="managemview.do"/>
		                <li><a href="${managemview }">Member</a></li>
		                <c:url var="managerview" value="managerview.do"/>
		                <li><a href="${managerview }">Report</a></li>
		            </ul>
            	</c:if>
	            <c:if test="${sessionScope.loginUser.id ne 'admin' }">
		            <ul class = "navi-area">
		                <li>Plan
		                	<ul class="sub-navi">
		                    	<c:url var="mpview" value="mpview.do"/>
		                        <li><a href="${mpview }">Monthly Planner</a></li>
		                        <c:url var="ttview" value="ttview.do"/>
		                        <li><a href="${ttview }">Timetable</a></li>
		                        <c:url var="mcview" value="mcview.do"/>
		                        <li class="b-radius"><a href="${mcview }">Menstrual Calendar</a></li>
		                	</ul>
		                </li>
		                <li>Daily
		                    <ul class="sub-navi">
		                    	<c:url var="htlist" value="htList.do"/>
			                    <li><a href="#">Daily Record</a></li>
			                    <li><a href="${htlist }">Habit Tracker</a></li>
			                    <li class="b-radius"><a href="#">Bookmark</a></li>
		                    </ul>
		                </li>
		                <li>Diet
		                    <ul class="sub-navi">
		                            <li><a href="DietCalendarView.do">Calendar</a></li>
		                            <li class="b-radius"><a href="DietGraphView.do">Graph</a></li>
		                    </ul>
		                </li>
		                <li>Account
		                	<ul class="sub-navi">
		                    	<c:url var="mrview" value="mrview.do"/>		
		                        <li><a href="${mrview }">Monthly Record</a></li>
		                        <c:url var="msview" value="msview.do"/>
		                        <li><a href="${msview }">Monthly Statistics</a></li>
		                        <c:url var="ysview" value="ysview.do"/>
		                        <li class="b-radius"><a href="${ysview }">Yealy Statistics</a></li>
		                    </ul>
		                </li>
		               <c:url var="groupMain" value="groupMain.do">
							<c:param name="loginUser" value="${sessionScope.loginUser}"/>
						</c:url>
		                <li><a href="${groupMain }" class="groupA">Group</a></li>
		            </ul>
	            </c:if>
            </c:if>
            <c:if test="${empty sessionScope.loginUser}">
	            <div class="login-area" onclick="location.href='${loginView}'">
	                <div><a>Login</a>
	                </div>
	            </div>
            </c:if>
            
			<c:url var="myInfoView" value="myInfoView.do"/>
            
            <c:if test="${!empty sessionScope.loginUser}">
            	<c:if test="${sessionScope.loginUser.id ne 'admin' }">
		            <div class="login-area after">
		                <div class="login-area-item">
		                	<div class="h-profile-image-area">
		                		<c:if test="${empty loginUser.rename_file }">
		                			<img class="h-profile-image" src="resources/images/icons/profile_white.png">
		                		</c:if>
		                		<c:if test="${!empty loginUser.rename_file }">
		                			<img class="h-profile-image" src="resources/muploadFiles/${loginUser.rename_file }">
		                		</c:if>
		                    </div>
		                    <div class="hide login-square"></div>
		                    <ul class="hide login-sub">
		                        <li class="t-radius"><a href="${myInfoView }">Info</a></li>
		                        <li><a onclick="chatview()">Chat</a></li>
		                        <li><a href="#">Alarm</a></li>
		                        <li><a href="mmview.do">Memo</a></li>
		                        <li class="b-radius"><a href="logout.do">Logout</a></li>
		                    </ul>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${sessionScope.loginUser.id eq 'admin' }">
	            	<div class="login-area after">
		                <div class="login-area-item">
		                	<div class="h-profile-image-area">
		                		<c:if test="${empty loginUser.rename_file }">
		                			<img class="h-profile-image" src="resources/images/icons/profile_white.png">
		                		</c:if>
		                		<c:if test="${!empty loginUser.rename_file }">
		                			<img class="h-profile-image" src="resources/muploadFiles/${loginUser.rename_file }">
		                		</c:if>
		                    </div>
		                    <div class="hide login-square"></div>
		                    <ul class="hide login-sub">
		                        <li class="t-radius"><a href="${myInfoView }">Info</a></li>
		                        <li><a onclick="chatview()">Chat</a></li>
		                        <li class="b-radius"><a href="logout.do">Logout</a></li>
		                    </ul>
		                </div>
		            </div>
	            </c:if>
            </c:if>
        </nav>
    </header>
    <script>
	 	// 로그인 서브 메뉴
	    $(document).ready(function(){
	    $(".login-area>div").click(function(){
	
	        var submenu = $(this).children(".login-sub");
	        var subdeco = $(this).children(".login-square");
	        
	         if(submenu.is(":visible")){
	            submenu.slideUp();
	            subdeco.toggleClass("hide");
	        }else{
	            submenu.slideDown();
	            subdeco.toggleClass("hide");
	        }
	
	        });
	    });
	 	
	 	function chatview(){
	 		window.open("chatview.do","_blank","top=50,left=500,width=500, height=600,menubar=no,status=no");
	 	}
    </script>
</body>
</html>