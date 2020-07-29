<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body { height:100%;}

    h1, h4{margin-top:20px; text-align:center;}
	
	 /* 구글 아이콘 */
    .material-icons{font-size:30px !important; padding-top:12px; padding-left: 10px; padding-right: 10px;  text-shadow: 1.5px 1.5px 1.5px gray; }


    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 65px; width: 81%; background: #F3F3F3; }
    .material-icons{font-size:30px;}

	  /* 공지 */
    .noticeText{float: right;margin:auto; width: 81%; background:#c2c2c2; border-radius: 0 0 5px 5px;  }
    .noticeTb{margin-left:20px;}
    .noticeTitle{padding-top:20px; padding-left:5px;font-weight: 600; font-size: 20px;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeWriter{padding-left:5px; font-size:12px; font-weight: 600;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeDate{padding-left:5px; font-size:12px; font-weight: 600;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeContent{padding-top:5px; padding-left:15px; padding-bottom: 20px; font-size:14px;  text-shadow: 1.5px 1.5px 1.5px gray; }

    .detailBox{width:1000px; border:0.5px solid lightgray;}
    .detailBox td{border:0.5px solid lightgray; background:white;}
    .groubJoinBtn{text-align: center;}

    .contentBox{width:1000px; border:0.5px solid lightgray; text-align:center;}
    .contentBox tr{background:white;}
	.boardImg{width:50%; height: 40%;}
	
    .commentBox{width:100px;}
    .like {cursor:pointer;}

    .replyBox{width:1000px;}
    .replyBox td{border:0.5px solid lightgray;}
    .replyBox td:nth-child(2){width:800px;}
    .replyBox td:nth-child(3){text-align: right;}

    #replyWirte{border:none; border-radius: 6px; width:800px; height:30px;}
    .reName{display:inline-block; font-weight:600;}
    .replyBtn{background:#FBD14B; border:none;  font-weight: 600; font-size: 14px; border-radius:6px; width:60px; height:35px;}
    .replyBtn:hover{border:#ffc400; border:none; color:#2860E1; font-weight: 600; font-size: 14px; border-radius:6px; width:60px; height:35px;}
	.replyConBox{margin-right:10px; width:920px;border:none; border-radius: 6px; background:white;}
	.replyReset{width:30px; display:inline-block; color:gray; font-weight:600; text-align:right; padding-bottom:9px; cursor:pointer;}
	.replyName{ cursor:pointer;}
	/* 대댓글 */
	.re{display:inline-block; font-size:15px !important; margin: 0 !important; padding:0 !important; text-shodow:0 !important;}
	.rereName{display:inline-block;}
	
	
    #submit{background:none; border:none; color:#2860E1; font-weight: 600; font-size: 20px; border-radius:6px; width:60px; height:35px;}
    #reset{background:none; border:none; color:#484848; font-weight: 600; font-size: 20px; width:100px;}


    .detailBox td:nth-child(1) {
            color: #484848;
            text-align: left;
            font-weight: 600;
            font-size: 16px;
            width:100px;
            background:lightgray;
        }
        
    .detailBox td:nth-child(2) { width:400px; padding-left:10px;}
            
    .detailBox td:nth-child(3) {
        color: #484848;
        text-align: left;
        font-weight: 600;
        font-size: 16px;
        width:100px;
        background:lightgray;
    }

	.detailBox td:nth-child(4) { width:400px; padding-left:10px;}
	

	
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
        <h4 class="pSubject">Board Detail</h4><br>
            <div class="groupJoin">
                <table class="detailBox">
                    <tr>
                        <td>제목</td>
                        <td>${boardList.gbTitle }</td>
                        <td>조회수</td>
                        <td>${boardList.gbCount }</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>${boardList.name }</td>
                        <td>작성시간</td>
                        <td>${boardList.gbDate }</td>
                    </tr>
                </table>
                <table class="contentBox">
                    <tr>
                        <td>${boardList.gbCon }</td>
                    </tr>
                    
					<c:if test="${empty photoList }">
					</c:if>
					<c:if test="${!empty photoList }">
						<c:forEach var="p" items="${photoList }">
							<tr>
								<td>
									<img class="boardImg" src="resources/groupBoardFiles/${p.gbpOrigin }">
								</td>
							<tr>
						</c:forEach>
					</c:if>
						
                </table>
                <table class="commentBox">
                    <tr>
                        <td>
                        	<c:if test="${empty likeList }">
                        		<span class="material-icons like">favorite_border</span>
                        	</c:if>
                        	<c:if test="${!empty likeList }">
                        		<span class="material-icons like">favorite</span>	
                        	</c:if>
                        </td>
                        <td style="width:25px"><span class="titalLike">${totalLike }</span></td>
                        <td>
                      	  <span class="material-icons">sms</span>
                        </td>
                        <td><div class="totalReply">${totalReply }</div></td>
                    </tr>
                </table>
                <table class="replyBox">
                	<tbody>
                	<c:if test="${empty replyList }"><!-- 댓글이 없을 경우 -->
                		<tr>
                			<td colspan="3" align="center">등록된 댓글이 없습니다.</td>
                		</tr>	
                	</c:if>
                	<c:if test="${!empty replyList }"><!-- 댓글이 있을 경우 -->
                		<c:forEach var="r" items="${replyList }">
                			
		               			<input type="hidden" class="crNo" value="${r.grNo }">
			               		<tr class="replyTr">
			                        <td><div class="replyName">${r.name }</div></td>
			                        <td><div class="replyCon">${r.grCon }</div></td>
			                        <td><div class="replyDate">${r.grDate }</div></td>
			                    </tr>
		                    
		                    
		                    	<c:forEach var="re" items="${reReplyList }">
			                    	<c:if test="${ re.grNo eq r.grNo}">
			               			<input type="hidden" class="crNo" value="${r.grNo }">
					               		<%-- <tr class="replyTr">
					                        <td><div class="replyName">${r.name }</div></td>
					                        <td><div class="replyCon">${r.grCon }</div></td>
					                        <td><div class="replyDate">${r.grDate }</div></td>
					                    </tr> --%>
					               		<tr class="reReplyTr">
					                        <td><span class="material-icons re">subdirectory_arrow_right</span><div class="rereName">${re.name }</div></td>
					                        <td><div class="replyCon">${re.grrCon }</div></td>
					                        <td><div class="replyDate">${re.grrDate }</div></td>
					                    </tr>
				                    </c:if>
			                    </c:forEach><!-- reReplyList  -->
		                    
	                    </c:forEach><!-- replyList  -->
                	</c:if>
                	</tbody>
                </table>
                <table class="replyWriteBox">
                    <tr>
                        <td>
                        	<div class="replyConBox">
                        		<input type="text" name="grCon" id="replyWirte">
                        	</div>
                       	</td>
                        <td><button class="replyBtn">submit</button></td>
                    </tr>
                </table>
               
                <br><br>
                <div class="groubJoinBtn">
                    <span id="reset">Back</span>
                   <span><button id="submit">Update</button>&nbsp;</span>
                </div>
            </div>
         </div>
         
         <!-- 좋아요 클릭 -->
         <script>
             $(".like").click(function(){
            	 var gmNo = ${gInfoGmNo};
            	 var gbNo = ${boardList.gbNo};
				
                 $(this).html($(this).html() == 'favorite_border' ? 'favorite' : 'favorite_border');

                 var heart = $(this).html();

                 $.ajax({
                	url:"likeAjax.do",
               	    type: "GET",
                    dataType: "json",
                	data:{gmNo:gmNo, gbNo:gbNo, heart:heart},
                	success:function(data){
                		$(".titalLike").html("");
                		$(".titalLike").html(data.totalLike);
                	},
               	  	error:function(request, status, errorData){
  						alert("error code: " + request.status + "\n"
  								+"message: " + request.responseText
  								+"error: " + errorData);
  					}
                }) 
             })

         </script>
         
         <!-- ------------------------------댓글----------------------------------- -->
         

       		
      		<!-- 댓글 이름 클릭했을 때  -->	
         <script>	
      		   var $replyNameLocation;	// 댓글 이름을 클릭했을 때 위치 저장할 변수
      		   var grNo;
      		   var $replyName;
      		   var $reset;
         	 $(document).on("click",".replyName",function(){
				
				 $replyNameLocation  = $(this);
         		
              	grNo = $(this).closest(".replyTr").prev().val();
         		
         		var $replyWrite = $("#replyWirte");
         		var $replyBox = $(".replyConBox");
         		$replyName = $("<div>").text("@" + $(this).html()).attr("class","reName");

         		if($(".reName").length == 0){	// @이름이 존재하지 않을 때
         			$reset = $("<div>").text("x").attr("class","replyReset");
         			$replyBox.prepend($replyName);
         			$replyBox.append($reset);

         			$(".replyReset").click(function(){	// @이름 삭제
         				$replyName.remove();
         				$reset.remove();
         			})
         		} // if($(".reName").length == 0)
			})
         </script>
         
          <!-- 함수 실행 -->
         <script>
         	// re댓글이 아닐경우 (그냥 댓글일 경우)
          	$(".replyBtn").click(function(){
         		if($(".reName").length == 0){	// @이름이 없는 경우
         			if($("#replyWirte").val() == ""){
						alert("댓글을 입력해주세요.");         				
         			}else{						
         				
         			replySubmit();
         			}
         		} else {						// @이름이 있는 경우
         			reReplySubmit();
         		}
         	})
         </script>
         
         
         
         <!-- 댓글 함수 -->
         <script>
         
         	// 댓글 입력 ajax
         	let replySubmit = function(){
       		 var gmNo = ${gInfoGmNo};
           	 var gbNo = ${boardList.gbNo};
           	 var grCon = $(".replyBtn").parent().prev().children().children().val();

           			$.ajax({
                			url:"replyAjax.do",
              				type: "GET",
                            dataType: "json",
                        	data:{gmNo:gmNo, gbNo:gbNo,grCon:grCon},
                        	success:function(data){
       						var $replyWirte = $("#replyWirte");
                       		var $replyBox = $(".replyBox tbody");
                       		var $totalReply = $(".totalReply");
                       		$replyWirte.val("");
                      			/* $replyBox.html(""); */
                      			$totalReply.html("");
                      			$totalReply.html(data.totalReply);
                      			
                      		  for(i in data.replyList){
       						var $grNo = $("<input type='hidden' class='grNo' value='"+ data.replyList[i].grNo+"'>");
                   			var $tr = $("<tr>").attr("class","replyTr");
                       		var $td1 = $("<td>");
                       		var $td2 = $("<td>");
                       		var $td3 = $("<td>");
                       		
                       		var $name = $("<div>").text(data.replyList[i].name).attr("class","replyName");
                       		var $content = $("<div>").text(data.replyList[i].grCon).attr("class","replyCon");
                       		var $date = $("<div>").text(data.replyList[i].grDate).attr("class","replyDate");
                       		
                       		
                       		
                       		$td1.append($name);
                       		$td2.append($content);
                       		$td3.append($date);
                       		
                       		$tr.append($td1);
                       		$tr.append($td2);
                       		$tr.append($td3);
                       		
                       		$replyBox.prepend($grNo);
                       		$replyBox.prepend($tr);

                      		  }
                       		
                       		
                       	},
                      	  	error:function(request, status, errorData){
         						alert("error code: " + request.status + "\n"
         								+"message: " + request.responseText
         								+"error: " + errorData);
         					}
                			
                		})
         	}
         	
         </script>
         
         <!-- 대댓글 함수 -->
         <script>
         let reReplySubmit = function(){
	        	var gmNo = ${gInfoGmNo};
	           	var gbNo = ${boardList.gbNo};
     			var grrCon = $("#replyWirte").val();
				 
   				if(grrCon == ""){
             		 alert("댓글을 입력해주세요.");
               	 } else {
/*                		var gmNo = ${gInfoGmNo};
                   	var gbNo = ${boardList.gbNo};
             
                   	console.log("grNO :  " + grNo); */
                   	
                   	// re댓글
        			$.ajax({
             			url:"reReplyAjax.do",
           				type: "GET",
           			 /* async:false, */
                        dataType: "json",
                     	data:{gmNo:gmNo, grNo:grNo, gbNo:gbNo, grrCon:grrCon},
                     	success:function(data){
                     		
                     		alert(data.reReplyList);
                     		console.log(data);
                     		$("#replyWirte").val("");	
                     		$replyName.remove();
             				$reset.remove();
             		   
                     	   for(i in data.reReplyList){ 
                     		 
                     		 var $replyTr = $replyNameLocation.closest(".replyTr");
                     		   
                     		 var $tr = $("<tr>");
                     		 var $td1 = $("<td>");
                     		 var $td2 = $("<td>");
                     		 var $td3 = $("<td>");
                     		     
                     		 var $re = $("<span>").text("subdirectory_arrow_right").attr("class","material-icons re");
                			 var $rereName = $("<div>").text(data.reReplyList[i].name).attr("class","rereName");
                			 var $rereCon = $("<div>").text(data.reReplyList[i].grrCon);
                			 var $rereDate = $("<div>").text(data.reReplyList[i].grrDate);
                			
                			 $td1.append($re);
                			 $td1.append($rereName);
                			 $td2.append($rereCon);
                			 $td3.append($rereDate);
                			 
                			 $tr.append($td1);
                			 $tr.append($td2);
                			 $tr.append($td3);
                			 
                			 $replyTr.after($tr);
                		  }  
                     		
                     		
                     		 $replyNameLocation.append(); 
                    		
                    	},
                   	  	error:function(request, status, errorData){
      						alert("error code: " + request.status + "\n"
      								+"message: " + request.responseText
      								+"error: " + errorData);
      					}
         		})
               	 }  // if(grCon == "") end
         }
     			 
         </script>
         
         
         
         
         
         
         
         
         
        
          <jsp:include page="../common/footer.jsp"/>	 
</body>
</html>