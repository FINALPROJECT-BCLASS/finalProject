<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	#postnumber {
	    margin-right: 6px;
		width:160px;
	}
	
	#id {
	    margin-right: 6px;
		width:237px;
	}
	
	
	/* 이미지 업로드 */
	
	.profile-image-area {
		display: inline-block;
	}
	
	.profile-image {
	    width: 60px;
	    height: 60px;
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
        <form action="#">
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
                    	<input type="text" name="nickname" id="nickname">
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
                    	<input type="password" id="checkPwd" required>
                    	<div class="check" id="checkPassword"></div>
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
                    <td><input type="date" name="birth" id="birth"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Address</td>
                    <td>
                        <input type="text" name="address" id="postnumber">
                        <button class="default-btn b-yell">Search</button>
                    </td> 
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="text" id="address1">
                    </td>
                </tr>
                <tr>
                	<td></td>
                	<td>
                        <input type="text" id="address2">
                	</td>
                </tr>
                <tr class="setMain">
                    <td class="setMain-td-f"><a class="blue">*</a> Set Main
                    	<div class="infoSetMain"><div class="square"></div>로그인시 첫 화면에 보여질 서비스를 선택하세요.</div>
                    </td>
                    <td>
                        <input type="radio" name="setMain" id="1" value="1"> <label for="1">Plan</label>
                        <input type="radio" name="setMain" id="2" value="2"> <label for="2">Habit Tracker</label><br>
                        <input type="radio" name="setMain" id="3" value="3"> <label for="3">Daily Record</label>
                        <input type="radio" name="setMain" id="4" value="4"> <label for="4">Account Book</label><br>
                        <input type="radio" name="setMain" id="5" value="5"> <label for="5">Diet Diary</label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Profile Image</td>
                    <td>
                    	<div class=profile-image-area>
                         <img class="profile-image" src="resources/images/icons/profile_default.png">
                        </div>
                       <div class="filebox"> 
						  <input type="file" name="file" id="file"> 
						  <input class="upload-name" value="Select file">
						  <label class="b-yell" for="file">Upload</label> 
						</div>
                         <!-- <input type="file" id="pImage"> -->  
                    </td>
                </tr>
            </table>
            <div class="button-area">
	            <button>Back</button>
	            <button>Reset</button>
	            <button>submit</button>
            </div>
        </form>
    </div>
    <script>
    
    
	    /* 파일 업로드 */
	    
	    $(document).ready(function(){
	    	
	    	var fileTarget = $('#file');
	    	
	    	fileTarget.on('change', function(){
	    		if(window.FileReader){
	    			var filename = $(this)[0].files[0].name;
	    		} else { 
	    			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일 이름만 추출
	    		}
	    		
	    		$(this).siblings('.upload-name').val(filename); // siblings : 나를 제외한 모든 요소들 중 탐색
	    	});	
    	});

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
   							$("#id").focus();
   						} else {
   							alert("사용 가능한 아이디입니다.");
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

	    /* For 유효성 검사 */
	    
    	var check_i = RegExp(/^(?=.*[a-zA-Z])(?=.*\d).{4,12}$/); // 아이디 체크
    	var check_p = RegExp(/^(?=.*[a-zA-Z])(?=.*\d).{4,15}$/); // 패스워드 체크
        var check_e = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); // 이메일 체크
    	
        var id = document.getElementById("id");
        var pwd = document.getElementById("pwd");
        var email = document.getElementById("email");
 
        
        /* 아이디 유효성 */
        
	    $(id).keyup(function(){
	    	
	    	if(!check_i.test($(this).val()) && $(this).val()){
	    		
	    		$("#checkId").show();
	    		$("#checkId").html("영문과 숫자를 조합하여 4자~12자로 입력하세요.");
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
	    })
        
        
	    /* 비밀번호 유효성 */
	    
	    $(pwd).keyup(function(){
	    	
	    	if(!check_p.test($(this).val())) {
	    		
	    		$("#checkPwd").show();
	    		$("#checkPwd").html("영문 숫자를 조합하여 4자~15자로 입력하세요.");
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
	    })
	    
	    /* 비밀번호 확인 */
	    
	    $(checkPwd).keyup(function(){
	    	if($(this).val() != $("#pwd").val()) {
	    		$("#checkPassword").show();
	    		$("#checkPassword").html("비밀번호가 일치하지 않습니다.");
	    		$("#checkPassword").removeClass("success");
	    		
	    		$(this).focusout(function(){
	    			$("#checkPassword").show();
	    		})
	    	
	    	}else{
	    		$("#checkPassword").html("비밀번호가 일치합니다.");
	    		$("#checkPassword").addClass("success");
	    		
	    		$(this).focusout(function(){
	    			$("#checkPassword").hide();
	    		})
	    	}
	    })
	    
	    
	    /* 이메일 유효성 */
	    
 		$(email).keyup(function(){
	    	
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
	    
	    
    </script>
    
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>