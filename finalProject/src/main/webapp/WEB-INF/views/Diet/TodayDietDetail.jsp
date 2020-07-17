<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodayDietDetail</title>
<style>
/* .left-navi-area:after {  display:block; content:""; clear:both;} */
.sky {
            background-color: #6B98FF;
        }

        .pink {
            background-color: #FFA3E5;
        }

        .light-purple {
            background-color: #C9A8FF;
        }

        .green {
            background-color: #50c6b0;
        }
        
        td{
        	width:100px;
        	height:60px;
        }
        
        #Dietbar{
        	text-align:center;
        	margin: 50px;
        }
        
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
        }
        
        .round {
			width: 70px;
		    height: 70px;
		    background: rgb(224, 224, 224);
		    border-radius: 50%;
		    margin: 0 auto;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		#dietDetail{
			display: flex;
		    justify-content: center;
		    align-items: center;
		    text-align: center;
	        margin: 20px 0;
	
		}
		.DietWhen{
		    display: flex;
		    justify-content: center;
		    align-items: center;
			
		}
		
		.DietInbody {
			 margin-left: 90px;
		}
		
		/* .DietInbody tr td:nth-child(2) {
			background:rgb(224, 224, 224);
			width: 200px;
            color: #484848;
            text-align: left;
            font-weight: 600;
            font-size: 16px;
        
		} */
		
		.DietInbody tr td:nth-child(2) div {
			display: flex;
		    align-items: center;
		    padding: 5px;
		    background: rgb(224, 224, 224);
		    width: 200px;
		    height: 40px;
		    color: #484848;
		    font-size: 14px;
		    border-radius: 10px;
        
		}
		
	.ModalTitle{
	    font-size: 30px;
	    font-weight: 700;
	    text-align: center;
	}
	 .modal-content{ 
		position: auto;
		top:50%;
		left:50%;
		transform: translate(-50%,-50%);
	    display: flex;
	    align-items: center;
	    padding: 40px; 
	}
	
	.modal-dialog{
		height: 100%;
	}
	
	.modal {
		padding-right:0 !important;
	}
	
	.modal-item {
		background: #f3f3f3;
	    width: 300px;
	    border-radius: 10px;
        margin: 35px;
	}
	
	.modal-item  td {
		height:40px !important;
	}
	
	.modal-item tr td:nth-child(2) {
	    text-align: right;
		    
        
		}
	
		
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidenaviDiet.jsp"/>
	<input type="hidden" name="today" value="${today }" id="today">
	<div class="rightArea">
		<h1 class="DietTitle">Today's Diet</h1>
		<table id="Dietbar">
			<tr>
				<td class="b-yell">${totaldiet.diCar }</td>
				<td class="sky">${totaldiet.diPro }</td>
				<td class="green">${totaldiet.diFat }</td>
				<td class="light-purple">${totaldiet.diNa }</td>
			</tr>
			<tr>
				<td>탄수화물</td>
				<td>단백질</td>
				<td>지방</td>
				<td>나트륨</td>
			</tr>
		</table>
		
		<div class="DietWhen">
		<!--  form 추가부분 -->
		<table cellpadding="8px" id="dietDetail">
  			<tr>
  				<td><div class="round" id="Breakfast">${breakfast }Kcal</div></td>
  				<td><div class="round" id="Morningsanck">${morningSnack }Kcal</div></td>
  				<td><div class="round" id="Lunch">${Lunch }Kcal</div></td>
  			</tr>
  			<tr>
  				<td>아침</td>
  				<td>아침간식</td>
  				<td>점심</td>
  			</tr>
  			<tr>
  				<td><div class="round" id="Lunchsnack">${Lunchsnack }Kcal</div></td>
  				<td><div class="round" id="Dinner">${Dinner }Kcal</div></td>
  				<td><div class="round" id="Dinnersnack">${Dinnersnack }Kcal</div></td>
  			</tr>
  			<tr>
  				<td>점심간식</td>
  				<td>저녁</td>
  				<td>저녁간식</td>
  			</tr>
  		</table>
  		<!--  form 추가부분2 -->
  		<c:if test="${!empty inbody }">
		<table cellpadding=8px; class="DietInbody">
  			<tr>
  				<td>몸무게</td>
  				<td><div>${ inbody.inWeight}</div></td>
  			</tr>
  			<tr>
  				<td>근육량</td>
  				<td><div>${ inbody.inMuscle}</div></td>
  			</tr>
  			<tr>
  				<td>체지방량</td>
  				<td><div>${ inbody.inFat}</div></td>
  			</tr>
  			<tr>
  				<td colspan="2"><button class="default-btn b-yell" style="float:right;" id="InbodyInsertbtn">Edit</button></td>
  			</tr>
  		</table>
  		</c:if>
  		<c:if test="${empty inbody }">
  		<table cellpadding=8px; class="DietInbody">
  			<tr>
  				<td>몸무게</td>
  				<td><div></div></td>
  			</tr>
  			<tr>
  				<td>근육량</td>
  				<td><div></div></td>
  			</tr>
  			<tr>
  				<td>체지방량</td>
  				<td><div></div></td>
  			</tr>
  			<tr>
  				<td colspan="2"><button class="default-btn b-yell" style="float:right;" id="InbodyInsertbtn">Edit</button></td>
  			</tr>
  		</table>
  		</c:if>
  		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<!--  모달 -->
	<div class="modal fade" id="modal" >
  				<div class="modal-dialog">
  					  <div class="modal-content">
  					  		<span class="ModalTitle"><div id="foodwhen"></div></span>
  					  		<table cellpadding="10px" class="modal-item" id="modalDietlist">
  					  			<tr>
  					  				<td>라면</td>
  					  				<td>300 kcal</td>
  					  			</tr>
  					  		</table>
  					  		<div class="button-area">
  					  			<button class="default-btn b-yell" id="TodayDietInsertbtn">Add</button>
  					  			<button class="default-btn b-yell">Edit</button>

  					  		</div>
  					  </div>
  				</div>
  	</div>	
