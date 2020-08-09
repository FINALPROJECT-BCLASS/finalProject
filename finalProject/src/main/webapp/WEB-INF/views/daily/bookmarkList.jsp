<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookmark List</title>
<!-- 카카오 지도 관련 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="dapi.kakao.com/v2/maps/sdk.js?appkey=a5165e87a2b10b900ab474145bc13247"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5165e87a2b10b900ab474145bc13247&libraries=services,clusterer,drawing"></script>
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

        .right-area {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            float: right;
            width: 81%;
            background-color: #f7f7f7;
            color: #484848;
            text-align: center;
            padding: 50px;
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
            vertical-align: center;
            padding:10px;
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
            height: 60px;
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
            overflow: auto;
            display: flex;
            flex-wrap: wrap;
            margin-top: 15px;
            padding: 0;
            border: 15px solid white;
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
		    border-left: 3px solid #FBD14B;
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
                <button type = "button" onclick="editBookmark()">Edit</button>
                <button type = "button" onclick="deleteBookmark()">Delete</button>
                <!-- <button type = "button" data-toggle="modal" data-target="#select-type">Add</button> -->
                <button type = "button" onclick="location.href='addBookmarkView.do'">Add</button>
            </div>
            <!-- Button End-->

            
            <div class="content-box intro" >
                <div class="title-area">
                    <span>맛집 List</span>
                    <div class="title-content">: 맛집 리스트 모음</div>
                </div>
                <div class="small-button-area">
        			<button type="button" onclick="addBookmark_m_u()">Add</button>
		            <button>Edit</button>
		            <button>Delete</button>
    			</div> 
	            <div class="content-box map-list">
	                <div class="map-item"> <!-- 맵 -->
	                    <span>노원 황소곱창</span>
	                    <span>02-1234-1234</span>
	                </div>
	            </div>
            </div>
            <div class="content-box-2 map-info">
                <div class="content-area">
                    <span class="content-item">노원 황소곱창</span>
                    <span class="content-item">02-0000-0000</span>
                    <span class="content-item time">주소입력란</span>
                    <textarea class="content-item time" readonly>평일 - 오전 9:00 ~ 오후 10:00
브레이크 타임 - 오후 3:00 ~ 오후 5:00</textarea>
                    <textarea class="content-item comment" readonly>글을 씁시다.글 쓴다구여어어어어어ㅓ엉 글써여</textarea>
                </div>
                <div class="map-area">
                    <div id="map">
                    </div>
                </div>
            </div>
        </div>
		
		<script>
		
			$(document).ready(function(){
				
				if('${blNum}' != null){
					$(".${blNum}").next().trigger("click");
				}
				
			});
		
			// 북마크 그룹 내의 add 버튼 클릭시 실행되는 함수
			function addBookmark_m_u() {
				
				var bl_no = $(".clicked").prev().val();
				var bl_type = $(".clicked").prev().prev().val();
				
				if(bl_type == "map") {
					
					location.href='addBookmarkMapView.do?bl_no='+ bl_no;
					
				}else {
					
					location.href='addBookmarkUrlView.do?bl_no='+ bl_no;
				}
				
			}
		
		
			$(".content-box").hide();
			$(".content-box-2").hide();
			
			
			var target = $(".carousel-cell");
			
			target.on("click", function() {
				
				$(this).addClass("clicked");
				
				var bl_title = $(".clicked").find(".bl_title").html();
				var bl_con = $(".clicked").prev().prev().prev().val();
				
				$(".content-box").show();
				$(".title-area > span:nth-child(1)").html(bl_title);
				$(".title-content").html(bl_con);
				
				showBoookmarkMapList();
				
				target.not($(this)).removeClass("clicked");
				
			});
			
			// 지도 북마크 
			function showBoookmarkMapList() {
				
				var bl_no = $(".clicked").prev().val();
				
				$.ajax({
		    	    method: 'POST',
		    	    url: 'selectBookmarkMapList.do',
		    	    data: {'bl_no':bl_no},
		    	    dataType:"json",
		    	    success : function(data) {
						console.log("data : " + data);
	   						
	   						$divBody = $(".map-list");
							$divBody.html("");
	   						
	   						var $div;
	   						
							for(var i in data.mbl){
								
								console.log(data.mbl[i]);
							
		   						var item = "<div class='map-item'>";
		   						var name = "<span>" + data.mbl[i].mb_title + "</span>";
		   						var phone = "<span>" + data.mbl[i].mb_phone + "</span>"
		   						var end = "</div>"
		   						
		   						$div = item + name + phone + end;
		   						
								$divBody.append($div);
							}
		    	    },
		    	    error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
             		} 
		    	 
		    	});	
				
			}
			
			
	        // 북마크 그룹 삭제
	        function deleteBookmark() {
	        	
	        	var bl_no = $(".clicked").prev().val();
	        	location.href="deleteBookmark.do?bl_no="+ bl_no;
	        	
	        }
	        
	        // 북마크 그룹 편집
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