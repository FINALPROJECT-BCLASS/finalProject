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
	    margin-bottom: 120px;
	    /* background: #F3F3F3; */
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
	    background: #F3F3F3;
	    height: 40px;
	    width: 327px;
	    padding: 10px;
	}
	
	tr > td:nth-child(1) {
		font-weight: 600;
		font-size: 18px;
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
	    background-color: #f3f3f3;
	}
	
	.button-area {
		width: 650px;
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
                    <td><input type="text" id="id"></td>
                </tr>
                <tr>
                    <td><a class="blue">*</a> Name</td>
                    <td><input type="text" id="name"></td>
                </tr>
                <tr>
                    <td><a class="blue">*</a> Nickname</td>
                    <td><input type="text" id="nickname"></td>
                </tr>
                <tr>
                    <td><a class="blue">*</a> Password</td>
                    <td><input type="password" id="password"></td>
                </tr>
                <tr>
                    <td><a class="blue">*</a> Check Password</td>
                    <td><input type="password" id="checkPwd"></td>
                </tr>
                <tr>
                    <td><a class="blue">*</a> Email</td>
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
                        <input type="text" id="postnumber">
                        <button class="default-btn b-yell">search</button>
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
                <tr>
                    <td><a class="blue">*</a> Set Main</td>
                    <td>
                        <input type="radio" name="setMain" value="1"> Plan
                        <input type="radio" name="setMain" value="2"> Habit Tracker<br>
                        <input type="radio" name="setMain" value="3"> Daily Record
                        <input type="radio" name="setMain" value="4"> Account Book<br>
                        <input type="radio" name="setMain" value="5"> Diet Diary
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Profile Image</td>
                    <td>
                    	<div class=profile-image-area>
                         <img class="profile-image" src="resources/images/icons/profile_default.png">
                        </div>
                       <div class="filebox"> 
						  <input type="file" id="file"> 
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
	    $("#file").on('change',function(){
		      var fileName = $("#file").val();
		      $(".upload-name").val(fileName);
	    });
    </script>
    
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>