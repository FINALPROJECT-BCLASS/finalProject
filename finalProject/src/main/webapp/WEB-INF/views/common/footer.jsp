<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Footer</title>
</head>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="resources/css/Footer.css">
<body>
    <footer class="footer">
        <div class="logo-area f-logo">
            <a class="blue">LIFE</a>NOTE
        </div>
        <div class="site-map-area">
            <ul class="site-map">
            	<c:url var="loginView" value="memberLoginView.do"></c:url>
           		<c:if test="${empty sessionScope.loginUser }">
            		<li>Plan
	                    <ul>
	                        <li><a href="${loginView}">Monthly Planner</a></li>
	                        <li><a href="${loginView}">Timetable</a></li>
	                        <li><a href="${loginView}">Menstrual Calendar</a></li>
	                    </ul>
	                </li>
	                <li>Daily
	                    <ul>
	                        <li><a href="${loginView}">Daily Record</a></li>
	                        <li><a href="${loginView}">Habit Tracker</a></li>
	                        <li><a href="${loginView}">Bookmark</a></li>
	                    </ul>
	                </li>
	                <li>Diet
	                    <ul>
	                        <li><a href="${loginView}">Calendar</a></li>
	                        <li><a href="${loginView}">Graph</a></li>
	                    </ul>
	                </li>
	                <li>Account
	                    <ul>
	                        <li><a href="${loginView}">Monthly Record</a></li>
	                        <li><a href="${loginView}">Profit Statistics</a></li>
	                        <li><a href="${loginView}">Expenditure Statistics</a></li>
	                        <li><a href="${loginView}">Yealy Statistics</a></li>
	                    </ul>
	                </li>
	                <li>Group
	                    <!-- <ul>
	                        <li><a href="#">Main</a></li>
	                        <li><a href="#">Vote</a></li>
	                        <li><a href="#">Board</a></li>
	                        <li><a href="#">Ladder Game</a></li>
	                        <li><a href="#">Plan</a></li>
	                        <li><a href="#">Account Book</a></li>
	                        <li><a href="#">Settings</a></li> 
	                    </ul> -->
	                </li>
            	
            	</c:if>
            	
            	<c:if test="${!empty sessionScope.loginUser }">
	                <li>Plan
	                    <ul>
	                    	<c:url var="mpview" value="mpview.do"/>
	                        <li><a href="${mpview }">Monthly Planner</a></li>
	                        <c:url var="ttview" value="ttview.do"/>
	                        <li><a href="${ttview }">Timetable</a></li>
	                        <c:url var="mcview" value="mcview.do"/>
	                        <li><a href="${mcview }">Menstrual Calendar</a></li>
	                    </ul>
	                </li>
	                <li>Daily
	                    <ul>
	                    	<c:url var="drview" value="dailyRecordView.do"/>
	                        <li><a href="${drview }">Daily Record</a></li>
	                        <c:url var="htview" value="htList.do"/>
	                        <li><a href="${htview }">Habit Tracker</a></li>
	                        <c:url var="bmview" value="bookmarkView.do"/>
	                        <li><a href="${bmview }">Bookmark</a></li>
	                    </ul>
	                </li>
	                <li>Diet
	                    <ul>
	                        <li><a href="DietCalendarView.do">Calendar</a></li>
	                        <li><a href="DietGraphView.do">Graph</a></li>
	                    </ul>
	                </li>
	                <li>Account
	                    <ul>
	                    	<c:url var="mrview" value="mrview.do"/>
	                        <li><a href="${mrview }">Monthly Record</a></li>
	                        <c:url var="psview" value="psview.do"/>
	                        <li><a href="${psview }">Profit Statistics</a></li>
	                        <c:url var="esview" value="esview.do"/>
	                        <li><a href="${esview }">Expenditure Statistics</a></li>
	                        <c:url var="ysview" value="ysview.do"/>
	                        <li><a href="${ysview }">Yealy Statistics</a></li>
	                    </ul>
	                </li>
	                <li>Group
	                    <!-- <ul>
	                        <li><a href="#">Main</a></li>
	                        <li><a href="#">Vote</a></li>
	                        <li><a href="#">Board</a></li>
	                        <li><a href="#">Ladder Game</a></li>
	                        <li><a href="#">Plan</a></li>
	                        <li><a href="#">Account Book</a></li>
	                        <li><a href="#">Settings</a></li> 
	                    </ul> -->
	                </li>
                </c:if>
            </ul>
                <div class="f-info-area">
                    <span class="f-info-subject">Information</span>
                    <div class="f-info">
                        그룹명 : 깡삽이네조<br>
                        관리자 :  김경섭<br>
                        주소 : 서울특별시 은평구 경섭이네 집<br>
                        전화번호 : 010-4507-2613<br>
                    </div> 
                </div>
        </div>
    </footer>
</body>
</html>