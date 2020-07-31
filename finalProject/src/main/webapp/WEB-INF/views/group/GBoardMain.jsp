<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>

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
   
    
    
    /* 게시판 css */
    html, body { height:100%;}
    h1{text-align:center;}
    .btnList{width:100%; text-align:right;}
    .groupBtn{border:none; font-weight: 600; background:none;}
    .BoardBtn{color:#2860E1; font-size: 21px;}
    .join-form-area{padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
    .groupJoin{width:900px;}
    
    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px; }
    .noticeIcon{color:#F3F3F3;}
    .like{color:#f3487b;}
    .reply{color:#2860E1;}
    
   
	
	/* 글쓰기 버튼 */
	#groupWrite {text-align:right; width:100%; height: 50px; margin-right:40px; margin-bottom:10px; border:none;}
    .groupWrite {width:50px; height:40px; cursor: pointer; border-radius: 5px;}
	
	.groupListCount{width:99%; margin-bottom:10px; text-align:right;}
	.emptyNoticeList{margin-top:100px; text-align:center; font-size:20px; font-weight:600;}
	    
    /* 게시판 */
    .groupNotice{width:100%; height:400px;overflow:scroll; overflow-x:hidden;}
    .noticeBoardTb{width:100%; margin-bottom:5px; background:white;border:0.5px solid lightgray; border-radius:10px;}
    .noticeBoardTitle{display:inline-block; padding-top:20px; padding-left:5px;font-weight: 600; font-size: 20px;}
    
   	.detailBtn{display:inline-block; margin:10px 10px 0px 0px; float:right; padding:7.2px; display:inline-block; border:none; border-radius:6px; width:60px; height:35px; background:#FBD14B;}
   	.detailBtn:hover{display:inline-block; margin:10px 10px 0px 0px; float:right; padding:7.2px; display:inline-block; border:none; border-radius:6px; width:60px; height:35px; background:#ffc400; cursor:pointer;}
   	
   	.memberImgBox{width:50px; height:50px; display:inline-block;margin:10px;}
   	.memberImg{width:100%; height:100%;border-radius:50%; }
    
    .noticeBoardWriter{padding-left:37px; font-size:12px; font-weight: 600;}
    .noticeBoardDate{padding-left:37px; font-size:12px; font-weight: 600;}
    .noticeBoardContent{margin-left:37px; margin-top:10px; padding-top:5px;padding-left:15px; width:1050px; height:70px; overflow:scroll; overflow-x:hidden; font-size:13px; background: #F3F3F3; border-radius: 5px; margin-bottom: 7px;}
  	.boardPhotoList{width:200px; height:100px; display:inline-block; border-radius:6px;}
  	.imgBox{display:inline-block; margin-left:20px;}
  	.etcBox{padding-left:20px; padding-top:10px; padding-bottom:20px;}
  	.like, .reply{cursor:pointer; font-size:30px !important;}
  	.totalLike, .totalReply{margin-left:10px; margin-right:20px; margin-bottom:10px; }
  	
 
  	
  
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

      
      <div class="join-form-area">
	
  		<jsp:include page="../common/groupNoticeHeader.jsp"/>
  		
  		
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
                	
                	
                	var $emoticon = $("<div>").attr("class","MemberImgBox");
                	var $memberNoImg = $("<img>").attr("class","memberImg").attr("src","resources/images/icons/profile_default.png");
                	var $memberImg = $("<img>").attr("class","memberImg").attr("src","resources/muploadFiles/"+data.boardList[i].renameFile);
                	
                	var $detailPage = $("<div>").text("Detail").attr("class","detailBtn");
                	var $gbNo = $("<input type='hidden' id='gbNo' value='"+ data.boardList[i].gbNo +"'>");
                	
                	var $boardTitle = $("<div>").text(data.boardList[i].gbTitle).attr("class","noticeBoardTitle");
                  	var $boardWriter = $("<div>").text(data.boardList[i].name).attr("class","noticeBoardWriter");
                  	var $boardDate = $("<div>").text(data.boardList[i].gbDate).attr("class","noticeBoardDate");
                  	var $boardContent = $("<div>").text(data.boardList[i].gbCon).attr("class","noticeBoardContent");
                 	
                  	var $like = $("<span>").text("favorite_border").attr("class","material-icons like");
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
	
	 
	<!-- detail 버튼 누르기 -->
	<script>
	
		 $(document).on("click",".detailBtn",function(){
			 $gbNo =  $(this).prev().prev().prev().val();
			  location.href="detailBoard.do?gbNo="+$gbNo;
			})
	</script>  
	  <jsp:include page="../common/footer.jsp"/>	
</body>

</html>