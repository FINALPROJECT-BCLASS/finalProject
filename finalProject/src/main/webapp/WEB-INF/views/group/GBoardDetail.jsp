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
	
	input:focus {outline:none;}
	
	 /* 구글 아이콘 */
    .material-icons{font-size:30px !important; padding-top:12px; padding-left: 10px; padding-right: 10px;  }
	.like{color:#f3487b;}
    .reply{color:#2860E1;}

    .join-form-area{padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
    .material-icons{font-size:30px;}

	
	/* 게시판 양식 */
    .detailBox{width:1000px; background:white; border-radius:10px 10px 0px 0px;}
    .MemberImgBox{text-align:center; padding:10px 0px 0px 10px;}
    .MemberImg{width:60px; height:60px; border-radius:40%;}
    .BoardTitle, .BoardName, .BoardDate, .BoardCount{display:inline-block; color:#484848;margin-right:10px;}
    .BoardTitle, .BoardName{padding:10px 0px 0px 10px;}
    .BoardName{font-size:15px; font-weight:600; }
    .BoardCon{text-align:left; padding:20px 0px 20px 20px;}
    .done{font-weight:600 !important; font-size:14px !important; padding-right:2px !important;}
    
    .groubJoinBtn{text-align: center;}
	
	/* 게시판 내용 칸  */
    .contentBox{width:1000px; text-align:center;}
    .contentBox tr{background:white;}
	.boardImg{width:50%; height: 40%;}
	
	/* 좋아요, 댓글칸 */
    .commentBox{width:1000px; background:white;border:1px solid #F3F3F3;}
    
    .like {cursor:pointer;}
	
	.noReply{color:gray; }
    .replyBox{height: 40px;border-radius: 0px 0px 10px 10px; width:1000px; border-collapse:collapse; background:white; }
    .replyBox tr{border:1px #F3F3F3 solid;}
    .replyBox td:nth-child(1){text-align:center; width:100px;}
    .replyBox td:nth-child(2){width:800px;}
    .replyBox td:nth-child(3){text-align: center;}

    #replyWirte{padding: 9px 9px 0px 19px;border:none;width:800px; height:30px; border-radius:6px;}
    .reName{display:inline-block; font-weight:600; padding-top:9px;}
    .replyTr, .reReplyTr{height:40px;}
    .replyBtn{background:#FBD14B; border:none;  font-weight: 600; font-size: 14px; border-radius:6px; width:67px; height:35px;}
    .replyBtn:hover{border:#ffc400; border:none; color:#2860E1; font-weight: 600; font-size: 14px; border-radius:6px; width:67px; height:35px;}
	.replyConBox{padding-left:20px;align-item:center; display:flex;justify-conten:center;height:40px; margin-right:10px; width:920px;border:none; border-radius: 6px; background:white;}
	.replyReset{margin-right:10px; padding-top:9px; width:20px; display:inline-block; color:gray; font-weight:600; text-align:right; padding-bottom:9px; cursor:pointer;}
	.replyName{ cursor:pointer; }
	.replyDate{display:inline-block;}
	
	.removeReply{color:gray; text-align:left;padding-left:20px;}
	
	/* 대댓글 */
	.re{font-weight:600 !important; color:gray !important; display:inline-block; font-size:15px !important; margin: 0 !important; padding:0 !important; text-shodow:0 !important;}
	.rereName{display:inline-block;}
	
	
    #submit{background:none; border:none; color:#2860E1; font-weight: 700; font-size: 20px; border-radius:6px; width:60px; height:35px;margin-right: 20px; cursor:pointer;}
    #reset{background:none; border:none; color:#484848; font-weight: 700; font-size: 20px; width:100px; cursor:pointer;    margin-right: 20px;}
	#delete{background:none; border:none; color:#ee1212d0; font-weight: 700; font-size: 20px; width:100px; cursor:pointer;    
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<jsp:include page="../common/sidenaviGroup.jsp"/>
	
	
    <div class="join-form-area">
    
    <jsp:include page="../common/groupNoticeHeader.jsp"/>
    
        <h1>Group Diary</h1>
        <h4 class="pSubject">Board Detail</h4><br>
            <div class="groupJoin">
                <table class="detailBox">
                    <tr>
                        <td rowspan="2" style="width:20px">
                        	<div class="MemberImgBox">
                        		<c:if test="${empty memberPhoto }">
                        			 <img src="resources/images/icons/profile_default.png" class="MemberImg">
                        		</c:if>
                        		<c:if test="${!empty memberPhoto }">
                        			<img src="resources/muploadFiles/${memberPhoto }" class="MemberImg">
                        		</c:if>
                        	</div>
                        </td>
                        <td>
                        	<div class="BoardTitle">
                        		${boardList.gbTitle }
                        	</div>
                        </td>
                       
                      
                    </tr>
                    <tr>
                        <td>
                        	<div class="BoardName">${boardList.name }</div>
                        	<div class="BoardDate">${boardList.gbDate }</div>
                        	<div class="BoardCount">
                        	<span class="material-icons done">done</span>
                        	${boardList.gbCount }</div>
                        </td>
                    </tr>
                </table>
                <table class="contentBox">
                    <tr>
                        <td><div class="BoardCon">${boardList.gbCon }</div></td>
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
                <div class="commentBox">
	                <table class="commentBoxTb">
	                    <tr>
	                        <td>
	                        	<c:if test="${empty likeList }">
	                        		<span class="material-icons like">favorite_border</span>
	                        	</c:if>
	                        	<c:if test="${!empty likeList }">
	                        		<span class="material-icons like">favorite</span>	
	                        	</c:if>
	                        </td>
	                        <td><span class="titalLike">${totalLike }</span></td>
	                        <td>
	                      	  <span class="material-icons reply">sms</span>
	                        </td>
	                        <td><div class="totalReply">${totalReply }</div></td>
	                    </tr>
	                </table>
                </div>
                <table class="replyBox">
                	<tbody>
                	<c:if test="${empty replyList }"><!-- 댓글이 없을 경우 -->
                		<tr class="noReplyTr">
                			<td colspan="3" align="center" class="noReplyTd"><div class="noReply">등록된 댓글이 없습니다.</div></td>
                		</tr>	
                	</c:if>
                	<c:if test="${!empty replyList }"><!-- 댓글이 있을 경우 -->
                		<c:forEach var="r" items="${replyList }">
                				<c:if test="${r.grDelete eq 'N' }">
		               			<input type="hidden" class="crNo" value="${r.grNo }">
			               		<tr class="replyTr">
			                        <td><div class="replyName">${r.name }</div></td>
			                        <td><div class="replyCon">${r.grCon }</div></td>
			                        <td><div class="replyDate">${r.grDate }</div></td>
			                        <c:if test="${gInfoGmNo eq  r.gmNo}">
			                        	<td><div class="replyReset replyDelete">x</div></td>
			                        </c:if>
			                    </tr>
		                    	</c:if>
		                    	
		                    	<c:if test="${r.grDelete eq 'Y' }">
	                    			<tr class="replyTr">
		                    			<td colspan="3">
		                    				<div class="removeReply">삭제한 댓글입니다.</div>
		                    			</td>
		                    		</tr>
		                    	</c:if>
		                    
		                    	<c:forEach var="re" items="${reReplyList }">
			                    	<c:if test="${ re.grNo eq r.grNo}">
			               			<input type="hidden" class="crNo" value="${r.grNo }">
					               		<tr class="reReplyTr" data-value="${re.grrNo }">
					                        <td><span class="material-icons re">subdirectory_arrow_right</span><div class="rereName">${re.name }</div></td>
					                        <td><div class="replyCon">${re.grrCon }</div></td>
					                        <td><div class="replyDate">${re.grrDate }</div></td>
					                        <c:if test="${gInfoGmNo eq  re.gmNo}">
			                        			<td><div class="replyReset reReplyDelete">x</div></td>
			                      			</c:if>
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
                        		<input type="text" name="grCon" id="replyWirte" placeholder="댓글을 남겨보세요.">
                        	</div>
                       	</td>
                        <td><button class="replyBtn">submit</button></td>
                    </tr>
                </table>

               <br><br>
                <c:if test="${gInfo.gmNo eq boardList.gmNo }">
	                <div class="groubJoinBtn">
	                    <span id="reset">Back</span>
	                   <span id="submit" onclick="location.href='boardUpdate.do?gbNo='+${boardList.gbNo}">Update</span>
	                    <span id="delete">Delete</span>
	                </div>
                </c:if>
                <c:if test="${gInfo.gmNo ne boardList.gmNo }">
                	<div class="groubJoinBtn">
	                    <span id="reset">Back</span>	                   
	                </div>
                </c:if>
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
         				$(".replyConBox").css("justify-content","none");
         				$replyName.remove();
         				$reset.remove();
         			})
         		} // if($(".reName").length == 0)
			})
         </script>
         
          <!-- 함수 실행 -->
         <script>         	
          	$(".replyBtn").click(function(){
         		if($(".reName").length == 0){	// @이름이 없는 경우
         			if($("#replyWirte").val() == ""){
						alert("댓글을 입력해주세요.");         				
         			}else{						
         				
         			replySubmit();
         			}
         		} else {						// @이름이 있는 경우
         			reReplySubmit();
         			$(".replyConBox").css("justify-content","none");
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
                        	// 처음 댓글을 작성했을 떄 "등록된 댓글이 없습니다" 없애주기.	
                        	$(".noReply").remove();
                        	$(".noReplyTd").remove();
                        	$(".noReplyTr").remove();
                        		
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
                       		var $td4 = $("<td>");
                       		
                       		var $name = $("<div>").text(data.replyList[i].name).attr("class","replyName");
                       		var $content = $("<div>").text(data.replyList[i].grCon).attr("class","replyCon");
                       		var $date = $("<div>").text(data.replyList[i].grDate).attr("class","replyDate");
                       		var $replyDelete = $("<div>").text("x").attr("class","replyReset replyDelete");
                       		
                       		
                       		$td1.append($name);
                       		$td2.append($content);
                       		$td3.append($date);
                       		$td4.append($replyDelete);
                       		
                       		$tr.append($td1);
                       		$tr.append($td2);
                       		$tr.append($td3);
                       		$tr.append($td4);
                       		
                       		$replyBox.prepend($tr);
                       		$replyBox.prepend($grNo);

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
                   	// re댓글
        			$.ajax({
             			url:"reReplyAjax.do",
           				type: "GET",
                        dataType: "json",
                     	data:{gmNo:gmNo, grNo:grNo, gbNo:gbNo, grrCon:grrCon},
                     	success:function(data){

                     		$("#replyWirte").val("");	
                     		$replyName.remove();
             				$reset.remove();
             		   
                     	   for(i in data.reReplyList){ 
                     		 
                     		 var $replyTr = $replyNameLocation.closest(".replyTr");
                     		   
                     		 var $tr = $("<tr>").attr("class","reReplyTr").attr("data-value",data.reReplyList[i].grrNo);
                     		 var $td1 = $("<td>");
                     		 var $td2 = $("<td>");
                     		 var $td3 = $("<td>");
                     		 var $td4 = $("<td>");
                     		     
                     		 var $re = $("<span>").text("subdirectory_arrow_right").attr("class","material-icons re");
                			 var $rereName = $("<div>").text(data.reReplyList[i].name).attr("class","rereName");
                			 var $rereCon = $("<div>").text(data.reReplyList[i].grrCon);
                			 var $rereDate = $("<div>").text(data.reReplyList[i].grrDate);
                			 var $reReplyDelete = $("<div>").text("x").attr("class","replyReset reReplyDelete");
                			 
                			 
                			 $td1.append($re);
                			 $td1.append($rereName);
                			 $td2.append($rereCon);
                			 $td3.append($rereDate);
                			 $td4.append($reReplyDelete);
                			 
                			 $tr.append($td1);
                			 $tr.append($td2);
                			 $tr.append($td3);
                			 $tr.append($td4);
                			 
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
         
         <!-- 댓글 삭제 -->
			<script>
         	 $(document).on("click",".replyDelete",function(){
         		var deleteConfirm = confirm("댓글을 삭제하시겠습니까? ");
         		if(deleteConfirm){
					/* var deleteCon = $(this).parent().prev().prev().children(); */
         			var deleteTr = $(this).closest(".replyTr");
					var deleteTd = $(this).closest(".replyTr").children();
         			var removeTd = $("<td>").attr("colspan", 3);
         			var deleteComment = $("<div>").text("삭제한 댓글입니다.").attr("class","removeReply");
					var reReplyYn = deleteTr.next().next();
					var deleteInput = deleteTr.prev();
         			var grNo = deleteInput.val();
         			
         			deleteTd.remove();
         			removeTd.append(deleteComment);
         			deleteTr.append(removeTd);
         			
         			
         			
         			/* deleteCon.text("삭제한 댓글입니다.").css("color","gray");	 */
					deleteInput.remove();

        			$.ajax({
             			url:"replyDelete.do",
           				type: "GET",
                        dataType: "text",
                     	data:{grNo:grNo},
                     	success:function(data){                     	
                     		console.log(data);
                     		
                    	},
                   	  	error:function(request, status, errorData){
      						alert("error code: " + request.status + "\n"
      								+"message: " + request.responseText
      								+"error: " + errorData);
      					}
         		})
         		}
			})
 			</script>        
         
         <!-- 대댓글 삭제@@@@@@@@@@@@@@@@수정중 -->
			<script>
         	 $(document).on("click",".reReplyDelete",function(){
         		var deleteConfirm = confirm("댓글을 삭제하시겠습니까? ");
         		if(deleteConfirm){
					/* var deleteCon = $(this).parent().prev().prev().children(); */
         			var deleteTr = $(this).closest(".reReplyTr");
					var deleteTd = $(this).closest(".reReplyTr").children();
         			var removeTd = $("<td>").attr("colspan", 3);
         			var deleteComment = $("<div>").text("삭제한 댓글입니다.").attr("class","removeReply");
					/* var deleteInput = deleteTr.prev(); */
         			var grrNo =  deleteTr.attr('data-value');
         
         			deleteTd.remove();
         			removeTd.append(deleteComment);
         			deleteTr.append(removeTd);

/* 					deleteInput.remove(); */

        			$.ajax({
             			url:"reReplyDelete.do",
           				type: "GET",
                        dataType: "text",
                     	data:{grrNo:grrNo},
                     	success:function(data){                     	
                     		console.log(data);
                     		
                    	},
                   	  	error:function(request, status, errorData){
      						alert("error code: " + request.status + "\n"
      								+"message: " + request.responseText
      								+"error: " + errorData);
      					}
         		})
         		}
			})
 			</script>        
         
         
         
         
         
        
          <jsp:include page="../common/footer.jsp"/>	 
</body>
</html>