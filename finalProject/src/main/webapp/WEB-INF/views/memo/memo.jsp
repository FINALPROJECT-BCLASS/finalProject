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
            width: 500px;
            display: flex;
            align-items: center;
            margin: 50px;
        }

        #memoLogo{
            margin-left: -30px;
            padding-top: 7px;
            font-size: 40px;
            color: rgba(72, 72, 72, 1);;
        }
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    <section>
		<div id="circleArea">
            <div id="circle"></div>
            <b id="memoLogo">Memo</b>
            <button class="default-btn" style="margin-left: 50px;">Add</button>
        </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	
    </script>	
    
</body>
</html>