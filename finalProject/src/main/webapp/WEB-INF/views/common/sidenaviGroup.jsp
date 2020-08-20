<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Sidenavi</title>
  <style>
	.subNav{
		display:none;
	}
	.sub-box {
        position: absolute;
	    right: 10px;
	    top: 182px;
	    list-style: none;
	    background: #f3f3f3;
	    padding: 0;
	    border-radius: 10px;
	    font-size: 14px;
	}
	
	.sub-box > li {
		padding: 10px 20px;
	}
	
	.tri {
		width: 13px;
	    height: 13px;
	    background: #f3f3f3;
	    transform: rotate(45deg);
	    position: absolute;
	    right: 85px;
	    top: 197px;
	}
	
	.subNavTitle{
		cursor:pointer;
	}

</style>
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
                <li  class="sharing">
                	<a href="noticeMain.do">Sharing</a>
                	<div class="tri subNav"></div>
                	<ul class="sub-box subNav">
                		<li class="subNavTitle t-radius" onclick="location.href='noticeMain.do'">Notice</li>
                		<li class="subNavTitle b-radius" onclick="location.href='boardMain.do'">Board</li>
                	</ul>
                </li>
                
                <li><a href="voteMain.do">Vote</a></li>
                <li><a href="accountMain.do">Account Book</a></li>
                <li  class="l-last-line"><a href="ladderMain.do">Ladder Game</a></li>

            </ul>
        </nav>
    </div>
    
       <script>
     	$(".sharing").mouseover(function(){
     		$(".subNav").css("display","block");
     	}).mouseout(function(){
     		$(".subNav").css("display","none");
     	})
     	
     	$(".subNavTitle").mouseover(function(){
     		$(".subNavTitle").css("background","#F3F3F3");
     		$(this).css("background","#FBD14B");
     	})
     </script>
    <!-- <script>
    	$(function(){
    		$(window).scroll(function(){
                let $window = $(this);
                let scrollTop = $window.scrollTop();
                let windowHeight = $window.height();
                let documentHeight = $(document).height();
                
                /* console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight ); */
                
                if( scrollTop + windowHeight + 200 > documentHeight ){
                	
                    $(".left-sub-navi").css("position","absolute");
                }
            })
    	})
    
    </script> -->
</body>
</html>