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
       	
    	$(document).ready(function() {
    		
	    	var dps = [];
	    	var chart = new CanvasJS.Chart("chartContainer", {
	    		theme: "light2", // "light1", "dark1", "dark2"
	    		animationEnabled: true,
	    		title: {
	    			text: ""
	    		},
	    		axisX: {
	    			titleFontWeight : "bold",
	    			suffix: "월"
	    		},
	    		axisY: {
	    			title: "액수",
	    			suffix: "원"
	    		},
	    		data: [{
	    			type: "line",
	    			dataPoints: dps
	    		}]
	    	});
    	 
	    	var xValue;
	    	var yValue;
	    	
	    	$.ajax({
    			url: 'mpslist.do',
    			data: {year:year},
    			dataType: 'json',
    			success: function(data) {
    				for(var i in data.mpsList) {
	   
	    				if(data.mpsList[i].month < 10) {
	    					xValue = "0" + data.mpsList[i].month;
	    				} else {
	    					xValue = data.mpsList[i].month;
	    				}
	    				
	    				yValue = parseInt(data.mpsList[i].amount);
	    				
	    				dps.push({
	    					x : parseInt(xValue),
	    					y : yValue
	    				})    					
    				}
    			},
    			error:function(request, status, errorData){
                    alert("error code: " + request.status + "\n"
                          +"message: " + request.responseText
                          +"error: " + errorData);
                }   
    		})
	    	 
	    	chart.render();
	    	 
    	})
    	
    	$(function(){
	    	$("#year").html(year);    		
    	})
    </script>
    
    <style>
        .col-md-6, .col-md-2 {
            position: inherit !important;
        }
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    <section>

		<jsp:include page="../common/sidenaviAccount.jsp"/>
        
        <br><br>
        
        <div class="row">
        	<div class="col-md-6"></div>
        	<div class="col-md-4">
	            <button type="button" class="default-btn" id="prevYear"><</button>
	        	<span id="year" style="font-weight: bold; font-size: 40px;"></span>
	        	<button type="button" class="default-btn" id="nextYear">></button>        	
        	</div>
        </div>
        
        <div id="chartContainer" style="margin-left: 300px; height: 500px; width: 70%;"></div>  
        
    </section>

    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	function getData(year){
    		$.ajax({
    			url: 'mpslist.do',
    			dataType: 'json',
    			success: function(data) {
    				
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