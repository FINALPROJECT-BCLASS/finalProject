<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DietCalendarView</title>
	<!-- slim.js -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>

	<!-- Calendar -->
	<link href='resources/css/main.css' rel='stylesheet' />
	<script src='resources/js/main.js'></script>
	
	<style>
	 body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #script-warning {
    display: none;
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    text-align: center;
    font-weight: bold;
    font-size: 12px;
    color: red;
  }

  #loading {
    display: none;
    position: absolute;
    top: 10px;
    right: 10px;
  }

  #calendar {
    max-width: 1100px;
    margin: 40px auto;
    padding: 0 10px;
  }
	
   .modal-content{ 
	position: auto;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
    width: 85% !important;	
    display: flex;
    align-items: center;
    padding: 40px; 
	}
	
	.modal-dialog{
		height: 100%;
	}
	
	.round {
		width: 70px;
	    height: 70px;
	    background: #f3f3f3;
	    border-radius: 50%;
	}
	#dietDetail{
		display: flex;
	    justify-content: center;
	    align-items: center;
	    text-align: center;
        margin: 20px 0;

	}
	.ModalTitle{
	    font-size: 30px;
	    font-weight: 700;
	    text-align: center;
	}


	</style>
</head>
<body>
		<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDiet.jsp"/>
			<div style="Float:right; width:81%">
				
			  <div id='script-warning'>
		 		 
			  </div>
			  
			
			  <div id='loading'>loading...</div><!-- 로딩을 보여주는곳? -->
			
			  <div id='calendar'></div>
				
			</div>
			
			
			<!-- modal -->
			<div class="modal fade" id="modal">
  				<div class="modal-dialog">
  					  <div class="modal-content">
  					  		<span class="ModalTitle">Today's Diet</span>
  					  		<table cellpadding="8px" id="dietDetail">
  					  			<tr>
  					  				<td><div class="round"></div></td>
  					  				<td><div class="round"></div></td>
  					  				<td><div class="round"></div></td>
  					  			</tr>
  					  			<tr>
  					  				<td>아침</td>
  					  				<td>오전간식</td>
  					  				<td>점심</td>
  					  			</tr>
  					  			<tr>
  					  				<td><div class="round"></div></td>
  					  				<td><div class="round"></div></td>
  					  				<td><div class="round"></div></td>
  					  			</tr>
  					  			<tr>
  					  				<td>점심간식</td>
  					  				<td>저녁</td>
  					  				<td>저녁간식</td>
  					  			</tr>
  					  		</table>
  					  		<button id="detailbtn" class="default-btn b-yell" type="button">상세보기</button>
       					 <!-- remote ajax call이 되는영역 -->
   					 </div>
  				</div>
			</div>
			
		<jsp:include page="../common/footer.jsp"/>	
</body>

	<script>
		function currentdate(date){
			var currentdate = date;
			console.log("에욱 " +currentdate);
			$("#detailbtn").click(function(){
				location.href="DietDetail.do?currentdate="+currentdate;
			})
		}
		
	 $(document).ready(function() {		
		 				//addEventListener ->지정한 이벤트가 대상에 전달될 때마다 호출할 함수 지정
		    var calendarEl = document.getElementById('calendar');

		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: ''/*'dayGridMonth,timeGridWeek,timeGridDay,listWeek' */
		      },
		      initialDate: new Date,
		      editable: false,		//편집 가능여부(드래그했을떄 옮겨가는것)
		      navLinks: false, // can click day/week names to navigate views
		      dayMaxEvents: true, // allow "more" link when too many events
		      events: {
		        
		        failure: function() {
		          			alert.log("에욱");
		        }
		      },
		      dateClick: function(info){
		    	 	$("#modal").modal();
		    	 	calendar.getEvents();
		    	 	
		    	 	 alert('Clicked on: ' + info.dateStr);
		    	 	 
		    	 	currentdate(info.dateStr);
		    	 	 
		    	  /*    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
		    	     alert('Current view: ' + info.view.type); */
		    	     // change the day's background color just for fun
		    	 /*     info.dayEl.style.backgroundColor = 'red'; */
		    	 	
		      },
		      loading: function(bool) {
		        document.getElementById('loading').style.display =
		          bool ? 'block' : 'none';
		      }
		    });

		    calendar.render();
		  });
	</script>


</html>