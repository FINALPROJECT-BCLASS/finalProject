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
		    color: white;
			border-style: none;
		    border-radius: 8px;
		    height: 50px;
		    width: 200px;
		    background-color: #2860E1;
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
        }
        
        .plan {
        	background-color: #a1e6d9;
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
		
		#planColor {
			background-color: #a1e6d9;
		}
		
		#bookmarkColor {
			background-color: #dfcbff;
		}
		
		#etcColor {
			background-color: #fde392;
		}
		
		/* pink:#ffc5ef sky:#c5d2ef */
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
            	<div class="circle" id="planColor"></div>&nbsp;<b>Monthly Planner</b>&nbsp;&nbsp;
            	<div class="circle" id="bookmarkColor"></div>&nbsp;<b>Bookmark</b>&nbsp;&nbsp;
            	<div class="circle" id="etcColor"></div>&nbsp;<b>Etc</b>
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
    	   						$conTd2 = $("<td colspan='2'>").html(data.memoList[i].content);
    	   						
    	   						$dateTr.append($dateTd1).append($dateTd2);
    	   						
    	   						$conTr1.append($conTd1);
    	   						
    	   						$conTr2.append($conTd2);
    	   						
    	   						$table.append($dateTr).append($conTr1).append($conTr2);
    	   						
    	   						$div.append($dBtnDiv).append($no).append($table);
    	   						
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
    	   						$titleTd2 = $("<td>").html(data.memoList[i].mpTitle);
    	   						
    	   						$startTr = $("<tr>");
    	   						$startTd1 = $("<th>").html("Start");
    	   						$startTd2 = $("<td>").html(data.memoList[i].mpStart);
    	   						
    	   						$endTr = $("<tr>");
    	   						$endTd1 = $("<th>").html("End");
    	   						$endTd2 = $("<td>").html(data.memoList[i].mpEnd);
    	   						
    	   						$timeTr = $("<tr>");
    	   						$timeTd1 = $("<th>").html("Time");
    	   						$timeTd2 = $("<td>").html(data.memoList[i].mpTime);
    	   						
    	   						$locationTr1 = $("<tr>");
    	   						$locationTd1 = $("<th colspan='2'>").html("Location");
    	   						
    	   						$locationTr2 = $("<tr>");
    	   						$locationTd2 = $("<td colspan='2'>").html("<br>");    	   							
    	   						if(data.memoList[i].mpMain != null) {
	    	   						$locationTd2 = $("<td colspan='2'>").html(data.memoList[i].mpMain + " " + data.memoList[i].mpSub);    	   							
    	   						}
    	   						
    	   						
    	   						$memoTr1 = $("<tr>");
    	   						$memoTd1 = $("<th colspan='2'>").html("Memo");
    	   						
    	   						$memoTr2 = $("<tr>");
    	   						$memoTd2 = $("<td colspan='2'>").html("<br>");    	   							
    	   						if(data.memoList[i].mpMemo != null) {
    	   							$memoTd2 = $("<td colspan='2'>").html(data.memoList[i].mpMemo);	   							
    	   						}
    	   						
    	   						$aBtnDiv = $("<div class='aBtnArea'>");
    	   						$addBtn = $("<button type='button' class='addBtn'>").text("Add");
    	   						
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
                    	<button type="button" class="select-btn" data-toggle="modal" data-target="#plannerModal">Planner</button>
                    	<br><br>
                    	<button type="button" class="select-btn" data-toggle="modal" data-target="#bookmarkModal">Bookmark</button>
                    	<br><br>
                    	<button type="button" class="select-btn" data-toggle="modal" data-target="#etcModal">Etc</button>
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
                                    <td><input type="text" id="addTitle" name="mpTitle" size="42"></td>
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
                                    	<input type="time" id="addTime" name="mpTime" style="width: 335px;">
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
                                        <textarea id="addMemo" name="mpMemo" cols="52" rows="5"></textarea>
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
    </section>

    <jsp:include page="../common/footer.jsp"/>
    
    <script>
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
	    
	    $(document).on("click",".addBtn",function(){
			var memoNo = $(this).parent().parent().find(".memoNo").val();

	    	var deleteCheck = confirm("일정에 추가하시겠습니까?");
			if(deleteCheck == true){
				location.href="mpadd.do?memoNo="+memoNo;
			}
			else if(deleteCheck == false){
				console.log("일정 추가를 취소합니다.");
			}
		});
    </script>	
    
</body>
</html>