<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>

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
   
    
    
    /* 게시판 css */
    html, body { height:100%;}
    h1{text-align:center;}
    .btnList{width:100%; text-align:right;}
    .groupBtn{border:none; font-weight: 600; background:none;}
    .photoBtn{color:#2860E1; font-size: 21px;}
    .join-form-area{padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
    .groupJoin{width:900px;}
    
    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px; }
    .noticeIcon{color:#F3F3F3;}

   
	
	/* 글쓰기 버튼 */
	#groupWrite {text-align:right; width:100%; height: 50px; margin-right:40px; margin-bottom:10px; border:none;}
   .writeBtn{margin-right:30px;color:#aeaeae !important; font-size:50px !important; cursor:pointer; padding:0 !important;}
    .writeBtn:hover{margin-right:30px;color:#2860E1 !important; font-size:50px !important; cursor:pointer; padding:0 !important;} 
    button {margin-bottom: 10px; margin-right:40px; background:none; border:0;}
	
	
	.groupListCount{width:99%; margin-bottom:10px; text-align:right; font-weight:600; margin-right:40px; font-size:16px;}
	.emptyNoticeList{margin-top:100px; text-align:center; font-size:20px; font-weight:600;}
	    
    /* 게시판 */
     .groupNotice{ width:100%; height:400px;overflow:scroll; overflow-x:hidden;column-gap: 15px;}
.all_wrap{margin: 0 auto;}        
.all_wrap div{width: 550px;margin: 3px; display:inline-block;}
.all_wrap img{width: 100%; border-radius: 10px;}
.all_wrap p{margin: 0;font-size: 10px;padding:0 0 10px 15px;}



  </style>
  
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>


      
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
        <div class="btnList">
            <button class="groupBtn noticeBtn" onclick="location.href='noticeMain.do'">Notice</button>
            <button class="groupBtn BoardBtn" onclick="location.href='boardMain.do'">Board</button>
            <button class="groupBtn PhotoBtn" onclick="location.href='photoMain.do'">Photo</button>
            <button class="groupBtn VideoBtn">Video</button>
    	</div>
     	
     	<br>
      	

        <br>
        
        <div class="groupListCount">Total : ${pi.listCount }</div>
		<div style="clear:both"></div>
     	
		 <div class="groupNotice">
			<c:if test="${empty photoList }">
				사진이 없습니다.
			</c:if>
			<c:if test="${!empty photoList }">
					<div class="all_wrap">
				<c:forEach var="p" items="${photoList }" varStatus="status">
										
					<div  class="image">
						<img src='resources/groupBoardFiles/${p.gbpOrigin }' >
					</div>
				</c:forEach>
					</div>
			</c:if>
          </div>
		</div>

     <script>
     var $grid = $('.all_wrap').imagesLoaded( function() {
    	  $grid.masonry({
    	      itemSelector: '.grid-item',
    	      fitwidth: true
    	  });
    	});


     $('.all_wrap').masonry({
    	  // options...
    	  itemSelector: '.grid-item',
    	  fitwidth: true
    	});

     </script>
	  <!-- 스크롤 게시판 -->
	 <!--  <script>
	  
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
               url:"photoMainAjax.do",
               type: "GET",
               dataType: "json",
               data:{page:pagePlus},
               success: function(data){
            	   if(data.boardList[0] == null){
      					$(".groupNotice").text("게시글이 없습니다.").css({"text-align":"center","padding-top":"200px","font-weight":"600","color":"gray"});
      				}
            	   
            	   
              	 page = data.boardList[0].page;
              	 pagePlus = page + 1;
              	 console.log("pagePlus : " + pagePlus);
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
                	
                	
                	var $emoticon = $("<div>").attr("class","MemberImgBox");
                	var $memberNoImg = $("<img>").attr("class","memberImg").attr("src","resources/images/icons/profile_default.png");
                	var $memberImg = $("<img>").attr("class","memberImg").attr("src","resources/muploadFiles/"+data.boardList[i].renameFile);
                	
                	var $detailPage = $("<div>").text("Detail").attr("class","detailBtn");
                	var $gbNo = $("<input type='hidden' id='gbNo' value='"+ data.boardList[i].gbNo +"'>");
                	
                	var $boardTitle = $("<div>").text(data.boardList[i].gbTitle).attr("class","noticeBoardTitle");
                  	var $boardWriter = $("<div>").text(data.boardList[i].name).attr("class","noticeBoardWriter");
                  	var $boardDate = $("<div>").text(data.boardList[i].gbDate).attr("class","noticeBoardDate");
                  	var $boardContent = $("<div>").text(data.boardList[i].gbCon).attr("class","noticeBoardContent");
                 	
                  	var $like = $("<span>").text("favorite").attr("class","material-icons like");
                  	/* var $borderlike = $("<span>").text("favorite_border").attr("class","material-icons like"); */
                 	var $reply = $("<span>").text("sms").attr("class","material-icons reply");
                 	
                 	$td1.append($gbNo);
                 	if(data.boardList[i].renameFile == null){
                 		$emoticon.append($memberNoImg);
                 	}else{
                 		$emoticon.append($memberImg);
                 	}
               		$td1.append($emoticon);
               		$td1.append($boardTitle);
               		$td1.append($detailPage);
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
                  
                   	
                 // 댓글
                    var $totalReply;
                    $totalReply = $("<span>").text(0).attr("class","totalReply");
                    
                    if(data.replyList.length > 0){
                   		for(l in data.replyList){
                     		if(data.boardList[i].gbNo == data.replyList[l].gbNo){
                     			if(data.replyList[l].totalReply > 0){
	                     			$totalReply = $("<span>").text(data.replyList[l].totalReply).attr("class","totalReply");
	                     			$td6.append($totalReply);
                     			}	
                     		}
                    	}
                         	 
                   	}
                   	
                    $td6.append($totalReply);
                 	$tr6.append($td6);
     				
               		$boardTb.append($tr1);
                  	$boardTb.append($tr2);
                  	$boardTb.append($tr3);
                  	$boardTb.append($tr4);
                  	
                  	// 사진
                  	if(data.photoList.length > 0){
                  
                   		for(j in  data.photoList){
                   			if(data.photoList[j].gbpOrigin != null){
                   			if(data.boardList[i].gbNo == data.photoList[j].gbNo){
                   				var $img = $("<img src='resources/groupBoardFiles/"+data.photoList[j].gbpOrigin+"' class='boardPhotoList'>");
                   				var $imgBox = $("<div>").attr("class","imgBox");
                   				$imgBox.append($img);
                   				$td5.append($imgBox);
                   				$tr5.append($td5);                             	 
                   				$boardTb.append($tr5);
                   				$groupBoard.append($boardTb); 
                   			}
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
   
	    </script> -->
		    <!-- 스크롤 게시판 end -->
	 
	<!-- detail 버튼 누르기 -->
	<script>
	
		 $(document).on("click",".detailBtn",function(){
			 $gbNo =  $(this).prev().prev().prev().val();
			  location.href="detailBoard.do?gbNo="+$gbNo;
			})
	</script>  
	
	<!-- 게시판 글쓰기  -->
	<script>
		$(".writeBtn").click(function(){
			location.href="boardInsertView.do";
		})
	</script>
	  <jsp:include page="../common/footer.jsp"/>	
</body>

</html>