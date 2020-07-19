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
				
				var ttDate = $("#date").html();
				
				$.ajax({
        			url: 'ttlist.do',
        			data: {ttDate:ttDate},
        			dataType: 'json',
        			success: function(data) {
        				for(var i in data.ttList){
    	   					var $time = $("<b>").html(data.ttList[i].start + " - " + data.ttList[i].end + " " + data.ttList[i].title
    	   											+ "(" + data.ttList[i].memo + ")");
    	   					
    	   					var $no = $("<input type='text' class='timeNo'>").val(data.ttList[i].no);
    	   					
    	   					var startHour = data.ttList[i].startHour;
    	   					var startMinute = data.ttList[i].startMinute;
    	   					
    	   					var gap = data.ttList[i].gap;
    	   					
    	   					var endHour = data.ttList[i].endHour;
    	   					var endMinute = data.ttList[i].endMinute;
    	   					var endOnTime = endHour - 1;
    	   					
    	   					if(startMinute >= 30 && gap <= 0) {
    	   						$("#"+startHour+"half").append($no).append($time).css("background-color", "pink").css("border-bottom", "1px solid pink");
    	   					} else if(startMinute < 30 && gap > 0) {
    	   						$("#"+startHour).append($no).append($time).css("background-color", "pink").css("border-bottom", "1px solid pink");
    	   						$("#"+startHour+"half").append($no).css("background-color", "pink").css("border-bottom", "1px solid pink");
    	   					} else if(startMinute >= 30 && gap > 0) {
    	   						$("#"+startHour+"half").append($no).append($time).css("background-color", "pink").css("border-bottom", "1px solid pink");
    	   					} else {
    	   						$("#"+startHour).append($no).append($time).css("background-color", "pink").css("border-bottom", "1px solid pink");
    	   					}
    	   					
    	   						
   	   						for(j = startHour+1; j < endHour; j++) {
   	   							var gapHour = startHour+j;
   	   							$("#"+j+"half").append($no).css("background-color", "pink").css("border-bottom", "1px solid pink");
   	   							$("#"+j).append($no).css("background-color", "pink").css("border-top", "1px solid pink")
   	   										.css("border-bottom", "1px solid pink");
   	   							$("#"+j+"half").append($no).css("background-color", "pink").css("border-top", "1px solid pink")
   	   												.css("border-bottom", "1px solid pink");
    	   					}
   	   						
    	   					if(endMinute >= 30) {
    	   						$("#"+endHour).append($no).css("background-color", "pink").css("border-top", "1px solid pink").css("border-bottom", "1px solid pink");
    	   						$("#"+endHour+"half").append($no).css("background-color", "pink").css("border-top", "1px solid pink").css("border-bottom", "1px solid #484848");
    	   					} else if(endMinute >= 1) {
    	   						$("#"+endHour).append($no).css("background-color", "pink").css("border-top", "1px solid pink").css("border-bottom", "1px solid #484848");
    	   					} else if(endMinute == 0 ) {
    	   						if(endHour == 24) {
    	   							$("#24").append($no).css("background-color", "pink").css("border-top", "1px solid pink").css("border-bottom", "1px solid pink");
    	   							$("#24half").append($no).css("background-color", "pink").css("border-top", "1px solid pink").css("border-bottom", "1px solid #484848");
    	   						} else {
	    	   						$("#"+endOnTime+"half").append($no).css("background-color", "pink").css("border-bottom", "1px solid #484848");    	   							
    	   						}
    	   					}
    	   					
    	   				};
        			},
        			error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                    }   
        		})
        		
        		$("#selectDate").change(function(){
        			var ttDate = $("#selectDate").val();
        			
        			$("#date").text(ttDate);
        			
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
        	   					var $time = $("<b>").html(data.ttList[i].start + " - " + data.ttList[i].end + " " + data.ttList[i].title
        	   											+ "(" + data.ttList[i].memo + ")");
        	   					
        	   					var startHour = data.ttList[i].startHour;
        	   					var startMinute = data.ttList[i].startMinute;
        	   					
        	   					var gap = data.ttList[i].gap;
        	   					
        	   					var endHour = data.ttList[i].endHour;
        	   					var endMinute = data.ttList[i].endMinute;
        	   					var endOnTime = endHour - 1;
        	   					
        	   					if(startMinute >= 30 && gap <= 0) {
        	   						$("#"+startHour+"half").append($time).css("background-color", "pink").css("border-bottom", "1px solid pink");
        	   					} else if(startMinute < 30 && gap > 0) {
        	   						$("#"+startHour).append($time).css("background-color", "pink").css("border-bottom", "1px solid pink");
        	   						$("#"+startHour+"half").css("background-color", "pink").css("border-bottom", "1px solid pink");
        	   					} else if(startMinute >= 30 && gap > 0) {
        	   						$("#"+startHour+"half").append($time).css("background-color", "pink").css("border-bottom", "1px solid pink");
        	   					} else {
        	   						$("#"+startHour).append($time).css("background-color", "pink").css("border-bottom", "1px solid pink");
        	   					}
        	   					
        	   						
       	   						for(j = startHour+1; j < endHour; j++) {
       	   							var gapHour = startHour+j;
       	   							$("#"+j+"half").css("background-color", "pink").css("border-bottom", "1px solid pink");
       	   							$("#"+j).css("background-color", "pink").css("border-top", "1px solid pink")
       	   										.css("border-bottom", "1px solid pink");
       	   							$("#"+j+"half").css("background-color", "pink").css("border-top", "1px solid pink")
       	   												.css("border-bottom", "1px solid pink");
        	   					}
       	   						
        	   					if(endMinute >= 30) {
        	   						$("#"+endHour).css("background-color", "pink").css("border-top", "1px solid pink").css("border-bottom", "1px solid pink");
        	   						$("#"+endHour+"half").css("background-color", "pink").css("border-top", "1px solid pink").css("border-bottom", "1px solid #484848");
        	   					} else if(endMinute >= 1) {
        	   						$("#"+endHour).css("background-color", "pink").css("border-top", "1px solid pink").css("border-bottom", "1px solid #484848");
        	   					} else if(endMinute == 0 ) {
        	   						if(endHour == 24) {
        	   							$("#24").css("background-color", "pink").css("border-top", "1px solid pink").css("border-bottom", "1px solid pink");
        	   							$("#24half").css("background-color", "pink").css("border-top", "1px solid pink").css("border-bottom", "1px solid #484848");
        	   						} else {
    	    	   						$("#"+endOnTime+"half").css("background-color", "pink").css("border-bottom", "1px solid #484848");    	   							
        	   						}
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
                                            <td><b>Title</b></td>
                                            <td>
                                            	<input type="text" name="ttTitle" size="30">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Date</b></td>
                                            <td>
                                            	<input type="date" name="ttDate" style="width: 250px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Time</b></td>
                                            <td>
                                                <input type="time" name="ttStart"> - 
                                                <input type="time" name="ttEnd">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>Memo</b></td>
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
                    <tr>
                        <td class="time">&nbsp;24:00</td>
                        <td class="timeContent" id="24"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent" id="24half"></td>
                    </tr>
                </table>
            </div>
            <!-- <div id="listArea"> -->
                <div class="col-md-2 fixed-bottom">
                    <div id="circleArea">
                        <div id="circle"></div>
                        <b id="listLogo">To do List</b>&nbsp;&nbsp;&nbsp;
                        <button type="button" class="default-btn" id="todolistBtn">Save</button>
                    </div>
                    <table id="listTable">
                        <tr>
                            <td class="listNo">1</td>
                            <td class="listContent"><input type="text" class="listInput" name="dtCon"></td>
                            <td class="listCheck"><input type="checkbox" name="dtComplete"></td>
                        </tr>
                        <tr>
                            <td class="listNo">2</td>
                            <td class="listContent"><input type="text" class="listInput" name="dtCon"></td>
                            <td class="listCheck"><input type="checkbox" name="dtComplete"></td>
                        </tr>
                        <tr>
                            <td class="listNo">3</td>
                            <td class="listContent"><input type="text" class="listInput" name="dtCon"></td>
                            <td class="listCheck"><input type="checkbox" name="dtComplete"></td>
                        </tr>
                        <tr>
                            <td class="listNo">4</td>
                            <td class="listContent"><input type="text" class="listInput" name="dtCon"></td>
                            <td class="listCheck"><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td class="listNo">5</td>
                            <td class="listContent"><input type="text" class="listInput" name="dtCon"></td>
                            <td class="listCheck"><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td class="listNo">6</td>
                            <td class="listContent"><input type="text" class="listInput" name="dtCon"></td>
                            <td class="listCheck"><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td class="listNo">7</td>
                            <td class="listContent"><input type="text" class="listInput" name="dtCon"></td>
                            <td class="listCheck"><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td class="listNo">8</td>
                            <td class="listContent"><input type="text" class="listInput" name="dtCon"></td>
                            <td class="listCheck"><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td class="listNo">9</td>
                            <td class="listContent"><input type="text" class="listInput" name="dtCon"></td>
                            <td class="listCheck"><input type="checkbox"></td>
                        </tr>
                        <tr>
                            <td class="listNo">10</td>
                            <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                            <td class="listCheck"><input type="checkbox"></td>
                        </tr>
                    </table>
                </div>
            <!-- </div> -->
        </div>
                
       <br><br><br><br><br>
    </section>

    <jsp:include page="../common/footer.jsp"/>

    <script>
    	$(function(){
    		$(".timeContent").click(function(){
    			var ttNo = $(this).find(".timeNo").val();
    			
    			console.log(ttNo);
    			
    			var deleteCheck = confirm("일정을 삭제하시겠습니까?");
    			if(deleteCheck == true){
    				location.href="ttdelete.do?ttNo="+ttNo;
    			}
    			else if(deleteCheck == false){
    				console.log("일정 삭제를 취소합니다.");
    			}
    		})
    	})
    	
        // 로그인 서브 메뉴
        $(document).ready(function(){
        $(".l-login-area>div").click(function(){

            var submenu = $(this).children(".l-login-sub");
            var subdeco = $(this).children(".l-login-square");
            
             if(submenu.is(":visible")){
                submenu.slideUp();
                subdeco.toggleClass("l-hide");
            }else{
                submenu.slideDown();
                subdeco.toggleClass("l-hide");
            }

            });
        });
    </script>
    
</body>
</html>