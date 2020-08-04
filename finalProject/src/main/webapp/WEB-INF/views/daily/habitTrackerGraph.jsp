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
<link rel="stylesheet" type="text/css" href="path/to/chartjs/dist/Chart.min.css">
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
	    	height: 920px;
	    	position: relative;
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
            justify-content: flex-start;
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
        
        .small-subject {
        	margin-top: -58px;
		    margin-bottom: 20px;
		    font-size: 20px;
		    font-weight: 600;
        }
        
        .s2 {
        	margin-top: 30px;
    		margin-bottom: 20px;
        }
        
        

		
    </style>
    </head>

    <body>
    	<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDaily.jsp"/>
        <div class="right-area">
            <span class="pSubject">Habit Tracker</span>

            <!-- 슬라이드 -->
            <div class="carousel" data-flickity='{ "draggable": true }'>
				<c:forEach var="h" items="${hlist }">
					<!-- 퍼센트 연산처리 -->
					<fmt:parseNumber var="percent" value="${(h.ht_now/h.ht_goal)*100+(1-(((h.ht_now/h.ht_goal)*100)%1))%1}" integerOnly="true" />
					<!-- 슬라이드 아이템 -->
					<input id="htCycle" type="hidden" value="${h.ht_cycle }">
		        	<input id="htNum" type="hidden" value="${h.ht_no }"> <!-- 습관 번호 -->
					<div class="progress carousel-cell habitItem ${h.ht_cycle }">
			        	<!-- 습관 주기 -->
				  		<div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:${percent }%; background-color:${h.ht_color};"></div>
			    		<div class="bar-info">
							<div class="ht_title">${h.ht_title }</div>
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
					</div>
				</c:forEach>
			</div>
		
       

    		<!-- 내용 -->
            <div id="content" class="content">
            	<input type="hidden" id="ht_no">
            	<div class="cSubject" id="habitTitle">Drink Water</div>
            	<div class="content-section1">
            	<div class="chart-container" style="top: 10%; position: absolute; height:200px; width:50vw">
            		<div class="small-subject">This Week</div>
            		<canvas id="myChart"></canvas>
            		<div class="small-subject s2">This Month</div>
            		<canvas id="myChartM"></canvas>
            	</div>
	            </div>
            </div>
			      
            <!-- Button Start-->
            <div class="button-area">
                <button class="blue" onclick="location.href='htList.do'"><< Back</button>
            </div>
            <!-- Button End-->
        </div>
		
		<!-- Calendar -->
		<!-- <script type="text/javascript"  src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
        crossorigin="anonymous"></script> -->
		
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script>
		
		var myChart;
		var myChartM;
		
		$(".content").hide();
		
		
		var data = [];
		var target = $('.habitItem');
		
		var t = new Date(); // 오늘 날짜
        var y= t.getFullYear(); // 년도
        var m = (t.getMonth()+1)>9 ? ''+(t.getMonth()+1) : '0'+(t.getMonth()+1); // 월
        var d = t.getDate()>9 ? ''+t.getDate() : '0'+t.getDate(); // 일
                
        var today = y + '-' + m + '-' + d;
		
		
	    target.on("click", function(){
	    	$(this).addClass("clicked");
	    	$(".content").show();
	    	
	    	$("#habitTitle").html($(this).find(".ht_title").html());
	    	
	    	var cycle = $(this).prev().prev("#htCycle").val();
	    	var no = $(this).prev("#htNum").val();
	    	
	    	$.ajax({
	    		
	    		url: "selectGraphData.do",
	   			type: "post",
				data: {ht_cycle:cycle, ht_no:no, today:today},
				dataType:"json",
				success:function(data){
					console.log("data" + data);
					graph(data); 
				},
				error:function(request, status, errorData){
                      alert("error code: " + request.status + "\n"
                                +"message: " + request.responseText
                                +"error: " + errorData);
                } 
	    		
	    	});
	    	
	    	
	    	target.not($(this)).removeClass("clicked");
	    });
	    
	    // 일주일 구하기
	    var currentDay = new Date();  
		var theYear = currentDay.getFullYear();
		var theMonth = currentDay.getMonth();
		var theDate  = currentDay.getDate();
		var theDayOfWeek = currentDay.getDay();
		 
		var thisWeek = [];
		 
		for(var i=0; i<7; i++) {
		  var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
		  var yy = resultDay.getFullYear();
		  var mm = Number(resultDay.getMonth()) + 1;
		  var dd = resultDay.getDate() + 1 ;
		 
		  mm = String(mm).length === 1 ? '0' + mm : mm;
		  dd = String(dd).length === 1 ? '0' + dd : dd;
		 
		  thisWeek[i] = yy + '/' + mm + '/' + dd;
		  
		  thisWeek[i] = thisWeek[i].substring(2);
		  
		}
		
		// 해당월의 일수 구해오기
		var dayCount = new Date(theYear,theMonth,0).getDate();
		var thisMonth = [];
		
		for(var i=0; i<dayCount; i++) {
			thisMonth[i] = i+1;
		}
		
		// 에이작스 데이터를 전역변수로 뺴고 그래프를 다큐먼트로 지정해주고 destroy()하고 실행하게 해보자.
	    // graph 실행 함수
	    function graph(data) {
	   	
	    var labels = [];
	    var datalist  = [];
	    
 	    
		for(var i=0;i< thisWeek.length;i++){
			datalist.push(0);
		}
	     
		for(var i=0;i< thisWeek.length;i++){
			for(var j in data.hd){
				if(thisWeek[i] == data.hd[j].ht_date){

					datalist.splice(i,1,data.hd[j].ht_now);
				}
			}

		}
	
     	 if (myChart) {
          myChart.destroy();
        }
		
		var ctx = document.getElementById('myChart').getContext('2d');
		myChart = new Chart(ctx, {
			
		    // The type of chart we want to create
		    type: 'bar',
		    // The data for our dataset
		    data: {
		        labels: thisWeek,//['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'september', 'actober', 'rebember', ''],
		        datasets: [{
		            label: $("#habitTitle").html(),
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)',
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)',
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1,
		            data:datalist,
		            options: {
		                responsive: false,
		                maintainAspectRatio: false,
		                scales: {
		                    yAxes: [{
		                        ticks: {
		                            beginAtZero: true
		                                 
		                        }
		                    }]
		                },
		            }
		        }]
		    },

		    // Configuration options go here
		    options: {
		    	legend:{
                	display:false
		    	}
		    }
		});
		/* chart.reset();
		chart.data.datasets.push(datalist);
		chart.update(); */
		
		
		var datalistM = [];
		
		for(var i=0;i< thisMonth.length;i++){
			datalistM.push(0);
		}
	     
		for(var i=0;i< thisMonth.length;i++){
			for(var j in data.hd){
				
				var date = data.hd[j].ht_date;
				var cutDay = date.substring(6);
				
				if(thisMonth[i] == cutDay){

					datalistM.splice(i,1,data.hd[j].ht_now);
				}
			}

		}
		
		if (myChartM) {
	          myChartM.destroy();
	    }
		
		var ctxm = document.getElementById('myChartM').getContext('2d');
		myChartM = new Chart(ctxm, {
		    // The type of chart we want to create
		    type: 'bar',

		    // The data for our dataset
		    data: {
		        labels: thisMonth,//['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'september', 'actober', 'rebember', ''],
		        datasets: [{
		            label: $("#habitTitle").html(),
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)',
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)',
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1,
		            data:datalistM,
		            options: {
		                responsive: false,
		                maintainAspectRatio: false,
		                scales: {
		                    yAxes: [{
		                        ticks: {
		                            beginAtZero: true
		                        }
		                    }]
		                },
		            }
		        }]
		    },

		    // Configuration options go here
		    options: {
		    	legend:{
                	display:false
      			}
		    } 
		});
		
	    }
	    
		</script>
        <jsp:include page="../common/footer.jsp"/>
    </body>
</html> 