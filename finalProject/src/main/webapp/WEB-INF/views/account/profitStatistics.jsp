<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Profit Statistics</title>
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
		    width: 75%;
		    margin-top: 30px;
		    margin-bottom: 100px;
        }
        
        .tdAmount {
        	width: 150px;
        }
        
        #notice {
        	margin-left: 550px;
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
        		<b style="color: blue; font-size: 20px;">Profit :&nbsp;</b>
        		<span><b id="profit" style="font-size: 20px;"></b></span>
        		<b style="color: red; font-size: 20px; margin-left: 50px;">Expenditure :&nbsp;</b>
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
	       			<tr id="monthly">
	       				<td class="category"><b>월급</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="weekly">
	       				<td class="category"><b>주급</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="daily">
	       				<td class="category"><b>일급</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="allowance">
	       				<td class="category"><b>용돈</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="over">
	       				<td class="category"><b>이월</b></td>
	       				<td class="tdAmount"><span class="amount"></span></td>
	       			</tr>
	       			<tr id="withdrawal">
	       				<td class="category"><b>자산인출</b></td>
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
    			url: 'pclist.do',
    			data: {date:date},
    			dataType: 'json',
    			success: function(data) {
    				var pSum = parseInt(data.pSum);
    				
    				$("#result").find(".amount").html("");
    				
    				for(var i in data.pcList) {
    					var category = data.pcList[i].category;
    					$("#" + category).find(".amount").html(data.pcList[i].amount.toLocaleString());
    					
   						name = data.pcList[i].title;
	    				amount = parseInt(data.pcList[i].amount);
	    				yValue = amount/pSum;
	    				
	    				dps.push({
	    					name : name,
	    					y : yValue
	    				})    					    						
	   
    				}
    				
    				chart.render();
    				
    				$("#sentence").html("");
    				$("#gapAmount").html("");
    				
    				if(data.pcList.length > 0) {
	    				if(data.gap == "plus") {
	    					$("#gapAmount").html("+" + data.gapAmount).css("color", "blue");
	    				} else {
	    					$("#gapAmount").html(data.gapAmount).css("color", "red");
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