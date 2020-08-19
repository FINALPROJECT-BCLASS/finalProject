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
		    cursor:pointer;
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
	        text-align: left;
		    width: 65%;
		    padding-left: 0;
	        cursor: pointer;
		}
	.dietchk{
	display: flex;
    justify-content: center;
    align-items: center;
    padding: 0;
	}
	.modal-item td{
	width: initial;
    padding-right: 15px;
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
				<td>탄수화물(g)</td>
				<td>단백질(g)</td>
				<td>지방(g)</td>
				<td>나트륨(mg)</td>
			</tr>
		</table>
		
		<div class="DietWhen">
		<!--  form 추가부분 -->
		<table cellpadding="8px" id="dietDetail">
			<tr>
            	<td colspan="3"><div class="comment" style="color:gray;">Please click and check.</div>
         	</tr>
  			<tr>
  				<td>
  				<c:if test="${breakfast ne 0 }">
  				<div class="round" id="Breakfast" style="background:#FBD14B">${breakfast }Kcal</div>
  				</c:if>
  				<c:if test="${breakfast eq 0 }">
  				<div class="round" id="Breakfast">${breakfast }Kcal</div>
  				</c:if>
  				</td>
  				<td>
				<c:if test="${morningSnack ne 0 }">
  					<div class="round" id="Morningsanck" style="background:#FBD14B">${morningSnack }Kcal</div>
  				</c:if>
  				<c:if test="${morningSnack eq 0 }">
  					<div class="round" id="Morningsanck">${morningSnack }Kcal</div>
  				</c:if>
  				</td>
  				<td>
				<c:if test="${Lunch ne 0 }">
					<div class="round" id="Lunch" style="background:#FBD14B">${Lunch }Kcal</div>
  				</c:if>
  				<c:if test="${Lunch eq 0 }">
  					<div class="round" id="Lunch">${Lunch }Kcal</div>
  				</c:if>
  				</td>
  			</tr>
  			<tr>
  				<td>아침</td>
  				<td>아침간식</td>
  				<td>점심</td>
  			</tr>
  			<tr>
  				<td>
				<c:if test="${Lunchsnack ne 0 }">
					<div class="round" id="Lunchsnack" style="background:#FBD14B">${Lunchsnack }Kcal</div>
  				</c:if>
  				<c:if test="${Lunchsnack eq 0 }">
  					<div class="round" id="Lunchsnack">${Lunchsnack }Kcal</div>
  				</c:if>
  				</td>
  				<td>
				<c:if test="${Dinner ne 0 }">
					<div class="round" id="Dinner" style="background:#FBD14B">${Dinner }Kcal</div>
  				</c:if>
  				<c:if test="${Dinner eq 0 }">
  					<div class="round" id="Dinner">${Dinner}Kcal</div>
  				</c:if>
  				</td>
  				<td>
				<c:if test="${Dinnersnack ne 0 }">
					<div class="round" id="Dinnersnack" style="background:#FBD14B">${Dinnersnack}Kcal</div>
  				</c:if>
  				<c:if test="${Dinnersnack eq 0 }">
  					<div class="round" id="Dinnersnack">${Dinnersnack}Kcal</div>
  				</c:if>
  				</td>
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
  				<td><div class="inWeight">${ inbody.inWeight}</div></td>
  			</tr>
  			<tr>
  				<td>근육량</td>
  				<td><div class="inMuscle">${ inbody.inMuscle}</div></td>
  			</tr>
  			<tr>
  				<td>체지방량</td>
  				<td><div class="inFat">${ inbody.inFat}</div></td>
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
  				<td><div class="inWeight"></div></td>
  			</tr>
  			<tr>
  				<td>근육량</td>
  				<td><div class="inMuscle"></div></td>
  			</tr>
  			<tr>
  				<td>체지방량</td>
  				<td><div class="inFat"></div></td>
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
  					  				<td class= "deletechk"><input type="checkbox"></td>
  					  				<td class='edit'></td>
  					  				<td></td>
  					  			</tr>
  					  		</table>
  					  		<div class="button-area">
  					  			<button class="default-btn b-yell" id="TodayDietInsertbtn">Add</button>
  					  			<button class="default-btn b-yell" id="deletebtn">Delete</button>

  					  		</div>
  					  </div>
  				</div>
  	</div>	
</body>
<script>


			//diet 편집.
		$(document).on("click",".edit",function(){
			var foodname = $(this).html();
			var today =$("#today").val();
			var foodwhen=$("#foodwhen").html();
			console.log("잘 나오니? " + foodname + " " + today + " " + foodwhen);
			
			 location.href="fooddetail.do?foodname="+ foodname+"&today="+today+"&foodwhen="+foodwhen; 
		}); 
		
	
		$(function(){
			$("#InbodyInsertbtn").click(function(){
				var today = $("#today").val();
				console.log(today);
				var inWeight = $(".inWeight").html();
				var inMuscle = $(".inMuscle").html();
				var inFat = $(".inFat").html();
				console.log("inWeight"+inWeight + "inMuscle : " + inMuscle +"inFat " +inFat);
		 		if(inWeight == "" && inMuscle == "" && inFat == ""){
				  location.href="InbodyInsertView.do?today=" + today; 
				}else{
					location.href="InbodyEditView.do?today="+today;
				} 
			})
		})
		//add btn
		$(function(){
			$("#TodayDietInsertbtn").click(function(){
				var today = $("#today").val();
				var dietwhen = $("#foodwhen").html();
 				location.href="TodayDietInsertView.do?today=" + today +"&&dietwhen="+ dietwhen;
			})
		});
		
		//delete btn
		$(function(){
			$("#deletebtn").click(function(){
				//var chknum = $("input:checkbox:checked").val();
				var chknum="";
				
				$("input[name=diNo]:checkbox:checked").each(function() { 
					chknum += $(this).val() + ",";
					})
					
					if(chknum == ""){
						alert("삭제할것을 체크해주세요.");
					}
				
				var today = $("#today").val();
				
				location.href="deleteAjax.do?chknum="+chknum+"&currentdate="+today;

			})
		})
		
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
				
				var $ptintHTML;
				for(var i in data.list){
					$printHTML="<tr>"
								+"<td class='deletechk'><input type='checkbox' name='diNo' value="+data.list[i].diNo+"></td>"
								+"<td class='edit'>"+data.list[i].foodname + " " + data.list[i].amount +"</td>"
								+"<td>"+data.list[i].kcal+"Kcal</td>";
					$modalDietlist.append($printHTML);
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