</body>
<script>
		$(document).on("click","#modalDietlist > tr",function(){
			var foodname = $(this).children().first().html();
			var today =$("#today").val();
			var foodwhen=$("#foodwhen").html();
			console.log("잘 나오니? " + foodname + " " + today + " " + foodwhen);
			
			 location.href="fooddetail.do?foodname="+ foodname+"&today="+today+"&foodwhen="+foodwhen; 
		}); 
		
	
		$(function(){
			$("#InbodyInsertbtn").click(function(){
				var today = $("#today").val();
				console.log(today);
				  location.href="InbodyInsertView.do?today=" + today; 
			})
		})
	
		$(function(){
			$("#TodayDietInsertbtn").click(function(){
				var today = $("#today").val();
				var dietwhen = $("#foodwhen").html();
 				location.href="TodayDietInsertView.do?today=" + today +"&&dietwhen="+ dietwhen;
			})
		});

		
	$(function(){
		$("#Breakfast").click(function(){
			$("#foodwhen").html("아침");
			modalAjax();
			$("#modal").modal();
		})
		
		$("#Morningsanck").click(function(){
			$("#foodwhen").html("아침간식");
			modalAjax();
			$("#modal").modal();
		})
		
		$("#Lunch").click(function(){
			$("#foodwhen").html("점심");
		 	modalAjax();
			$("#modal").modal();
		})
		
		$("#Lunchsnack").click(function(){
			$("#foodwhen").html("점심간식");
			modalAjax()
			$("#modal").modal();
		})
		
		$("#Dinner").click(function(){
			$("#foodwhen").html("저녁");
			modalAjax()
			$("#modal").modal();
		})
		
		$("#Dinnersnack").click(function(){
			$("#foodwhen").html("저녁간식");
			modalAjax()
			$("#modal").modal();
		})
		
	});
	
	
	function modalAjax(){
		var today =$("#today").val();
		var dtwhen = $("#foodwhen").html();
		console.log("today: "  + today + ", dtwhen: " + dtwhen);
		$.ajax({
			url:"todayDietDetailAjax.do",
			data:{today:today,dtwhen:dtwhen},
			dataType:"json",
			success:function(data){
				$modalDietlist = $("#modalDietlist");
				$modalDietlist.html("");
				
				var $tr;
				var $food;
				var $kcal;
				for(var i in data.list){
					$tr = $("<tr>");
					$food = $("<td>").text(data.list[i].foodname + " " + data.list[i].amount);
					$kcal = $("<td>").text(data.list[i].kcal);
					
					$tr.append($food);
					$tr.append($kcal);
					$modalDietlist.append($tr);
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
</html>