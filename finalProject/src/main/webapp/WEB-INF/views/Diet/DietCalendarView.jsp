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
  <!-- bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
	
	</style>
</head>
<body>
		<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDiet.jsp"/>
			<div style="Float:right; width:81%">
				
			  <div id='script-warning'>
		<%-- 	 <code>php/get-events.php</code> must be running.  --%>
			  </div>
			  
			
			  <div id='loading'>loading...</div><!-- 로딩을 보여주는곳? -->
			
			  <div id='calendar'></div>
				
			</div>
		<jsp:include page="../common/footer.jsp"/>	
</body>

	<script>
	 document.addEventListener('DOMContentLoaded', function() {		
		 				//addEventListener ->지정한 이벤트가 대상에 전달될 때마다 호출할 함수 지정
		    var calendarEl = document.getElementById('calendar');

		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		         right: /*'dayGridMonth,timeGridWeek,timeGridDay,listWeek' */''
		      },
		      initialDate: '2020-07-13',
		      editable: true,
		      navLinks: true, // can click day/week names to navigate views
		      dayMaxEvents: true, // allow "more" link when too many events
		      events: {
		        url: 'php/get-events.php',
		        
		        failure: function() {
		          document.getElementById('script-warning').style.display = 'block'
		        }
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