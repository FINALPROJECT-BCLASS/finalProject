<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    button{border:none; outline:none !important;}
    .btnList{width:100%; text-align:right;}
    .groupBtn{border:none; font-weight: 600; background:none;}
    .voteBtn{color:#2860E1; font-size: 21px;}
    .join-form-area{z-index:0; padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
    .groupJoin{width:900px;}
    
    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px; }
    .noticeIcon{color:#F3F3F3;}
    .like{color:#f3487b;}
    .reply{color:#2860E1;}
    
   
	
	/* 글쓰기 버튼 */
	#groupWrite {text-align:right; width:100%; height: 50px; margin-right:40px; margin-bottom:10px; border:none;}
    .groupWrite {width:50 px; height:40px; cursor: pointer; border-radius: 5px;} 
    button {margin-bottom: 10px; margin-right:40px; background:none; border:0;}
	.writeBtn{color:#2860E1 !important; font-size:60px !important;  text-shadow: 1.5px 1.5px 1.5px gray !important; cursor:pointer;}
	
	.groupListCount{width:99%; margin-bottom:10px; text-align:right;}
	.emptyNoticeList{margin-top:100px; text-align:center; font-size:20px; font-weight:600;}
	    
    /* 게시판 */
    .groupNotice{width:100%; height:400px;overflow:scroll; overflow-x:hidden;}
    .noticeBoardTb{width:100%; margin-bottom:5px; background:white; border-radius:10px;}
    .noticeBoardTitle{display:inline-block; padding-top:20px; padding-left:5px;font-weight: 600; font-size: 20px;}
    
   	.detailBtn{display:inline-block; margin:10px 10px 0px 0px; float:right; padding:7.2px; display:inline-block; border:none; border-radius:6px; width:100; height:35px; background:#FBD14B;}
   	.detailBtn:hover{display:inline-block; margin:10px 10px 0px 0px; float:right; padding:7.2px; display:inline-block; border:none; border-radius:6px; width:100; height:35px; background:#ffc400; cursor:pointer;}
   	
   	
   	.MemberImgBox{width:50px; height:50px; display:inline-block;margin:10px;}
   	.memberImg{width:100%; height:100%;border-radius:50%; }
    
    .noticeBoardWriter{padding-left:37px; font-size:12px; font-weight: 600;}
    .dateView{margin-left: 35px; color: #2860E1;font-size: 13px;display:inline-block; }
    .noticeBoardDate{display: inline-block;padding-left:10px; font-size:13px; font-weight: 400;}
    .endDate{margin-left:5px;}
    #sample04{display: inline-block;margin-left: 15px;font-size: 13px;    color: #2860E1;}
    .noticeBoardContent{margin-left:37px; margin-top:10px; padding-top:5px;padding-left:15px; width:1050px; height:70px; overflow:scroll; overflow-x:hidden; font-size:13px; background: #F3F3F3; border-radius: 5px; margin-bottom: 7px;}
  	.boardPhotoList{width:200px; height:100px; display:inline-block; border-radius:6px;}
  	
  	  /* 투표 내용 시작 */
    .voteBox{ margin-bottom: 10px; margin-left:17px; width:1100px !important; border-radius:10px; border:1px solid #F3F3F3; display: flex; align-items: center;}
    .voteTitle{width:85%; height:50px; cursor: unset !important; border:0; outline:0 !important; background:none; }
    .voteSubmit{font-weight: 600;font-size: 17px;color:white; margin-left: 3px; margin-top:20px; margin-bottom:10px; width:45%; height:50px; border:none; background:#2860E1; border-radius: 5px; }
    .voteEnd{background:#FBD14B;}
    .voteUpdate{background:#2860E1 ;}
    .voteDelete{background:#dc3545 ;}
    .checkName{display:inline-block; margin-bottom:10px; font-weight: 600; font-size: 16px; color:#434343;}
    .checkClick{display:inline-block; font-size:14px; color:gray; padding-left:5px;}
 	.checkView{width:100px;padding: 10px 30px !important;}
  	.etcBox{text-align:center !important;}	
  	
  	.endBtn{background:#2860E1;}
  	.removeBtn{background:lightgray;}
  	
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
            <button class="groupBtn voteBtn">Voting</button>
            <button class="groupBtn FinishedBtn" >Finished</button>
    	</div>
     	
     	<br>
      	<div id="groupWrite"  ><span class="material-icons writeBtn">create</span></div>
        <br>
        <br>
        
        <div class="groupListCount">진행중인 투표 : ${pi.listCount } 건</div>
		<div style="clear:both"></div>
     	
		 <div class="groupNotice">
		 
		 	<br>
 
          </div>
		</div>
		
		<!-- write Btn -->
		<script>
			$(".writeBtn").click(function(){
				location.href="voteWrite.do";
			})
		</script>
		
		
		<!-- Voting Btn -->
		<script>
			$(".voteBtn").click(function(){
				location.href="voteMain.do";
			})
		</script>
		
		<!-- Finished Btn -->
		<script>
			$(".FinishedBtn").click(function(){
				location.href="finishedVote.do";
			})
		</script>
		
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
               url:"voteMainAjax.do",
               type: "GET",
               dataType: "json",
               data:{page:pagePlus},
               success: function(data){
				
            	   if(data.voteList[0] == null){
   					$(".groupNotice").text("진행중인 투표가 없습니다.").css({"text-align":"center","padding-top":"200px","font-weight":"600","color":"gray"});
   				}
				console.log(data);
				
			 	 page = data.voteList[0].page;
              	 pagePlus = page + 1;
              	 
                   // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
                   // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
              	 let length =  data.voteList.length;
              	 console.log("length : " + length);
              	 
              	 
                   if( length < 5 ){
                       isEnd = true;
                   }
                   for(i in data.voteList){
                    
                  	var $groupBoard = $(".groupNotice");
                  	$groupBoard.append(data.voteList[i]);
                  	var $boardTb = $("<table>").attr("class","noticeBoardTb");
                  	
                  	var $tr1 = $("<tr>");
                	var $tr2 = $("<tr>");
                	var $tr3 = $("<tr>");
                	var $tr4 = $("<tr>");
               		var $tr5 = $("<tr>");
                	var $tr6 = $("<tr>");
                	var $tr7 = $("<tr>");
                	
                	var $td1 = $("<td>");
                	var $td2 = $("<td>");
                	var $td3 = $("<td>");
                	var $td4 = $("<td>");
                	var $td5 = $("<td>");
                	var $td6 = $("<td>").attr("class","etcBox");
                	var $td7 = $("<td>");
                	
                	var $detailPage = $("<div>").text("Take Vote").attr("class","detailBtn");
                	var $gvNo = $("<input type='hidden' id='gvNo' value='"+ data.voteList[i].gvNo +"'>");
                	
                	var $emoticon = $("<div>").attr("class","MemberImgBox");
                	var $memberNoImg = $("<img>").attr("class","memberImg").attr("src","resources/images/icons/profile_default.png");
                	var $memberImg = $("<img>").attr("class","memberImg").attr("src","resources/muploadFiles/"+data.voteList[i].renameFile);
                                	
                	var $boardTitle = $("<div>").text(data.voteList[i].gvTitle).attr("class","noticeBoardTitle");
                  	var $boardWriter = $("<div>").text(data.voteList[i].name).attr("class","noticeBoardWriter");
                  	var $voteStart = $("<div>").text("Start : ").attr("class","dateView");
                  	var $boardDate = $("<div>").text(data.voteList[i].gvStart).attr("class","noticeBoardDate");
                  	
                  	var $voteEnd = $("<div>").text("End : ").attr("class","dateView");
                  	var $endDate = $("<div>").text(data.voteList[i].gvEnd).attr("class","noticeBoardDate endDate");
                  	
                  	
                  	var $boardContent = $("<div>").text(data.voteList[i].gvCon).attr("class","noticeBoardContent");
                 	
                  	var $endBtn = $("<button class='voteSubmit endBtn'>").text("Close Vote");
                  	var $removeBtn = $("<button class='voteSubmit removeBtn'>").text("Delete");
                  	
                 	if(data.voteList[i].renameFile == null){
                 		$emoticon.append($memberNoImg);
                 	}else{
                 		$emoticon.append($memberImg);
                 	}
                 	
               		$td1.append($emoticon);
               		$td1.append($boardTitle);
               		$td1.append($detailPage);
               		$td1.append($gvNo);
               		
                   	$tr1.append($td1);
                   	
                   	$td2.append($boardWriter);
                   	$tr2.append($td2);
                   	
                   	$td3.append($voteStart);
                   	$td3.append($boardDate);
                   	$tr3.append($td3);
                   	
                   	if(data.voteList[i].gvEnd != null){
                   	$td7.append($voteEnd);
                   	$td7.append($endDate);
                   	$tr7.append($td7);
                   	}
                   	
                   	$td4.append($boardContent);
                   	$tr4.append($td4);
 					
                   	if(data.itemList[i].gviItem != null){
                   		for(var j in data.itemList){
                   		if(data.itemList[j].gvNo == data.voteList[i].gvNo){
                   		
   	                   			
                   		
                 			
                   			var $td5  = $("<td>");
                   			var $td5  = $("<tr>");
                   			
                   		
                   			var $voteItem = $("<div>").attr("class","voteBox");
                          	var $check = $("<span>").attr("class","material-icons checkView");
                          	var $itemBtn = $("<button class='voteTitle' value='"+ data.itemList[j].gvNo +"'>").text( data.itemList[j].gviItem);
                          	var $itemBtnCheck = $("<button class='voteTitle' value='"+ data.itemList[j].gvNo +"'>").text( data.itemList[j].gviItem);
                          	var $hiddenGviNo = $("<input type='hidden' id='hiddenGviNo' value='"+ data.itemList[j].gviNo +"'>");
                          	var $hiddenGvNo = $("<input type='hidden' id='hiddenGviNo' value='"+ data.itemList[j].gvNo +"'>");
                          	var $userImoticon = $("<span>").attr("class","material-icons voteUser").text("person");
                          	var $totalItem = $("<span>").text(data.itemList[j].totalGviNo );
	                   		
                          	
   	                   		$voteItem.append($check);
	                   		$voteItem.append($itemBtn); 
	                   		$voteItem.append($hiddenGviNo); 
	                   		$voteItem.append($userImoticon);
	                   		$voteItem.append($totalItem);     
  	                   		

	                     
	                   		$td5.append($voteItem);
	                   		$tr5.append($td5);
	                   		 
	                   
	                   	 
	                   	 
                   		
                   		}
                   		}	// for itemList
                   		
                   	}	// if gviItem != null
                 	
                   	if(data.gInfoGmNo == data.voteList[i].gmNo){
                   		
                   	$td6.append($endBtn);
                   	$td6.append($removeBtn);
                	$tr6.append($td6);
                   	}
                	
               		$boardTb.append($tr1);
                  	$boardTb.append($tr2);
                  	$boardTb.append($tr3);
                  	$boardTb.append($tr7);
                  	$boardTb.append($tr4);
                  	$boardTb.append($tr5);
                  	$boardTb.append($tr6);
                  	$boardTb.append($hiddenGvNo);
                
                  	$groupBoard.append($boardTb); 

                  	
                    	
                    
                   	} // for voteList end
               },
               error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
           });
       }
      
	    </script>
	    
	    <!-- 투표 상세 페이지 이동 -->
	    <script>
	    	$(document).on("click",".detailBtn", function(){
	    	var gvNo = $(this).next().val();
	    		location.href="voteDetail.do?gvNo="+gvNo;
	    	})
	    </script>
	    
	    <!-- 투표 종료 -->
	    <script>
	    	$(document).on("click",".endBtn", function(){
	    		var deleteConfirm = confirm("투표를 종료하시겠습니까? ");
		 		if(deleteConfirm){
		 			alert("투표가 종료되었습니다.");
		 			var gvNo = $(this).parent().parent().next().val();
		 			location.href="endVote.do?gvNo="+gvNo;
				}
	    	})
	    </script>
	    
	      <!-- 투표 삭제 -->
	    <script>
	    	$(document).on("click",".removeBtn", function(){
	    		
	    		
	    		var deleteConfirm = confirm("투표를 삭제하시겠습니까? ");
		 		if(deleteConfirm){
		 			alert("투표를 삭제되었습니다.");
		 			var gvNo = $(this).parent().parent().next().val();
		    		location.href="removeVote.do?gvNo="+gvNo;
		 		}
		    	
	    	})
	    </script>
    <!-- 스크롤 게시판 end -->
    
   
   			   
		     <jsp:include page="../common/footer.jsp"/>	
</body>
</html>