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
            padding: 50px;
        }

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
            display: block;
            margin-top: 30px;
            padding: 15px;
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
			padding:15px;
			width: 46%;
		}
		
		
		.content-section1-right,
		.content-section2-right {
			width: 50%;
		    height: 262px;
		    float: right;
		    background: #f3f3f3;
		    border-radius: 10px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
	        flex-direction: column;
		}
		
		.content-section2-right {
			padding:15px;
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
		}
		
		.add::after {
			display: flex;
			position: absolute;
		    content: "+";
		    width: 100%;
		    height: 100%;
		    background: #0000007a;
		    color: white;
		    border-radius: 10px;
		    justify-content: center;
		    align-items: flex-end;
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
			color: #484848;
			font-weight: 600;
			font-size: 20px;
			height: 20px;
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
    		margin-left: -15px;
        }
        
        .count {
        	text-align: right;
		    background: none;
		    border: none;
		    margin: 15px;
		    font-size: 50px;
		    width: 200px;
		    padding: 10px;
        }
        
        .memo-area {
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
        

		
    </style>
    </head>

    <body>
    	<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDaily.jsp"/>
        <div class="right-area">
            <span class="pSubject">Habit Tracker</span>
            
            <div class="small-button-area">
       			<button>Daily</button>
       			<button>Weekly</button>
                <button>Monthly</button>
			</div>
            <!-- 슬라이드 -->
            <div class="carousel" data-flickity='{ "draggable": false }'>
				<c:forEach var="h" items="${hlist }">
					<!-- 퍼센트 연산처리 -->
					<fmt:parseNumber var="percent" value="${(h.ht_now/h.ht_goal)*100+(1-(((h.ht_now/h.ht_goal)*100)%1))%1}" integerOnly="true" />
					<!-- 슬라이드 아이템 -->
		        	<input id="htNum" type="hidden" value="${h.ht_no }"> <!-- 습관 번호 -->
					<div class="progress carousel-cell">
				  		<div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:${percent }%; background-color:${h.ht_color};"></div>
			    		<div class="bar-info">
							<div class="ht_title">${h.ht_title }</div>
							<div><a class="ht_now">${h.ht_now }</a> / ${h.ht_goal } ${h.ht_unit }</div> <!-- now는 기록 메모 테이블의 현재값 컬럼을 더한 값 -->
						</div>
						<div>${percent }%</div>
					</div>
				</c:forEach>
			</div>
       
            
            <!-- Button Start-->
            <div class="button-area">
                <button>Edit</button>
                <button>Delete</button>
                <button onclick="location.href='addHabitView.do'">Add</button>
            </div>

    		<!-- 내용 -->
            <div class="content">
            	<div class="cSubject">Drink Water</div>
            	<div class="content-section1">
            		<div class="content-section1-left">
	            		<div>
	            			Calendar
	            		</div>
	            	</div>
	            	<div class="content-section1-right">
	            		<div class="item-subject">Progress</div>
	            		<div class="progress carousel-cell progress-d">
				  			<div class="progress-bar" id="progress1" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
	            		</div>
	            		<div class="section1-item-area">
		            		<div class="section1-item add" data-toggle="modal" data-target="#add-count" style="margin-right: 10px;">
		            			<span id="periode"></span>
		            			<span id="now"></span>
		            			<span id="goal"></span>
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

	            		<div class="item-subject sub">Comment
	            		</div>
	            		<div class="section2-item" id="comment">
	            			
	            		</div>
	            		<div class="small-button-area">
			                <button>Edit</button>
			            </div>
	            	</div>
	            	<div class="content-section2-right b-white">
	            		<div class="item-subject sub">Record
	            		</div>
	            		<div class="section2-item">
	            			<!-- <div class="t-sub blue" colspan="3">Today</div> -->
	            			<table id="habit-record" class="habit-record" cellpadding="3px">
	       
	            			</table>
	            		</div>
	            			<div class="small-button-area">
	            				<button>Delete</button>
				                <button>Edit</button>
				            </div>
	            	</div>
	            </div>
            </div>
            		
			<!-- Modal -->
			<div class="modal fade" id="add-count" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      <form action="#"> <!-- Count form -->
				      <div class="modal-body">
					      <div class="modal-t">
				      		<div>Count</div>
				      		<div>Drink water</div>
					      </div>
					      <div class="count-area b-lightgray">
					      	<span>+</span>
					      	<input class="count blue" type="text" value="300">
					      	<span>ml</span>
					      </div>
					      <div class="memo-area">
					      	<div>Memo</div>
					      	<input type="text" value="memo">
					      </div>
					      <div class="small-button-area">
	           				<button>Save</button>
			                <button data-dismiss="modal" aria-label="Close">Cancel</button>
					      </div>
				      </div>
			      </form>
			    </div>
			  </div>
			</div>           
            
            
            <!-- Button Start-->
            <div class="button-area">
                <button class="blue">Graph >></button>
            </div>
            <!-- Button End-->
            
            

        </div>
		
		<script>
	
		
			$(function(){
				
		        var responseMessage = "<c:out value="${message}" />";
		        if (responseMessage != ""){alert(responseMessage)}
		   
		  
		    })
		    
		    var target=$('.carousel-cell');
		    
		    target.click(function(){
		    	$(this).addClass("clicked");
		    	var htNum = $(this).prev("#htNum").val();
		    	console.log(htNum);
		    	
		    	$.ajax({
   					url: "habitContent.do",
   					type: "post",
   					data: {htNum:htNum},
   					dataType:"json",
   					success:function(data){
   						console.log(data);
   						
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
	   						var checkbox = "<input type='checkbox' id='check"+ i +"' name='check" + i +"'>" + "<label for='check"+i+"'>" + "</label>";
	   						
	   						sum += + data.recordDailyList[i].htr_now;
	   						
							$tr = $("<tr>");
							$tdCheckbox = $("<td>").append(checkbox);
							$tdTime = $("<td>").text(data.recordDailyList[i].htr_time);
							$tdNow = $("<td>").text("+" + data.recordDailyList[i].htr_now + data.list.ht_unit);
							$tdCon=$("<td>").text(data.recordDailyList[i].htr_con);
							
							$tr.append($tdCheckbox);
							$tr.append($tdTime);
							$tr.append($tdNow);
							$tr.append($tdCon);
							$tableBody.append($tr);
							
						}
						
						console.log(sum);
						
						$("#periode").html("Today");
						
						//현재 값
   						$("#now").html(sum);
   						$("#now").css("color", data.list.ht_color);
   						
   						//현재 퍼센트
   						$("#achieve").html(Math.ceil(sum/data.list.ht_goal*100)+"%");
   						$("#achieve").css("color", data.list.ht_color);
   						
   						//progress bar
   						$("#progress1").css("width", Math.ceil(sum/data.list.ht_goal*100) + "%");
   						$("#progress1").css("background-color", data.list.ht_color);
						
   					} else if(data.list.ht_cycle == "Weekly") { //기준이 일주일일 때
   						
   						$("#periode").html("This Week");
   						
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
	   						var checkbox = "<input type='checkbox' id='check"+ i +"' name='check" + i +"'>" + "<label for='check"+i+"'>" + "</label>";
	   						var date = "<b>" + data.recordMonthlyList[i].htr_month + "일 </b>" + data.recordMonthlyList[i].htr_time;  
							
							sum += + data.recordMonthlyList[i].htr_now;
	   						
							$tr = $("<tr>");
							$tdCheckbox = $("<td>").append(checkbox);
							$tdTime = $("<td>").append(date);
							$tdNow = $("<td>").text("+" + data.recordMonthlyList[i].htr_now + data.list.ht_unit);
							$tdCon=$("<td>").text(data.recordMonthlyList[i].htr_con);
							
							$tr.append($tdCheckbox);
							$tr.append($tdTime);
							$tr.append($tdNow);
							$tr.append($tdCon);
							$tableBody.append($tr);
						}
						
						//프로그레스 소제목
   						$("#periode").html("This Month");
						
						//현재 값
   						$("#now").html(sum);
   						$("#now").css("color", data.list.ht_color);
   						
   						//현재 퍼센트
   						$("#achieve").html(Math.ceil(sum/data.list.ht_goal*100)+"%");
   						$("#achieve").css("color", data.list.ht_color);
   						
   						//progress bar
   						$("#progress1").css("width", Math.ceil(sum/data.list.ht_goal*100) + "%");
   						$("#progress1").css("background-color", data.list.ht_color);		
   						
   					}
 		
   					},
   					error:function(request, status, errorData){
                         alert("error code: " + request.status + "\n"
                               +"message: " + request.responseText
                               +"error: " + errorData);
              		} 
   				})
		    	
		    	target.not($(this)).removeClass("clicked");
		    });
		    


        </script>
        <jsp:include page="../common/footer.jsp"/>
    </body>
</html> 