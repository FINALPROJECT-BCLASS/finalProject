<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	html, body {
    	height:100%;
    	
	}

	.join-form-area {
	    float: right;
	    display: flex;
	    justify-content: center;
	    flex-direction: column;
	    align-items: center;
	    padding: 65px;
	    color: #484848;
	    width: 100%;
	    padding-bottom: 120px;
		background: #F7F7f7;
	}
	
	input{
		margin-left:20px;
	}
	
	input[type=text],
	input[type=password],
	input[type=date],
	input[type=email],
	input[type=tel] {
		border-style: none;
	    border-radius: 8px;
	    background: white;
	    height: 40px;
	    width: 327px;
	    padding: 10px;
	}
	
	tr > td:nth-child(1) {
		font-weight: 600;
		font-size: 18px;
		cursor: default;
	}
	
	tr > td:nth-child(2) {
		padding-left:37px;
	}
	
	.pSubject {
		font-size: 30px;
	    font-weight: 600;
	    padding: 30px;
	    color: #484848;
	}
	
	.postcode {
	    margin-right: 6px;
		width:160px !important;
	}
	
	#id {
	    margin-right: 6px;
		width:237px;
	}
	
	
	/* 이미지 업로드 */
	
	.profile-image-area {
	    width: 50px;
	    height: 50px;
	    border-radius: 50%;
	    overflow: hidden;
	    margin-right: 10px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.profile-image {
	    height: 135%;
	}
	
	.filebox {
		display: inline-block;
	}
	
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	
	.filebox label {
		display: inline-block;
	    height: 40px;
	    padding: 7px 20px;
	    color: #484848;
	    font-size: 15px;
	    font-weight: 600;
	    vertical-align: middle;
	    background-color: #FBD14B;
	    cursor: pointer;
	    border-radius: 8px;
	    margin: 0;
	}
	
	/* named upload */
	.filebox .upload-name {
		display: inline-block;
	    vertical-align: middle;
	    width: 164px;
	    height: 40px;
	    font-size: 13px;
	    padding: 0 10px;
	    border: 0;
	    border-radius: 8px;
	    margin-right: 5px;
	    background-color: white;
	}
	
	.button-area {
		margin-top: 50px;
		display: flex;
		justify-content: flex-end;
	}
	
	.button-area > button {
		border: none;
	    height: 40px;
	    margin: 0 5px;
	    background: none;
	    font-size: 23px;
	    font-weight: 700;
	    color: #484848;
	}
	
    input::placeholder { 
    	font-size: 80%;
    	color:#c4c4c4;
    }
    
    /* for 유효성 검사 */
    
    .check {
    	display: none;
	    font-size: 13px;
	    font-weight: 400;
	    margin-top: 5px;
	    color: #c65858;
    }
    
    label {
    	margin-bottom: 0 !important;
    }
    
    .success {
    	color: #50c6b0;
    }
    
    
    /* For 카테고리 설명 */
    
    .setMain-td-f {
    	position: relative;
    }
    
    
    .infoSetMain {
    	opacity: 0;
    	position: absolute;
	    top: 65px;
	    left: 5px;
	    padding: 12px;
	    font-size: 13px;
	    border-radius: 8px;
	    z-index: 2;
	    background: beige;
    }
    
    .setMain-td-f:hover .infoSetMain {
    	opacity: 1;
    	transition-duration: 0.5s;
    	display: initial;
    }
    
    .square {
    	width: 15px;
	    height: 15px;
	    background-color: beige;
	    position: absolute;
	    top: -6px;
	    left: 19px;
	    transform: rotate(45deg);
    }
    


	
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>

<div class="join-form-area">
        <span class="pSubject">Join</span>
        <form action="minsert.do" method="post" enctype="multipart/form-data" id="joinForm">
            <table cellpadding="6px">
                <tr>
                    <td><a class="blue">*</a> Id</td>
                    <td>
                    	<input type="text" name="id" id="id" required>
                    	<button type="button" class="default-btn b-yell" onclick="idCheck()">Check</button>
                    	<div class="check" id="checkId"></div>
                    </td>
                </tr>
                <tr>
                    <td><a class="blue">*</a> Name</td>
                    <td>
                    	<input type="text" name="name" id="name" required>
                    </td>
                </tr>
                <tr>
                    <td><a class="blue">*</a> Nickname</td>
                    <td>
                    	<input type="text" name="nickname" id="nickname" required>
                    	<div class="check" id="checkNickname"></div>
                    </td>
                </tr>
                <tr>
                    <td><a class="blue">*</a> Password</td>
                    <td>
                    	<input type="password" name="pwd" id="pwd" required>
                    	<div class="check" id="checkPwd"></div>
                    </td>
                </tr>
                <tr>
                    <td><a class="blue">*</a> Check Password</td>
                    <td>
                    	<input type="password" id="checkPassword" required>
                    	<div class="check" id="checkCheckPwd"></div>
                    </td>
                    
                </tr>
                <tr>
                    <td><a class="blue">*</a> Email</td>
                    <td>
                    	<input type="email" name="email" id="email" required>
                    	<div class="check" id="checkEmail"></div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Phone</td>
                    <td><input type="tel" name="phone" id="phone" placeholder="ex) 010-1234-1234"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Birth</td>
                    <td><input type="date" name="birthday" id="birth"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Address</td>
                    <td>
                        <input type="text" name="postcode" id="postcode" class="postcode">
                        <button type="button" class="default-btn b-yell" onclick="searchAddress()">Search</button>
                    </td> 
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="text" name="mainAddress" id="mainAddress">
                    </td>
                </tr>
                <tr>
                	<td></td>
                	<td>
                        <input type="text" name="subAddress" id="subAddress">
                	</td>
                </tr>
                <tr class="setMain">
                    <td class="setMain-td-f"><a class="blue">*</a> Set Main
                    	<div class="infoSetMain"><div class="square"></div>로그인시 첫 화면에 보여질 서비스를 선택하세요.</div>
                    </td>
                    <td>
                        <input type="radio" name="main_no" id="1" value="1" checked> <label for="1">Plan</label>
                        <input type="radio" name="main_no" id="2" value="2"> <label for="2">Habit Tracker</label><br>
                        <input type="radio" name="main_no" id="3" value="3"> <label for="3">Daily Record</label>
                        <input type="radio" name="main_no" id="4" value="4"> <label for="4">Account Book</label><br>
                        <input type="radio" name="main_no" id="5" value="5"> <label for="5">Diet Diary</label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Profile Image</td>
                    <td style="display: flex; align-items: center;">
                    	<div class=profile-image-area>
                        	<img class="profile-image" src="resources/images/icons/profile_default.png">
                       	</div>
                       <div class="filebox"> 
							<input type="file" name="file" id="file" onchange="uploadPhoto(this);"> 
						  	<input class="upload-name" value="Select file">
						  	<label class="b-yell" for="file">Upload</label> 
						</div>
                         <!-- <input type="file" id="pImage"> -->  
                    </td>
                </tr>
            </table>
            <div class="button-area">
	            <button onclick="history.go(-1)">Back</button>
	            <button type="reset">Reset</button>
	            <button type="button" onclick="joinSubmit()">submit</button>
            </div>
        </form>
    </div>


    <script>
    
 
	    /* 파일 업로드 */
	    
	    function uploadPhoto(value) {
	    	
			if(value.files && value.files[0]) {
				
				var reader = new FileReader();
			
				reader.onload = function(e) {
					
					$(".profile-image").attr("src", e.target.result);
					
					var filename = $("#file").val().split('/').pop().split('\\').pop();
					
					$(".upload-name").val("");
					$(".upload-name").val(filename);
				}
				
				reader.readAsDataURL(value.files[0]);
			}
	    }
	   

	    /* 아이디 중복확인 */
	    
	   	function idCheck(){
			
   			var userId = $("#id").val().trim();
   			
   			if(userId.length < 4){
   				alert("아이디는 최소 4자리 이상이어야 합니다.");
   				userId.focus();
   				return;
   			}else{
   				$.ajax({
   					url: "checkId.do",
   					type: "post",
   					data: {id:userId},
   					success:function(data){
   						
   						if (data == 1) {
   							alert("중복된 아이디가 있습니다.");
   							$("#id").removeClass("finished");
   							$("#id").val("");
   							$("#id").focus();
   						} else {
   							alert("사용 가능한 아이디입니다.");
   							$("#id").addClass("finished");
   							$("#name").focus();
   						}
   						
   					},
   					error:function(request, status, errorData){
                         alert("error code: " + request.status + "\n"
                               +"message: " + request.responseText
                               +"error: " + errorData);
              		} 
   				})
   			}
	   	}
	    
	    /* For 아이디 중복확인 후 다시 값이 변경될 때 중복확인 해제 */
	    
	    $(function(){
	    	$("#id").on("change",function(){
	    		$(this).removeClass("finished");
	    	})
	    })

	    /* For 유효성 검사 */
	    
	    // 아이디 체크
    	var check_i = RegExp(/^[a-z0-9_\-]{4,12}$/); 
    	// 패스워드 체크
    	var check_p = RegExp(/^(?=.*[a-z])(?=.*[0-9]).{4,15}$/);
    	// 닉네임 체크
    	var check_n = RegExp(/^[가-힣A-Za-z]{2,6}$/);
    	// 이메일 체크
    	var check_e = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
        
        
        /* 아이디 유효성 */
        
	    $("#id").keyup(function(){
	    	
	    	if($(this).val() == ""){
	    		
	    		$("#checkId").show();
	    		$("#checkId").html("아이디를 입력해 주세요.");
	    		$("#checkId").removeClass("success");
	    		
	    	} else {
	    	
		    	if(!check_i.test($(this).val())){
		    		
		    		$("#checkId").show();
		    		$("#checkId").html("영문 소문자와 숫자를 조합하여 4자~15자로 입력하세요.");
		    		$("#checkId").removeClass("success");
		    		
		    		$(this).focusout(function(){
		    			$("#checkId").show(); // 포커스 잃어도 div태그 보여주기
		    		})
		    	
		    	}else{
		    		
		    		$("#checkId").html("정상적으로 입력되었습니다.");
		    		$("#checkId").addClass("success");
		    		
		    		$(this).focusout(function(){ // 포커스 잃으면 div태그 숨기기
		    			$("#checkId").hide();
		    		})
		    	}
	    	}
	    })
        
    	/* 닉네임 유효성 */
    	
    	$("#nickname").keyup(function(){
	    	
	    	if(!check_n.test($(this).val())){
	    		
	    		$("#checkNickname").show();
	    		$("#checkNickname").html("두 글자 이상 입력해 주세요.(특수문자 입력 불가)");
	    		$("#checkNickname").removeClass("success");
	    		
	    		$(this).focusout(function(){
	    			$("#checkNickname").show();
	    		})
	    	
	    	}else{
	    		
	    		$("#checkNickname").html("정상적으로 입력되었습니다.");
	    		$("#checkNickname").addClass("success");
	    		
	    		$(this).focusout(function(){
	    			$("#checkNickname").hide();
	    		})
	    	}
	    })
        
	    /* 비밀번호 유효성 */
	    
	    $("#pwd").keyup(function(){
	    	
	    	if($(this).val() == ""){
	    		
	    		$("#checkPwd").show();
	    		$("#checkPwd").html("비밀번호를 입력해 주세요.")
	    		$("#checkPwd").removeClass("success");
	    	
	    	}else{
	    	
		    	if(!check_p.test($(this).val())) {
		    		
		    		$("#checkPwd").show();
		    		$("#checkPwd").html("영문 소문자와 숫자를 조합하여 4자~15자로 입력하세요.");
		    		$("#checkPwd").removeClass("success");
		    		
		    		$(this).focusout(function(){
		    			$("#checkPwd").show();
		    		})
		    	
		    	}else{
		    		
		    		$("#checkPwd").html("정상적으로 입력되었습니다.");
		    		$("#checkPwd").addClass("success");
		    		
		    		$(this).focusout(function(){
		    			$("#checkPwd").hide();
		    		})	
	    		}
	    	}
	    })
	    
	    /* 비밀번호 확인 */
	    
	    $("#checkPassword").keyup(function(){
	    	
			if($(this).val() == ""){
	    		
	    		$("#checkCheckPwd").show();
	    		$("#checkCheckPwd").html("비밀번호를 입력하세요.")
	    		$("#checkCheckPwd").removeClass("success");
	    	
	    	}else{
	    		
		    	if($(this).val() != $("#pwd").val()) {
		    		
		    		$("#checkCheckPwd").show();
		    		$("#checkCheckPwd").html("비밀번호가 일치하지 않습니다.");
		    		$("#checkCheckPwd").removeClass("success");
		    		
		    		$(this).focusout(function(){
		    			$("#checkCheckPwd").show();
		    		})
		    	
		    	}else{
		    		$("#checkCheckPwd").html("비밀번호가 일치합니다.");
		    		$("#checkCheckPwd").addClass("success");
		    		
		    		$(this).focusout(function(){
		    			$("#checkCheckPwd").hide();
		    		})
		    	}
	    	}
	    })
	    
	    
	    /* 이메일 유효성 */
	    
 		$("#email").keyup(function(){
	    	
	    	if(!check_e.test($(this).val())) {
	    		
	    		$("#checkEmail").show();
	    		$("#checkEmail").html("이메일 형식에 맞게 입력해 주세요.");
	    		$("#checkEmail").removeClass("success");
	    		
	    		$(this).focusout(function(){
	    			$("#checkEmail").show();
	    		})
	    	
	    	}else{
	    		
	    		$("#checkEmail").html("정상적으로 입력되었습니다.");
	    		$("#checkEmail").addClass("success");
	    		
	    		$(this).focusout(function(){
	    			$("#checkEmail").hide();
	    		})	
	    	}
	    })
	    
	    /* submit 버튼 누른 후 유효성 체크 */
	    
	    function joinSubmit() {
				
        	var id = $("#id").val();
        	
        	
        	if(!$("#id").hasClass("finished")){
        		alert("아이디 중복체크를 진행해 주세요.");
        		$("#id").val(id);
        		$("#id").val("");
        		$("#id").val(id);
        		$("#id").focus();
        		return false;
        		
        	}else if(!check_i.test($("#id").val())){
        		alert("아이디를 제대로 입력해 주세요.");
        		$("#id").val("");
        		return false;
        		
        	}else if($("#name").val() == ""){
        		alert("이름을 제대로 입력해 주세요.");
        		$("#name").val("");
        		return false;
        		
        	}else if(!check_n.test($("#nickname").val())){
        		alert("닉네임을 제대로 입력해 주세요.");
        		$("#nickname").val("");
        		return false;
        		
        	}else if(!check_p.test($("#pwd").val())){
        		alert("비밀번호를 제대로 입력해 주세요.");
        		$("#pwd").val("");
        		return false;
        		
        	}else {
        		$("#joinForm").submit();
        	}
        }
        
        
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
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("mainAddress").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("subAddress").focus();
	            }
	        }).open();
	    }
	    
    </script>
    
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>