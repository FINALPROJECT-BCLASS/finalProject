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
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 150px auto;
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
	input[type=password] {
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

    .join-btn {
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

</style>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="login-form-area">
        <span class="pSubject">Login</span>
        <form action="login.do" method="post">
            <table cellpadding="6px">
                <tr>
                    <td>
                        Id <br>
                        <input type="text" name="id" placeholder="아이디를 입력해 주세요.">
                    </td>
                </tr>
                <tr>
                    <td>
                        Password <br>
                        <input type="password" name="pwd" placeholder="비밀번호를 입력해 주세요.">
                    </td>
                </tr>
                <tr>
                    <td><button type="submit" class="login-btn b-blue white">Login</button>
                    </td>
                </tr>
            </table>
        </form>
        <c:url var="joinview" value="join.do"/>
        <a href="#">Forgot Password? Click here</a>
        <button class="join-btn" onclick="location.href='${joinview}'">Join us</button>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>