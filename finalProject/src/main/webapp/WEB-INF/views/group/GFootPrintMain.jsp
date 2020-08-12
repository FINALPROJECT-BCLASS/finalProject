<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=282ad558d1e7ac4bd914010bf579f327&libraries=services"></script> <!-- 지도 api -->
<style>
	.join-form-area{padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
	#map{border-radius:10px;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
  		<c:if test="${ groupTable.id eq gInfo.loginUserId}">
			<jsp:include page="../common/sidenaviGroupAdmin.jsp"/>
		</c:if>
		
		<c:if test="${ groupTable.id ne gInfo.loginUserId}">
			<jsp:include page="../common/sidenaviGroup.jsp"/>
		</c:if>
		
		 <div class="join-form-area">
			<jsp:include page="../common/groupNoticeHeader.jsp"/>
			
			 <h1>Group Diary</h1>
			 <h4>FootPrint</h4>
			 <h6 style="color:gray; ">"Follow in our footsteps "</h6>
			 <br>
			<div id="map" style="width:80%;height:800px;"></div>

			
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(36.6423128599305, 128.068037365551), // 지도의 중심좌표
			        level: 12 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 
			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다
			
			var positions = [];   
			
			/* 수정예정  */
			
	
			
			var coordY;
			var coordX;
			var title;
			var Date;
			var gpNo;
	 		<c:forEach var="p" items="${planList}">
	 			coordY = '${p.gpCoordY}';
	 			coordX = '${p.gpCoordX}';
	 			title = '${p.gpTitle}';
	 			date = '${p.gpStart}';
	 			gpNo = '${p.gpNo}';
	 			positions.push(
	 				 
				    {
				        content: '<div>'+date +' / '+ title+'</div>', 
				        latlng: new kakao.maps.LatLng(coordX, coordY)
				    }
	 				
	 				
	 			);
	 		</c:forEach>
	 			console.log("p"+ positions[0].latlng );
	 		 	   
			for (var i = 0; i < positions.length; i ++) {
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커의 위치
			        clickable: true
			    });
			
			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].content // 인포윈도우에 표시할 내용
			    });
			
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			}
			
			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}
			
			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			
			/* kakao.maps.event.addListener(marker, 'click', function() {
			   location.href="groupCalendarMain.do";  
			}); */
			
			
			kakao.maps.event.addListener(marker, 'click', function() { 
				
				 location.href="groupCalendarMain.do";  
			});

				
			</script>
			
			
		</div>


  <jsp:include page="../common/footer.jsp"/>	 
</body>
</html>