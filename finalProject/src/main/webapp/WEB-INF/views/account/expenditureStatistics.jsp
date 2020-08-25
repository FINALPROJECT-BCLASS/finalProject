<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Expenditure Statistics</title>
    <script type="text/javascript"></script>
    
    <link href='resources/css/main.css' rel='stylesheet' />
    <script src='resources/lib/main.js'></script>
    
    <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    
    <script>
   		var today = new Date();
       	var year = today.getFullYear();
       	var month = today.getMonth()+1;
       	var date;
       	
       	if(month > 10) {
       		date = year + "-" + month;       		
       	} else {
       		date = year + "-0" + month;
       	}
       	
       	
       	$(document).ready(function(){
	    	var dps = [];
	    	
	    	var chart = new CanvasJS.Chart("chartContainer", {
	    		animationEnabled: true,
	    		exportEnabled: true,	
	    		title:{
	    		
	    		},
	    		data: [{
	    			type: "pie",    
	    		    yValueFormatString: "#%",
	    		    showInLegend: true,
	    		    indexLabel: "{name}", 
	    		    indexLabelPlacement: "inside",
	    			dataPoints: dps
	    		}]
	    	});
	    	
	    	insertData(date, dps, chart);
	    	
	    	$("#prevMonth").click(function(){
	    		month = month-1;
	    		
	    		if(month < 1) {
	    			year = year-1;
	    			month = 12;
	    		}
	    		
	    		if(month > 9) {
	           		date = year + "-" + month;       		
	           	} else {
	           		date = year + "-0" + month;
	           	}
	    		
	    		$("#date").html(date);
	    		
	    		var newDps = [];
	    		
	    		var chart = new CanvasJS.Chart("chartContainer", {
		    		animationEnabled: true,
		    		exportEnabled: true,	
		    		title:{
		    		
		    		},
		    		data: [{
		    			type: "pie",    
		    		    yValueFormatString: "#%",
		    		    showInLegend: true,
		    		    indexLabel: "{name}", 
		    		    indexLabelPlacement: "inside",
		    			dataPoints: newDps
		    		}]
		    	});
		    	
		    	insertData(date, newDps, chart);
	    		
	    	})
	    	
	    	$("#nextMonth").click(function(){
	    		month = month+1;
	    		
	    		if(month > 12) {
	    			year = year+1;
	    			month = 1;
	    		}
	    		
	    		if(month > 9) {
	           		date = year + "-" + month;       		
	           	} else {
	           		date = year + "-0" + month;
	           	}
	    		
	    		$("#date").html(date);
	    		
	    		var newDps = [];
	    		
	    		var chart = new CanvasJS.Chart("chartContainer", {
		    		animationEnabled: true,
		    		exportEnabled: true,	
		    		title:{
		    		
		    		},
		    		data: [{
		    			type: "pie",    
		    		    yValueFormatString: "#%",
		    		    showInLegend: true,
		    		    indexLabel: "{name}", 
		    		    indexLabelPlacement: "inside",
		    			dataPoints: newDps
		    		}]
		    	});
		    	
		    	insertData(date, newDps, chart);
	    		
	    	})
	    	 
    	})
    	
    	$(function(){
    		$("#date").html(date);
    	})
    </script>
    
    <style>
        .col-md-6, .col-md-2 {
            position: inherit !important;
        }
        
        .col-md-4 {
        	display: flex;
        	justify-content: center;
        	align-items: center;
        }
        
        #result {
        	margin-left: 50px;
        }
        
        #result tr {
        	border-bottom: solid 3px #F3F3F3;
        }
        
        #result td {
        	padding: 5px;
        }
        
        #content {
        	display: flex;
		    align-items: center;
		    float: right;
		    width: 68%;
		    margin-top: 30px;
		    margin-bottom: 100px;
        }
        
        .tdAmount {
        	width: 150px;
        }
        
        #notice {
        	margin-left: 650px;
        	width: 500px;
        	text-align: center;
        }
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    <section>

		<jsp:include page="../common/sidenaviAccount.jsp"/>
        
        <br><br>
        
        <div class="row">
        	<div class="col-md-5"></div>
        	<div class="col-md-4">
	            <button type="button" class="default-btn" id="prevMonth"><</button>
	        	<span id="date" style="font-weight: bold; font-size: 40px;"></span>
	        	<button type="button" class="default-btn" id="nextMonth">></button>        	
        	</div>
        </div>
        
        <div class="row">
        	<div id="notice">
        		<b style="color: #007bff; font-size: 20px;">Profit :&nbsp;</b>
        		<span><b id="profit" style="font-size: 20px;"></b></span>
        		<b style="color: #dc3545; font-size: 20px; margin-left: 50px;">Expenditure :&nbsp;</b>
        		<span><b id="expenditure" style="font-size: 20px;"></b></span>
        		<br>
        		<b id="gapAmount" style="font-size: 40px;"></b>
        		<br>
        		<b id="sentence" style="font-size: 20px;"></b>
        	</div>
        </div>
        
        <div id="content">
	       	<div>
	       		<div id="chartContainer" style="height: 500px; width: 500px;"></div>
	       	</div>
	       	<div>
	       		<table id="result">
	       			<tr id="meal">
	       				<td class="category"><b>식비</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="transition">
	       				<td class="category"><b>교통비</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="culture">
	       				<td class="category"><b>문화생활</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="life">
	       				<td class="category"><b>생필품</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="clothes">
	       				<td class="category"><b>의류</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="beauty">
	       				<td class="category"><b>미용</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="health">
	       				<td class="category"><b>의료</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="education">
	       				<td class="category"><b>교육</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="phone">
	       				<td class="category"><b>통신비</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="membership">
	       				<td class="category"><b>회비</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="occasion">
	       				<td class="category"><b>경조사</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="saving">
	       				<td class="category"><b>저축</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="machine">
	       				<td class="category"><b>가전</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="utility">
	       				<td class="category"><b>공과금</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="card">
	       				<td class="category"><b>카드대금</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="etc">
	       				<td class="category"><b>기타</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       		</table>
	       	</div>
       	</div>
        
    </section>

    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	function insertData(date, dps, chart){
    		
	    	var label;
	    	var yValue;
	    	
	    	$.ajax({
    			url: 'eclist.do',
    			data: {date:date},
    			dataType: 'json',
    			success: function(data) {
    				var eSum = parseInt(data.eSum);
    				
    				$("#result").find(".amount").html("");
    				
    				for(var i in data.ecList) {
    					var category = data.ecList[i].category;
    					$("#" + category).find(".amount").html(data.ecList[i].amount.toLocaleString());
    					
   						name = data.ecList[i].title;
	    				amount = parseInt(data.ecList[i].amount);
	    				yValue = amount/eSum;
	    				
	    				dps.push({
	    					name : name,
	    					y : yValue
	    				})    					    						
	   
    				}
    				
    				chart.render();
    				
    				$("#sentence").html("");
    				$("#gapAmount").html("");
    				
    				if(data.ecList.length > 0) {
	    				if(data.gap == "plus") {
	    					$("#gapAmount").html("+" + data.gapAmount).css("color", "#007bff");
	    				} else {
	    					$("#gapAmount").html(data.gapAmount).css("color", "#dc3545");
	    				}
	    				
	    				if(data.maxExp != "") {
	    					$("#sentence").html("'" + data.maxExp + "'을 줄여보시는게 어떨까요?");
	    				} else {
	    					$("#sentence").html("계획적인 소비 생활을 하고 계시는군요!")
	    				}    					
    				}
    				
    				$("#profit").html(data.formatPSum);
    				$("#expenditure").html(data.formatESum);
    			},
    			error:function(request, status, errorData){
                    alert("error code: " + request.status + "\n"
                          +"message: " + request.responseText
                          +"error: " + errorData);
                }   
    		})
    	}
    </script>	
    
</body>
</html>