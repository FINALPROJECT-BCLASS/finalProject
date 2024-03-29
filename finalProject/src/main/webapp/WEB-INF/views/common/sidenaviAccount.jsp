<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Sidenavi</title>
</head>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="resources/css/Sidenavi.css">
<body>
    <div class="left-navi-area">
        <nav class="left-sub-navi">
        
	        <c:url var="mrview" value="mrview.do"/>
	        <c:url var="ysview" value="ysview.do"/>
	        <c:url var="esview" value="esview.do"/>
	        <c:url var="psview" value="psview.do"/>
	        
            <span>Plan</span>
            <ul>
                <li><a href="${mrview }">Monthly Record</a></li>
                <li><a href="${psview }">Profit Statistics</a></li>
                <li><a href="${esview }">Expenditure Statistics</a></li>
                <li class="l-last-line"><a href="${ysview }">Yearly Statistics</a></li>
            </ul>
        </nav>
    </div>
</body>
</html>