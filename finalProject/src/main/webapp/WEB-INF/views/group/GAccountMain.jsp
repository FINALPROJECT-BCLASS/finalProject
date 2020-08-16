<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <script type="text/javascript"></script>
    
    <link href='resources/css/main.css' rel='stylesheet' />
    <script src='resources/lib/main.js'></script>
    <script>
	    document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
	            eventSources: [{
	            	events: function(info,successCallback,failureCallback) {
	            		var events = [];
	            		
	            		$.ajax({
	            			url: 'accountList.do',
	            			dataType: 'json',
	            			success: function(data) {
	            				/* alert(data); */
	            				console.log(data);
	            				for(var i in data.accountList){
		    	   					events.push({title:data.accountList[i].eventTitle
		    	   								,date:data.accountList[i].date
		    	   								,color:data.accountList[i].color
		    	   								,id:data.accountList[i].gaNo})
		    	   				};
	            				
	            				successCallback(events);
	            			},
	            			error:function(request, status, errorData){
	                            alert("error code: " + request.status + "\n"
	                                  +"message: " + request.responseText
	                                  +"error: " + errorData);
	                        }   
	            		})
	            	}
	            }],
	            <c:if test="${gInfo.loginUserId eq groupTable.id}">	
	            dateClick: 
	            	function(info){
		            	var clickDate = info.dateStr;	            	
		            	location.href="insertAccountView.do?clickDate="+clickDate;
			      	}
            	,
            	</c:if>
		      	eventClick: function(info) {
		      		location.href="detailAccount.do?gaNo="+info.event.id;
	            }
	        });
	
	        calendar.render();
	        
	        var year = calendar.getDate().getFullYear();
	        var month = calendar.getDate().getMonth()+1;
			var formatMonth = "";
	        
			if(month < 10){
		        formatMonth = "0"+month;
		    } else {
		    	formatMonth = month;
		    }
			
			var calendarDate = year + "-" + formatMonth;
			
			sumView(calendarDate);
	        
	        $(".fc-prev-button").click(function(){
	        	month = month - 1;
	        	
	        	if(month < 1) {
	        		month = 12;
	        		year = year - 1;
	        	}
	        	
	        	if(month < 10) {
	        		formatMonth = "0"+month;
	        	} else {
	        		formatMonth = month;
	        	}
	        	
	        	calendarDate = year + "-" + formatMonth;
	        	$("#listDate").val(calendarDate);
	        	
	        	sumView(calendarDate);
	        })
	        
	        $(".fc-next-button").click(function(){
	        	month = month + 1;
	        	
	        	if(month > 12) {
	        		month = 1;
	        		year = year + 1;
	        	}
	        	
	        	if(month < 10) {
	        		formatMonth = "0"+month;
	        	} else {
	        		formatMonth = month;
	        	}
	        	
	        	calendarDate = year + "-" + formatMonth;
	        	$("#listDate").val(calendarDate);
	        	
	        	sumView(calendarDate);
	        })
	    });
    </script>
    
    <style>
        .col-md-6, .col-md-2 {
            position: inherit !important;
        }
		.modal-dialog{
		    max-width: 1000px !important;
		}
		
		
        .modal-content{
            width: 1000px !important;
        }

		.calBox{
			width:70%;
			margin-left:-200px;
		}
		
        #calendar {
            /* max-width: 900px; */
            width:100%%;
            margin: 0 auto;
            
            /* z-index: 0 !important; */
        }

        .fc-today-button{
            display: none !important;
        }
        
        .default-btn{
        	margin-left: 15px;
        }
        
        .fc-event-time{
        	display: none !important;
        }
        #total{
        	
        	width:100%;
        }
        
        .total{
        	display:inline-block;
        	width:150px;
        	color:#484848;
        	font-size:17px;
        	font-weight:400;
        }
        .totalBox, #groupWrite{
        	display:inline-block;
        	width:30%;
        }
       
         .join-form-area{top:-40px; padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }

         .alert{font-size:14px; color:gray; margin-top:-20px;}
         .proText{color:#2860E1; font-size:18px; font-weight:600;}
         .expText{color:#dc3545; font-size:18px; font-weight:600;}
         .feeText{color:#FBD14B; font-size:18px; font-weight:600;}
         
         .bodyBox{width:100%; margin:0 auto;}
         .itemBox{width:65%; display:inline-block;}
         .memoBox{margin-top: 100px; width:10%; display:inline-block; position: absolute;right: 0%; overflow-y:scroll; height:980px;width:300px;  }
         .shareMemo{border-radius:6px;margin-bottom: 10px;padding:20px; background:#FBD14B; width:260px; height:250px; margin: 10px; }
         .memberCheck{width: 17px; height:17px;}
         .cansle{text-align:right; cursor:pointer; color:gray; font-weight:600;}
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    

		<c:if test="${ groupTable.id eq gInfo.loginUserId}">
			<jsp:include page="../common/sidenaviGroupAdmin.jsp"/>
		</c:if>
		
		<c:if test="${ groupTable.id ne gInfo.loginUserId}">
			<jsp:include page="../common/sidenaviGroup.jsp"/>
		</c:if>
        
        <br><br>
           <div class="join-form-area">
    
   <jsp:include page="../common/groupNoticeHeader.jsp"/>
   		
         
         <h1 align="center">Group Diary</h1>
        <h4 align="center">Account</h4><br>
        <h6 align="center" class="alert">Group Account는 그룹 관리자만 작성할 수 있습니다.</h6>
         <br>
         
                <div class="calBox">
   
                <table id="total">
                    <tr>
                    	<td>
                    		<div class="totalBox proText">Profit : <div class="total pro"> </div></div>
                    		<div class="totalBox expText">Expense : <div class="total exp"> </div></div>
                    		<div class="totalBox feeText">Fee : <div class="total fee"> </div></div>
                    		<div id="groupWrite"  ><span class="material-icons writeBtn">create</span></div>
                    	</td>
                    </tr>
                </table>
                  <div id='calendar'></div>
                 </div>  
   				 
     <div class="memoBox">
     	<c:forEach var="c" items="${checkList }">
	     	<div class="shareMemo">
	     		<c:if test="${gInfo.loginUserId eq groupTable.id }">
	     			<div class="cansle">x</div>
	     		</c:if>
	     		<table>
	     			<input type="hidden" class="gaNo" value="${c.gaNo }">
	     			
	     			<tr>
	     				<td style="font-weight:600;">Title : </td>
	     				<td colspan="2">${c.gaTitle }</td>
	     			</tr>
	     			<tr>
	     				<td style="font-weight:600;">Date : </td>
	     				<td colspan="2">${c.gaDate }</td>
	     			</tr>
	     			<c:if test="${gInfo.loginUserId eq groupTable.id }">
	     			<c:forEach var="m" items="${checkMemberList }">
	     			<c:if test="${c.gaNo eq m.gaNo }">
	     				<tr>
	     					<input type="hidden" class="gamNo" value="${m.gamNo }">
	     					<c:if test="${m.gamYn eq 'Y'}">
	     						<td>
	     							<input type="checkBox" class="memberCheck" checked>
	     							<input type="hidden" class="checkYn"  name="gamYn" value="Y">
	     						</td>
	     					</c:if>
	     					<c:if test="${m.gamYn eq 'N'}">
	     						<td>
	     							<input type="checkBox" class="memberCheck" >
	     							<input type="hidden" class="checkYn" name="gamYn" value="N">
	     						</td>
	     					</c:if>
	     					<td>${m.name } : </td>
	     					<c:set var="amount" value="${m.gamAmount }"/>
	     					<td><fmt:formatNumber value="${amount }" groupingUsed="true"/></td>
	     				</tr>
	     			</c:if>
	     			</c:forEach>
	     			</c:if>
	     			<c:if test="${gInfo.loginUserId ne groupTable.id }">
	     			<c:forEach var="m" items="${checkMemberList }">
	     			<c:if test="${c.gaNo eq m.gaNo }">
	     				<tr>
	     					<input type="hidden" class="gamNo" value="${m.gamNo }">
	     					<c:if test="${m.gamYn eq 'Y'}">
	     						<td>
	     							<input type="checkBox" class="memberCheck" checked disabled>
	     							<input type="hidden" class="checkYn"  name="gamYn" value="Y">
	     						</td>
	     					</c:if>
	     					<c:if test="${m.gamYn eq 'N'}">
	     						<td>
	     							<input type="checkBox" class="memberCheck" disabled>
	     							<input type="hidden" class="checkYn" name="gamYn" value="N">
	     						</td>
	     					</c:if>
	     					<td>${m.name } : </td>
	     					<td>${m.gamAmount }</td>
	     				</tr>
	     			</c:if>
	     			</c:forEach>
	     			</c:if>
	     		</table>
	     	</div>
     	</c:forEach>
     </div>       
	</div>

    <jsp:include page="../common/footer.jsp"/>	
	
	<!-- 메모 체크 -->
	<script>
		$(document).on("change",".memberCheck",function(){
			if($(this).is(":checked") == true){
				$(".checkYn").val("Y");
			}else if($(this).is(":checked") == false){
				$(".checkYn").val("N");
				
			}
			var gamNo = $(this).parent().prev().val();
			var gamYn = $(this).next().val();
			$.ajax({
       			url: 'gamCheckYn.do',
       			data: {gamYn:gamYn,gamNo:gamNo},
       			dataType: 'json',
       			success: function(data) {
					console.log(data);

       			},
       			error:function(request, status, errorData){
                       alert("error code: " + request.status + "\n"
                             +"message: " + request.responseText
                             +"error: " + errorData);
                   }   
       		})
		})
	</script>
	
	<!-- 전체 금액  -->
    <script>	
		function sumView(calendarDate) {
        	
	        $.ajax({
       			url: 'totalAccountList.do',
       			data: {gaDate:calendarDate},
       			dataType: 'json',
       			success: function(data) {

       				console.log(data);
       				console.log(data.proTotalList);
       				$(".pro").html("");
       				$(".exp").html("");
       				$(".fee").html("");

       				$(".pro").html(data.proTotalList);
       				$(".exp").html(data.expTotalList);
       				$(".fee").html(data.feeTotalList);

       			},
       			error:function(request, status, errorData){
                       alert("error code: " + request.status + "\n"
                             +"message: " + request.responseText
                             +"error: " + errorData);
                   }   
       		})
	    }
    </script>
    
    <script>
    	$(document).on("click",".cansle",function(){
		 		var deleteConfirm = confirm("공유를 취소하시겠습니까?");
		 		if(deleteConfirm){
		 			alert("공유를 취소하였습니다.");
		 			var gaNo = $(this).next().children().val();
		 			location.href="cansleSharing.do?gaNo="+gaNo;
		 		}
		 		
    	})
    </script>
    
</body>
</html>