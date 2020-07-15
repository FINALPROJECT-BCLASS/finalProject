<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="rightArea">
		<h1 class="DietTitle">Today's Diet</h1>
		<table id="Dietbar">
			<tr>
				<td class="b-yell"></td>
				<td class="sky"></td>
				<td class="green"></td>
				<td class="light-purple"></td>
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
  				<td><div class="round" id="Breakfast"></div></td>
  				<td><div class="round" id="Morningsanck"></div></td>
  				<td><div class="round" id="Lunch"></div></td>
  			</tr>
  			<tr>
  				<td>아침</td>
  				<td>오전간식</td>
  				<td>점심</td>
  			</tr>
  			<tr>
  				<td><div class="round" id="Lunchsnack"></div></td>
  				<td><div class="round" id="Dinner"></div></td>
  				<td><div class="round" id="Dinnersnack"></div></td>
  			</tr>
  			<tr>
  				<td>점심간식</td>
  				<td>저녁</td>
  				<td>저녁간식</td>
  			</tr>
  		</table>
  		<!--  form 추가부분2 -->
		<table cellpadding=8px; class="DietInbody">
  			<tr>
  				<td>몸무게</td>
  				<td><div>내용</div></td>
  			</tr>
  			<tr>
  				<td>근육량</td>
  				<td><div>내용</div></td>
  			</tr>
  			<tr>
  				<td>체지방량</td>
  				<td><div>내용</div></td>
  			</tr>
  			<tr>
  				<td colspan="2"><button class="default-btn b-yell" style="float:right;" id="InbodyInsertbtn">Edit</button></td>
  			</tr>
  		</table>
  		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<!--  모달 -->
	<div class="modal fade" id="modal" >
  				<div class="modal-dialog">
  					  <div class="modal-content">
  					  		<span class="ModalTitle"></span>
  					  		<table cellpadding="10px" class="modal-item">
  					  			<tr>
  					  				<td><input type="checkbox"> 라면</td>
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
		$(function(){
			$("#InbodyInsertbtn").click(function(){
				location.href="InbodyInsertView.do";
			})
		})
	
		$(function(){
			$("#TodayDietInsertbtn").click(function(){
 				location.href="TodayDietInsertView.do";
			})
		});

		
	$(function(){
		$("#Breakfast").click(function(){
			$(".ModalTitle").html("아침");
			$("#modal").modal();
		})
		
		$("#Morningsanck").click(function(){
			$(".ModalTitle").html("아침간식");
			$("#modal").modal();
		})
		
		$("#Lunch").click(function(){
			$(".ModalTitle").html("점심");
			$("#modal").modal();
		})
		
		$("#Lunchsnack").click(function(){
			$(".ModalTitle").html("점심간식");
			$("#modal").modal();
		})
		
		$("#Dinner").click(function(){
			$(".ModalTitle").html("저녁");
			$("#modal").modal();
		})
		
		$("#Dinnersnack").click(function(){
			$(".ModalTitle").html("저녁간식");
			$("#modal").modal();
		})
		
	});
</script>
</html>