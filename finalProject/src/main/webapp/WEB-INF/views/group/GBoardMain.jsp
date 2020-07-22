<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<!-- CSS -->
	<link rel="stylesheet" href="resources/css/flickity/flickity.css">
	<!-- JavaScript -->
	<script src="resources/js/flickity/flickity.pkgd.min.js"></script>
	
	

	
	 <!-- Demo styles -->
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

   
    /* swiper css */
    .carousel{width:90%;}
    .carousel-cell {
		  width: 200px;
		  height: 100px !important;
		  margin-right: 10px;
		  background: #e9ecef;
		  border-radius: 8px !important;
		  counter-increment: carousel-cell;
		  cursor: pointer;
		  overflow: hidden;
		}
	.carImg {width:100%;}	
    
    /* 게시판 css */
     html, body { height:100%;}

    h1{text-align:center;}
    .btnList{width:100%; text-align:right;}
    .groupBtn{border:none; font-weight: 600; background:none;}
    .BoardBtn{color:#2860E1; font-size: 21px;}

    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
    .groupJoin{width:900px;}

    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px; text-shadow: 1.5px 1.5px 1.5px gray; }
   
    /* 공지 */
    .noticeText{float: right;margin:auto; width: 81%; background:#c2c2c2; border-radius: 0 0 5px 5px;  }
    .noticeTb{margin-left:20px;}
    .noticeTitle{padding-top:20px; padding-left:5px;font-weight: 600; font-size: 20px;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeWriter{padding-left:5px; font-size:12px; font-weight: 600;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeDate{padding-left:5px; font-size:12px; font-weight: 600;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeContent{padding-top:5px; padding-left:15px; padding-bottom: 20px; font-size:14px;  text-shadow: 1.5px 1.5px 1.5px gray; }

	/* 글쓰기 버튼 */
	#groupWrite {text-align:right; width:100%; height: 50px; margin-right:40px; margin-bottom:10px; border:none;}
    .groupWrite {width:50px; height:40px; cursor: pointer; border-radius: 5px;}
	
	.groupListCount{width:95%; margin-bottom:10px; text-align:right;}

	.emptyNoticeList{margin-top:100px; text-align:center; font-size:20px; font-weight:600;}
	    
    /* 공지게시판 */
    .groupNotice{width:100%; height:400px;overflow:scroll; overflow-x:hidden;}
    .noticeBoardTb{width:100%; margin-bottom:5px; background:white;border:0.5px solid lightgray; border-radius:10px;}
    .noticeBoardTitle{display:inline-block; padding-top:20px; padding-left:5px;font-weight: 600; font-size: 20px;}
    .noticeBoardWriter{padding-left:37px; font-size:12px; font-weight: 600;}
    .noticeBoardDate{padding-left:37px; font-size:12px; font-weight: 600;}
    .noticeBoardContent{margin-left:37px; margin-top:10px; padding-top:5px;padding-left:15px; width:1000px; height:70px; overflow:scroll; overflow-x:hidden; font-size:13px; background: #F3F3F3; border-radius: 5px; margin-bottom: 7px;}
  	.boardPhotoList{width:200px; height:100px; display:inline-block; border-radius:6px;}
  	.imgBox{display:inline-block; margin-left:20px;}
  	.etcBox{padding-left:20px; padding-top:10px; padding-bottom:20px;}
  	.like, .reply{cursor:pointer; font-size:30px !important;}
  	.totalLike{margin-left:10px; margin-right:20px; margin-bottom:10px; }
  	
 
  	
  
  	tr > td:nth-child(1) {
        color: #484848;
        text-align: left;
        font-weight: 600;
        font-size: 16px;
        width:40px;
    }
  </style>
  

      
</head>

<body>

	<jsp:include page="../common/header.jsp"/>
	
	<jsp:include page="../common/sidenaviGroup.jsp"/>

	<!-- 공지사항 -->

	<div class="noticeText">
	   	<c:if test="${!empty noticeList }">
        <table class="noticeTb">
          <tr>
	          <td><span class="material-icons">campaign</span></td>
	          <td><div class="noticeTitle">${noticeList.gnTitle }</div></td>
          </tr>
          <tr><td></td><td><div class="noticeWriter">${noticeList.name }</div></td></tr>
          <tr><td></td><td><div class="noticeDate">${noticeList.gnDate }</div></td></tr>
          <tr><td></td><td><div class="noticeContent">${noticeList.gnCon }</div></td></tr>
        </table>
        </c:if>
      </div>
      
      <div class="join-form-area">
  
        <h1>Group Diary</h1>
        <div class="btnList">
            <button class="groupBtn noticeBtn" onclick="location.href='noticeMain.do'">Notice</button>
            <button class="groupBtn BoardBtn" onclick="location.href='boardMain.do'">Board</button>
            <button class="groupBtn PhotoBtn">Photo</button>
            <button class="groupBtn VideoBtn">Video</button>
    	</div>
     	
     	<br>
      	<div id="groupWrite" ><img class="groupWrite" src="resources/images/write.png" id="writeBtn"></div>
        <br>
        
        <div class="groupListCount">총 게시판 : ${pi.listCount }</div>
		<div style="clear:both"></div>
     	
		 <div class="groupNotice">
		 
		 	<br>
           	<c:if test="${empty noticeList }">
           		<div class="emptyNoticeList"> 작성한 게시판이 없습니다.</div>
           	</c:if>

              <table class="noticeBoardTb">
                <tr><td><span class="material-icons">perm_identity</span></td><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td></td><td><div class="noticeBoardWriter">김혜린</div></td></tr>
                <tr><td></td><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td></td><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              	<tr>
              		<td></td>
              		<td class="swiperTd">
              		<!-- carousel -->
              			<div class="carousel" data-flickity='{"draggable":false}'>
              				<div class="carousel-cell">
              					<img class="carImg" src="resources/images/emptyHeart.png">
              				</div>
              				<div class="carousel-cell">
              					<img class="carImg" src="resources/images/emptyHeart.png">
              				</div>
              				<div class="carousel-cell">
              					<img  class="carImg" src="resources/images/emptyHeart.png">
              				</div>
              				<div class="carousel-cell">
              					<img src="resources/images/emptyHeart.png">
              				</div>
              				<div class="carousel-cell">
              					<img src="resources/images/emptyHeart.png">
              				</div>
              				<div class="carousel-cell">
              					<img class="carImg" src="resources/groupMainFiles/히지.png">
              				</div>
              			
              			</div>
              		<!-- carousel end -->
              		
              			
              		</td>
              	</tr>
              	<tr>
              		<td colspan="2">
              			<div class="reply likeBox"><span class="material-icons emptyHeart">favorite_border</span><span class="reply">3</span></div>
              			<div class="reply replyBox"><span class="material-icons">sms</span>&nbsp;<span class="reply">3</span></div>
           			</td>
              	</tr>
              </table>
              
          </div>
	
	  </div>

	
	  <!-- 스크롤 게시판 -->
	  <script>
	  
 		/* var gInfo = ${gInfo.gmNo}; */
 		
       let isEnd = false;
      
       var pagePlus = 1;
       $(function(){
      	 
      	    $(".groupNotice").scroll(function(){
             	 /* console.log("ajax 전 page : " + ${pi.currentPage}); */
                 	 if ($(this)[0].scrollHeight - Math.round($(this).scrollTop()) == $(this).outerHeight()){
                 		 
                          fetchList();
                          
                      }       
                  })
                  
                    fetchList(); 
              })
       
       
       let fetchList = function(){
           if(isEnd == true){
               return;
           }
        
           $.ajax({
               url:"boardMainAjax.do",
               type: "GET",
               dataType: "json",
               data:{page:pagePlus},
               success: function(data){
            	 /* console.log("ajax photo : " + data.photoList[0].gbNo );
            	 console.log("ajax data : " + data.boardList[0].gbNo); */
              	 page = data.boardList[0].page;
              	 pagePlus = page + 1;
              	 
                   // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
                   // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
              	 let length =  data.boardList.length;
              	 /* console.log("length : " + length); */
              	 
              	 
                   if( length < 5 ){
                       isEnd = true;
                   }

                    for(i in data.boardList){

                  	var $groupBoard = $(".groupNotice");
                  	var $boardTb = $("<table>").attr("class","noticeBoardTb");
                  	
                  	var $tr1 = $("<tr>");
                	var $tr2 = $("<tr>");
                	var $tr3 = $("<tr>");
                	var $tr4 = $("<tr>");
               		var $tr5 = $("<tr>");
                	var $tr6 = $("<tr>");
                	
                	var $td1 = $("<td>");
                	var $td2 = $("<td>");
                	var $td3 = $("<td>");
                	var $td4 = $("<td>");
                	var $td5 = $("<td>");
                	var $td6 = $("<td>").attr("class","etcBox");
                	
                	
                	var $emoticon = $("<span>").text("perm_identity").attr("class","material-icons");
                	var $boardTitle = $("<div>").text(data.boardList[i].gbTitle).attr("class","noticeBoardTitle");
                  	var $boardWriter = $("<div>").text(data.boardList[i].name).attr("class","noticeBoardWriter");
                  	var $boardDate = $("<div>").text(data.boardList[i].gbDate).attr("class","noticeBoardDate");
                  	var $boardContent = $("<div>").text(data.boardList[i].gbCon).attr("class","noticeBoardContent");
                 	var $like = $("<span>").text("favorite_border").attr("class","material-icons like");
                 	var $reply = $("<span>").text("sms").attr("class","material-icons reply");
                 	
               		$td1.append($emoticon);
               		$td1.append($boardTitle);
                   	$tr1.append($td1);
                   	
                   	$td2.append($boardWriter);
                   	$tr2.append($td2);
                   	
                   	$td3.append($boardDate);
                   	$tr3.append($td3);
                   	
                   	$td4.append($boardContent);
                   	$tr4.append($td4);
 					
                   	$td6.append($like);
                   	
                   	// 좋아요
                    var $totalLike;
                    $totalLike = $("<span>").text(0).attr("class","totalLike");
                    
                    if(data.likeList.length > 0){
                   		for(l in data.likeList){
                     		if(data.boardList[i].gbNo == data.likeList[l].gbNo){
                     			if(data.likeList[l].totalLike > 0){
	                     			$totalLike = $("<span>").text(data.likeList[l].totalLike).attr("class","totalLike");
	                     			$td6.append($totalLike);
                     			}	
                     		}
                    	}
                         	 
                   	}
                   	
     				$td6.append($totalLike);
                   	$td6.append($reply);
                   	$tr6.append($td6);
                   	
               		$boardTb.append($tr1);
                  	$boardTb.append($tr2);
                  	$boardTb.append($tr3);
                  	$boardTb.append($tr4);
                  	
                  	// 사진
                  	if(data.photoList.length > 0){
                   		/* console.log("사진 legnth : " + data.photoList.length); */
                   		for(j in  data.photoList){
                   			if(data.boardList[i].gbNo == data.photoList[j].gbNo){
                   				var $img = $("<img src='resources/groupMainFiles/"+data.photoList[j].gbpOrigin+"' class='boardPhotoList'>");
                   				var $imgBox = $("<div>").attr("class","imgBox");

                   				$imgBox.append($img);
                   				$td5.append($imgBox);
                   				$tr5.append($td5);                             	 
                   				$boardTb.append($tr5);
                   				$groupBoard.append($boardTb); 
                   			}
                   		}
                   	}
                  	
                  	$boardTb.append($tr6);
                  	$groupBoard.append($boardTb); 
                    
                  	
                	
                   	
                   	
                   	}
                
               },
               error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
           });
       }
   
	    </script>
		    <!-- 스크롤 게시판 end -->
    
	  <!-- 하트 누르기 -->
	  <script>
	  $(document).on("click",".like",function(){
		  
		  $(this).html($(this).html() == 'favorite_border' ? 'favorite' : 'favorite_border');
 		})
	  	 
  	</script>
	  
	  <jsp:include page="../common/footer.jsp"/>	
</body>

</html>