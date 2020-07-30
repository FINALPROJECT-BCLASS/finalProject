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
	    		exportEnabled: true,
	    		animationEnabled: true,
	    		theme: "light2", // "light1", "dark1", "dark2"
	    		title: {
	    		},
	    		subtitles: [{
	    		}],
	    		data: [{
	    			type: "pie",
	    			yValueFormatString: "#,##0\"%\"",
	    			indexLabel: "{label} - {y}",
	    			dataPoints: dps[0]
	    		}]
	    	});
	    	
	    	insertData(date, dps, chart);
	    	 
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
        	<div class="col-md-3"></div>
        	<div class="col-md-4">
        		<b style="color: blue; font-size: 20px;">Profit :&nbsp;</b><span><b id="profit" style="font-size: 20px;"></b></span>
        	</div>
        	<!-- <div class="col-md-4"></div> -->
        	<div class="col-md-5">
        		<b style="color: red; font-size: 20px;">Expenditure :&nbsp;</b><span><b id="expenditure" style="font-size: 20px;"></b></span>
        	</div>
        </div>
        
        <br><br>
        
        <div class="row">
        	<div class="col-md-2"></div>
        	<div class="col-md-10">
        		<div id="chartContainer" style="height: 600px; width: 600px;"></div>
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
    				for(var i in data.ecList) {
    					console.log(data.ecList[i]);
    					
   						label = data.ecList[i].category;
	    				yValue = parseInt(data.ecList[i].amount);
	    				
	    				dps.push({
	    					label : label,
	    					y : yValue
	    				})    					    						
	   
    				}
    				
    				chart.render();
    				
    				$("#profit").html(data.pSum);
    				$("#expenditure").html(data.eSum);
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