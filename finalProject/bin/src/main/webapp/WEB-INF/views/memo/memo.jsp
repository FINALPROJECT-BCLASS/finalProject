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
            width: 500px;
            display: flex;
            align-items: center;
            margin: 50px;
        }

        #memoLogo{
            margin-left: -30px;
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
        </div>
        
        
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
                                	<th>Color</th>
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
    </script>	
    
</body>
</html>