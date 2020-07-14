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
        <nav>
            <div class="logo-area">
                <a class="blue">LIFE</a>NOTE
            </div>
            <ul class = "navi-area">
                <li>Plan
                        <ul class="sub-navi">
                        	<c:url var="mplist" value="mplist.do"/>
                            <li><a href="${mplist }">Monthly Planner</a></li>
                            <li><a href="#">Timetable</a></li>
                            <li class="b-radius"><a href="#">Menstrual Calendar</a></li>
                        </ul>
                </li>
                <li>Daily
                    <ul class="sub-navi">
                            <li><a href="#">Daily Record</a></li>
                            <li><a href="#">Habit Tracker</a></li>
                            <li class="b-radius"><a href="#">Bookmark</a></li>
                    </ul>
                </li>
                <li>Diet
                    <ul class="sub-navi">
                            <li><a href="#">Calendar</a></li>
                            <li class="b-radius"><a href="#">Graph</a></li>
                    </ul>
                </li>
                <li>Account
                    <ul class="sub-navi">
                            <li><a href="#">Monthly Record</a></li>
                            <li><a href="#">Monthly Statistics</a></li>
                            <li class="b-radius"><a href="#">Yealy Statistics</a></li>
                    </ul>
                </li>
                <li>Group
                    <ul class="sub-navi">
                            <li><a href="#">Main</a></li>
                            <li><a href="#">Vote</a></li>
                            <li><a href="#">Board</a></li>
                            <li><a href="#">Ladder Game</a></li>
                            <li><a href="#">Plan</a></li>
                            <li><a href="#">Account Book</a></li>
                            <li class="b-radius"><a href="#">Settings</a></li>
                    </ul>
                </li>
            </ul>
            <c:if test="${empty sessionScope.loginUser}">
	            <c:url var="loginView" value="memberLoginView.do"></c:url>
	            <div class="login-area" onclick="location.href='${loginView}'">
	                <div><a>Login</a>
	                </div>
	            </div>
            </c:if>
            
            <c:if test="${!empty sessionScope.loginUser}">
            
	            <c:url var="logout" value="logout.do"></c:url>
	            
	            <div class="login-area after">
	                <div class="login-area-item">
	                	<img class="h-profile-image" src="resources/images/icons/profile_default.png">
	                    <div class="hide login-square"></div>
	                    <ul class="hide login-sub">
	                        <li class="t-radius"><a href="#">Info</a></li>
	                        <li><a href="#">Chat</a></li>
	                        <li><a href="#">Alarm</a></li>
	                        <li class="b-radius"><a onclick ="location.href='${logout }'">Logout</a></li>
	                    </ul>
	                </div>
	            </div>
	            
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
    </script>
</body>
</html>