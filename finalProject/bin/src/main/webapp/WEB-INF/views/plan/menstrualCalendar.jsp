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
    <script>
	    document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
	            eventSources: [{
	            	events: function(info,successCallback,failureCallback) {
	            		var events = [];
	            		
	            		$.ajax({
	            			url: 'mclist.do',
	            			dataType: 'json',
	            			success: function(data) {
	            				for(var i in data.mcList){
		    	   					events.push({title:data.mcList[i].eventTitle
		    	   								,start:data.mcList[i].start
		    	   								,end:data.mcList[i].end
		    	   								,color:data.mcList[i].color})
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
	            }]
	        });
	
	        calendar.render();
	    });
    </script>
    
    <style>
        #personalInfo{
            border-collapse: separate;
            border-spacing: 0 5px;
            width: 300px;
        }

        .col-md-6, .col-md-2 {
            position: inherit !important;
        }

        .modal-content{
            width: 300px;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
            margin-left: 300px;
            /* z-index: 0 !important; */
        }

        .fc-today-button{
            display: none !important;
        }
        
        .default-btn{
        	margin-left: 15px;
        }
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    <section>

		<jsp:include page="../common/sidenavi.jsp"/>
        
        <br><br>
        <div class="modal fade" id="setModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body" align="center">
                        <form action="mcinsert.do" method="post">
                            가장 최근의 생리 시작일을 입력하세요<br>
                            <input type="hidden" name="id" value="${loginUser.id }">
                            <input type="date" name="mcFirst" style="margin: 5px;"><br>
                            <button type="submit" class="default-btn">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <c:if test="${check eq 0}">
        	<script>
        		$(function(){
        			viewModal();
        		})
        	</script>
        </c:if>
        
        <c:if test="${!empty msg }">
        	<script>
        		alert("예정일이 업데이트 되었습니다.");
        	</script>
        </c:if>
        
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-3">
            	<form action="mcupdate.do" method="post">
            		<input type="hidden" name="id" value="${loginUser.id }">
	                <table id="personalInfo">
	                    <tr>
	                        <td style="text-align: right;"><b>Cycle :&nbsp;</b></td>
	                        <c:if test="${empty menstrual }">
	                        	<td><input type="number" min="1" max="31" value="28" name="mcCycle"><br></td>	                        	
	                        </c:if>
	                        <c:if test="${!empty menstrual }">
	                        	<td><input type="number" min="1" max="31" value="${menstrual.mcCycle }" name="mcCycle"><br></td>	
	                        </c:if>
	                        <th>days</th>
	                        <c:if test="${check ne 0}">
	                        	<td><button type="button" class="default-btn b-lightgray" id="resetBtn">Reset</button></td>	                        
	                        </c:if>
	                        <c:if test="${check eq 0}">
	                        	<td>
	                        		<button class="default-btn b-lightgray" type="button" disabled>Reset</button>
	                        	</td>	                        
	                        </c:if>
	                    </tr>
	                    <tr>
	                        <td style="text-align: right;"><b>Period :&nbsp;</b></td>
	                        <c:if test="${empty menstrual }">
	                        	<td><input type="number" min="1" max="31" value="5" name="mcPeriod"><br></td>	                        	
	                        </c:if>
	                        <c:if test="${!empty menstrual }">
	                        	<td><input type="number" min="1" max="31" value="${menstrual.mcPeriod }" name="mcPeriod"><br></td>	
	                        </c:if>
	                        <th>days</th>
	                        <c:if test="${check ne 0}">
	                        	<td><button type="submit" class="default-btn b-lightgray">Save</button></td>	                        
	                        </c:if>
	                        <c:if test="${check eq 0}">
	                        	<td>
	                        		<button class="default-btn b-lightgray" type="button" data-toggle="modal" data-target="#setModal">Save</button>
	                        	</td>	                        
	                        </c:if>
	                    </tr>
	                </table>
            	</form>
            </div>
            <div class="col-md-5"></div>
            <div class="col-md-2">
                <table style="font-size: 18px;">
                    <tr>
                        <td style="color: #F781BE;">♥</td>
                        <td>생리 예정일</td>
                    </tr>
                    <tr>
                        <td style="color: #00CC66;">★</td>
                        <td>가임기</td>
                    </tr>
                </table>
            </div>
        </div>

        <div id='calendar'></div>
        
       <br><br><br><br><br>
    </section>

    <jsp:include page="../common/footer.jsp"/>	

    <script>
        function viewModal() {
        	$("#setModal").modal();
        }
        
      	$(function(){
      		$("#resetBtn").click(function(){
      			location.href="mcdelete.do";
      		})
      	})
    </script>
    
</body>
</html>