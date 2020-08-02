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
    
    <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    
    <script>
   		var today = new Date();
       	var year = today.getFullYear();
       	
       	$(document).ready(function(){
	    	var dps1 = [];
	    	var dps2 = [];
	    	
	    	var chart = new CanvasJS.Chart("chartContainer", {
	    		theme: "light2", // "light1", "dark1", "dark2"
	    		animationEnabled: true,
	    		title: {
	    		},
	    		axisX: {
	    			suffix: "월",
	    			interval: 1,
	    			labelFontWeight: "bold"
	    			
	    		},
	    		axisY: {
	    			suffix: "원",
	    			labelFontWeight: "bold"
	    		},
	    		data: [
	    			{
	    				type: "line",
	    				color: "blue",
	    				dataPoints: dps1
	    			},
	    			{
	    				type: "line",
	    				color: "red",
	    				dataPoints: dps2
	    			}
	    		]
	    	});
	    	
	    	insertData(year, dps1, dps2, chart);
	    	
	    	$("#prevYear").click(function(){
	    		year = year-1;
	    		$("#year").html(year);
	    		
	    		var newDps1 = [];
	    		var newDps2 = [];
	    		
	    		var chart = new CanvasJS.Chart("chartContainer", {
		    		theme: "light2", // "light1", "dark1", "dark2"
		    		animationEnabled: true,
		    		title: {
		    		},
		    		axisX: {
		    			suffix: "월",
		    			interval: 1,
		    			labelFontWeight: "bold"
		    			
		    		},
		    		axisY: {
		    			suffix: "원",
		    			labelFontWeight: "bold"
		    		},
		    		data: [
		    			{
		    				type: "line",
		    				color: "blue",
		    				dataPoints: newDps1
		    			},
		    			{
		    				type: "line",
		    				color: "red",
		    				dataPoints: newDps2
		    			}
		    		]
		    	});
	    		
	    		insertData(year, newDps1, newDps2, chart);
	    	})
	    	
	    	$("#nextYear").click(function(){
	    		year = year+1;
	    		$("#year").html(year);
	    		
	    		var newDps1 = [];
	    		var newDps2 = [];
	    		
	    		var chart = new CanvasJS.Chart("chartContainer", {
		    		theme: "light2", // "light1", "dark1", "dark2"
		    		animationEnabled: true,
		    		title: {
		    		},
		    		axisX: {
		    			suffix: "월",
		    			interval: 1,
		    			labelFontWeight: "bold"
		    			
		    		},
		    		axisY: {
		    			suffix: "원",
		    			labelFontWeight: "bold"
		    		},
		    		data: [
		    			{
		    				type: "line",
		    				color: "blue",
		    				dataPoints: newDps1
		    			},
		    			{
		    				type: "line",
		    				color: "red",
		    				dataPoints: newDps2
		    			}
		    		]
		    	});
	    		
	    		insertData(year, newDps1, newDps2, chart);
	    	})
	    	 
    	})
    	
    	$(function(){
	    	$("#year").html(year);    		
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
        
        #year {
        	margin-top: -8px;
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
	            <button type="button" class="default-btn" id="prevYear"><</button>
	        	<span id="year" style="font-weight: bold; font-size: 40px;"></span>
	        	<button type="button" class="default-btn" id="nextYear">></button>        	
        	</div>
        </div>
        
        <br>
        
        <div class="row">
        	<div class="col-md-5"></div>
        	<div class="col-md-7">
        		<b style="color: blue; font-size: 40px; margin-left: 30px;">Profit</b>
        		<b style="color: red; font-size: 40px; margin-left: 100px;">Expenditure</b>
        	</div>
        </div>
        
        <div id="chartContainer" style="margin-left: 300px; height: 500px; width: 70%;"></div>  
        
    </section>

    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	function insertData(year, dps1, dps2, chart){
    		
    		var xValue;
	    	var yValue;
	    	
	    	$.ajax({
    			url: 'mslist.do',
    			data: {year:year},
    			dataType: 'json',
    			success: function(data) {
    				for(var i in data.msList) {
    					
    					if(data.msList[i].type == "profit") {
		    				xValue = parseInt(data.msList[i].month);
		    				
		    				yValue = parseInt(data.msList[i].amount);
		    				
		    				dps1.push({
		    					x : xValue,
		    					y : yValue
		    				})    					    						
    					} else {
							xValue = parseInt(data.msList[i].month);
		    				
		    				yValue = parseInt(data.msList[i].amount);
		    				
		    				dps2.push({
		    					x : xValue,
		    					y : yValue
		    				})    					    			
    					}
	   
    				}
    				
    				chart.render();
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