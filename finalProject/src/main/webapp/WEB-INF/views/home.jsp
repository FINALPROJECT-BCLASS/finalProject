<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/css/swiper-bundle.css">
    <link rel="stylesheet" href="resources/css/swiper-bundle.min.css">
    <script src="resources/js/swiper-bundle.js"></script>

  <style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width: 100%;
      height: 600px;
      background: #000;
      z-index: -1;
    }

    .swiper-slide {
      font-size: 18px;
      color: #fff;
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
      padding: 12% 60px;
      padding-left: 152px;
      padding-top: 130px;
    }

    .parallax-bg {
      position: absolute;
      left: 0;
      top: 0;
      width: 130%;
      height: 100%;
      -webkit-background-size: cover;
      background-size: cover;
      background-position: center;
    }

    .swiper-slide .title {
      font-size: 41px;
      font-weight: 300;
    }

    .swiper-slide .subtitle {
      font-size: 43px;
      font-weight: 500;
    }

    .swiper-slide .text {
      font-size: 16px;
      max-width: 510px;
      line-height: 1.4;
    }

    .swiper-logo  {
      padding:0 !important;
      font-size: 25px !important;
    }

    .sign-up-btn {
      font-size: 25px;
      font-weight: 500;
      padding-left: 7px;
    }

    .round-deco{
      margin-top: -37px;
      margin-left: -10px;
      height: 40px;
      width: 40px;
      border-radius: 50%;
      background-color: #2860E1;
      z-index: -1;
    }

    .main-section {
      width: 100%;
      height: 550px;
    }
    
    .main-table {
      margin: 0 auto;
      width: 80%;
      vertical-align:middle;

    }

    .main-section-subject {
      text-align: center;
      padding-top: 60px;
      padding-bottom: 40px;
      color: rgba(72, 72, 72, 1);
      font-size: 28px;
      font-weight: 700;
      
    }

    .b-bottom-y {
      border-bottom: solid 3px #FBD14B;
    }

    .b-bottom-b {
      border-bottom: solid 3px #2860E1;
    }


    .main-section-image-area {
      width: 300px;
      padding: 30px;
    }

    .main-section-img {
      width: 230px;
      height: 230px;
      margin-left: 80px;
      margin-top: 44px;
    }

    .main-section-img-2 {
      width: 270px;
      height: 270px;
      margin-left: -40px;
      margin-top: -10px;
    }
    

    .main-section-content {
      padding : 30px;
      font-size: 17px;
      color: rgba(72, 72, 72, 1);
      line-height: 1.5em;
    }

    .main-section-content-sub {
      font-size: 22px;
      font-weight: 600;
      line-height: 2.3em;
    }

    .image-round {
      border-radius: 50%;
      width: 300px;
      height:300px;
    }

    .p-left {
      padding-left: 20%;
    }

    .p-right {
      padding-right: 20%;
    }


  </style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	
	<!-- Swiper -->
	
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide" style="background-image: url(resources/images/main-images/main.jpg);">
        <div class="title" data-swiper-parallax="-300"><div class="logo-area swiper-logo">
          <a class="blue">LIFE</a>NOTE </div>
        </div>
        <div class="subtitle" data-swiper-parallax="-200">Make Your Life Better.</div>
        <br>
        <div class="text" data-swiper-parallax="-100">
          <p>
            어디서나 노트를 작성하세요.<br>
            일정, 일기 등을 작성하면 빈틈 없는 정보 관리가 가능해집니다.<br>
            라이프노트가 당신의 삶을 좀 더 효율적으로 관리해줍니다.<br>
            당신의 삶의 주인공이 되기 위해 지금 바로 시작하세요 !
          </p>
            <br>
            <span class="sign-up-btn">Sign up</span>
            <div class="round-deco"></div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="title" data-swiper-parallax="-300"><div class="logo-area swiper-logo">
          <a class="blue">LIFE</a>NOTE </div>
        </div>
        <div class="subtitle" data-swiper-parallax="-200">Make Your Life Better.</div>
        <br>
        <div class="text" data-swiper-parallax="-100">
          <p>
            어디서나 노트를 작성하세요.<br>
            일정, 일기 등을 작성하면 빈틈 없는 정보 관리가 가능해집니다.<br>
            라이프노트가 당신의 삶을 좀 더 효율적으로 관리해줍니다.<br>
            당신의 삶의 주인공이 되기 위해 지금 바로 시작하세요 !
          </p>
            <br>
            <span class="sign-up-btn">Sign up</span>
            <div class="round-deco"></div>
          </div>
        </div>
      </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination swiper-pagination-white"></div>
    <!-- Add Navigation -->
    <div class="swiper-button-prev swiper-button-white"></div>
    <div class="swiper-button-next swiper-button-white"></div>
  </div>



  <!-- 메인 시작 -->
  <div class="main-section b-white">
      <table class="main-table">
        <tr>
          <td class="main-section-subject" colspan="2"><span class="b-bottom-y">Plan</span></td>
        </tr>
        <tr>
          <td class="main-section-image-area">
            <div class="image-round b-yell">
              <img class="main-section-img" src="resources/images/main-images/calendar.png">
            </div>
          </td>
          <td class="main-section-content p-left">
            <span class="main-section-content-sub">Planner</span> <br>
              효율적으로 일정을 관리하세요.<br>
              월별 일정 관리를 통해 한 달의 계획을 세우세요.<br>
              일별로 일정 관리를 하면 계획적인 생활이 가능합니다.<br>
              당신의 소중한 시간을 절약하도록 도와줍니다.<br>
            <span class="main-section-content-sub yellow">Sign Up &nbsp; ►►</span>
          </td>
        </tr>
      </table>
  </div>

  <div class="main-section b-lightgray">
    <table class="main-table">
      <tr>
        <td class="main-section-subject" colspan="2"><span class="b-bottom-b">Daily</span></td>
      </tr>
      <tr>
        <td class="main-section-content p-right">
          <span class="main-section-content-sub">Daily Record</span> <br>
	          나만의 습관을 정하고 달성도를 체크하세요.<br>
			  특별한 이벤트나 소소한 일상 등 당신의 하루를 기록하세요.<br>
			  좋아하는 장소나 음악 등을 한곳에 정리하세요.<br>
		      당신의 소중한 일상을 LIFENOTE와 함께하세요.<br>
          <span class="main-section-content-sub blue">Sign Up &nbsp; ►►</span>
        </td>
        <td class="main-section-image-area">
          <div class="image-round b-blue">
            <img class="main-section-img-2" src="resources/images/main-images/diary.png">
          </div>
        </td>
      </tr>
    </table>
