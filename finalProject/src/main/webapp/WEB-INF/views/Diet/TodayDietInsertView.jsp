<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodayDietInsertView</title>
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
    		margin-bottom: 40px;
        }
        
    input[type=text]{
        border-style: none;
	    border-radius: 8px;
	    height: 40px;
	    width: 260px;	
    }
    
    #FoodCount {
    	width: 150px;
   	    margin-right: 10px;
    }
    
    #FoodCountUnit {
    	width: 95px;
    }
    
    .default-btn{
	    margin-left: 10px;
    }
    
    
    
</style>
</head>
<body>
		<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDiet.jsp"/>
		
		<div class="rightArea">
			<h1 class="DietTitle">Add Diet</h1>
			
			<form>
				<table cellpadding="8px">
					<tr>
						<td>음식명</td>
						<td><input type="text" id="FoodName"></td>
					</tr>
					<tr>
						<td>수량</td>
						<td><input type="text" id="FoodCount"> <input type="text" id="FoodCountUnit"></td>
					</tr>
					<tr>
						<td>칼로리</td>
						<td><input type="text" id="Kcal"></td>
					</tr>
					<tr>
						<td>탄수화물</td>
						<td><input type="text" id="Clabo"></td>
					</tr>
					<tr>
						<td>단백질</td>
						<td><input type="text" id="Protain"></td>
					</tr>
					<tr>
						<td>지방</td>
						<td><input type="text" id="Fat"></td>
					</tr>
					<tr>
						<td>나트륨</td>
						<td><input type="text" id="Natrium"> <button type="submit" class="default-btn b-yell">Add</button></td>
					</tr>
				</table>
			</form>
		</div>
		
		<jsp:include page="../common/footer.jsp"/>	
</body>
</html>