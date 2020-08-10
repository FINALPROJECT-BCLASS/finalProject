<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <span>GROUP</span>
            <ul>
            	<li><a href="groupSessionDelete.do">Main</a></li>
                <li><a href="groupCalendarMain.do">Calendar</a></li>
                <li><a href="footPrintMain.do">Footprint</a></li>
                <li>
                	<a href="noticeMain.do">Sharing</a>
                </li>
                <li><a href="voteMain.do">Vote</a></li>
                <li><a href="accountMain.do">Account Book</a></li>
                
                <li><a href="ladderMain.do">Ladder Game</a></li>
                <li class="l-last-line"><a href="voteSettings.do">Settings</a></li>
            </ul>
        </nav>
    </div>
    
    
    <script>
    	$(function(){
    		$(window).scroll(function(){
                let $window = $(this);
                let scrollTop = $window.scrollTop();
                let windowHeight = $window.height();
                let documentHeight = $(document).height();
                
                console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
                
                if( scrollTop + windowHeight + 200 > documentHeight ){
                	
                    $(".left-sub-navi").css("position","absolute");
                }
            })
    	})
    
    </script>
</body>
</html>