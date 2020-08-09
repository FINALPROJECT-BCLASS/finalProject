<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookmark List</title>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/flickity/flickity.css">
<!-- JavaScript -->
<script src="resources/js/flickity/flickity.pkgd.min.js"></script>       
<style>

        body {
            font-size: 14px;
            color: #484848;
            margin: 0;
            padding: 0;
        }
        
        /* body::-webkit-scrollbar {
  		  	display: none; 
		} */

        .right-area {
            display: flex;
		    flex-direction: column;
		    justify-content: center;
		    float: right;
		    width: 81%;
		    background-color: #f7f7f7;
		    color: #484848;
		    text-align: center;
		    padding: 88px 50px;
        }

        .pSubject {
            font-size: 30px;
            font-weight: 600;
            padding: 30px;
            padding-top: 0;
            color: #484848;
            display: inline-block;
        }

        .swiper-container {
            width: 100%;
            height: 100px;
        }

        .swiper-slide {
            /* text-align: center; */
            width: 252px !important;
            margin: 0 3.2px !important;
            border-radius: 8px;
            font-size: 18px;
            background: #c4c4c4;
            padding: 20px 35px;
            justify-content: left !important;
            align-items: center !important;
            display: flex !important;
            cursor: pointer;
            position: relative;
        }

        .swiper-slide > div > span {
            margin-left: 15px;
            font-weight: 600;
        }

        .slide-show-area{
            height: 100%;
            width: 795px;
            padding: 10px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            position: relative;
            z-index: 0;
        }

        .group-img {
            width: 30px;
            height: 30px;
        }
        
        .clicked {
        	box-shadow: 0 0 0 3px #c4c4c4;
        }


        /* content */

        .content-box {
        	width: 100%;
            border-radius: 10px;
            background: white;
            display: block;
            margin-top: 30px;
            padding: 15px;
            padding-bottom:0;
            position:relative;
        }
        
        .content-box-2 {
        	width: 100%;
            border-radius: 10px;
            background: white;
            display: block;
            margin-top: 30px;
            padding: 15px;
        }

        .content-area {
            float: left;
            display: flex;
            flex-direction: column;
        }

        .content-item {
            font-size: 14px;
		    display: flex;
		    justify-content: flex-start;
		    align-items: flex-start;
		    padding: 10px;
		    height: 40px;
		    margin-bottom: 10px;
		    width: 292px;
		    background-color: #f3f3f3;
		    border-radius: 5px;
        }

        .map-area {
            float: right;
            display: flex;
            flex-direction: column;
        }

        .map-area > div {
            height: 370px;
            width: 717px;
            padding:10px;
            border-radius: 5px;
            background-color: #f3f3f3;
            display: flex;
        }

        .time {
            height: 80px;
        }

        .comment {
            height: 130px;
            margin-bottom: 0;
        }

        textarea {
            border: 0px;
            resize: none !important;
            cursor: initial;
        }

        textarea:focus {
            outline: none;
        }
        
        /* color */
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

        /* button */

        .button-area {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
            width: 100%;
	    }
	
        .button-area > button {
            border: none;
            height: 40px;
            margin: 0 5px;
            background: none;
            font-size: 23px;
            font-weight: 700;
            color: #484848;
            outline:none;
        }

        /* 북마크 세부 제목 */

        .title-area {
            display: flex;
            align-items: center;
            height: 40px;
            padding: 10px;
            border-radius: 5px;
        }

        .title-area > span {
            font-size: 18px;
            font-weight: 700;
            display: flex;
        }

        .title-area > div {
            padding: 0 10px;
            display: flex;
        }

        /* 북마크 맵 세부 목록 */

        .map-list {
        	height: 210px;
            overflow-y: scroll;
            display: flex;
            flex-wrap: wrap;
            margin-top: 15px;
            padding: 0;
            border: 15px solid white;
        }
        
        .map-list::-webkit-scrollbar {
		    display: none; 
        	
        }
        
        

        .map-item {
            display: flex;
		    flex-direction: column;
		    justify-content: center;
		    width: 186px;
		    height: 81px;
		    margin-right: 15px;
		    margin-bottom: 15px;
		    background: white;
		    border: 1px solid #f3f3f3;
		    border-left: 3px solid #d5d5d5;
		    align-items: start;
		    padding-left: 18px;
        }

        .map-info {
            margin-top: 15px;
            width: 100%;
        }

        .map-item > span:nth-child(1) {
            font-weight: 700;
    		font-size: 15px;
        }
        
        .map-item > span:nth-child(2) {
    		font-size: 14px;
        }

        .map-list > div:nth-child(5n) {
            margin-right: 0;
        }
        
        /* url 세부목록 */

        .url {
            /* display: inline-block; */
            display: none;
            width: 825px;
            height: 250px;
            margin-bottom: 0;
            padding: 0;
            overflow-x: scroll;
            white-space: nowrap;
            border: 10px solid #f3f3f3;
        }

        .url > div {
            display: inline-block;
            margin-right: 15px !important;
            width: 200px;
            height: 100%;
            background-color: white;
            border-radius: 8px;
        }
        
        hr {
        	width: 97%;
        }
        
        /* external css: flickity.css */

		* { box-sizing: border-box; }
		
		body { font-family: sans-serif; }
		
		.carousel {
		  height: 106px;
		  background: #f7f7f7;
		}
		
		.carousel-cell {
		 	width: 28%;
		    display: flex;
		    justify-content: flex-start;
		    align-items: center;
		    padding: 20px;
		    height: 100px;
		    margin-right: 10px;
		    background: white;
	    	border-radius: 8px !important;
		    counter-increment: carousel-cell;
		    position: relative;
		}
		
		.carousel-cell > div:nth-child(1) {
		    margin-left: 15px;
		}
		
		.carousel-cell > div:nth-child(2) {
		    margin-left: 15px;
		}
		
		.carousel-cell > div:nth-child(3) {
			position:absolute;
			right: 35px;
		}
		
		/* .carousel-cell.is-selected {
		  background: #ED2;
		} */
		
		/* cell number */
		.carousel-cell:before {
		  display: block;
		  text-align: center;
		  /* content: counter(carousel-cell); */
		  line-height: 100px;
		  font-size: 80px;
		  color: white;
		}
		        
		.flickity-slider {
		  position: absolute;
		  width: 100%;
		  height: 100%;
		  display: flex;
    	  align-items: center;
		}
		
		.flickity-viewport {
			height:100% !important;
		}
		
		
		/* 모달 */
		 .close {
        	position: absolute;
		    z-index: 1;
		    right: 10px;
		    top: 10px;
		    width: 30px;
		    height: 30px;
        }
        
        .modal-content {
       	    border-radius: 0.7rem !important;
       	    height: 155px;
        }
        
        .modal-body {
       	    padding: 16px !important;
        }
        
        .modal-dialog {
        	margin-top: 100px !important;
        	max-width: 415px !important;
        }
        
        .modal-t {
       	    margin: 15px;
    		text-align: center;
        }
        
        .modal-t > div:nth-child(1) {
       	    font-size: 21px;
    		font-weight: 600;
        }
        
        /* 작은 버튼 */
        
        .small-button-area {
	        display: flex;
		    justify-content: flex-end;
		    width: 100%;
		    font-size: 10px;
		    position: absolute;
		    right: 15px;
		    top: 15px;
        }
        
        .small-button-area > button {
        	border: none;
		    height: 40px;
		    margin: 0 5px;
		    background: none;
		    font-size: 18px;
		    font-weight: 700;
		    color: #b7b7b7;
		    
        }
        
        .default-btn {
        	width:120px !important;
        }
        
        .default-btn:hover {
        	background:#FBD14B;
        }
        
        .image-area {
        	width: 30px;
        	height: 30px;
        	overflow: hidden;
        	display: flex;
        	align-items: center;
        	justify-content: center;
        	border-radius: 50%;
        	
        }
        
        .image {
        	height: 110%;
        
        }
        
        .flickity-page-dots {
        	display:none;
        }
        
        .select {
        	
        }
        
        .mb_address_d {
        	overflow-y: scroll;
       	    text-align: left;
        }
        
        .mb_address_d::-webkit-scrollbar {
        	display:none;
        }
        
        input::placeholder,
        textarea::placeholder {
		  color: #cecece;
		  font-size: 13px;
		}
		
		.message {
			position: absolute;
		    top: 57px;
		    right: 100px;
		    border: 1px solid #f8dbdb;
		    background: rgb(255 247 247);
		    width: 500px;
		    height: 56px;
		    display: flex;
		    border-radius: 10px;
		    justify-content: center;
		    align-items: center;
		}
		
		.tri {
			position: absolute;
		    background: #fff7f7;
		    right: 163px;
		    top: 50px;
		    width: 15px;
		    height: 15px;
		    transform: rotate(45deg);
		    border-left: 1px solid #f9dfdf;
		    border-top: 1px solid #f9dfdf;
		    z-index: 1;
		}
		
		.tri {
	    animation: fadein 0.7s;
	    -webkit-animation: fadein 0.7s; /* Safari and Chrome */
		}
		
		.message {
		 animation: fadein 0.7s;
	    -webkit-animation: fadein 0.7s; /* Safari and Chrome */
		}
		
		@-webkit-keyframes fadein { /* Safari and Chrome */
		    from {
		        opacity:0;
		    }
		    to {
		        opacity:1;
		    }
		}
		
	


    </style>
    </head>

    <body>
    	<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDaily.jsp"/>
        <div class="right-area">
       
            <span class="pSubject">Bookmark</span>
                 <!-- 슬라이드 -->
            <div style="width: 100%">
	            <div class="carousel" data-flickity='{ "draggable": true }' style="width: 100%">
					<c:forEach var="bm" items="${bm }">
						<input class="bl_color" id="bl_color" type="hidden" name="bl_con" value="${bm.bl_color }">
						<input id="bl_con" type="hidden" name="bl_con" value="${bm.bl_con }">
						<input id="bl_type" type="hidden" name="bl_type" value="${bm.bl_type }">
						<input class="${bm.bl_no }" id="bl_no" type="hidden" name="bl_no" value="${bm.bl_no }">
						<div class="carousel-cell" style="background:${bm.bl_color }">
				  			<div class="image-area">
				  				<c:if test="${empty bm.bl_rename }">
									<c:if test="${bm.bl_type eq 'url'}">
										<span class="material-icons">link</span>
									</c:if>
									<c:if test="${bm.bl_type eq 'map'}">
										<span class="material-icons">place</span>
									</c:if>
			                   	</c:if>
			                   	<c:if test="${!empty bm.bl_rename }">
			                   		<img class="image" src="resources/bluploadFiles/${bm.bl_rename }">
			                   	</c:if>
			                </div>
							<div class="bl_title">
								${bm.bl_title }
							</div>
							<div>
								3
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

            <!-- Button Start-->
            <div class="button-area">
                <button type = "button" onclick="location.href='addBookmarkView.do'">Add</button>
                <button type = "button" onclick="editBookmark();">Edit</button>
                <button type = "button" onclick="deleteBookmark();">Delete</button>
                <!-- <button type = "button" data-toggle="modal" data-target="#select-type">Add</button> -->
            </div>
            <!-- Button End-->

            
            <div class="content-box intro" >
                <div class="title-area">
                    <span>맛집 List</span>
                    <div class="title-content">: 맛집 리스트 모음</div>
                </div>
                <div class="small-button-area">
        			<button type="button" onclick="addBookmark_m_u();">Add</button>
		            <button type="button" onclick="editBookmark_m_u();">Edit</button>
		            <button type="button" onclick="deleteBookmark_m_u();">Delete</button>
    			</div> 
	            <div class="content-box map-list">
	                <div class="map-item">
	                    <span></span>
	                    <span></span>
	                </div>
	            </div>
            </div>
            <div class="content-box-2 map-info">
                <div class="content-area">
                    <span class="content-item mb_title_d"></span>
                    <span class="content-item mb_phone_d"></span>
                    <span class="content-item mb_address_d"></span>
                    <textarea class="content-item time mb_time_d" readonly placeholder="Time"></textarea>
                    <textarea class="content-item comment mb_comment_d" readonly placeholder="Memo"></textarea>
                </div>
                <div class="map-area">
                    <div id="map"></div>
                </div>
            </div>
        </div>
		
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5165e87a2b10b900ab474145bc13247&libraries=services"></script>
		<script>
			
		
		
		
		
			$(document).ready(function(){
				
				if('${blNum}'){
					$(".${blNum}").next().trigger("click");
					
					// 왜 안 됨?
					if('${mbNum}'){
						
						/* $("#${mbNum}").click(); */
						/* $("#${mbNum}").trigger("click"); */
					/* 	$(document).on("click", '#${mbNum}'); */
					}
					
				}
				
			});
			
			var bl_no;
			var bl_type;
			
			// 북마크 그룹 내의 add 버튼 클릭시 실행되는 함수
			function addBookmark_m_u() {
				
				bl_no = $(".clicked").prev().val();
				bl_type = $(".clicked").prev().prev().val();
				
				if(bl_type == "map") {
					
					location.href='addBookmarkMapView.do?bl_no='+ bl_no;
					
				}else {
					
					location.href='addBookmarkUrlView.do?bl_no='+ bl_no;
				}
				
			}
			
			
			// 북마크 그룹 내의 delete 버튼 클릭시 실행되는 함수
			function deleteBookmark_m_u() {
				
				bl_no = $(".clicked").prev().val();
				bl_type = $(".clicked").prev().prev().val();
				
				var mb_no = $(".select").find(".mb_no").val();
				
				if(mb_no != undefined) {
					
					if(bl_type == "map") {
						
						if(!confirm('정말 삭제하시겠습니까?')){
							return false;
						}else{
							
							$.ajax({
					    	    method: 'POST',
					    	    url: 'deleteBookmarkMap.do',
					    	    data: {'bl_no':bl_no, 'mb_no':mb_no},
					    	    success : function(data) {
										
					    	    	if(data == "success"){
					    	    		$("."+bl_no).next().trigger("click");
					    	    	}else {
					    	    		alert("삭제 실패, 다시 시도해 주세요."); 
					    	    	}
					    	    	
					    	    },
					    	    error:function(request, status, errorData){
			                        alert("error code: " + request.status + "\n"
			                              +"message: " + request.responseText
			                              +"error: " + errorData);
			             		} 
					    	 
					    	});	
							
						}
							
							/* location.href='deleteBookmarkMap.do?mb_no='+ mb_no +'&bl_no='+bl_no; */
						} else {
						
						/* location.href='editBookmarkUrlView.do?mb_no='+ mb_no; */
						
					}
				
				}else {
					
					alert("삭제할 북마크를 선택해 주세요.");
					
				}
				
			}
			
			// 북마크 그룹 내의 edit 버튼 클릭시 실행되는 함수
			function editBookmark_m_u() {
				
				bl_no = $(".clicked").prev().val();
				bl_type = $(".clicked").prev().prev().val();
				
				var mb_no = $(".select").find(".mb_no").val();
				
				console.log("북마크 번호 : " + mb_no);
				console.log("북마크 타입 : " + bl_type);
				
				if(mb_no != undefined) {
					
					if(bl_type == "map") {
						
						location.href='editBookmarkMapView.do?mb_no='+ mb_no;
						
					} else {
						
						/* location.href='editBookmarkUrlView.do?mb_no='+ mb_no; */
						
					}
				
				}else {
					
					alert("수정할 북마크를 선택해 주세요.");
					
				}
				
			}
			
		
		
			$(".content-box").hide();
			$(".content-box-2").hide();
			
			
			var target = $(".carousel-cell");
			
			// 북마크 그룹 클릭시 실행
			target.on("click", function() {
				
				target.not($(this)).removeClass("clicked");
				
				$(this).addClass("clicked");
				$(".content-box-2").hide();
				
				var bl_title = $(".clicked").find(".bl_title").html();
				var bl_con = $(".clicked").prev().prev().prev().val();
				
				$(".content-box").show();
				$(".title-area > span:nth-child(1)").html(bl_title);
				$(".title-content").html(bl_con);
				
				// 지도 북마크 리스트 불러오기
				showBoookmarkMapList();
				
			});
			
			
			// 지도 북마크 리스트 불러오기
			function showBoookmarkMapList() {
				
				var bl_no = $(".clicked").prev().val();
				
				$.ajax({
		    	    method: 'POST',
		    	    url: 'selectBookmarkMapList.do',
		    	    data: {'bl_no':bl_no},
		    	    dataType:"json",
		    	    success : function(data) {
							console.log("data : " + data);
							$(".tri").remove();	
							$(".message").remove();
							
	   						$divBody = $(".map-list");
							$divBody.html("");
	   						
	   						var $div;
	   						
							for(var i in data.mbl){
								
								console.log(data.mbl[i]);
							
		   						var item = "<div class='map-item' id='"+ data.mbl[i].mb_no +"'>";
		   						var name = "<span>" + data.mbl[i].mb_title + "</span>";
		   						var phone = "<span>" + data.mbl[i].mb_phone + "</span>"
		   						var no = "<input type = 'hidden' class='mb_no' value='" + data.mbl[i].mb_no + "'>";
		   						var end = "</div>"
		   						
		   						$div = item + name + phone + no + end;
		   						
								$divBody.append($div);
								
							}
							
							if(data.mbl.length < 6) {
								
								$(".map-list").css("height", "130px");
								
							}else {
								
								$(".map-list").css("height", "210px");
							}
							
							if(data.mbl == "") {
								
								$(".map-list").hide();
								$(".intro").attr("style", "padding-bottom:15px;");
								$(".title-area").append("<div class='tri' style='padding:0;'></div><div class='message'>"+ "북마크를 추가해 주세요." +"</div>");
							
							}else {
								$(".map-list").show();
								$(".message").remove();
								$(".tri").remove();
								
							}
							
		    	    },
		    	    error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
             		} 
		    	 
		    	});	
				
			}
			
			// 지도 북마크 클릭시
			$(document).on('click', '.map-item', function(){ // 에이작스로 불러온 값에 click 이벤트가 먹지 않으면 이 형태로 사용
				
				
				var mb_no = $(this).find(".mb_no").val();
				var color = $(".clicked").prev().prev().prev().prev().val();
				
				console.log("find : " + color);
				
				// 선택된 북마크의 왼쪽 테두리 색 변경
				$(this).css("border-left", "3px solid" + color);
				$(this).addClass("select");
					
				$(".content-box-2").show();
				
				selectBookmarkMap(mb_no);
				
				
				// 선택된 태그가 지금 선택된 것이 아닐시 색상 초기화 / select 클래스명 제거
				$(".map-item").not($(this)).css("border-left", "3px solid #d5d5d5");
				$(".map-item").not($(this)).removeClass("select");
				
			});
			
			// 선택한 북마크 내용 가져오기
			function selectBookmarkMap(mb_no) {
				
				$.ajax({
		    	    method: 'POST',
		    	    url: 'selectBookmarkMap.do',
		    	    data: {'mb_no':mb_no},
		    	    dataType:"json",
		    	    success : function(data) {
						console.log("data : " + data);
						
						var add = data.mb_address;
						var address = add.split("_");
						
						/* console.log("1 : " + address[0]+ " 2 : " + address[1]); */
						
						$(".mb_title_d").html(data.mb_title);
						$(".mb_phone_d").html(data.mb_phone);
						$(".mb_comment_d").html(data.mb_memo);
						$(".mb_time_d").html(data.mb_time);
						$(".mb_address_d").html(address[0] + ", " + address[1]);
						
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
						

						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
					
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
					
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(address[0] , function(result, status) {
					
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
					
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
					
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div class="ma" style="width:150px; text-align:center; font-size:13px;">' + data.mb_title + '</div>'
						        });
						        
						        infowindow.open(map, marker);
					
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});
		    	    },
		    	    error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
             		} 
		    	 
		    	});	
				
			}
			
			
			
			
	        // 북마크 그룹 삭제 버튼 클릭시 실행
	        function deleteBookmark() {
	        	
	        	var bl_no = $(".clicked").prev().val();
	        	location.href="deleteBookmark.do?bl_no="+ bl_no;
	        	
	        }
	        
	        // 북마크 그룹 편집 버튼 클릭시 실행 
	        function editBookmark() {
	        	
				var bl_no = $(".clicked").prev().val();
	        	location.href="editBookmarkView.do?bl_no="+ bl_no;
	        	
	        }
	        
	        
	        $(function(){
				
		        var responseMessage = "<c:out value="${message}" />";
		        if (responseMessage != ""){alert(responseMessage)}
		   
		    });
            
        </script>
        <jsp:include page="../common/footer.jsp"/>
    </body>
</html> 