<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Habit Tracker</title>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/flickity/flickity.css">
<!-- JavaScript -->
<script src="resources/js/flickity/flickity.pkgd.min.js"></script>

<link href='resources/css/simpleCalendar/simple-calendar.css' rel='stylesheet' />

<style>

        body {
            font-size: 14px;
            color: #484848;
            margin: 0;
            padding: 0;
        }

        .right-area {
        	display: flex;
            flex-direction: column;
            justify-content: center;
            float: right;
            width: 81%;
            background-color: #f7f7f7;
            color: #484848;
            text-align: center;
            padding: 60px 50px;
        }
        
        /* body::-webkit-scrollbar {
  		  	display: none; 
		} */

        .pSubject {
            font-size: 30px;
            font-weight: 600;
            padding: 30px;
            padding-top: 0;
            color: #484848;
            display: inline-block;
        }

        .group-img {
            width: 30px;
            height: 30px;
        }
        
        .clicked {
        	box-shadow: 0 0 0 3px #c4c4c4;
        }


        /* content */

        .content {
        	margin: 0 auto;
            width: 100%;
            border-radius: 10px;
            background: white;
            margin-top: 30px;
            padding: 30px;
            display: block;
        }
        
       	.cSubject {
	    	font-size: 25px;
	    	font-weight: 600;
	    	padding: 20px;
	    }
	    
        
        .content-section1,
        .content-section2 {
        	width: 100%;
		    height: 262px;
		    background: #f3f3f3;
		    border-radius: 10px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
	        flex-direction: row;
        }
        
	    .content-section1 {
	    	height: 430px;
	    }
        .content-section2 {
        	justify-content: start;
        }
        
        .content-section1-left,
        .content-section2-left {
			width: 50%;
		    height: 262px;
		    background: #f3f3f3;
		    border-radius: 10px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
	        flex-direction: column;
		}
		
		.content-section2-left {
			padding-right: 20px;
			width: 46%;
		}
		
		.conetent-section1-left {
			width: 50%;
		    padding-left: 70px;
		    height: 100%;
		    flex-direction: column;
		}
		
		.content-section1-right,
		.content-section2-right {
			width: 50%;
		    height: 262px;
		    float: right;
		    border-radius: 10px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
	        flex-direction: column;
		}
		
		.content-section2-right {
			width: 56%;
		}
		
		.section1-item-area,
		.section2-item-area {
			width: 85%;
		    display: flex;
    		justify-content: center;
		}
		
		.section1-item,
		.section2-item {
			width: 46%;
		    background: white;
		    border-radius: 10px;
		    padding: 15px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		    margin-top: 10px;
		}
		
		.section2-item {
			background: #F3F3F3;
		    text-align: left;
		    width: 100%;
		    height: 100%;
		    overflow: hidden;
		    overflow-y: scroll;
		    align-items: baseline;
		    justify-content:start;
		    
		}
		
		.section2-item::-webkit-scrollbar {
  		  	display: none; 
		}
		
		.add {
			position:relative;
			height: 130px;
		}
		
		.add::after {
			/* display: flex; */
			position: absolute;
		    content: "+";
		    width: 100%;
		    height: 100%;
		    background: #0000007a;
		    color: white;
		    border-radius: 10px;
		    /* justify-content: center;
		    align-items: flex-end; */
		    font-size: 80px;
		    font-weight: 200;
		    opacity: 0;
		    
		}
		
		.add:hover::after {
			cursor: pointer;
			opacity: 1;
			transition-duration: 0.5s;
			
		}
		
		.section1-item > span:nth-child(1) {
			font-weight: 600;
			font-size: 20px;
		}
		
		.section1-item > span:nth-child(2) {
			font-size: 29px;
		    font-weight: 700;
		    color: #6b98ff;
		    margin-top: -5px;
		}
		
		.section1-item > span:nth-child(3) {
		    font-weight: 600;
		    color: gray;
	        margin-top: -8px;
		}

        textarea {
            border: 0px;
            resize: none !important;
            cursor: initial;
        }

        textarea:focus {
            outline: none;
        }
        
        /* color */
        .sky {
            background-color: #6B98FF !important;
        }

        .pink {
            background-color: #FFA3E5 !important;
        }

        .light-purple {
            background-color: #C9A8FF !important;
        }

        .green {
            background-color: #50c6b0 !important;
        }

        /* button */

        .button-area {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
            width: 100%;
            position: relative;
	    }
	
        .button-area > button {
            border: none;
            height: 40px;
            margin: 0 5px;
            background: none;
            font-size: 23px;
            font-weight: 700;
            color: #484848;
        }
        
        .item-subject {
        	font-size: 23px;
		    font-weight: 600;
		    width: 81%;
		    height: 42px;
		    text-align: left;
        }
        
        .sub {
        	display: flex;
        	width: 100%;
		    margin-top: 30px;
		    margin-bottom: -10px;
        }
        
        /* external css: flickity.css */

		* { box-sizing: border-box; }
		
		
		.carousel-cell {
		  	
			width: 280px;
			margin-top: 5px;
			height: 100px !important;
			margin-right: 10px;
			background: #e9ecef;
			border-radius: 8px !important;
			counter-increment: carousel-cell;
			cursor: pointer;
		}
		
		.flickity-page-dots {
			display: none;
		}
		
		.flickity-viewport {
			height: 110px !important;
		}


		.bar-info {
			width: 100%;
		    height: 100%;
		    padding: 18px;
		    position: absolute;
		    display: flex;
		    align-items: flex-start;
		    justify-content: center;
		    flex-direction: column;
		}
	 
		.bar-info > div:nth-child(1) {
		    line-height: initial;
			color: #484848;
			font-weight: 600;
			font-size: 20px;
			height: 35px;
			margin-top: -5px;
			text-align: left;
		}
		
		.ht_title_ {
        	 display: inline-block;
            vertical-align: middle;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            width: 75%;
        }
		
		.progress > div:nth-child(3) {
			position: absolute;
		    right: 0;
		    width: 50px;
		    height: 50px;
		    background: white;
		    border-radius: 50%;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    color: gray;
		    font-size: 17px;
		    font-weight: 700;
		    margin: 25px 20px;
		}
	    
	    .progress-d {
	    	height: 35px !important;
		    width: 82%;
		    border-radius: 50px !important;
	        margin: 0;
	    }
	    
	    /*habit record*/
	    
	    .habit-record {
	    	width: 100%;
    		text-align: left;
	    }
	    
	    .habit-record tr td:nth-child(1) {
    	    height: 30px;
    	    width: 30px;
		    display: flex;
		    text-align: center;
		    align-items: center;
		    justify-content: center;
	    }
	    
	    .habit-record tr td:nth-child(2) {
    	    height: 30px;
    	    width: 100px;
	    }
	    
	    .habit-record tr td:nth-child(3) {
    	    color: #2860E1;
    	    font-weight: 600;
   	        height: 30px;
   	        width:100px;
	    }
	    
	    .habit-record tr td:nth-child(4) {
    	    width: 300px;
   	        height: 30px;
	    }
	    
	    .t-sub {
    	    font-size: 20px;
    		font-weight: 700;
	    }
	    
	    /* checked select */

        input[type="checkbox"] {
            display: none;
        }

        input[type="checkbox"]:checked + label{
       		background-color: #2860E1;
        
        }
        
        label {
        	margin: 0 !important;
        	width: 15px;
        	height: 15px;
        	border-radius: 50%;
        	background: white;
        }
        
        /*모달*/
        
        .close {
        	position: absolute;
		    z-index: 1;
		    right: 10px;
		    top: 10px;
		    width: 30px;
		    height: 30px;
        }
        
        .modal-content {
       	    border-radius: 0.7rem !important;
        }
        
        .modal-body {
       	    padding: 16px !important;
        }
        
        .modal-dialog {
        	margin-top: 100px !important;
        	max-width: 415px !important;
        }
        
        .modal-t {
       	    margin: 15px;
    		text-align: left;
        }
        
        .modal-t > div:nth-child(1) {
       	    font-size: 21px;
    		font-weight: 600;
        }
        
        .count-area {
		    height: 100px;
		    border-radius: 10px;
	        margin: 15px;
		    display: flex;
		    align-items: center;
        }
        
        .count-area > span:nth-child(1) {
       	    width: 81px;
		    float: left;
		    font-size: 30px;
		    margin-top: -7px;
		    
        }
        
        .count-area > span:nth-child(3) {
        	font-size: 30px;
        }
        
        .count {
        	text-align: right;
		    background: none;
		    border: none;
		    font-size: 50px;
		    width: 200px;
		    padding: 10px;
        }
        
        .memo-area, .comment-area, .record-area {
        	margin: 15px;
   			text-align: left;		
        }
        
        .memo-area > div:nth-child(1) {
      	    font-size: 21px;
    		font-weight: 600;
    		margin-bottom: 10px;
        }
        
        .memo-area > input {
        	background: #f3f3f3;
		    font-size: 17px;
    		color: #484848;
		    height: 60px;
		    width: 100%;
		    border-radius: 10px;
		    display: flex;
		    align-items: flex-start;
		    border: 0;
		    padding: 15px;
        }
        
        .comment-area > textarea {
        	background: #f3f3f3;
		    font-size: 17px;
		    color: #484848;
		    height: 190px;
		    width: 100%;
		    border-radius: 10px;
		    display: flex;
		    align-items: flex-start;
		    border: 15px solid #f3f3f3;
		    
        }
        
        .comment-area > textarea::-webkit-scrollbar {
  		  	display: none; 
		}
		
		
        
        /* 작은 버튼 */
        
        .small-button-area {
	        display: flex;
		    justify-content: flex-end;
		    width: 100%;
		    font-size: 10px;
        }
        
        .small-button-area > button {
        	border: none;
		    height: 40px;
		    margin: 0 5px;
		    background: none;
		    font-size: 18px;
		    font-weight: 700;
		    color: #484848;
		    
        }
        
        input[type="hidden"] {
            display: none;
        }
        
        .slide-btn {
        	margin-bottom : 10px;
        }
        
        .slide-btn > button {
       	    border: none;
		    height: 40px;
		    width: 40px;
		    background: white;
		    border-radius: 50%;
		    margin-left: 9px;
        }
        
        .show {
        	display: flex;
        }
        
        .hide {
        	display: none;
        }
        
        #record-time {
       	    display: inline-block;
		    width: 120px;
		    height: 40px;
		    font-size: 17px;
		    padding: 10px;
		    font-weight: 600;
        }
        
        #htr_now_m {
        	border: none;
		    border-radius: 10px;
		    background: #f3f3f3;
		    height: 50px;
		    width: 80px;
		    padding: 10px;
        }
        
        #htr_con_m {
        	border: none;
		    border-radius: 10px;
		    background: #f3f3f3;
		    height: 50px;
		    width: 100%;
		    margin-top: 10px;
		    padding: 10px;
        }
        
        #htr_unit_m {
        	display: inline-block;
    		font-weight: 700;
    		font-size: 17px;
        }
        
        .smallA {
        	font-size: 14px;
		    display: inherit;
		    margin-top: -5px;
		    color: gray !important;
        }
        
        .message {
			position: absolute;
		    top: 57px;
		    right: 100px;
		    border: 1px solid #f8dbdb;
		    background: rgb(255 247 247);
		    width: 500px;
		    height: 56px;
		    display: flex;
		    border-radius: 10px;
		    justify-content: center;
		    align-items: center;
		}
		
		.tri {
			position: absolute;
		    background: #fff7f7;
		    right: 163px;
		    top: 50px;
		    width: 15px;
		    height: 15px;
		    transform: rotate(45deg);
		    border-left: 1px solid #f9dfdf;
		    border-top: 1px solid #f9dfdf;
		    z-index: 1;
		}
		
		.tri {
	    animation: fadein 0.7s;
	    -webkit-animation: fadein 0.7s; /* Safari and Chrome */
		}
		
		.message {
		 animation: fadein 0.7s;
	    -webkit-animation: fadein 0.7s; /* Safari and Chrome */
		}
		
		@-webkit-keyframes fadein { /* Safari and Chrome */
		    from {
		        opacity:0;
		    }
		    to {
		        opacity:1;
		    }
		}
        
        .tri-main {
			right: 179px;
			top: -20px;
			border: none;
			border-right: 1px solid #f9dfdf;
			border-bottom: 1px solid #f9dfdf;
		}
        
      
        

		
    </style>
    </head>

    <body>
    	<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDaily.jsp"/>
        <div class="right-area">
            <span class="pSubject">Habit Tracker</span>
            
           <!--  <div class="small-button-area slide-btn">
       			<button type="button" onclick="cycleBtn();">D</button>
       			<button type="button" onclick="cycleBtn();">W</button>
                <button type="button" onclick="cycleBtn();">M</button>
			</div> -->
            <!-- 슬라이드 -->
            <div class="carousel" data-flickity='{ "draggable": true }'>
				<c:forEach var="h" items="${hlist }">
					<!-- 퍼센트 연산처리 -->
					<fmt:parseNumber var="percent" value="${(h.ht_now/h.ht_goal)*100+(1-(((h.ht_now/h.ht_goal)*100)%1))%1}" integerOnly="true" />
					<!-- 슬라이드 아이템 -->
		        	<input id="htNum" type="hidden" value="${h.ht_no }"> <!-- 습관 번호 -->
					<div class="progress carousel-cell habitItem ${h.ht_cycle }">
				  		<div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:${percent }%; background-color:${h.ht_color};"></div>
			    		<div class="bar-info">
							<div class="ht_title ht_title_">${h.ht_title }</div>
							<div>
								<c:set var="now" value="${h.ht_now }"/>
								<c:if test="${empty now}">
									<a class="ht_now">0</a>
								</c:if>
								<c:if test="${!empty now}">
									<a class="ht_now">${h.ht_now }</a>
								</c:if>
								/ <a class="ht_goal">${h.ht_goal }</a>
								<a class="ht_unit">${h.ht_unit }</a>
							</div> <!-- now는 기록 메모 테이블의 현재값 컬럼을 더한 값 -->
						</div>
						<div class="percent">${percent }%</div>
						<!-- 주 -->
					</div>
				</c:forEach>
			</div>
		
       
            
            <!-- Button Start-->
            <div class="button-area">
                <button onclick="location.href='addHabitView.do'">Add</button>
                <button id="d-btn">Delete</button>
                <button id="e-btn">Edit</button>
                <c:if test="${empty hlist }">
            		<div class='tri tri-main' style="padding:0;"></div>
            		<div class='message' style="top: -68px;">습관을 추가해 주세요.</div>
	            </c:if>
            </div>

    		<!-- 내용 -->
            <div id="content" class="content">
            	<input type="hidden" id="ht_no">
            	<div class="cSubject" id="habitTitle">Drink Water</div>
            	<div class="content-section1">
            		<div class="content-section1-left">
	            		<div>
	            			<div id="event-cal-container" class="calendar-container"></div>
	            		</div>
	            	</div>
	            	<div class="content-section1-right">
	            		<div class="item-subject">Progress</div>
	            		<div class="progress carousel-cell progress-d">
				  			<div class="progress-bar" id="progress1" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
	            		</div>
	            		<div class="section1-item-area">
		            		<div class="section1-item add" data-toggle="modal" data-target="#add-count" style="margin-right: 10px;">
		            			<span id="period"></span>
		            			<span id="now"></span>
		            			<span id="goal"></span>
		            			<input type="hidden" id="period-hidden">
		            		</div>
		            		<div class="section1-item">
		            			<span>Achieve Rate</span>
		            			<span id="achieve" style="font-size: 39px"></span>
		            		</div>
	            		</div>
	            	</div>
	            </div>
	            <div class="content-section2 b-white">
		            <div class="content-section2-left b-white">

	            		<div class="item-subject sub">Comment</div>
	            		<div class="section2-item" id="comment">
	            			
	            		</div>
	            		<div class="small-button-area">
			                <button data-toggle="modal" data-target="#edit-comment" onclick="editCommentCheck();">Edit</button>
			            </div>
	            	</div>
	            	<div class="content-section2-right b-white">
	            		<div class="item-subject sub">Record</div>
	            		<div class="section2-item">
	            			<table id="habit-record" class="habit-record" cellpadding="3px"></table>
	            		</div>
	            			<div class="small-button-area">
	            				<button onclick="deleteHabitRecord();">Delete</button>
				                <button onclick="updateHabitRecordCheck();">Edit</button>
				            </div>
	            	</div>
	            </div>
            </div>
            		
			<!-- Modal -->
			<div class="modal fade" id="add-count" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      	<div class="modal-body">
					    <div class="modal-t">
				      		<div>Count</div>
				      		<div>Drink water</div>
					    </div>
					    <div class="count-area b-lightgray">
					      	<span>+</span>
					      	<input id="htr_now" name="htr_now" class="count blue" type="text" maxlength="16">
					      	<span name="htr_unit">ml</span>
					      	<input id="htr_now_" type="hidden">
					    </div>
					    <div class="memo-area">
					      	<div>Memo</div>
					      	<input id="htr_con" name="htr_con" type="text" maxlength="16">
					    </div>
					    <div class="small-button-area">
	           				<button type="button" onclick="countModal();">Save</button>
			                <button data-dismiss="modal" aria-label="Close">Cancel</button>
					    </div>
			      	</div>
			    </div>
			  </div>
			</div>
			
			<!-- Content Edit Modal -->
			<div class="modal fade" id="edit-comment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      	<div class="modal-body">
					    <div class="modal-t">
				      		<div>Comment</div>
				      		<div></div>
					    </div>
					    <div class="comment-area">
					      	<textarea id="ht_comment" maxlength="160"></textarea>
					    </div>
					    <div class="small-button-area">
	           				<button type="button" onclick="editCommentModal();">Save</button>
			                <button data-dismiss="modal" aria-label="Close">Cancel</button>
					    </div>
			      	</div>
			    </div>
			  </div>
			</div>
			
			<!-- Content Edit Modal -->
			<div class="modal fade" id="edit-record" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&nbsp;</span></button>
			      	<div class="modal-body">
					    <div class="modal-t">
				      		<div>Record</div>
				      		<div></div>
					    </div>
					    <div class="record-area">
					    	<div id="record-time"></div>&nbsp;
					    	<input type="text" id="htr_now_m" name="htr_now_m">&nbsp;&nbsp;<div id="htr_unit_m"></div>
					    	<input type="text" id="htr_con_m" name="htr_con_m">
					    </div>
					    <div class="small-button-area">
	           				<button type="button" onclick="editHabitRecordModal();">Save</button>
			                <button data-dismiss="modal" aria-label="Close">Cancel</button>
					    </div>
			      	</div>
			    </div>
			  </div>
			</div>    
			      
            <!-- Button Start-->
            <div class="button-area">
                <button class="blue" onclick="location.href='graphView.do'">Graph >></button>
            </div>
            <!-- Button End-->
        </div>
		
		<script type="text/javascript"  src='resources/js/simpleCalendar/jquery.simple-calendar.js'></script>
		<script>
		
		$(".add").on("click", function(){
			$("#htr_now").val($("#htr_now_").val());
		});
			
		var changeNo = 0;
		
			// 습관 삭제하기
			$(document).on("click","#d-btn",function(){
				var d_htNum = $(".clicked").prev("#htNum").val();
				
				if($(".habitItem").hasClass("clicked") === true) {

					if(!confirm('삭제하시겠습니까?')){
						return false;}
					
					location.href="deleteHabit.do?ht_no="+ d_htNum;

				}else {
					
					alert("삭제할 습관을 선택해 주세요.");
					
				}

				
			}); 
			
			// 습관 수정하기
			$(document).on("click","#e-btn",function(){
				var d_htNum = $(".clicked").prev("#htNum").val();
				
				if($(".habitItem").hasClass("clicked") === true) {

					location.href="editHabitView.do?ht_no="+ d_htNum;

				}else {
					
					alert("수정할 습관을 선택해 주세요.");
					
				}

				
			}); 
			
			var htDate;
			$(".content").hide();
	
			// 모달에 comment 내용 넣어주기
			function editCommentCheck() {
				$("#ht_comment").val($("#comment").html());
			}
			
			$(function(){
				
		        var responseMessage = "<c:out value="${message}" />";
		        if (responseMessage != ""){alert(responseMessage)}
		   
		    })
		    
		    var target=$('.habitItem');
		    
		    target.off("click").on("click", function(){
		    	target.not($(this)).removeClass("clicked");
		    	$(this).addClass("clicked");
		    	$(".content").show();
		    	
		    	
		    	// ht_no를 기준으로 content 내용을 뿌려주기 위함
		    	var htNum = $(this).prev("#htNum").val();
		 					
				var t = new Date(); // 오늘 날짜
		        var y= t.getFullYear(); // 년도
		        var m = (t.getMonth()+1)>9 ? ''+(t.getMonth()+1) : '0'+(t.getMonth()+1); // 월
		        var d = t.getDate()>9 ? ''+t.getDate() : '0'+t.getDate(); // 일
		                
		        var today = y + '-' + m + '-' + d;

		    	$.ajax({
   					url: "habitContent.do",
   					type: "post",
   					data: {htNum:htNum},
   					dataType:"json",
   					success:function(data){
   					
   					$(".event").removeClass("event");
                	
   					var eventDates = [];	
   					
                	
			        $(".today").css("background", data.list.ht_color);
   					
                	/* Calendar */
   					// 불러온 데이터와 일치하는 날짜 태그에 event 클래스명 추가
                	for(var i in data.hrclist) {
 	   					eventDates.push(data.hrclist[i].htr_date);
 	   					$("." + data.hrclist[i].htr_date).addClass("event");
					}
                	
                	// 이전, 이후 버튼 눌렀을 때 이벤트 클래스 제거하고 새로 추가
                	$(".btn-next").off("click").on("click", function(){
                		$(".event").removeClass("event");
                		for(var i in data.hrclist) {
     	   					eventDates.push(data.hrclist[i].htr_date);
     	   					$("." + data.hrclist[i].htr_date).addClass("event");
    					}
                	})
                	
                	$(".btn-prev").off("click").on("click", function(){
                		$(".event").removeClass("event");
                		for(var i in data.hrclist) {
     	   					eventDates.push(data.hrclist[i].htr_date);
     	   					$("." + data.hrclist[i].htr_date).addClass("event");
    					}
                	})
                	
      	            $("#event-cal-container").simpleCalendar({
      	                fixedStartDay: true,
      	              	displayEvent: true,
      	               	events: eventDates,
      	              	selectCallback: function(date){ // 캘린더에서 날짜를 눌렀을 때
      	              	
      	              	
      	              		var change = date.replace(/-/g, "/");
      	              		var day = change.substr(2);
      	              		var month = change.substr(2,5);
      	              		var htCycle = $("#period-hidden").val();
      	              		var htNum =$(".clicked").prev("#htNum").val();
      	  				
      	  					if(htCycle == "Today" || htCycle == "This Week") {
      	  						htDate = day;
      	  					}else if(htCycle == "This Month"){
      	  						htDate = month;
      	  					}
      	  					
      	  					$.ajax({url: "habitDateSelectList.do",
      	  	   					type: "post",
      	     					data: {htNum:htNum, htDate:htDate, htCycle:htCycle},
      	     					dataType:"json",
      	     					success:function(caldata){
      	     							
     	     							$tableBody = $("#habit-record");
     	     							$tableBody.html("");
      	     				
    	     	   						var $tr;
    	     	   						var $tdCheckbox;
    	     	   						var $tdTime;
    	     	   						var $tdNow;
    	     	   						var $tdCon;
    	     	   						var unit = $(".clicked a.ht_unit").html();
    	     	   						var goal = $(".clicked a.ht_goal").html();
    	     	   						
    	     	   						var sum = 0;
    	     	   						
    	     	   						
    	     	   						if(htCycle == "Today") {
    	     	   							
     	     							for(var i in caldata.hrc) {
     	     								
     	     								var checkbox = "<input type='checkbox' value='"+ caldata.hrc[i].htr_no + "' id='check"+ i +"' name='check" + i +"'>" + "<label for='check"+i+"'>" + "</label>";
     	     		   						var htNow = "+" + caldata.hrc[i].htr_now + unit + "<input type='hidden' id='htr_now_hidden' value='"+ caldata.hrc[i].htr_now +"'>";
     	     		   						
     	     		   						sum += + caldata.hrc[i].htr_now;
     	     		   						
     	     								$tr = $("<tr>");
     	     								$tdCheckbox = $("<td>").append(checkbox);
     	     								$tdTime = $("<td>").text(caldata.hrc[i].htr_time);
     	     								$tdNow = $("<td>").append(htNow);
     	     								$tdCon=$("<td>").text(caldata.hrc[i].htr_con);
     	     								
     	     								$tr.append($tdCheckbox);
     	     								$tr.append($tdTime);
     	     								$tr.append($tdNow);
     	     								$tr.append($tdCon);
     	     								$tableBody.append($tr);
     	     								
     	     							}
     	     							
     	     							if(today == date) {
     	         	              			$("#period").html("Today" +"<br><a class = 'smallA'>" + date + "</a>");
     	         	              		}else{
     	     								//날짜 표시
     	     								$("#period").html(date + "<br><a style = 'display:none'>" + date + "</a>");
     	         	              		}
    	     	   						
      	     						}else if(htCycle == "This Week" || htCycle == "This Month"){
      	     							
      	     							for(var i in caldata.hrc) {
      	     								
      	     								var checkbox = "<input type='checkbox' value='"+ caldata.hrc[i].htr_no + "' id='check"+ i +"' name='check" + i +"'>" + "<label for='check"+i+"'>" + "</label>";
      	     		   						var htNow = "+" + caldata.hrc[i].htr_now + unit + "<input type='hidden' id='htr_now_hidden' value='"+ caldata.hrc[i].htr_now +"'>";
      	     		   						var htrDate = "<b>" + caldata.hrc[i].htr_month + "일</b>&nbsp; " + caldata.hrc[i].htr_time;
      	     		   						
      	     		   						sum += +caldata.hrc[i].htr_now;
      	     		   						
      	     								$tr = $("<tr>");
      	     								$tdCheckbox = $("<td>").append(checkbox);
      	     								$tdTime = $("<td>").append(htrDate);
      	     								$tdNow = $("<td>").append(htNow);
      	     								$tdCon=$("<td>").text(caldata.hrc[i].htr_con);
      	     								
      	     								$tr.append($tdCheckbox);
      	     								$tr.append($tdTime);
      	     								$tr.append($tdNow);
      	     								$tr.append($tdCon);
      	     								$tableBody.append($tr);
      	     								
      	     							}
      	     							
      	     							// 선택된 날짜의 해당 주를 반환하기 위해 tr태그를 한줄씩 저장
      	        	              		var selectWeek = $("."+date).closest("tr").html();
      	        	              		var week_1 = $(".calendar table>tbody>tr:nth-child(1)").html();
      	        	              		var week_2 = $(".calendar table>tbody>tr:nth-child(2)").html();
	      	  	      	          	    var week_3 = $(".calendar table>tbody>tr:nth-child(3)").html();
	      	  	      	       		    var week_4 = $(".calendar table>tbody>tr:nth-child(4)").html();
	      	  	      	      		    var week_5 = $(".calendar table>tbody>tr:nth-child(5)").html();
	      	  	      	      		    
	      	  	      	      			var thisWeek = $(".today").closest("tr").html();
      	     							
     	     							var year = $(".year").html();
     	     							var month = $(".year").next().html();
     	     							
     	     							if(htCycle == "This Week"){
     	     								
     	     								if(selectWeek == thisWeek) {
     	     									
     	     									$("#period").html("This Week" + "<br><a class = 'smallA'>" + date + "</a>");
     	     									
     	     								}else{
     	     								
	     	     								// for 선택된 날짜의 주차 표시
	     	     								if(selectWeek == week_1){
	     	     									$("#period").html(year+"/"+month + " " + 1 + "주차<br>" + "<a class = 'smallA'>" + date + "</a>");
	     	     	      	              		}else if(selectWeek == week_2){
	     	     	      	              			$("#period").html(year+"/"+month + " " + 2 + "주차<br>" + "<a class = 'smallA'>" + date + "</a>");
	     	     	      	              		}else if(selectWeek == week_3){
	     	     	      	              			$("#period").html(year+"/"+month + " " + 3 + "주차<br>" + "<a class = 'smallA'>" + date + "</a>");
	     	     	      	              		}else if(selectWeek == week_4){
	     	     	      	              			$("#period").html(year+"/"+month + " " + 4 + "주차<br>" + "<a class = 'smallA'>" + date + "</a>");
	     	     	      	              		}else if(selectWeek == week_5){
	     	     	      	              			$("#period").html(year+"/"+month + " " + 5 + "주차<br>" + "<a class = 'smallA'>" + date + "</a>");
	     	     	      	              		}
	     	     							     	     								
     	     								}
     	     								
     	     							}else{
     	     								
     	     								var selectM = date.substr(5,2);
     	     								
     	     								if(month == m) {
         	         	              			$("#period").html("This Month" + "<br><a class = 'smallA'>" + date + "</a>");
         	         	              		}else{
	     	     							//날짜 표시
	     	     								$("#period").html(year+"-"+month + "<br><a class = 'smallA'>" + date + "</a>");
         	         	              		}
     	     							}
     	     						}
    	     	   						
        	     	   					
	    	     	   							var htNum =$(".clicked").prev("#htNum").val();
	    										var color = $(".clicked").find(".progress-bar").css("background-color");
    	     	   						
    	     	   						if($(".clicked").hasClass("Daily") === true) {
    	     	   							
    	     	   							if(today == date){
    	     	   								
	    										$(".clicked").find(".percent").html(Math.ceil(sum/goal*100)+"%");
	    										
	    										$(".clicked").find(".progress-bar").attr("style", "background-color:"+ color + "; width:" + Math.ceil(sum/goal*100)+"%")
	    										
	    										$(".clicked").find(".ht_now").html(sum);
    	     	   							}
    	     	   							
    	     	   						}else if($(".clicked").hasClass("Weekly") === true){
      	  									
    	     	   							var clickWeek =  $("." + $(".smallA").html()).closest("tr").html();
    	     	   							 
      	  									if(thisWeek == clickWeek) {
												
	    										$(".clicked").find(".percent").html(Math.ceil(sum/goal*100)+"%");
	    										
	    										$(".clicked").find(".progress-bar").attr("style", "background-color:"+ color + "; width:" + Math.ceil(sum/goal*100)+"%")
	    										
	    										$(".clicked").find(".ht_now").html(sum);
      	  										
      	  									}
      	  								}else if($(".clicked").hasClass("Monthly") === true){
      	  									
      	  									if(m == month) {
      	  										
	    										$(".clicked").find(".percent").html(Math.ceil(sum/goal*100)+"%");
	    										
	    										$(".clicked").find(".progress-bar").attr("style", "background-color:"+ color + "; width:" + Math.ceil(sum/goal*100)+"%")
	    										
	    										$(".clicked").find(".ht_now").html(sum);
    										
      	  									}
      	  									
      	  								}
    	     							//현재 값
    	     	   						$("#now").html(sum);
    	     	   						//현재 퍼센트
    	     	   						$("#achieve").html(Math.ceil(sum/goal*100)+"%");
    	     	   						//progress bar
    	     	   						$("#progress1").css("width", Math.ceil(sum/goal*100) + "%");
      	     						
      	     					},
      	     					error:function(request, status, errorData){
      	                          alert("error code: " + request.status + "\n"
      	                                +"message: " + request.responseText
      	                                +"error: " + errorData);
      	               			} 
      	  				
      	  					});
   	              		}
      	            });
   					
   						
					//목표 값
					$("#goal").html("/" + data.list.ht_goal + data.list.ht_unit);
					
					//내용
					$("#comment").html(data.list.ht_con);
 						
   						
   					if(data.list.ht_cycle == "Daily") { //기준이 하루일 때
   						
   						$tableBody = $("#habit-record");
						$tableBody.html("");
   						
   						var $tr;
   						var $tdCheckbox;
   						var $tdTime;
   						var $tdNow;
   						var $tdCon;
   						var sum = 0;
   						
						for(var i in data.recordDailyList){
	   						var checkbox = "<input type='checkbox' value='"+ data.recordDailyList[i].htr_no + "' id='check"+ i +"' name='check" + i +"'>" + "<label for='check"+i+"'>" + "</label>";
	   						var htNow = "+" + data.recordDailyList[i].htr_now + data.list.ht_unit + "<input type='hidden' id='htr_now_hidden' value='"+ data.recordDailyList[i].htr_now +"'>";
	   						
	   						
	   						sum += + data.recordDailyList[i].htr_now;
	   						
							$tr = $("<tr>");
							$tdCheckbox = $("<td>").append(checkbox);
							$tdTime = $("<td>").text(data.recordDailyList[i].htr_time);
							$tdNow = $("<td>").append(htNow);
							$tdCon=$("<td>").text(data.recordDailyList[i].htr_con);
							
							$tr.append($tdCheckbox);
							$tr.append($tdTime);
							$tr.append($tdNow);
							$tr.append($tdCon);
							$tableBody.append($tr);
							
						}
						
						$("#ht_no").val(htNum);
						
						$("#habitTitle").html(data.list.ht_title);
						
						//프로그레스 구역 내의 소제목
						$("#period").html("Today" + "<br><a class = 'smallA'>" + today + "</a>");
						$("#period-hidden").val("Today");
						
						//현재 값
   						$("#now").html(sum);
   						$("#now").css("color", data.list.ht_color);
   						
   						//현재 퍼센트
   						$("#achieve").html(Math.ceil(sum/data.list.ht_goal*100)+"%");
   						$("#achieve").css("color", data.list.ht_color);
   						
   						//progress bar
   						$("#progress1").css("width", Math.ceil(sum/data.list.ht_goal*100) + "%");
   						$("#progress1").css("background-color", data.list.ht_color);
   						
   						// 모달에 세팅 
   				    	$(".modal-t > div:nth-child(2)").html(data.list.ht_title);
   				    	$(".count-area > #htr_now").val(data.list.ht_amount);
   				    	$(".count-area > #htr_now_").val(data.list.ht_amount);
   				    	$(".count-area > span:nth-child(3)").html(data.list.ht_unit);
   				    	
   						// for 클릭 트리거 (내용 변경 후 재클릭시 슬라이드 내부의 내용도 동시에 수정하기 위함)
   						$(".clicked").find("a.ht_now").html(sum);
   						$(".clicked").find("div.progress-bar").css("width", Math.ceil(sum/data.list.ht_goal*100) + "%");
   						$(".clicked").find("div.progress-bar").css("background-color", data.list.ht_color);
   						$(".clicked").find("div.percent").html(Math.ceil(sum/data.list.ht_goal*100) + "%");
   				    	
						
   					} else if(data.list.ht_cycle == "Weekly") { //기준이 일주일일 때
   						
   						$tableBody = $("#habit-record");
						$tableBody.html("");
   						
   						var $tr;
   						var $tdCheckbox;
   						var $tdTime;
   						var $tdNow;
   						var $tdCon;
						var sum = 0;
   						
						for(var i in data.recordWeeklyList){
	   						var checkbox = "<input type='checkbox' value='"+ data.recordWeeklyList[i].htr_no + "' id='check"+ i +"' name='check" + i +"'>" + "<label for='check"+i+"'>" + "</label>";
	   						var date = "<b>" + data.recordWeeklyList[i].htr_month + "일 </b>&nbsp;" + data.recordWeeklyList[i].htr_time;  
	   						var htNow = "+" + data.recordWeeklyList[i].htr_now + data.list.ht_unit + "<input type='hidden' id='htr_now_hidden' value='"+ data.recordWeeklyList[i].htr_now +"'>";
	   						
							sum += + data.recordWeeklyList[i].htr_now;
	   						
							$tr = $("<tr>");
							$tdCheckbox = $("<td>").append(checkbox);
							$tdTime = $("<td>").append(date);
							$tdNow = $("<td>").append(htNow);
							$tdCon=$("<td>").text(data.recordWeeklyList[i].htr_con);
							
							$tr.append($tdCheckbox);
							$tr.append($tdTime);
							$tr.append($tdNow);
							$tr.append($tdCon);
							$tableBody.append($tr);
						}
						
						$("#ht_no").val(htNum);
						
						$("#habitTitle").html(data.list.ht_title);
						
						//프로그레스 구역 내의 소제목
   						$("#period").html("This Week" + "<br><a class = 'smallA'>" + today + "</a>");
   						$("#period-hidden").val("This Week");
						
						//현재 값
   						$("#now").html(sum);
   						$("#now").css("color", data.list.ht_color);
   						
   						//현재 퍼센트
   						$("#achieve").html(Math.ceil(sum/data.list.ht_goal*100)+"%");
   						$("#achieve").css("color", data.list.ht_color);
   						
   						//progress bar
   						$("#progress1").css("width", Math.ceil(sum/data.list.ht_goal*100) + "%");
   						$("#progress1").css("background-color", data.list.ht_color);
   						
   						// 모달에 세팅 
   						// countModal
   				    	$(".modal-t > div:nth-child(2)").html(data.list.ht_title);
   				    	$(".count-area > #htr_now").val(data.list.ht_amount);
   				    	$(".count-area > #htr_now_").val(data.list.ht_amount);
   				    	$(".count-area > span:nth-child(3)").html(data.list.ht_unit);
   				    	
   				 		// for 클릭 트리거 (내용 변경 후 재클릭시 슬라이드 내부의 내용도 동시에 수정하기 위함)
   				    	$(".clicked").find("a.ht_now").html(sum);
   						$(".clicked").find("div.progress-bar").css("width", Math.ceil(sum/data.list.ht_goal*100) + "%");
   						$(".clicked").find("div.progress-bar").css("background-color", data.list.ht_color);
   						$(".clicked").find("div.percent").html(Math.ceil(sum/data.list.ht_goal*100) + "%");
   						
   					} else if(data.list.ht_cycle == "Monthly"){ //기준이 한 달일 때
   						
   						
   						$tableBody = $("#habit-record");
						$tableBody.html("");
   						
   						var $tr;
   						var $tdCheckbox;
   						var $tdTime;
   						var $tdNow;
   						var $tdCon;
						var sum = 0;
   						
						for(var i in data.recordMonthlyList){
	   						var checkbox = "<input type='checkbox' value='"+ data.recordMonthlyList[i].htr_no + "'id='check"+ i +"' name='check" + i +"'>" + "<label for='check"+i+"'>" + "</label>";
	   						var date = "<b>" + data.recordMonthlyList[i].htr_month + "일 </b> &nbsp;" + data.recordMonthlyList[i].htr_time;  
							var htNow = "+" + data.recordMonthlyList[i].htr_now + data.list.ht_unit + "<input type='hidden' id='htr_now_hidden' value='"+ data.recordMonthlyList[i].htr_now +"'>";
								
	   						
							sum += + data.recordMonthlyList[i].htr_now;
	   						
							$tr = $("<tr>");
							$tdCheckbox = $("<td>").append(checkbox);
							$tdTime = $("<td>").append(date);
							$tdNow = $("<td>").append(htNow);
							$tdCon=$("<td>").text(data.recordMonthlyList[i].htr_con);
							
							$tr.append($tdCheckbox);
							$tr.append($tdTime);
							$tr.append($tdNow);
							$tr.append($tdCon);
							$tableBody.append($tr);
						}
						
						$("#ht_no").val(htNum);
						
						$("#habitTitle").html(data.list.ht_title);
						
						//프로그레스 소제목
   						$("#period").html("This Month" + "<br><a class = 'smallA'>" + today + "</a>");
   						$("#period-hidden").val("This Month");
						
						//현재 값
   						$("#now").html(sum);
   						$("#now").css("color", data.list.ht_color);
   						
   						//현재 퍼센트
   						$("#achieve").html(Math.ceil(sum/data.list.ht_goal*100)+"%");
   						$("#achieve").css("color", data.list.ht_color);
   						
   						//progress bar
   						$("#progress1").css("width", Math.ceil(sum/data.list.ht_goal*100) + "%");
   						$("#progress1").css("background-color", data.list.ht_color);
   						
   						// 모달에 세팅 
   				    	$(".modal-t > div:nth-child(2)").html(data.list.ht_title);
   				    	$(".count-area > #htr_now").val(data.list.ht_amount);
   				    	$(".count-area > #htr_now_").val(data.list.ht_amount);
   				    	$(".count-area > span:nth-child(3)").html(data.list.ht_unit);
   				    	
   				  		// for 클릭 트리거 (내용 변경 후 재클릭시 슬라이드 내부의 내용도 동시에 수정하기 위함)
   				    	$(".clicked").find("a.ht_now").html(sum);
   						$(".clicked").find("div.progress-bar").css("width", Math.ceil(sum/data.list.ht_goal*100) + "%");
   						$(".clicked").find("div.progress-bar").css("background-color", data.list.ht_color);
   						$(".clicked").find("div.percent").html(Math.ceil(sum/data.list.ht_goal*100) + "%");
   						
   						}
 		
   					},
   					error:function(request, status, errorData){
                         alert("error code: " + request.status + "\n"
                               +"message: " + request.responseText
                               +"error: " + errorData);
              		} 
   				})
		    	 
		    });
		    
		    
		    // 습관 카운트 하기
		    function countModal() {
		    	
		    	var check_g = RegExp(/^[0-9]*$/); 
	    		
				if(!check_g.test($("#htr_now").val())){
					
		    		alert("숫자만 입력 가능합니다.");
		    		$("#htr_now").val("");
		    		$("#htr_now").focus();
		    		
		    		return false;
		    		
		    	}else {
		    		
			    	var ht_no = $("#ht_no").val();
			    	var htr_now = $("#htr_now").val();
			    	var htr_now_ = $("#htr_now_").val();
			    	var htr_con = $("#htr_con").val();
			    	var htr_date = $("#period > a").html();
			    	
			    	var htr = [ht_no, htr_now, htr_con, htr_date];
			    	 
			    	$.ajax({
			    	    method: 'POST',
			    	    url: 'insertHtr.do',
			    	    traditional: true,
			    	    data: {'htr':htr},
			    	    success : function(data) {
							if(data == "success") {
								$("."+htr_date).trigger("click");
								$("."+htr_date).addClass("event");
								$("#add-count").modal("hide");
								$("#htr_now").val(htr_now_);
								$("#htr_con").val("");
							}else {
								alert("기록 실패, 다시 시도해 주세요.");
								
							}
			    	    },
			    	    error:function(request, status, errorData){
	                        alert("error code: " + request.status + "\n"
	                              +"message: " + request.responseText
	                              +"error: " + errorData);
	             		} 
			    	 
			    	});
		    	
		    	}
		    }
		    
		    // 습관 내용 수정하기
		    function editCommentModal() {
		    	
		    	var ht_con = $("#ht_comment").val();
		    	var ht_no = $("#ht_no").val();
		    	var htr_date = $("#period > a").html();
		    	
		    	
		    	$.ajax({
		    		method: 'POST',
		    		url: 'updateHabitComment.do',
		    		data: {'ht_con':ht_con, 'ht_no':ht_no},
		    		success: function(data) {
		    			
		    			if(data == "success") {
		    				
		    				
							$("#edit-comment").modal("hide");
							$("#ht_comment").val("");
		    				$(".clicked").trigger("click");
		    			}else{
		    				alert("내용 수정 실패, 다시 시도해 주세요.");
		    			}
		    			
		    		},
		    		error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
             		} 
		    	})
		    }
		    
		    // 선택한 습관기록 내용 삭제하기
		    function deleteHabitRecord(){
	
				var checkboxList = $("input[type='checkbox']:checked");
				
				arrayList = '';
				
				for(var i=0; i<checkboxList.length; i++){
			
					// checkbox가 체크 되어있을 때만 실행
					if($(checkboxList[i]).is(":checked")){
						
						if(i != checkboxList.length-1){
							arrayList += $(checkboxList[i]).val() + ",";
						} else{
							arrayList += $(checkboxList[i]).val();
						}
						
					}
				}	
				
				
				// 하나도 체크 안했을 시 
				if(arrayList == ''){
					alert("하나 이상을 선택해주세요.");
				}else{
					if(!confirm('삭제하시겠습니까?')){
					return false;}
					
					var htr_date = $("#period > a").html();
	
					$.ajax({
						type: "POST",
						url: "deleteHabitRecord.do",
						data: {htr_no : arrayList},
						success: function(data){
							
							if(data == "success"){
								$("."+htr_date).trigger("click");
								
								if(!$(".habit-record").html()){
									$("."+htr_date).removeClass("event");
								}
								
							}else{
			    				alert("삭제 실패, 다시 시도해 주세요.");
			    			}
							
						},
						error:function(request, status, errorData){
	                        alert("error code: " + request.status + "\n"
	                              +"message: " + request.responseText
	                              +"error: " + errorData);
	             		} 
					});
				}
				
			}
		    
		 	// 선택한 습관기록 내용 수정하기
		    function updateHabitRecordCheck(){
	
		    	
				var checkbox = $("input[type='checkbox']:checked");
				var htr_time = $(checkbox).parent().next().html();
				var htr_now = $(checkbox).parent().next().next().children().val();
				var ht_unit = $(".clicked a.ht_unit").html();
				var htr_con = $(checkbox).parent().next().next().next().html();
				
				if(checkbox.length > 1){
					alert("하나만 선택해 주세요.");
				}else if(checkbox.length < 1){
					alert("수정하실 내용을 선택해 주세요.");
				}else{
					
					$("#record-time").html(htr_time);
					$("#htr_now_m").val(htr_now);
					$("#htr_con_m").val(htr_con);
					$("#htr_unit_m").html(ht_unit);
					$("#edit-record").modal("show");
	
				}	
		 	}
		 	
		 	function editHabitRecordModal(){
		 		
		 		var checkbox = $("input[type='checkbox']:checked");
		 		var htr_date = $("#period > a").html();
		 		var htr_no = $(checkbox).val();
				var htr_now = $("#htr_now_m").val();
				var htr_con = $("#htr_con_m").val();
		 		
		 		$.ajax({
					type: "POST",
					url: "updateHabitRecord.do",
					data: {htr_no:htr_no, htr_now:htr_now, htr_con:htr_con},
					success: function(data){
						
						if(data == "success"){
							$("#edit-record").modal("hide");
							$("."+htr_date).trigger("click");
						}else{
		    				alert("수정 실패, 다시 시도해 주세요.");
		    			}
						
					},
					error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
             		} 
				});
		 		
		 	}
		    
		    

        </script>
        <jsp:include page="../common/footer.jsp"/>
    </body>
</html> 