<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.rightArea{
        	margin-left: 19%;
  			width: 81%;
  			padding: 70px;
        	background: #f3f3f3;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
        }
        .DietTitle{
            font-size: 35px;
            margin-bottom: 30px;
        }
         .default-btn{
	    margin-left: 10px;
   		}
     input[type=text]{
        border-style: none;
	    border-radius: 8px;
	    height: 40px;
	    width: 260px;	
 		}
</style>
<body>
	<jsp:include page="../common/header.jsp"/>	
	<jsp:include page="../common/sidenaviDiet.jsp"/>
		<div class="rightArea">
			<h1 class="DietTitle">Edit Inbody</h1>
			<form action="InbodyEdit.do" method="post" >
				<table cellpadding="8px">
				<input type="hidden" value="${today }" id="In_date" name="inDate">
					<tr>
						<td>체중</td>
						<td><input type="text" id="In_weight" name="inWeight" value="${inbody.inWeight }" required></td>
					</tr>
					<tr>
						<td>골격근량</td>
						<td><input type="text" id="In_muscle" name="inMuscle" value="${inbody.inMuscle }" required></td>
					</tr>
					<tr>
						<td>체지방량</td>
						<td><input type="text" id="In_fat" name="inFat" value="${inbody.inFat }" required><button type="submit" class="default-btn b-yell">Edit</button></td>
					</tr>
				</table>
			</form>
		</div>
	<jsp:include page="../common/footer.jsp"/>

</body>
<script>
//숫자만
var check_i = RegExp(/^[0-9]+([,.][0-9]+)?$/);

$("#In_weight").blur(function(){
	if($(this).val() == ''){
		return;
	}
	
	if(!check_i.test($(this).val())){
		alert("숫자만 입력해주세요.");
		$("#In_weight").val('');
	}
})

$("#In_muscle").blur(function(){
	if($(this).val() == ''){
		return;
	}
	
	if(!check_i.test($(this).val())){
		alert("숫자만 입력해주세요.");
		$("#In_muscle").val('');
	}
})	
$("#In_fat").blur(function(){
	if($(this).val() == ''){
		return;
	}
	
	if(!check_i.test($(this).val())){
		alert("숫자만 입력해주세요.");
		$("#In_fat").val('');
	}
})	
</script>
</html>