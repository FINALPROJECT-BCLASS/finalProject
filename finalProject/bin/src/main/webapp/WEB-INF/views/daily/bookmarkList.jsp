<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookmark List</title>
<!-- 카카오 지도 관련 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="dapi.kakao.com/v2/maps/sdk.js?appkey=a5165e87a2b10b900ab474145bc13247"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet" href="resources/css/swiper-bundle.css">
<link rel="stylesheet" href="resources/css/swiper-bundle.min.css">
<script src="resources/js/swiper-bundle.js"></script>        
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
            border : 3px solid #838383;
        }


        /* content */

        .content {
            width: 855px;
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
            display: flex;
            vertical-align: center;
            padding:10px;
            height: 40px;
            margin-bottom: 10px;
            width: 260px;
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
            width: 550px;
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
            width: 855px;
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
            width: 825px;
            padding: 10px;
            border-radius: 5px;
        }

        .title-area > span {
            width: 100px;
            font-size: 18px;
            font-weight: 700;
            display: flex;
        }

        .title-area > div {
            width: 700px;
            padding: 0 10px;
            display: flex;
        }

        /* 북마크 맵 세부 목록 */

        .map-list {
            height: 130px;
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
            width: 195px;
            height: 100px;
            margin-right: 15px;
            margin-bottom: 15px;
            background: #f3f3f3;
            border-radius: 5px;
            align-items: center;
        }

        .map-info {
            margin-top: 15px;
        }

        .map-item > span:nth-child(1) {
            font-weight: 700;
            font-size: 18px;
        }

        .map-list > div:nth-child(4n) {
            margin-right: 0;
        }

        .map-item{
            border-top: 5px solid #FBD14B;
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



    </style>
    </head>

    <body>
    	<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDaily.jsp"/>
        <div class="right-area">
       
            <span class="pSubject">Bookmark</span>
            <div class="slide-show-area b-white">
                <!-- Slide Show Start -->
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide b-yell">
                            <img class="group-img" src="images/profile.png">
                            <div>
                                <span>맛집</span>
                            </div>
                            <!-- <div class="explain">
                                <div class="square"></div>
                                맛집 리스트 모음
                            </div> -->
                        </div>
                        <div class="swiper-slide sky">
                            <img class="group-img" src="images/profile.png">
                            <div>
                                <span>java 강의</span>
                            </div>
                        </div>
                        <div class="swiper-slide pink">
                            <img class="group-img" src="images/profile.png">
                            <div>
                                <span>꿀팁</span>
                            </div>
                        </div>
                        <div class="swiper-slide"></div>
                    </div>
                </div>
                <!-- Slide Show End-->
                
                <!-- Arrow Start -->
                <div class="swiper-button-next" style="right: -50px;"></div>
                <div class="swiper-button-prev" style="left: -50px;"></div>
                <!-- Arrow End -->

            </div>

            <!-- Button Start-->
            <div class="button-area">
                <button>Edit</button>
                <button>Delete</button>
                <button>Add</button>
            </div>
            <!-- Button End-->

            
            <div class="content intro" >
                <div class="title-area">
                    <span>맛집 List</span> <div class="title-content">: 맛집 리스트 모음</div>
                </div>
            </div>

            <div class="content map-list">
                <div class="map-item">
                    <span>노원 황소곱창</span>
                    <span>02-1234-1234</span>
                </div>
                <div class="map-item">
                    <span>노원 황소곱창</span>
                    <span>02-1234-1234</span>
                </div>
                <div class="map-item">
                    <span>노원 황소곱창</span>
                    <span>02-1234-1234</span>
                </div>
                <div class="map-item">
                    <span>노원 황소곱창</span>
                    <span>02-1234-1234</span>
                </div>
                <div class="map-item">
                    <span>노원 황소곱창</span>
                    <span>02-1234-1234</span>
                </div>
                <div class="map-item">
                    <span>노원 황소곱창</span>
                    <span>02-1234-1234</span>
                </div>
                <div class="map-item">
                    <span>노원 황소곱창</span>
                    <span>02-1234-1234</span>
                </div>
            </div>

            <div class="content map-info">
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
            <!-- Button Start-->
            <div class="button-area">
                <button>Edit</button>
                <button>Delete</button>
                <button>Add</button>
            </div>
            <!-- Button End-->

        </div>
		
		<script>

            // var container = document.getElementById('map');
            // var options = {
            //     center: new kakao.maps.LatLng(33.450701, 126.570667),
            //     level: 3
            // };

            // var map = new kakao.maps.Map(container, options);
            


            var target=$('.swiper-slide');

            target.click(function(){
                $(this).addClass("clicked");
                target.not($(this)).removeClass("clicked");
            })


            var swiper = new Swiper('.swiper-container', {
                slidesPerView: 3,
                spaceBetween: 0,
                slidesPerGroup: 3,
                loop: true,
                loopFillGroupWithBlank: true,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
            });
        </script>
        <jsp:include page="../common/footer.jsp"/>
    </body>
</html> 