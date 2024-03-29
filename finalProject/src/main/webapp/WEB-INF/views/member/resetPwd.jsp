<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>

    body{
        height: 100%;
        width: 100%;
        background: #f9f9f9 !important;
    }
    
    .login-form-area {
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 182px auto;
        padding: 30px;
        padding-bottom: 45px;
        color: #484848;
        width: 370px;
        border-radius: 8px;
        background-color: white;
        box-shadow: 0px 0px 24px rgba(0, 0, 0, 0.1);
    }
    
    .pSubject {
        margin: 0 auto;
        font-size: 30px;
        font-weight: 600;
        padding: 15px;
        color: #484848;
    }

    tr > td:nth-child(1) {
        color: #484848;
		font-weight: 600;
		font-size: 16px;
    }
    
    input[type=text],
	input[type=email] {
		border-style: none;
	    border-radius: 8px;
	    background: #F7F7F7;
	    height: 40px;
	    width: 270px;
	    padding: 10px;
    }
    
    .login-btn {
        font-size: 15px;
        font-weight: 600;
        color: #484848;
        border-style: none;
        border-radius: 8px;
        height: 40px;
        width: 270px;
    }

    .back-btn {
        position: absolute;
        display: inline-block;
        text-align: center;
        vertical-align: middle;
        font-weight: 700;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        border: 3px solid #f3f3f3;
        color: #f3f3f3;
        top: 18px;
        right: 17px;
    }

    .back-btn:hover {
        color:#FBD14B;
        border-color:#FBD14B;
        cursor: pointer;
    }
    
    input::placeholder { 
    	font-size: 80%;
    	color:#c4c4c4;
    }
    
    .id_ {
    	display: block;
	    font-weight: 400;
	    font-size: 14px;
	    text-align: right;
	    margin-top: 3px;
	    margin-right: 3px;
    }
    
    .modal-form-area {
    	display: flex;
	    flex-direction: column;
	    align-items: center;
	    margin: 30px;
    }
    
    .mSubject {
   		margin: 0 auto;
        font-size: 30px;
        font-weight: 600;
        padding: 15px;
        color: #484848;
    	padding-top: 0;
    }
    
    .close {
    	position: absolute;
	    right: 20px;
	    top: 13px;
    }
    
    .modal-dialog {
    	max-width: 375px !important;
    }
    
    .modal, .modal-open {
    	padding-right: 0 !important;
    }


</style>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="login-form-area">
        <div onclick="location.href='memberLoginView.do'" class="back-btn"><a>X</a></div>
        <span class="pSubject">Reset Password</span>
        <form action="findPwd.do" method="post">
            <table cellpadding="6px">
                <tr>
                    <td>
                        Id <br>
                        <input type="text" name="id" id="id" placeholder="아이디를 입력해 주세요.">
                        <span class="id_"><a href="#" data-toggle="modal" data-target="#myModal">Forgot ID? Click here</a></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email <br>
                        <input type="email" name="email" id="email" placeholder="이메일을 입력해 주세요.">
                    </td>
                </tr>
                <tr>
                    <td><button type="button" onclick="findPwd()" class="login-btn b-blue white">Submit</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
 
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-body">
		        <div class="modal-form-area">
		        	<div class="back-btn" data-dismiss="modal" aria-label="Close"><a>X</a></div>
			        <span class="mSubject">Find ID</span>
			        <form action="findPwd.do" method="post">
			            <table cellpadding="6px">
			                <tr>
			                    <td>
			                        Name <br>
			                        <input type="text" name="name" id="name" placeholder="가입시 등록한 이름을 입력해 주세요.">
			                    </td>
			                </tr>
			                <tr>
			                    <td>
			                        Email <br>
			                        <input type="email" name="email_" id="email_" placeholder="가입시 등록한 이메일을 입력해 주세요.">
			                    </td>
			                </tr>
			                <tr>
			                    <td><button type="button" onclick="findId()" class="login-btn b-blue white">Submit</button>
			                    </td>
			                </tr>
			            </table>
			        </form>
			    </div>
	      </div>
	    </div>
	  </div></div>
    
    <script>
    	function findPwd() {
    		
    		$.ajax({
				url : "findPwd.do",
				type : "POST",
				data : {
					id:$("#id").val(),
					email:$("#email").val()
				},
				success : function(result) {
						
					if(result == "메일로 임시 비밀번호가 발송되었습니다.") {
						alert(result);
						location.href="memberLoginView.do";
					}else {
						alert(result);
					}
				},
				error:function(request, status, errorData){
                    alert("error code: " + request.status + "\n"
                            +"message: " + request.responseText
                            +"error: " + errorData);
           		} 
			})
    	}
    	
    	function findId() {
    		
    		$.ajax({
				url : "findId.do",
				type : "POST",
				data : {
					name:$("#name").val(),
					email:$("#email_").val()
				},
				success : function(result) {
						
					if(result == "입력하신 정보와 일치하는 아이디가 없습니다.") {
						alert(result);
					}else {
						alert(result);
					}
				},
				error:function(request, status, errorData){
                    alert("error code: " + request.status + "\n"
                            +"message: " + request.responseText
                            +"error: " + errorData);
           		} 
			})
    		
    	}
    	
    	
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>