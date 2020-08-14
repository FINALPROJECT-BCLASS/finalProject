<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#listTable{
    	margin-top: 5px;
    }

    #listTable td{
        border: 1px solid;
        border-color: #484848;
        text-align: center;
    }

    .listNo{
        width: 25px;
    }

    .listContent{
        width: 130px;
    }

    .listCheck{
        width: 20px;
    }

    .listInput{
        width: 100%;
    }

    #circle{
        width: 25px;
        height : 26px;
        background-color: #FBD14B;
        border-radius: 50%;
        display: inline-block;
    }

    #circleArea{
        width: 200px;
        display: flex;
        align-items: center;
    }

    #listLogo{
        margin-left: -15px;
        padding-top: 7px;
        font-size: 16px;
        color: rgba(72, 72, 72, 1);;
    }
    
    #timeTable{
    	margin-top: 10px;
    }

    #timeTable td{
        border: 1px solid;
        border-color: rgba(72, 72, 72, 1);
    }

    .time{
        width: 100px;
        background-color: #F3F3F3;
    }

    .timeContent{
        width: 750px;
    }

    .col-md-8, .col-md-2 {
        position: inherit !important;
    }

    #listArea{
        display: inline-block;
        /* position: fixed; */
        z-index: 0;
    }

    .modal-content{
        width: 350px !important;
    }

    #addTable td{
        padding: 5px;
    }

    #addBtnArea{
        display: inline-block;
        width: 500px;
        text-align: right;
    }
    
    .listInput{
    	border: none;
    }
    
    input[type="radio"] {
            display: none;
        }

        input[type="radio"]:checked + .b-icons>div{
            border: 3px solid #484848;
        }

        input[type="radio"]:checked + .b-check>div{
            border: 3px solid white;
            background-color: #2860E1;
        }
        
        label{
            margin:0 !important;
        }
        
        .b-icons {
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            width: 25px;
            height: 25px;
            margin-bottom: 0;
            margin-right: 10px !important;
            cursor: pointer;
        }

        .b-icons > div {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            vertical-align: middle;
            text-align: center;
        }
        
        /* color */
        .sky {
            background-color: #6B98FF;
        }

        .pink {
            background-color: #FFA3E5;
        }

        .light-purple {
            background-color: #C9A8FF;
        }

        .green {
            background-color: #50c6b0;
        }
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <section>

		<jsp:include page="../common/sidenavi.jsp"/>
		
		<script>			
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth()+1;
			var date = today.getDate();
			
			if(month < 10){
		        month = "0"+month;
		    }
		    if(date < 10){
		        date = "0"+date;
		    }
			
			$(function(){

				$("#date").html(year.toString()+"-"+month.toString()+"-"+date.toString());
				
				var dtDate = $('#date').html();
				$("#listDate").val(dtDate);
				
				var ttDate = $("#date").html();
				
				$.ajax({
        			url: 'ttlist.do',
        			data: {ttDate:ttDate},
        			dataType: 'json',
        			success: function(data) {
        				for(var i in data.ttList){
        					if(data.ttList[i].memo != null) {
	    	   					var $time = $("<b>").html(data.ttList[i].start + " - " + data.ttList[i].end + " " + data.ttList[i].title
	    	   											+ "(" + data.ttList[i].memo + ")");        						
        					} else {
        						var $time = $("<b>").html(data.ttList[i].start + " - " + data.ttList[i].end + " " + data.ttList[i].title);
        					}
    	   					
    	   					var no = data.ttList[i].no;
    	   					
    	   					var startHour = data.ttList[i].startHour;
    	   					var startMinute = data.ttList[i].startMinute;
    	   					
    	   					var gap = data.ttList[i].gap;
    	   					
    	   					var endHour = data.ttList[i].endHour;
    	   					var endMinute = data.ttList[i].endMinute;
    	   					var endOnTime = endHour - 1;
    	   					
    	   					if(startMinute >= 30 && gap <= 0) {
    	   						$("#"+startHour+"half").append("<input type='hidden' class='timeNo'>").append($time).css("background-color", data.ttList[i].color)
    	   											.css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+startHour+"half").find(".timeNo").val(no);
    	   					} else if(startMinute < 30 && gap > 0) {
    	   						$("#"+startHour).append("<input type='hidden' class='timeNo'>").append($time).css("background-color", data.ttList[i].color)
    	   										.css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+startHour+"half").append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
    	   										.css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+startHour).find(".timeNo").val(no);
    	   						$("#"+startHour+"half").find(".timeNo").val(no);
    	   					} else if(startMinute >= 30 && gap > 0) {
    	   						$("#"+startHour+"half").append("<input type='hidden' class='timeNo'>").append($time).css("background-color", data.ttList[i].color)
    	   											.css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+startHour+"half").find(".timeNo").val(no);
    	   					} else {
    	   						$("#"+startHour).append("<input type='hidden' class='timeNo'>").append($time).css("background-color", data.ttList[i].color)
    	   										.css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+startHour).find(".timeNo").val(no);
    	   					}
    	   					
    	   						
   	   						for(j = startHour+1; j < endHour; j++) {
   	   							var gapHour = startHour+j;
   	   							$("#"+j).append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
   	   									.css("border-top", "1px solid"+data.ttList[i].color).css("border-bottom", "1px solid"+data.ttList[i].color);
   	   							$("#"+j+"half").append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
   	   										.css("border-top", "1px solid"+data.ttList[i].color).css("border-bottom", "1px solid"+data.ttList[i].color);
   	   							$("#"+j).find(".timeNo").val(no);
   	   							$("#"+j+"half").find(".timeNo").val(no);
    	   					}
   	   						
    	   					if(endMinute >= 31) {
    	   						$("#"+endHour).append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
    	   									.css("border-top", "1px solid"+data.ttList[i].color).css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+endHour+"half").append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
    	   											.css("border-top", "1px solid"+data.ttList[i].color).css("border-bottom", "1px solid #484848");
    	   						$("#"+endHour).find(".timeNo").val(no);
    	   						$("#"+endHour+"half").find(".timeNo").val(no);
    	   					} else if(endMinute >= 1) {
    	   						$("#"+endHour).append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
    	   									.css("border-top", "1px solid"+data.ttList[i].color).css("border-bottom", "1px solid #484848");
    	   						$("#"+endHour+"half").find(".timeNo").val(no);
    	   					} else if(endMinute == 0 ) {
    	   						$("#"+endOnTime+"half").append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
    	   											.css("border-bottom", "1px solid #484848");
    	   						$("#"+endOnTime+"half").find(".timeNo").val(no);
    	   					}
    	   					
    	   				};
        			},
        			error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                    }   
        		})
        		
        		$.ajax({
        			url: 'dtlist.do',
        			data: {dtDate:dtDate},
        			dataType: 'json',
        			success: function(data) {
        				for(var i in data.dtList){
    	   					var content = data.dtList[i].content;
    	   					
    	   					$("#listContent"+i).val(content);

    	   					if(data.dtList[i].complete == 'Y') {
    	   						$("#listCheck"+i).prop("checked", true);
    	   						$("#checkResult"+i).val("Y");
    	   					} else {
    	   						$("#listCheck"+i).prop("checked", false);
    	   						$("#checkResult"+i).val("N");
    	   					}
    	   				}
        			},
        			error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                    }   
        		})
        		
        		var todayFormat = year.toString()+"-"+month.toString()+"-"+date.toString();
        		$("#selectDate").val(todayFormat);
        		var selectDate = $("#selectDate").val();
        		$("#ttDate").val(selectDate);
			})
		</script>
         
        <br><br>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <span style="font-size: 30px; color: #2860E1; font-weight: bold" id="date"></span>&nbsp;
                &nbsp;<input type="date" id="selectDate">
                <div id="addBtnArea">
                    <button type="button" class="default-btn" data-toggle="modal" data-target="#addModal">Add</button>
                </div>
                <div class="modal fade" id="addModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                            </div>
                            <div class="modal-body" align="center">
                                <form action="ttinsert.do" method="post">
                                	<input type="hidden" value="${loginUser.id }" name="id">
                                    <table id="addTable">
                                        <tr>
                                            <th>Title</th>
                                            <td>
                                            	<input type="text" name="ttTitle" size="30">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Date</th>
                                            <td>
                                            	<input type="date" name="ttDate" id="ttDate" style="width: 250px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Time</th>
                                            <td>
                                                <input type="time" name="ttStart" required> - 
                                                <input type="time" name="ttEnd" required>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<th>Color</th>
                                        	<td>
                                        		<div style="display: flex;">
	                                        		<input type="radio" name="color" id="yellow" value="#FBD14B" checked>
						                            <label class="b-icons" for="yellow"><div class="b-yell"></div></label>
						                            <input type="radio" name="color" id="pink" value="#FFA3E5" >
						                            <label class="b-icons" for="pink" ><div class="pink"></div></label>
						                            <input type="radio" name="color" id="purple" value="#C9A8FF">
						                            <label class="b-icons" for="purple"><div class="light-purple"></div></label>
						                            <input type="radio" name="color" id="sky" value="#6B98FF">
						                            <label class="b-icons" for="sky" ><div class="sky"></div></label>
						                            <input type="radio" name="color" id="green" value="#50c6b0">
						                            <label class="b-icons" for="green"><div class="green"></div></label>                                        		
                                        		</div>
                                        		<input type="hidden" id="ttColor" name="ttColor" value="#FBD14B">
                                        	</td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">Memo</th>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <textarea name="ttMemo" cols="40" rows="5"></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                    <button type="submit" class="default-btn">Add</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <table id="timeTable">
                    <tr>
                        <td class="time">&nbsp;0:00</td>
                        <td class="timeContent" id="0"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="0half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;1:00</td>
                        <td class="timeContent" id="1"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="1half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;2:00</td>
                        <td class="timeContent" id="2"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="2half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;3:00</td>
                        <td class="timeContent" id="3"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="3half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;4:00</td>
                        <td class="timeContent" id="4"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="4half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;5:00</td>
                        <td class="timeContent" id="5"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="5half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;6:00</td>
                        <td class="timeContent" id="6"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="6half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;7:00</td>
                        <td class="timeContent" id="7"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="7half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;8:00</td>
                        <td class="timeContent" id="8"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="8half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;9:00</td>
                        <td class="timeContent" id="9"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="9half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;10:00</td>
                        <td class="timeContent" id="10"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="10half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;11:00</td>
                        <td class="timeContent" id="11"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="11half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;12:00</td>
                        <td class="timeContent" id="12"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="12half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;13:00</td>
                        <td class="timeContent" id="13"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="13half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;14:00</td>
                        <td class="timeContent" id="14"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="14half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;15:00</td>
                        <td class="timeContent" id="15"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="15half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;16:00</td>
                        <td class="timeContent" id="16"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="16half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;17:00</td>
                        <td class="timeContent" id="17"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="17half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;18:00</td>
                        <td class="timeContent" id="18"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="18half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;19:00</td>
                        <td class="timeContent" id="19"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="19half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;20:00</td>
                        <td class="timeContent" id="20"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="20half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;21:00</td>
                        <td class="timeContent" id="21"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="21half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;22:00</td>
                        <td class="timeContent" id="22"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="22half"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;23:00</td>
                        <td class="timeContent" id="23"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="23half"></td>
                    </tr>
                </table>
            </div>
            <!-- <div id="listArea"> -->
                <div class="col-md-2 fixed-bottom">
                	<form action="dtinsert.do" method="post">
	                    <div id="circleArea">
	                        <div id="circle"></div>
	                        <b id="listLogo">To do List</b>&nbsp;&nbsp;&nbsp;
	                        <button type="submit" class="default-btn" id="todolistBtn">Save</button>
	                    </div>
                    	<input type="hidden" id="listDate" name="dtDate">
	                    <table id="listTable">
	                        <tr>
	                            <td class="listNo">1</td>
	                            <td class="listContent"><input type="text" class="listInput" name="listContent" id="listContent0"></td>
	                            <td class="listCheck">
	                            	<input type="checkbox" class="listCheck" id="listCheck0">
	                            	<input type="hidden" class="checkResult" id="checkResult0" name="checkResult" value="N">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="listNo">2</td>
	                            <td class="listContent"><input type="text" class="listInput" name="listContent" id="listContent1"></td>
	                            <td class="listCheck">
	                            	<input type="checkbox" class="listCheck" id="listCheck1">
	                            	<input type="hidden" class="checkResult" id="checkResult1" name="checkResult" value="N">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="listNo">3</td>
	                            <td class="listContent"><input type="text" class="listInput" name="listContent" id="listContent2"></td>
	                            <td class="listCheck">
	                            	<input type="checkbox" class="listCheck" id="listCheck2">
	                            	<input type="hidden" class="checkResult" id="checkResult2" name="checkResult" value="N">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="listNo">4</td>
	                            <td class="listContent"><input type="text" class="listInput" name="listContent" id="listContent3"></td>
	                            <td class="listCheck">
	                            	<input type="checkbox" class="listCheck" id="listCheck3">
	                            	<input type="hidden" class="checkResult" id="checkResult3" name="checkResult" value="N">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="listNo">5</td>
	                            <td class="listContent"><input type="text" class="listInput" name="listContent" id="listContent4"></td>
	                            <td class="listCheck">
	                            	<input type="checkbox" class="listCheck" id="listCheck4">
	                            	<input type="hidden" class="checkResult" id="checkResult4" name="checkResult" value="N">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="listNo">6</td>
	                            <td class="listContent"><input type="text" class="listInput" name="listContent" id="listContent5"></td>
	                            <td class="listCheck">
	                            	<input type="checkbox" class="listCheck" id="listCheck5">
	                            	<input type="hidden" class="checkResult" id="checkResult5" name="checkResult" value="N">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="listNo">7</td>
	                            <td class="listContent"><input type="text" class="listInput" name="listContent" id="listContent6"></td>
	                            <td class="listCheck">
	                            	<input type="checkbox" class="listCheck" id="listCheck6">
	                            	<input type="hidden" class="checkResult" id="checkResult6" name="checkResult" value="N">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="listNo">8</td>
	                            <td class="listContent"><input type="text" class="listInput" name="listContent" id="listContent7"></td>
	                            <td class="listCheck">
	                            	<input type="checkbox" class="listCheck" id="listCheck7">
	                            	<input type="hidden" class="checkResult" id="checkResult7" name="checkResult" value="N">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="listNo">9</td>
	                            <td class="listContent"><input type="text" class="listInput" name="listContent" id="listContent8"></td>
	                            <td class="listCheck">
	                            	<input type="checkbox" class="listCheck" id="listCheck8">
	                            	<input type="hidden" class="checkResult" id="checkResult8" name="checkResult" value="N">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="listNo">10</td>
	                            <td class="listContent"><input type="text" class="listInput" name="listContent" id="listContent9"></td>
	                            <td class="listCheck">
	                            	<input type="checkbox" class="listCheck" id="listCheck9">
	                            	<input type="hidden" class="checkResult" id="checkResult9" name="checkResult" value="N">
	                            </td>
	                        </tr>
	                    </table>
                    </form>
                </div>
            <!-- </div> -->
        </div>
                
       <br><br><br><br><br>
    </section>

    <jsp:include page="../common/footer.jsp"/>

    <script>
    	$(function(){
    		$("#selectDate").change(function(){
				
    			var ttDate = $("#selectDate").val();
    			
    			$("#date").text(ttDate);
    			$("#listDate").val(ttDate);
    			
    			$(".timeContent").empty();
    			$(".timeContent").css("background-color", "transparent")
    							.css("border-top", "1px solid #484848")
    							.css("border-bottom", "1px solid #484848");
    			
    			$.ajax({
        			url: 'ttlist.do',
        			data: {ttDate:ttDate},
        			dataType: 'json',
        			success: function(data) {
        				for(var i in data.ttList){
        					if(data.ttList[i].memo != null) {
	    	   					var $time = $("<b>").html(data.ttList[i].start + " - " + data.ttList[i].end + " " + data.ttList[i].title
	    	   											+ "(" + data.ttList[i].memo + ")");        						
        					} else {
        						var $time = $("<b>").html(data.ttList[i].start + " - " + data.ttList[i].end + " " + data.ttList[i].title);
        					}
    	   					
    	   					var no = data.ttList[i].no;
    	   					
    	   					var startHour = data.ttList[i].startHour;
    	   					var startMinute = data.ttList[i].startMinute;
    	   					
    	   					var gap = data.ttList[i].gap;
    	   					
    	   					var endHour = data.ttList[i].endHour;
    	   					var endMinute = data.ttList[i].endMinute;
    	   					var endOnTime = endHour - 1;
    	   					
    	   					if(startMinute >= 30 && gap <= 0) {
    	   						$("#"+startHour+"half").append("<input type='hidden' class='timeNo'>").append($time).css("background-color", data.ttList[i].color)
    	   											.css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+startHour+"half").find(".timeNo").val(no);
    	   					} else if(startMinute < 30 && gap > 0) {
    	   						$("#"+startHour).append("<input type='hidden' class='timeNo'>").append($time).css("background-color", data.ttList[i].color)
    	   										.css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+startHour+"half").append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
    	   										.css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+startHour).find(".timeNo").val(no);
    	   						$("#"+startHour+"half").find(".timeNo").val(no);
    	   					} else if(startMinute >= 30 && gap > 0) {
    	   						$("#"+startHour+"half").append("<input type='hidden' class='timeNo'>").append($time).css("background-color", data.ttList[i].color)
    	   											.css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+startHour+"half").find(".timeNo").val(no);
    	   					} else {
    	   						$("#"+startHour).append("<input type='hidden' class='timeNo'>").append($time).css("background-color", data.ttList[i].color)
    	   										.css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+startHour).find(".timeNo").val(no);
    	   					}
    	   					
    	   						
   	   						for(j = startHour+1; j < endHour; j++) {
   	   							var gapHour = startHour+j;
   	   							$("#"+j).append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
   	   									.css("border-top", "1px solid"+data.ttList[i].color).css("border-bottom", "1px solid"+data.ttList[i].color);
   	   							$("#"+j+"half").append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
   	   										.css("border-top", "1px solid"+data.ttList[i].color).css("border-bottom", "1px solid"+data.ttList[i].color);
   	   							$("#"+j).find(".timeNo").val(no);
   	   							$("#"+j+"half").find(".timeNo").val(no);
    	   					}
   	   						
    	   					if(endMinute >= 31) {
    	   						$("#"+endHour).append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
    	   									.css("border-top", "1px solid"+data.ttList[i].color).css("border-bottom", "1px solid"+data.ttList[i].color);
    	   						$("#"+endHour+"half").append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
    	   											.css("border-top", "1px solid"+data.ttList[i].color).css("border-bottom", "1px solid #484848");
    	   						$("#"+endHour).find(".timeNo").val(no);
    	   						$("#"+endHour+"half").find(".timeNo").val(no);
    	   					} else if(endMinute >= 1) {
    	   						$("#"+endHour).append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
    	   									.css("border-top", "1px solid"+data.ttList[i].color).css("border-bottom", "1px solid #484848");
    	   						$("#"+endHour+"half").find(".timeNo").val(no);
    	   					} else if(endMinute == 0 ) {
    	   						$("#"+endOnTime+"half").append("<input type='hidden' class='timeNo'>").css("background-color", data.ttList[i].color)
    	   											.css("border-bottom", "1px solid #484848");
    	   						$("#"+endOnTime+"half").find(".timeNo").val(no);
    	   					}
    	   					
    	   				};
        			},
        			error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                    }   
        		})
        		
    			$(".listCheck").prop("checked",false);
        		$(".listInput").val("");

        		$.ajax({
        			url: 'dtlist.do',
        			data: {dtDate:ttDate},
        			dataType: 'json',
        			success: function(data) {
        				for(var i in data.dtList){
    	   					var content = data.dtList[i].content;

    	   					$("#listContent"+i).val(content);

    	   					if(data.dtList[i].complete == 'Y') {
    	   						$("#listCheck"+i).prop("checked", true);
    	   						$("#checkResult"+i).val("Y");
    	   					} else {
    	   						$("#listCheck"+i).prop("checked", false);
    	   						$("#checkResult"+i).val("N");
    	   					}
    	   				}
        			},
        			error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                    }   
        		})
        		
        		var selectDate = $("#selectDate").val();
        		$("#ttDate").val(selectDate);
    			
    		})
    		
    		$(".timeContent").click(function(){
    			var ttNo = $(this).find(".timeNo").val();
    			
    			if(ttNo != null) {
	    			var deleteCheck = confirm("일정을 삭제하시겠습니까?");
	    			if(deleteCheck == true){
	    				location.href="ttdelete.do?ttNo="+ttNo;
	    			}
	    			else if(deleteCheck == false){
	    				console.log("일정 삭제를 취소합니다.");
	    			}    				
    			}
    		})
    		
    		
    		$(".listCheck").change(function(){
    			if($(this).is(":checked") == true){
    			    $(this).next().val("Y");
    			} else {
    				$(this).next().val("N");
    			}
    		})
    		
    		$(".b-icons").click(function(){
        		var color = $(this).prev().val();
        		$("#ttColor").val(color);
        	})
    	})
    </script>
    
</body>
</html>