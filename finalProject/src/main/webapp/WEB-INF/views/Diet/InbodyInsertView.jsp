<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InbodyInsertView</title>
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
</head>
<body>
	<jsp:include page="../common/header.jsp"/>	
	<jsp:include page="../common/sidenaviDiet.jsp"/>
		<div class="rightArea">
			<h1 class="DietTitle">Edit Inbody</h1>
			<form>
				<table cellpadding="8px">
					<tr>
						<td>체중</td>
						<td><input type="text" id="Weight"></td>
					</tr>
					<tr>
						<td>골격근량</td>
						<td><input type="text" id="Muscle"></td>
					</tr>
					<tr>
						<td>체지방량</td>
						<td><input type="text" id="Fat"> <button type="submit" class="default-btn b-yell">Add</button></td>
					</tr>
				</table>
			</form>
		</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>