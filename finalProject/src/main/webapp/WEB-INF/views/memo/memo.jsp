<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <script type="text/javascript"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	<!-- 주소 api -->
    
    <link href='resources/css/main.css' rel='stylesheet' />
    <script src='resources/lib/main.js'></script>
    
    <style>
    	#circle{
            width: 60px;
            height : 60px;
            background-color: #FBD14B;
            border-radius: 50%;
            display: inline-block;
        }

        #circleArea{
            width: 100%;
            display: flex;
            align-items: center;
            margin: 50px;
        }

        #memoLogo{
            margin-left: -40px;
            padding-top: 7px;
            font-size: 40px;
            color: rgba(72, 72, 72, 1);;
        }
        
        .select-btn{
        	font-size: 20px;
		    font-weight: 600;
			border-style: none;
		    border-radius: 8px;
		    height: 50px;
		    width: 200px;
		    margin: -5px;
        }
        
        #memoArea {
        	display: flex;
		    align-items: center;
		    flex-flow: wrap;
        }
        
        .memo-size {
        	width: 400px;
        	height: 350px;
        	margin-left: 20px;
        	margin-bottom: 20px;
        	padding: 10px;
        }
        
        .etc {
        	background-color: #fde392;
        	color: #484848;
        }
        
        .plan {
        	background-color: #a1e6d9;
        	color: #484848;
        }
        
        .account {
        	background-color: #ffc5ef;
        	color: #484848;
        }
        
        .bookmark {
        	background-color: #dfcbff;
        	color: #484848;
        }
        
        .dBtnArea {
        	width: 100%;
        	text-align: right;
        }
        
        .deleteBtn {
        	background: none;
        	border: none;
        	font-weight: bold;
        }
        
        .aBtnArea {
        	width: 100%;
        	text-align: center;
        }
        
        .addBtn {
        	margin-top: 20px;
        	font-size: 15px;
		    font-weight: 600;
		    color: white;
		    background-color: #484848;
			border-style: none;
		    border-radius: 8px;
		    height: 30px;
		    width: 60px;
		}
		
		.circle {
			width: 15px;
	      	height: 15px;
	      	border-radius: 50%;
	      	display: inline-block;
		}
		
		#colorArea {
			margin-left: 100px;
			width: 500px;
		}
		
		.eBtnArea {
        	width: 100%;
        	text-align: center;
        }
        
        .editBtn {
        	margin-top: 20px;
        	font-size: 15px;
		    font-weight: 600;
		    color: white;
		    background-color: #484848;
			border-style: none;
		    border-radius: 8px;
		    height: 30px;
		    width: 60px;
		    margin-right: 5px;
		}
		
		/* sky:#c5d2ef */
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    <section>
		<div id="circleArea">
            <div id="circle"></div>
            <b id="memoLogo">Memo</b>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="default-btn" data-toggle="modal" data-target="#selectModal">Add</button>
            <div id="colorArea">
            	<div class="circle plan"></div>&nbsp;<b>Monthly Planner</b>&nbsp;&nbsp;
            	<div class="circle bookmark"></div>&nbsp;<b>Bookmark</b>&nbsp;&nbsp;
            	<div class="circle account"></div>&nbsp;<b>Account Book</b>&nbsp;&nbsp;
            	<div class="circle etc"></div>&nbsp;<b>Etc</b>
            </div>
        </div>
        
        <div id="memoArea"></div>
        
        <script>
        	$(function(){
        		$.ajax({
        			url: 'memolist.do',
        			dataType: 'json',
        			success: function(data) {
        				for(var i in data.memoList){
    	   					if(data.memoList[i].main == 0) {
    	   						$div = $("<div class='memo-size etc'>");
    	   						
    	   						$dBtnDiv = $("<div class='dBtnArea'>");
    	   						$deleteBtn = $("<button type='button' class='deleteBtn'>").text("X");
    	   						
    	   						$dBtnDiv.append($deleteBtn);
    	   						
    	   						$no = $("<input type='hidden' class='memoNo' value='" + data.memoList[i].no + "'>");
    	   						
    	   						$table = $("<table class='memo-table'>");
    	   						
    	   						$dateTr = $("<tr>");
    	   						$dateTd1 = $("<th>").html("Date");
    	   						$dateTd2 = $("<td>").html(data.memoList[i].date);
    	   						
    	   						$conTr1 = $("<tr>");
    	   						$conTd1 = $("<th colspan='2'>").html("Content");
    	   						
    	   						$conTr2 = $("<tr>");
    	   						$conTd2 = $("<td colspan='2' class='conTd2'>").html(data.memoList[i].content);
    	   						
    	   						$eBtnDiv = $("<div class='eBtnArea'>");
    	   						$editBtn = $("<button type='button' class='editBtn eMemoBtn'>").text("Edit");
    	   						
    	   						$eBtnDiv.append($editBtn);
    	   						
    	   						$dateTr.append($dateTd1).append($dateTd2);
    	   						
    	   						$conTr1.append($conTd1);
    	   						
    	   						$conTr2.append($conTd2);
    	   						
    	   						$table.append($dateTr).append($conTr1).append($conTr2);
    	   						
    	   						$div.append($dBtnDiv).append($no).append($table).append($eBtnDiv);
    	   						
    	   						$("#memoArea").append($div);
    	   					} else if(data.memoList[i].main == 1) {
								$div = $("<div class='memo-size plan'>");
								
								$dBtnDiv = $("<div class='dBtnArea'>");
    	   						$deleteBtn = $("<button type='button' class='deleteBtn'>").text("X");
    	   						
    	   						$dBtnDiv.append($deleteBtn);
    	   						
    	   						$no = $("<input type='hidden' class='memoNo' value='" + data.memoList[i].no + "'>");
    	   						
    	   						$table = $("<table class='memo-table'>");
    	   						
    	   						$dateTr = $("<tr>");
    	   						$dateTd1 = $("<th>").html("Date");
    	   						$dateTd2 = $("<td>").html(data.memoList[i].date);
    	   						
    	   						$titleTr = $("<tr>");
    	   						$titleTd1 = $("<th>").html("Title");
    	   						$titleTd2 = $("<td class='titleTd2'>").html(data.memoList[i].mpTitle);
    	   						
    	   						$startTr = $("<tr>");
    	   						$startTd1 = $("<th>").html("Start");
    	   						if(data.memoList[i].mpStart != null) {
    	   							$startTd2 = $("<td class='startTd2'>").html(data.memoList[i].mpStart);
    	   						} else {
    	   							$startTd2 = $("<td class='startTd2'>").html("미정");
    	   						}
    	   						
    	   						$endTr = $("<tr>");
    	   						$endTd1 = $("<th>").html("End");
    	   						if(data.memoList[i].mpEnd != null) {
    	   							$endTd2 = $("<td class='endTd2'>").html(data.memoList[i].mpEnd);
    	   						} else {
    	   							$endTd2 = $("<td class='endTd2'>").html("미정");
    	   						}
    	   						
    	   						$timeTr = $("<tr>");
    	   						$timeTd1 = $("<th>").html("Time");
    	   						$timeTd2 = $("<td class='timeTd2'>").html(data.memoList[i].mpTime);
    	   						
    	   						$locationTr1 = $("<tr>");
    	   						$locationTd1 = $("<th colspan='2'>").html("Location");
    	   						
    	   						$locationTr2 = $("<tr>");
    	   						$locationTd2 = $("<td colspan='2' class='locationTd2'>").html("<br>");    	   							
    	   						if(data.memoList[i].mpMain != null) {
    	   							if(data.memoList[i].mpSub != null) {
		    	   						$locationTd2 = $("<td colspan='2' class='locationTd2'>").html(data.memoList[i].mpMain + ", " + data.memoList[i].mpSub);    	   							    	   								
    	   							}else {
    	   								$locationTd2 = $("<td colspan='2' class='locationTd2'>").html(data.memoList[i].mpMain);
    	   							}
    	   						}
    	   						
    	   						$memoTr1 = $("<tr>");
    	   						$memoTd1 = $("<th colspan='2'>").html("Memo");
    	   						
    	   						$memoTr2 = $("<tr>");
    	   						$memoTd2 = $("<td colspan='2' class='mpMemo'>").html("<br>");    	   							
    	   						if(data.memoList[i].mpMemo != null) {
    	   							$memoTd2 = $("<td colspan='2' class='memoTd2'>").html(data.memoList[i].mpMemo);	   							
    	   						}
    	   						
    	   						$aBtnDiv = $("<div class='aBtnArea'>");
    	   						if(data.memoList[i].mpStart != null && data.memoList[i].mpEnd != null) {
	    	   						$addBtn = $("<button type='button' class='addBtn planAddBtn'>").text("Add");    	   							
    	   						} else {
    	   							$addBtn = $("<button type='button' class='addBtn mpNoDateBtn'>").text("Add");
    	   						}
    	   						
    	   						$editBtn = $("<button type='button' class='editBtn ePlannerBtn'>").text("Edit");
    	   						
    	   						$aBtnDiv.append($editBtn);
    	   						
    	   						$aBtnDiv.append($addBtn);
    	   						
    	   						$dateTr.append($dateTd1).append($dateTd2);
    	   						
    	   						$titleTr.append($titleTd1).append($titleTd2);
    	   						
    	   						$startTr.append($startTd1).append($startTd2);
    	   						
    	   						$endTr.append($endTd1).append($endTd2);
    	   						
    	   						$timeTr.append($timeTd1).append($timeTd2);
    	   						
								$locationTr1.append($locationTd1);
    	   						
    	   						$locationTr2.append($locationTd2);
    	   						
								$memoTr1.append($memoTd1);
    	   						
    	   						$memoTr2.append($memoTd2);
    	   						
    	   						$table.append($dateTr).append($titleTr).append($startTr).append($endTr).append($timeTr).append($locationTr1).append($locationTr2).append($memoTr1).append($memoTr2);
    	   						
    	   						$div.append($dBtnDiv).append($no).append($table).append($aBtnDiv);
    	   						
    	   						$("#memoArea").append($div);
    	   					} else if(data.memoList[i].main == 9) {
    	   						$div = $("<div class='memo-size account'>");
								
								$dBtnDiv = $("<div class='dBtnArea'>");
    	   						$deleteBtn = $("<button type='button' class='deleteBtn'>").text("X");
    	   						
    	   						$dBtnDiv.append($deleteBtn);
    	   						
    	   						$no = $("<input type='hidden' class='memoNo' value='" + data.memoList[i].no + "'>");
    	   						
    	   						$table = $("<table class='memo-table'>");
    	   						
    	   						$dateTr = $("<tr>");
    	   						$dateTd1 = $("<th>").html("Date");
    	   						$dateTd2 = $("<td>").html(data.memoList[i].date);
    	   						
    	   						if(data.memoList[i].apcTitle != "해당없음") {
	    	   						$titleTr = $("<tr>");
	    	   						$titleTd1 = $("<th>").html("Category");
	    	   						$titleTd2 = $("<td>").html(data.memoList[i].apcTitle);    	   							
    	   						}
    	   						
    	   						if(data.memoList[i].aecTitle != "해당없음") {
	    	   						$titleTr = $("<tr>");
	    	   						$titleTd1 = $("<th>").html("Category");
	    	   						$titleTd2 = $("<td>").html(data.memoList[i].aecTitle);    	   							
    	   						}
    	   						
    	   						$budgetTr = $("<tr>");
    	   						$budgetTd1 = $("<th>").html("Budget Date");
    	   						if(data.memoList[i].abDate != null) {
    	   							$budgetTd2 = $("<td>").html(data.memoList[i].abDate);
    	   							
    	   							$addBtn = $("<button type='button' class='addBtn accountAddBtn'>").text("Add");
    	   						} else {
    	   							$budgetTd2 = $("<td>").html("미정");
    	   							
    	   							$addBtn = $("<button type='button' class='addBtn abNoDateBtn'>").text("Add");
    	   						}
    	   						
    	   						$amountTr = $("<tr>");
    	   						$amountTd1 = $("<th>").html("Amount");
    	   						$amountTd2 = $("<td>").html(data.memoList[i].abAmount);
    	   						
    	   						$memoTr1 = $("<tr>");
    	   						$memoTd1 = $("<th colspan='2'>").html("Memo");
    	   						
    	   						$memoTr2 = $("<tr>");
    	   						$memoTd2 = $("<td colspan='2'>").html("<br>");    	   							
    	   						if(data.memoList[i].abMemo != null) {
    	   							$memoTd2 = $("<td colspan='2'>").html(data.memoList[i].abMemo);	   							
    	   						}
    	   						
    	   						$aBtnDiv = $("<div class='aBtnArea'>");
    	   						
    	   						$aBtnDiv.append($addBtn);
    	   						
    	   						$dateTr.append($dateTd1).append($dateTd2);
    	   						
    	   						$titleTr.append($titleTd1).append($titleTd2);
    	   						
    	   						$budgetTr.append($budgetTd1).append($budgetTd2);
    	   						
    	   						$amountTr.append($amountTd1).append($amountTd2);
    	   						
								$memoTr1.append($memoTd1);
    	   						
    	   						$memoTr2.append($memoTd2);
    	   						
    	   						$table.append($dateTr).append($titleTr).append($budgetTr).append($amountTr).append($memoTr1).append($memoTr2);
    	   						
    	   						$div.append($dBtnDiv).append($no).append($table).append($aBtnDiv);
    	   						
    	   						$("#memoArea").append($div);
    	   					} else if(data.memoList[i].main == 6 && data.memoList[i].type == "map") {
								$div = $("<div class='memo-size bookmark'>");
								
								$dBtnDiv = $("<div class='dBtnArea'>");
    	   						$deleteBtn = $("<button type='button' class='deleteBtn'>").text("X");
    	   						
    	   						$dBtnDiv.append($deleteBtn);
    	   						
    	   						$no = $("<input type='hidden' class='memoNo' value='" + data.memoList[i].no + "'>");
    	   						
    	   						$type = $("<input type='hidden' class='memoType' value='" + data.memoList[i].type + "'>");
    	   						
    	   						$table = $("<table class='memo-table'>");
    	   						
    	   						$dateTr = $("<tr>");
    	   						$dateTd1 = $("<th>").html("Date");
    	   						$dateTd2 = $("<td>").html(data.memoList[i].date);

    	   						$bookmarkTr = $("<tr>");
    	   						$bookmarkTd1 = $("<th>").html("Bookmark");
    	   						$bookmarkTd2 = $("<td>").html(data.memoList[i].blTitle);    	   							

    	   						$titleTr = $("<tr>");
    	   						$titleTd1 = $("<th>").html("Title");
    	   						$titleTd2 = $("<td>").html(data.memoList[i].mbTitle);
    	   						
    	   						$phoneTr = $("<tr>");
    	   						$phoneTd1 = $("<th>").html("Phone");
    	   						$phoneTd2 = $("<td>").html(data.memoList[i].mbPhone);
    	   						
    	   						$timeTr = $("<tr>");
    	   						$timeTd1 = $("<th>").html("Time");
    	   						$timeTd2 = $("<td>").html(data.memoList[i].mbTime);
    	   						
    	   						$locationTr1 = $("<tr>");
    	   						$locationTd1 = $("<th colspan='2'>").html("Location");
    	   						
    	   						$locationTr2 = $("<tr>");
    	   						$locationTd2 = $("<td colspan='2'>").html("<br>");    	   							
    	   						if(data.memoList[i].mbAddress != null) {
    	   							$locationTd2 = $("<td colspan='2'>").html(data.memoList[i].mbAddress);
    	   						}
    	   						
    	   						$memoTr1 = $("<tr>");
    	   						$memoTd1 = $("<th colspan='2'>").html("Memo");
    	   						
    	   						$memoTr2 = $("<tr>");
    	   						$memoTd2 = $("<td colspan='2'>").html("<br>");    	   							
    	   						if(data.memoList[i].abMemo != null) {
    	   							$memoTd2 = $("<td colspan='2'>").html(data.memoList[i].bmMemo);	   							
    	   						}
    	   						
    	   						$aBtnDiv = $("<div class='aBtnArea'>");
    	   						$addBtn = $("<button type='button' class='addBtn bookmarkAddBtn'>").text("Add");
    	   						
    	   						$aBtnDiv.append($addBtn);
    	   						
    	   						$dateTr.append($dateTd1).append($dateTd2);
    	   						
    	   						$bookmarkTr.append($bookmarkTd1).append($bookmarkTd2)
    	   						
    	   						$phoneTr.append($phoneTd1).append($phoneTd2);
    	   						
    	   						$timeTr.append($timeTd1).append($timeTd2);
    	   						
								$locationTr1.append($locationTd1);
    	   						
    	   						$locationTr2.append($locationTd2);
    	   						
								$memoTr1.append($memoTd1);
    	   						
    	   						$memoTr2.append($memoTd2);
    	   						
    	   						$table.append($dateTr).append($bookmarkTr).append($titleTr).append($phoneTr).append($timeTr).append($locationTr1).append($locationTr2).append($memoTr1).append($memoTr2);
    	   						
    	   						$div.append($dBtnDiv).append($no).append($type).append($table).append($aBtnDiv);
    	   						
    	   						$("#memoArea").append($div);
    	   					} else if(data.memoList[i].main ==6 && data.memoList[i].type == "url") {
								$div = $("<div class='memo-size bookmark'>");
								
								$dBtnDiv = $("<div class='dBtnArea'>");
    	   						$deleteBtn = $("<button type='button' class='deleteBtn'>").text("X");
    	   						
    	   						$dBtnDiv.append($deleteBtn);
    	   						
    	   						$no = $("<input type='hidden' class='memoNo' value='" + data.memoList[i].no + "'>");
    	   						
    	   						$type = $("<input type='hidden' class='memoType' value='" + data.memoList[i].type + "'>");
    	   						
    	   						$table = $("<table class='memo-table'>");
    	   						
    	   						$dateTr = $("<tr>");
    	   						$dateTd1 = $("<th>").html("Date");
    	   						$dateTd2 = $("<td>").html(data.memoList[i].date);

    	   						$bookmarkTr = $("<tr>");
    	   						$bookmarkTd1 = $("<th>").html("Bookmark");
    	   						$bookmarkTd2 = $("<td>").html(data.memoList[i].blTitle);

    	   						$titleTr = $("<tr>");
    	   						$titleTd1 = $("<th>").html("Title");
    	   						$titleTd2 = $("<td>").html(data.memoList[i].ubTitle);    	   							
    	   						
    	   						$urlTr1 = $("<tr>");
    	   						$urlTd1 = $("<th colspan='2'>").html("Url");
    	   						
    	   						$urlTr2 = $("<tr>");
    	   						$urlTd2 = $("<td colspan='2'>").html(data.memoList[i].ubUrl);    	   							
    	   						
    	   						$memoTr1 = $("<tr>");
    	   						$memoTd1 = $("<th colspan='2'>").html("Memo");
    	   						
    	   						$memoTr2 = $("<tr>");
    	   						$memoTd2 = $("<td colspan='2'>").html("<br>");    	   							
    	   						if(data.memoList[i].ubCon != null) {
    	   							$memoTd2 = $("<td colspan='2'>").html(data.memoList[i].ubCon);	   							
    	   						}
    	   						
    	   						$aBtnDiv = $("<div class='aBtnArea'>");
    	   						$addBtn = $("<button type='button' class='addBtn bookmarkAddBtn'>").text("Add");
    	   						
    	   						$aBtnDiv.append($addBtn);
    	   						
    	   						$dateTr.append($dateTd1).append($dateTd2);
    	   						
    	   						$bookmarkTr.append($bookmarkTd1).append($bookmarkTd2);
    	   						
    	   						$titleTr.append($titleTd1).append($titleTd2);
    	   						
								$urlTr1.append($urlTd1);
    	   						
    	   						$urlTr2.append($urlTd2);
    	   						
								$memoTr1.append($memoTd1);
    	   						
    	   						$memoTr2.append($memoTd2);
    	   						
    	   						$table.append($dateTr).append($bookmarkTr).append($titleTr).append($urlTr1).append($urlTr2).append($memoTr1).append($memoTr2);
    	   						
    	   						$div.append($dBtnDiv).append($no).append($type).append($table).append($aBtnDiv);
    	   						
    	   						$("#memoArea").append($div);
    	   					}
    	   				};
        			},
        			error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                    }   
        		})
        	})
        </script>
        
    	<div class="modal fade" id="selectModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body" align="center">
                    	<button type="button" class="select-btn plan" data-toggle="modal" data-target="#plannerModal">Planner</button>
                    	<br><br>
                    	<button type="button" class="select-btn bookmark" data-toggle="modal" data-target="#bookmarkModal">Bookmark</button>
                    	<br><br>
                    	<button type="button" class="select-btn account" data-toggle="modal" data-target="#accountModal">Account</button>
                    	<br><br>
                    	<button type="button" class="select-btn etc" data-toggle="modal" data-target="#etcModal">Etc</button>
                    </div>
                </div>
            </div>
        </div>   
        
    	<div class="modal fade" id="plannerModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body" align="center">
                        <form action="mminsert.do" method="post">
                        	<input type="hidden" name="id" value="${loginUser.id }">
                        	<input type="hidden" name="mainNo" value="1">
                        	<input type="hidden" name="mpColor" value="#FBD14B">
                            <table id="addTable">
                                <tr>
                                    <th>Title</th>
                                    <td><input type="text" name="mpTitle" size="42"></td>
                                </tr>
                                <tr>
                                    <th>Date</th>
                                    <td>
                                        <input type="date" name="mpStart"> - 
                                        <input type="date" name="mpEnd">
                                    </td>
                                </tr>
                                <tr>
                                    <th>Time</th>
                                    <td>
                                    	<input type="time" name="mpTime" style="width: 335px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    	<b>Location</b>&nbsp;
                                    	<button type="button" class="default-btn b-lightgray" onclick="searchAddress()">Search</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input type="text" name="mpMain" class="mainAddress" size="49"></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input type="text" name="mpSub" class="subAddress" size="49"></td>
                                </tr>
                                <tr>
                                    <th colspan="2">Memo</th>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <textarea name="mpMemo" cols="52" rows="5"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" class="default-btn">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="uPlannerModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body" align="center">
                        <form action="mmupdate.do" method="post">
                        	<input type="hidden" id="mpMemoNo" name="memoNo">
                        	<input type="hidden" name="mainNo" value="1">
                        	<input type="hidden" name="mpColor" value="#FBD14B">
                            <table id="addTable">
                                <tr>
                                    <th>Title</th>
                                    <td><input type="text" id="mpTitle" name="mpTitle" size="42"></td>
                                </tr>
                                <tr>
                                    <th>Date</th>
                                    <td>
                                        <input type="date" id="mpStart" name="mpStart"> - 
                                        <input type="date" id="mpEnd" name="mpEnd">
                                    </td>
                                </tr>
                                <tr>
                                    <th>Time</th>
                                    <td>
                                    	<input type="time" id="mpTime" name="mpTime" style="width: 335px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    	<b>Location</b>&nbsp;
                                    	<button type="button" class="default-btn b-lightgray" onclick="searchAddress()">Search</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input type="text" name="mpMain" class="mainAddress" size="49"></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input type="text" name="mpSub" class="subAddress" size="49"></td>
                                </tr>
                                <tr>
                                    <th colspan="2">Memo</th>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <textarea id="mpMemo" name="mpMemo" cols="52" rows="5"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" class="default-btn">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="accountModal" role="dialog">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">×</button>
	                </div>
	                <div class="modal-body" align="center">
	                    <form action="mminsert.do" method="post">
	                    	<input type="hidden" name="id" value="${loginUser.id }">
                        	<input type="hidden" name="mainNo" value="9">
	                        <table id="addTable">
	                        	<tr>
	                         	<td>
	                         		<input type="radio" id="profit" name="type" value="profit" checked>
	                         		<label for="profit"><b>Profit</b></label>
	                         	</td>
	                         	<td>
	                         		&nbsp;<input type="radio" id="expenditure" name="type" value="expenditure">
	                         		<label for="expenditure"><b>Expenditure</b></label>
	                         	</td>
	                        	</tr>
	                            <tr>
	                                <th>Category</th>
	                                <td>
	                                	<select id="apcNo" name="apcNo" style="width: 230px;">
	                                		<option value="1">월급</option>
	                                		<option value="2">주급</option>
	                                		<option value="3">일급</option>
	                                		<option value="4">용돈</option>
	                                		<option value="5">이월</option>
	                                		<option value="6">자산인출</option>
	                                		<option value="7">기타</option>
	                                	</select>
	                                	<select id="aecNo" name="aecNo" style="width: 230px; display: none;">
	                                		<option value="1">식비</option>
	                                		<option value="2">교통비</option>
	                                		<option value="3">문화생활</option>
	                                		<option value="4">생필품</option>
	                                		<option value="5">의류</option>
	                                		<option value="6">미용</option>
	                                		<option value="7">의료</option>
	                                		<option value="8">교육</option>
	                                		<option value="9">통신비</option>
	                                		<option value="10">회비</option>
	                                		<option value="11">경조사</option>
	                                		<option value="12">저축</option>
	                                		<option value="13">가전</option>
	                                		<option value="14">공과금</option>
	                                		<option value="15">카드대금</option>
	                                		<option value="16">기타</option>
	                                	</select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>Date</th>
	                                <td>
	                                	<input type="date" name="abDate" id="abDate" style="width: 230px;">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>Amount</th>
	                                <td><input type="number" name="abAmount" style="width: 230px;"></td>
	                            </tr>
	                            <tr>
	                                <th colspan="2">Memo</th>
	                            </tr>
	                            <tr>
	                                <td colspan="2">
	                                    <textarea name="abMemo" cols="40" rows="5"></textarea>
	                                </td>
	                            </tr>
	                        </table>
	                        <button type="submit" class="default-btn">Add</button>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    <div class="modal fade" id="bookmarkModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body" align="center">
                        <form action="mminsert.do" method="post">
                        	<input type="hidden" name="id" value="${loginUser.id }">
                        	<input type="hidden" name="mainNo" value="6">
                        	<input type="hidden" id="memoType" name="memoType">
                            <table id="addTable">
                                <tr>
                                    <th>Bookmark</th>
                                    <td>
                                    	<select id="bl_no" name="bl_no">
                                   		<c:forEach var="b" items="${bmList }">
                                   			<option class="${b.bl_type }" value="${b.bl_no }">${b.bl_title }</option>
                                   		</c:forEach>
                                    	</select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Title</th>
                                    <td>
                                    	<input type="text" class="mapInput" name="mb_title" size="37">
                                    	<input type="text" class="urlInput" name="ub_title" size="37">
                                    </td>
                                </tr>
                                <tr class="mapInput">
                                    <th>Phone</th>
                                    <td>
                                    	<input type="text" name="mb_phone" size="37">
                                    </td>
                                </tr>
                                <tr class="mapInput">
                                    <th>Time</th>
                                    <td>
                                    	<input type="text" name="mb_time" size="37">
                                    </td>
                                </tr>
                                <tr class="urlInput">
                                    <th>Url</th>
                                    <td>
                                    	<input type="text" name="ub_url" size="37">
                                    </td>
                                </tr>
                                <tr class="mapInput">
                                    <td colspan="2">
                                    	<b>Location</b>&nbsp;
                                    	<button type="button" class="default-btn b-lightgray" onclick="searchAddress()">Search</button>
                                    </td>
                                </tr>
                                <tr class="mapInput">
                                    <td colspan="2"><input type="text" name="mb_main" class="mainAddress" size="49"></td>
                                </tr>
                                <tr class="mapInput">
                                    <td colspan="2"><input type="text" name="mb_sub" class="subAddress" size="49"></td>
                                </tr>
                                <tr>
                                    <th colspan="2">Memo</th>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <textarea class="mapInput" name="mb_memo" cols="52" rows="5"></textarea>
                                        <textarea class="urlInput" name="ub_con" cols="52" rows="5"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" class="default-btn">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>   
        
        <div class="modal fade" id="etcModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body" align="center">
                        <form action="mminsert.do" method="post">
                        	<input type="hidden" name="id" value="${loginUser.id }">
                        	<input type="hidden" name="mainNo" value="0">
                            <table id="addTable">
                            	<tr>
                            		<th>Content</th>
                            	</tr>
                                <tr>
	                                <td>
	                                	<textarea name="memoCon" rows="5" cols="50"></textarea>
	                                </td>
                                </tr>
                            </table>
                            <button type="submit" class="default-btn">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="uEtcModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body" align="center">
                        <form action="mmupdate.do" method="post">
                        	<input type="hidden" id="eMemoNo" name="memoNo">
                        	<input type="hidden" name="mainNo" value="0">
                            <table id="addTable">
                            	<tr>
                            		<th>Content</th>
                            	</tr>
                                <tr>
	                                <td>
	                                	<textarea id="uContent" name="memoCon" rows="5" cols="50"></textarea>
	                                </td>
                                </tr>
                            </table>
                            <button type="submit" class="default-btn">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="abDateModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 300px;">
                    <div class="modal-header">
                    	날짜를 입력해주세요
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body" align="center">
                        <form action="abadd.do" method="post">
                        	<input type="hidden" id="abUpdateMNo" name="memoNo">
                        	<input type="date" name="abDate" required>
                        	<input type="hidden" name="memoType" value="noDate">
                        	<br><br>
                            <button type="submit" class="default-btn">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="mpDateModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 500px;">
                    <div class="modal-header">
                    	기간을 입력해주세요
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body" align="center">
                        <form action="mpadd.do" method="post">
                        	<input type="hidden" id="mpUpdateMNo" name="memoNo">
                        	<input type="date" id="mpUpdateS" name="mpStart" required> - <input type="date" id="mpUpdateE" name="mpEnd" required>
                        	<input type="hidden" name="memoType" value="noDate">
                        	<br><br>
                            <button type="submit" class="default-btn">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>  
              
    </section>

    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	function changeType() {
    		var type = $("option:selected", "#bl_no").attr("class");
    		
    		$("#memoType").val(type);
			
			if(type == "map") {
				$(".mapInput").show();
				$(".urlInput").hide();
			} else {
				$(".mapInput").hide();
				$(".urlInput").show();
			}
    	}
    	
    	$(function(){
    		$("#profit").click(function(){
    			$("#apcNo").css("display", "block");
    			$("#aecNo").css("display", "none");
    		})
    		
    		$("#expenditure").click(function(){
    			$("#aecNo").css("display", "block");
    			$("#apcNo").css("display", "none");			
    		})
    		
    		changeType();
    		
    		$("#bl_no").change(function(){
    			changeType();
    		})
    		
    		$(".select-btn").click(function(){
    			$(".mainAddress").val("");
        		$(".subAddress").val("");
    		})
    	})
    
	    function searchAddress() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = '(' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    /* document.getElementByClassName("subAddress").value = extraAddr; */
	                    $(".subAddress").val(extraAddr);
	                
	                } else {
	                    /* document.getElementByClassName("subAddress").value = ''; */
	                	$(".subAddress").val('');
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                //document.getElementById('postcode').value = data.zonecode;
	                /* document.getElementByClassName("mainAddress").value = addr; */
	                $(".mainAddress").val(addr);
	                // 커서를 상세주소 필드로 이동한다.
	                /* document.getElementByClassName("subAddress").focus(); */
	                $(".subAddress").focus();
	            }
	        }).open();
	    }
	    
	    $(document).on("click",".deleteBtn",function(){
			var memoNo = $(this).parent().next().val();
	    	
	    	var deleteCheck = confirm("메모를 삭제하시겠습니까?");
			if(deleteCheck == true){
				location.href="memodelete.do?memoNo="+memoNo;
			}
			else if(deleteCheck == false){
				console.log("메모 삭제를 취소합니다.");
			}
		});
	    
	    $(document).on("click",".planAddBtn",function(){
			var memoNo = $(this).parent().parent().find(".memoNo").val();

	    	var addCheck = confirm("일정에 추가하시겠습니까?");
			if(addCheck == true){
				location.href="mpadd.do?memoNo="+memoNo;
			}
			else if(addCheck == false){
				console.log("일정 추가를 취소합니다.");
			}
		});
	    
	    $(document).on("click",".mpNoDateBtn",function(){
			var memoNo = $(this).parent().parent().find(".memoNo").val();
			
			$("#mpUpdateMNo").val(memoNo);

	    	var addCheck = confirm("일정에 추가하시겠습니까?");
			if(addCheck == true){
				$("#mpUpdateS").val("");
				$("#mpUpdateE").val("");
				
				$("#mpDateModal").modal();
			}
			else if(addCheck == false){
				console.log("일정에 추가를 취소합니다.");
			}
		});
	    
	    $(document).on("click",".accountAddBtn",function(){
			var memoNo = $(this).parent().parent().find(".memoNo").val();

	    	var addCheck = confirm("가계부에 추가하시겠습니까?");
			if(addCheck == true){
				location.href="abadd.do?memoNo="+memoNo;
			}
			else if(addCheck == false){
				console.log("가계부 추가를 취소합니다.");
			}
		});
	    
	    $(document).on("click",".abNoDateBtn",function(){
			var memoNo = $(this).parent().parent().find(".memoNo").val();
			
			$("#abUpdateMNo").val(memoNo);

	    	var addCheck = confirm("가계부에 추가하시겠습니까?");
			if(addCheck == true){
				$("#abDateModal").modal();
			}
			else if(addCheck == false){
				console.log("가계부 추가를 취소합니다.");
			}
		});
	    
	    $(document).on("click",".bookmarkAddBtn",function(){
			var memoNo = $(this).parent().parent().find(".memoNo").val();
			var memoType = $(this).parent().parent().find(".memoType").val();

	    	var addCheck = confirm("북마크에 추가하시겠습니까?");
			if(addCheck == true){
				location.href="bmadd.do?memoNo="+memoNo+"&memoType="+memoType;
			}
			else if(addCheck == false){
				console.log("가계부 추가를 취소합니다.");
			}
		});
	    
	    $(document).on("click",".eMemoBtn",function(){
			var memoNo = $(this).parent().parent().find(".memoNo").val();
			$("#eMemoNo").val(memoNo);
	    	
	    	var content = $(this).parent().parent().find(".conTd2").html();
	    	$("#uEtcModal").find("#uContent").val(content);
	    	
	    	$("#uEtcModal").modal();
		});
	    
	    $(document).on("click",".ePlannerBtn",function(){
			var memoNo = $(this).parent().parent().find(".memoNo").val();
			$("#mpMemoNo").val(memoNo);
	    	
	    	var mpTitle = $(this).parent().parent().find(".titleTd2").html();
	    	$("#uPlannerModal").find("#mpTitle").val(mpTitle);
	    	
	    	var mpStart = $(this).parent().parent().find(".startTd2").html();
	    	$("#uPlannerModal").find("#mpStart").val(mpStart);
	    	
	    	var mpEnd = $(this).parent().parent().find(".endTd2").html();
	    	$("#uPlannerModal").find("#mpEnd").val(mpEnd);
	    	
	    	var mpTime = $(this).parent().parent().find(".timeTd2").html();
	    	$("#uPlannerModal").find("#mpTime").val(mpTime);
	    	
	    	var mpLocation = $(this).parent().parent().find(".locationTd2").html();
	    	if(mpLocation != "<br>") {
		        var splitLocation = mpLocation.split(', ');
		        $("#uPlannerModal").find(".mainAddress").val(splitLocation[0]);
		        $("#uPlannerModal").find(".subAddress").val(splitLocation[1]);	    		
	    	}
	    	
	    	var mpMemo = $(this).parent().parent().find(".memoTd2").html();
	    	$("#uPlannerModal").find("#mpMemo").val(mpMemo);
	    	
	    	$("#uPlannerModal").modal();
		});
    </script>	
    
</body>
</html>