</div>

<div class="main-section b-white">
  <table class="main-table">
    <tr>
      <td class="main-section-subject" colspan="2"><span class="b-bottom-y">Diet</span></td>
    </tr>
    <tr>
      <td class="main-section-image-area">
        <div class="image-round b-lightgray">
          <img style="width: 270px; height: 270px;" class="main-section-img" src="resources/images/main-images/exercise.png">
        </div>
      </td>
      <td class="main-section-content p-left">
        <span class="main-section-content-sub">Diet Diary</span> <br>
	       자신의 식단을 관리해 보세요.<br>
	       그날의 인바디를 기록하세요.<br>
	       인바디 그래프를 통해 변화를 한눈에 확인하세요.<br>
	       LIFENOTE가 책임지고 당신의 건강 관리를 도와줍니다.<br>
        <span class="main-section-content-sub yellow">Sign Up &nbsp; ►►</span>
      </td>
    </tr>
  </table>
</div>

<div class="main-section b-lightgray">
  <table class="main-table">
    <tr>
      <td class="main-section-subject" colspan="2"><span class="b-bottom-b">Account</span></td>
    </tr>
    <tr>
      <td class="main-section-content p-right">
        <span class="main-section-content-sub">Account Book</span> <br>
	        당신의 자산을 체계적으로 관리하세요.<br>
	        월별 수익과 지출 통계를 분류별로 제공합니다.<br>
	        연도별 수익과 지출 변화를 한 눈에 확인하세요. <br>
	        불필요한 소비를 피할 수 있습니다.<br>
        <span class="main-section-content-sub blue">Sign Up &nbsp; ►►</span>
      </td>
      <td class="main-section-image-area">
        <div class="image-round b-blue">
          <img class="main-section-img-2" style="margin-left: -50px;" src="resources/images/main-images/piggy-bank.png">
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="main-section b-white">
  <table class="main-table">
    <tr>
      <td class="main-section-subject" colspan="2"><span class="b-bottom-y">Group</span></td>
    </tr>
    <tr>
      <td class="main-section-image-area">
        <div class="image-round b-lightgray">
          <img class="main-section-img" src="resources/images/main-images/dialogue.png">
        </div>
      </td>
      <td class="main-section-content p-left">
        <span class="main-section-content-sub">Group Diary</span> <br>
          그룹 멤버와 함께 하는 공간입니다.<br>
          사람들과 아이디어를 공유하세요.<br>
          일정, 가계부 , 투표로 효율적으로 관리가 가능합니다.<br>
          동호회, 스터디 주제별 모임을 LIFE NOTE로 시작해보세요.<br>
        <span class="main-section-content-sub yellow">Sign Up &nbsp; ►►</span>
      </td>
    </tr>
  </table>
</div>




  <!-- Initialize Swiper --> 
  <script>
    var swiper = new Swiper('.swiper-container', {
      speed: 600,
      parallax: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
	
	<jsp:include page="common/footer.jsp"/>
	
</body>
</html>
