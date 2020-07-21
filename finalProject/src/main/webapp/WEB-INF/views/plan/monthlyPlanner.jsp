<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <script type="text/javascript"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
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
	            			url: 'mplist.do',
	            			dataType: 'json',
	            			success: function(data) {
	            				for(var i in data.mpList){
	            					console.log(data.mpList[i].end);
		    	   					events.push({title:data.mpList[i].eventTitle
		    	   								,start:data.mpList[i].start
		    	   								,end:data.mpList[i].end
		    	   								,color:data.mpList[i].color})
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
        #listTable{
            margin-top: 5px;
        }

        #listTable td{
            border: 1px solid;
            border-color: rgba(72, 72, 72, 1);
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
            border: none;
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

        .col-md-8, .col-md-2 {
            position: inherit !important;
        }

        .modal-content{
            width: 440px !important;
        }

        #addTable td{
            padding: 5px;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
            /* z-index: 0; */
        }

        .fc-today-button{
            display: none !important;
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
        
        <br><br>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <button class="default-btn" type="button" data-toggle="modal" data-target="#addModal">Add</button>
                <div class="modal fade" id="addModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                            </div>
                            <div class="modal-body" align="center">
                                <form action="mpinsert.do" method="post">
                                	<input type="hidden" name="id" value="${loginUser.id }">
                                    <table id="addTable">
                                        <tr>
                                            <td><b>Title</b></td>
                                            <td><input type="text" name="mpTitle" size="42"></td>
                                        </tr>
                                        <tr>
                                            <td><b>Date</b></td>
                                            <td>
                                                <input type="date" name="mpStart"> - 
                                                <input type="date" name="mpEnd">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Time</b></td>
                                            <td>
                                            	<input type="time" name="mpTime" style="width: 335px;">
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td><b>Color</b></td>
                                        	<td>
                                        		<div style="display: flex;">
	                                        		<input type="radio" name="color" id="yellow" value="#FBD14B" checked>
						                            <label class="b-icons" for="yellow"><div class="b-yell"></div></label>
						                            <input type="radio" name="color" id="pink" value="#FFA3E5" >
						                            <label class="b-icons" for="pink" ><div class="pink"></div></label>
						                            <input type="radio" name="color" id="purple" value="#C9A8FF">
						                            <label class="b-icons" for="purple"><div class="light-purple"></div></label>
						                            <input type="radio" name="color" id="blue" value="#2860E1">
						                            <label class="b-icons" for="blue" ><div class="sky"></div></label>
						                            <input type="radio" name="color" id="green" value="#50c6b0">
						                            <label class="b-icons" for="green"><div class="green"></div></label>                                        		
                                        		</div>
                                        		<input type="hidden" id="mpColor" name="mpColor" value="#FBD14B">
                                        	</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                            	<b>Location</b>&nbsp;
                                            	<button type="button" class="default-btn b-lightgray" onclick="searchAddress()">Search</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="text" name="mainAddress" id="mainAddress" size="49"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="text" name="subAddress" id="subAddress" size="49"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>Memo</b></td>
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
                <div id='calendar'></div>
            </div>
            <div class="col-md-2">
                <div id="circleArea">
                    <div id="circle"></div>
                    <b id="listLogo">To do List</b>&nbsp;&nbsp;&nbsp;
                    <button type="button" class="default-btn">Save</button>
                </div>
                <table id="listTable">
                    <tr>
                        <td class="listNo">1</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">2</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">3</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">4</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">5</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">6</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">7</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">8</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">9</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">10</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">11</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">12</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">13</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">14</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">15</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                </table>
            </div>
        </div>
       <br><br><br><br><br>
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
	                    document.getElementById("subAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("subAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                //document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("mainAddress").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("subAddress").focus();
	            }
	        }).open();
	    }
    
        // 로그인 서브 메뉴
        $(document).ready(function(){
        	$(".b-icons").click(function(){
        		var color = $(this).prev().val();
        		$("#mpColor").val(color);
        	})
        	
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