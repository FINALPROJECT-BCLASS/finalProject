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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b636d978e4a9f9da9633851dddc7bb99&libraries=services"></script> <!-- 지도 api -->
    
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
	            			url: 'selectPlan.do',
	            			dataType: 'json',
	            			success: function(data) {
	            				for(var i in data.planList){
		    	   					events.push({title:data.planList[i].gpTitle
		    	   								,start:data.planList[i].gpStart
		    	   								,end:data.planList[i].gpEnd
		    	   								,color:data.planList[i].color
		    	   								,id:data.planList[i].getGpNo})
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
	            eventClick: function(info) {
	            	mpDetailView(info.event.id);
	            },
	            dateClick: function(info){

		    	 	/* calendar.getEvents(); */
		    	 	 
		    	 	$("#mpStart").val(info.dateStr);
		    	 	$("#mpEnd").val(info.dateStr);
		    	 	
		    	 	$("#addModal").modal();
		      	},
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
			$("#listDate").val(calendarDate);
			
			mtListView(calendarDate);
	        
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
	        	
	        	mtListView(calendarDate);
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
	        	
	        	mtListView(calendarDate);
	        })
	    });
	    	  
    </script>
    
    <style>
    	.textBox{
    		height:35px;
    		border:none;
    		background:#F3F3F3;
    		border-radius:6px;
    	}
    	.textCon{
    		height:60px;
    	}
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
        
		.modal{
			padding-top:100px;
		}
		
        .modal-content{
            width: 800px !important;
        }
        
		.modal-dialog{
			max-width:750px !important;
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
        
        input[type="radio"]:checked + .u-icons>div{
            border: 3px solid #484848;
        }
        
        .u-icons {
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

        .u-icons > div {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            vertical-align: middle;
            text-align: center;
        }
        
         tr > td:nth-child(1) {
            color: #484848;
            text-align: left;
            font-weight: 600;
            font-size: 16px;
        }
        
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    <section>

		<c:if test="${ groupTable.id eq gInfo.loginUserId}">
		<jsp:include page="../common/sidenaviGroupAdmin.jsp"/>
		</c:if>
		
		<c:if test="${ groupTable.id ne gInfo.loginUserId}">
		<jsp:include page="../common/sidenaviGroup.jsp"/>
		</c:if>
        
        <br><br>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-10">
                <button class="default-btn" type="button" data-toggle="modal" data-target="#addModal">Add</button>
                <div class="modal fade" id="addModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                            </div>
                            <div class="modal-body" align="center">
                                <form action="insertPlan.do" method="post">
                                	<input type="hidden" name="id" value="${gInfo }">
                                    <table id="addTable">
                                    <input type="hidden" name="gNo" value="${gInfo.groupNo }">
                                    <input type="hidden" name="gmNo" value="${gInfo.gmNo}">
                                    <input type="hidden" name="gpDelete" value="N">
                                        <tr>
                                            <td>Title</td>
                                            <td><input type="text" id="addTitle" class="textBox" name="gpTitle" size="42"></td>
                                        </tr>
                                        <tr>
                                            <td>Date</td>
                                            <td>
                                                <input type="date" id="mpStart" name="gpStart" class="textBox"> - 
                                                <input type="date" id="mpEnd" name="gpEnd" class="textBox">
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>Color</td>
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
                                            	Location&nbsp;
                                            	<button type="button" class="default-btn b-lightgray" onclick="searchAddress()">Search</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="text" name="address1" class="mainAddress textBox" size="49"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="text" name="address2" class="subAddress textBox" size="49"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Content</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <textarea id="addMemo" name="gpCon"   class="textCon textBox" cols="52" rows="5"></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                    <button type="submit" class="default-btn b-yell">Add</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div id='calendar'></div>
            </div>

        </div>
       <br><br><br><br><br>
       
       <div class="modal fade" id="detailModal" role="dialog">
	       <div class="modal-dialog">
	           <div class="modal-content">
	               <div class="modal-header">
	                   <button type="button" class="close" data-dismiss="modal">×</button>
	               </div>
	               <div class="modal-body" align="center">
	                   <form action="mpinsert.do" method="post">
	                   	<input type="hidden" name="mpNo" id="mpNo">
	                       <table id="detailTable">
	                           <tr>
	                               <td>Title</td>
	                               <td><span id="mpTitle"></span></td>
	                           </tr>
	                           <tr>
	                               <td>Date</td>
	                               <td><span id="mpDate"></span></td>
	                           </tr>
	                           <!-- <tr>
	                               <th>Time</th>
	                               <td><span id="mpTime"></span></td>
	                           </tr> -->
	                           <tr>
	                               <td colspan="2">Content</td>
	                           </tr>
	                           <tr>
	                               <td colspan="2"><span id="mpMemo">&nbsp;</span></td>
	                           </tr>
	                           <tr>
	                               <td colspan="2">Location</td>
	                           </tr>
	                           <tr>
	                               <td colspan="2"><span id="mpLocation">&nbsp;</span></td>
	                           </tr>
	                       </table>
	                       <div id="map" style="width:300px;height:200px;"></div>
	                       <br><br>
	                       <button type="button" class="default-btn" id="updateBtn">Edit</button>
	                       &nbsp;<button type="button" class="default-btn" id="deleteBtn">Delete</button>
	                   </form>
	               </div>
	           </div>
	       </div>
	   </div>
	   
	   <div class="modal fade" id="updateModal" role="dialog">
           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal">×</button>
                   </div>
                   <div class="modal-body" align="center">
                       <form action="mpupdate.do" method="post">
                           <input type="hidden" name="mpNo" id="updateNo">
                           <table id="updateTable">
                               <tr>
                                   <th>Title</th>
                                   <td><input type="text" name="mpTitle" id="updateTitle" size="42"></td>
                               </tr>
                               <tr>
                                   <th>Date</th>
                                   <td>
                                       <input type="date" name="mpStart" id="updateStart"> - 
                                       <input type="date" name="mpEnd" id="updateEnd">
                                   </td>
                               </tr>
                               <tr>
                                   <th>Time</th>
                                   <td>
                                   	<input type="time" name="mpTime" id="updateTime" style="width: 335px;">
                                   </td>
                               </tr>
                               <tr>
                               	<th>Color</th>
                               	<td>
                               		<div style="display: flex;">
                                		<input type="radio" name="color" id="uYellow" value="#FBD14B" checked>
			                         	<label class="u-icons" for="uYellow"><div class="b-yell"></div></label>
			                         	<input type="radio" name="color" id="uPink" value="#FFA3E5" >
			                         	<label class="u-icons" for="uPink" ><div class="pink"></div></label>
			                         	<input type="radio" name="color" id="uPurple" value="#C9A8FF">
			                         	<label class="u-icons" for="uPurple"><div class="light-purple"></div></label>
			                         	<input type="radio" name="color" id="uBlue" value="#2860E1">
			                         	<label class="u-icons" for="uBlue" ><div class="sky"></div></label>
			                         	<input type="radio" name="color" id="uGreen" value="#50c6b0">
			                         	<label class="u-icons" for="uGreen"><div class="green"></div></label>                                        		
                               		</div>
                               		<input type="hidden" id="updateColor" name="mpColor" value="#FBD14B">
                               	</td>
                               </tr>
                               <tr>
                                   <td colspan="2">
                                   	<b>Location</b>&nbsp;
                                   	<button type="button" class="default-btn b-lightgray" onclick="searchAddress()">Search</button>
                                   </td>
                               </tr>
                               <tr>
                                   <td colspan="2"><input type="text" name="mpMain" id="updateMain" class="mainAddress" size="49"></td>
                               </tr>
                               <tr>
                                   <td colspan="2"><input type="text" name="mpSub" id="updateSub" class="subAddress" size="49"></td>
                               </tr>
                               <tr>
                                   <th colspan="2">Memo</th>
                               </tr>
                               <tr>
                                   <td colspan="2">
                                       <textarea name="mpMemo" id="updateMemo" cols="52" rows="5"></textarea>
                                   </td>
                               </tr>
                           </table>
                           <button type="submit" class="default-btn">Save</button>
                       </form>
                   </div>
               </div>
           </div>
       </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>	

    <script>
	    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	    var options = { //지도를 생성할 때 필요한 기본 옵션
	    	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	    	level: 3 //지도의 레벨(확대, 축소 정도)
	    };
	
	    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    
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
	    
	    function resizeMap(coords) {
    		$("#detailModal").on('shown.bs.modal', function () {
        	    map.relayout();
        	    map.setCenter(coords);
        	});
    	}
	    	    
	    function mpDetailView(id) {
	    	
	    	$.ajax({
    			url: 'mpdetail.do',
    			data:{mpNo:id},
    			dataType: 'json',
    			success: function(data) {
    				var mpNo = data.no;
    				var mpTitle = data.eventTitle;
    				var mpStart = data.start;
    				var mpEnd = data.end;
    				var mpDate = mpStart + " - " + mpEnd;
    				var mpTime = data.time;
    				var mpLocation = data.location;
    				var mpMemo = data.memo;
    				var mapAddress = data.map;
    				
    				$("#mpNo").val(mpNo);
    				$("#mpTitle").html(mpTitle);
    				$("#mpDate").html(mpDate);
    				$("#mpTime").html(mpTime);
    				$("#mpLocation").html(mpLocation);
    				$("#mpMemo").html(mpMemo);
    				
    				$("#updateNo").val(mpNo);
    				$("#updateTitle").val(mpTitle);
    				$("#updateStart").val(mpStart);
    				$("#updateEnd").val(mpEnd);
    				$("#updateTime").val(mpTime);
    				$("#updateMain").val(data.main);
    				$("#updateSub").val(data.sub);
    				$("#updateMemo").val(mpMemo);
    				
    				$("#detailModal").modal();
    				
    				if(mapAddress != null) {
    					$("#map").css("display", "block");
    					
	    	    		var geocoder = new kakao.maps.services.Geocoder();
	    				// 주소로 좌표를 검색합니다
	    				geocoder.addressSearch(mapAddress, function(result, status) {
	    				
	    				    // 정상적으로 검색이 완료됐으면 
	    				     if (status === kakao.maps.services.Status.OK) {
	    				
	    				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    				
	    				        // 결과값으로 받은 위치를 마커로 표시합니다
	    				        var marker = new kakao.maps.Marker({
	    				            map: map,
	    				            position: coords
	    				        });
	    				
	    				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    				        /* map.setCenter(coords); */
	    				        
	    				        resizeMap(coords);
	    				    } 
	    				});
    				} else {
    					$("#map").css("display", "none");
    				}
    		    	
    			},
    			error:function(request, status, errorData){
                    alert("error code: " + request.status + "\n"
                          +"message: " + request.responseText
                          +"error: " + errorData);
                }   
    		})
	    	
	    }
	    
	    /* function mtListView(calendarDate) {
	    	$(".listCheck").prop("checked",false);
        	$(".listInput").val("");
        	
	        $.ajax({
       			url: 'mtlist.do',
       			data: {mtDate:calendarDate},
       			dataType: 'json',
       			success: function(data) {
       				for(var i in data.mtList){
   	   					var content = data.mtList[i].content;
   	   					
   	   					$("#listContent"+i).val(content);

   	   					if(data.mtList[i].complete == 'Y') {
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
	    } */
    
        $(document).ready(function(){
        	$(".b-icons").click(function(){
        		var color = $(this).prev().val();
        		$("#mpColor").val(color);
        	})
        	
        	$(".u-icons").click(function(){
        		var color = $(this).prev().val();
        		console.log(color);
        		$("#updateColor").val(color);
        	})
        	
        	$("#deleteBtn").click(function(){
        		var deleteNo = $("#mpNo").val();
        		
      			location.href="mpdelete.do?mpNo="+deleteNo;
      		})
      		
      		$("#updateBtn").click(function(){
      			$('#detailModal').modal("hide"); //닫기 
      			 
      			$('#updateModal').modal("show"); //열기
      		})
      		
      		$('#addModal').on('shown.bs.modal', function (e) {
      			$("#addTitle").val("");
      			$("#addTime").val("");
				$(".mainAddress").val("");
				$(".subAddress").val("");
				$("#addMemo").val("");
			});
        	
        	/* $(".listCheck").change(function(){
    			if($(this).is(":checked") == true){
    			    $(this).next().val("Y");
    			} else {
    				$(this).next().val("N");
    			}
    		}) */
        });
    </script>
    
</body>
</html>