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
	            		
	            		
	            	}
	            }],
	            dateClick: function(info){
		    	 	$("#abDate").val(info.dateStr);
		    	 	
		    	 	$("#addModal").modal();
		      	},
	        });
	
	        calendar.render();
	    });
    </script>
    
    <style>
        .col-md-6, .col-md-2 {
            position: inherit !important;
        }

        .modal-content{
            width: 350px !important;
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

		<jsp:include page="../common/sidenaviAccount.jsp"/>
        
        <br><br>
        
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <table id="total">
                    <tr>
                        <td style="color: blue; text-align: right;"><b>Profit :&nbsp;</b></td>
                        <td><b></b></td>
                    </tr>
                   	<tr>
                        <td style="color: red;text-align: right;"><b>Expenditure :&nbsp;</b></td>
                        <td><b></b></td>
                    </tr>
                </table>
            </div>
            <div class="col-md-5"></div>
            <div class="col-md-2">
            	<button type="button" class="default-btn" data-toggle="modal" data-target="#addModal">Add</button>
            	<div class="modal fade" id="addModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                            </div>
                            <div class="modal-body" align="center">
                                <form action="abinsert.do" method="post">
                                	<input type="hidden" value="${loginUser.id }" name="id">
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
                                            <td><b>Category</b></td>
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
                                            		<option value="1" selected>식비</option>
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
                                            <td><b>Date</b></td>
                                            <td>
                                            	<input type="date" name="abDate" id="abDate" style="width: 230px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Amount</b></td>
                                            <td><input type="number" name="abAmount" step="1000" style="width: 230px;"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>Memo</b></td>
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
            </div>
        </div>

        <div id='calendar'></div>
        
       <br><br><br><br><br>
    </section>

    <jsp:include page="../common/footer.jsp"/>	

    <script>
    	$(function(){
    		$("#profit").click(function(){
    			$("#apcNo").css("display", "block");
    			$("#aecNo").css("display", "none");
    		})
    		
    		$("#expenditure").click(function(){
    			$("#aecNo").css("display", "block");
    			$("#apcNo").css("display", "none");			
    		})
    	})
    	
        function viewModal() {
        	$("#setModal").modal();
        }
    </script>
    
</body>
</html>