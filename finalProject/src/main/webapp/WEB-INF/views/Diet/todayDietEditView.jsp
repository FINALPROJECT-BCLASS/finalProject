<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todayDietEditView</title>
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
			
			<form action="DietEdit.do" method="post">
				<table cellpadding="8px">
					<input type="hidden" value="${diet.diNo}" id="dtno" name="diNo">
					<input type="hidden" value="${diet.dtDate}" id="In_date" name="dtDate">
					<input type="hidden" value="${diet.dtWhen}" name="dtWhen">
					<tr>
						<td>음식명</td>
						<td><input type="text" id="FoodName" name="diFood" value="${diet.diFood}" required></td>
					</tr>
					<tr>
						<td>수량</td>
						<td><input type="text" id="FoodCount" name="foodCount" value="${foodCount}" required> <input type="text" id="FoodCountUnit" name="foodCountUnit" value="${FoodCountUnit }" placeholder="개,회 등" required></td>
					</tr>
					<tr>
						<td>칼로리</td>
						<td><input type="text" id="Kcal" name="diKcal" value="${diet.diKcal}" required></td>
					</tr>
					<tr>
						<td>탄수화물</td>
						<td><input type="text" id="Clabo" name="diCar" value="${diet.diCar}" required></td>
					</tr>
					<tr>
						<td>단백질</td>
						<td><input type="text" id="Protain" name="diPro" value="${diet.diPro}" required></td>
					</tr>
					<tr>
						<td>지방</td>
						<td><input type="text" id="Fat" name="diFat" value="${diet.diFat}" required></td>
					</tr>
					<tr>
						<td>나트륨</td>
						<td><input type="text" id="Natrium" name="diNa" value="${diet.diNa}" required> <button type="submit" class="default-btn b-yell">Edit</button></td>
					</tr>
				</table>
			</form>
		</div>
		
		<jsp:include page="../common/footer.jsp"/>	

</body>
</html>