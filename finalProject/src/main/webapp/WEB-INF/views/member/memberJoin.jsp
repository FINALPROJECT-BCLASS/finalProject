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

	.join-form-area{
	    float: right;
	    display: flex;
	    justify-content: center;
	    flex-direction: column;
	    align-items: center;
	    padding: 65px;
	    width: 75%;
	    height:100%;
	    background: #F3F3F3;
	}
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidenavi.jsp"/>

<div class="join-form-area">
        <span class="pSubject">Join</span>
        <form action="#">
            <table>
                <tr>
                    <td>* Id</td>
                    <td><input type="text" id="id"></td>
                </tr>
                <tr>
                    <td>* Name</td>
                    <td><input type="text" id="name"></td>
                </tr>
                <tr>
                    <td>* Nickname</td>
                    <td><input type="text" id="nickname"></td>
                </tr>
                <tr>
                    <td>* Password</td>
                    <td><input type="password" id="password"></td>
                </tr>
                <tr>
                    <td>* Check Password</td>
                    <td><input type="password" id="checkPwd"></td>
                </tr>
                <tr>
                    <td>* Email</td>
                    <td><input type="email" id="email"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Phone</td>
                    <td><input type="tel" id="phone"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Birth</td>
                    <td><input type="date" id="birth"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Address</td>
                    <td>
                        <input style="width:138px;" type="text" id="postnumber">
                        <button>search</button>
                    </td> 
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="text" id="address1"><br>
                        <input type="text" id="address2">
                    </td>
                </tr>
                <tr>
                    <td>* Set Main</td>
                    <td>
                        <input type="radio" name="setMain" value="1">Plan
                        <input type="radio" name="setMain" value="2">Habit Tracker<br>
                        <input type="radio" name="setMain" value="3">Daily Record
                        <input type="radio" name="setMain" value="4">Account Book<br>
                        <input type="radio" id="setMain" value="5">Diet Diary
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Profile Image</td>
                    <td>
                         <!-- <img src="">  -->
                         <!-- <input type="file" id="pImage"> -->  
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>