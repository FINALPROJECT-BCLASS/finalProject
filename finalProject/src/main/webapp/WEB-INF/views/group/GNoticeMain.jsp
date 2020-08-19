<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<style>
	html, body { height:100%;}

    h1{text-align:center;}
    .btnList{width:100%; text-align:right;}
    .groupBtn{border:none; font-weight: 600; background:none;}
    .noticeBtn{color:#2860E1; font-size: 21px;}

    .join-form-area{padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
    .groupJoin{width:900px;}

    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px; }
   .noticeIcon{color:#F3F3F3;}
   
   /* 공지 */
    /* .noticeText{ background: linear-gradient(#285fe1b3, #2860E1 ) fixed; box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.048); position:absolute; top:0; float: right; margin:auto; width: 100%; } */
    .noticeTb{margin-left:20px;}
    /* .noticeTitle{padding-top:20px; padding-left:5px; font-size: 20px; color:#F3F3F3; }
    .noticeWriter, .noticeDate {padding-left:5px; font-size:12px; font-weight: 600;  color:#F3F3F3; }
    .noticeContent{padding-top:5px; padding-left:15px; padding-bottom: 20px; font-size:14px; color:#F3F3F3; } */
    .noticeTitle{font-size: 18px; color:#484848;}
    .noticeWriter, .noticeDate {font-size:12px; margin: 0px 7px 0px 7px; color:gray;}
    .noticeContent{padding-top:5px; padding-bottom: 20px; font-size:14px; color:#484848; }

	/* 글쓰기 버튼 */
	#groupWrite {text-align:right; width:100%; height: 50px; margin-right:40px; margin-bottom:10px; border:none;}
    .groupWrite {width:50 px; height:40px; cursor: pointer; border-radius: 5px;} 
    button {margin-bottom: 10px; margin-right:40px; background:none; border:0;}
	.writeBtn{margin-right:30px;color:#aeaeae !important; font-size:50px !important; cursor:pointer; padding:0 !important;}
    .writeBtn:hover{margin-right:30px;color:#2860E1 !important; font-size:50px !important; cursor:pointer; padding:0 !important;}
	.groupListCount{width:95%; margin-bottom:10px; text-align:right; font-weight:600;}
	
    .emptyNoticeList{color: gray;margin-top:200px; text-align:center; font-size:15px; font-weight:600;}
    /* 공지게시판 */
    .memberImgBox{width:50px; height:50px; display:inline-block;margin:10px;}
   	.memberImg{width:100%; height:100%;border-radius:50%; }
    
    .groupNotice{width:100%; height:400px;overflow:scroll; overflow-x:hidden;}
    .noticeBoardTb{margin-bottom:10px; margin-right:5px; border-radius:10px; width:100%; background:white;}
    .noticeBoardTitle{display:inline-block;padding-top:20px;font-weight: 600; font-size: 20px;}
    .noticeBoardWriter{padding-left:40px; font-size:12px; font-weight: 600;}
    .noticeBoardDate{padding-left:40px; font-size:12px; font-weight: 600;}
    .noticeBoardContent{padding-top:5px; padding-left:40px; height:50px; overflow:scroll; overflow-x:hidden; overflow-y:hidden; font-size:13px;}
	#groupCon, #conModi{resize:none;}
	/* 수정버튼  */
	.aditBtn{border:none; cursor:pointer; padding-top:6px; text-align:center; border-radius:6px; background:#FBD14B; width:60px; height:35px; margin:0 auto;}
	.aditBtn:hover{border:none; cursor:pointer; padding-top:6px; text-align:center; border-radius:6px; background:#fac107; width:60px; height:35px; margin:0 auto;}
	 .td5{width:7%; }

	/* modal */
	 .modal-content{ 
	position: auto;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
    width: 85% !important;	
    display: flex;
    align-items: center;
    padding: 40px; 
	}
	
	.modal-dialog{
		height: 100%;
		max-width:800px !important;	/* 모달 가로 넓이 */
	}
	
	.ModalTitle{
	    font-size: 30px;
	    font-weight: 700;
	    text-align: center;
	}
	
	.updateBtn, .deleteBtn {display:inline-block; margin-right:10px;}
	
	/* 공지사항 작성 */
	.groupTb{margin:auto; width:600px; border-spacing: 10px; border-collapse: separate;}
    .groupTbTd {text-align:end;}
    input{width:100%;height:40px; background:#F3F3F3;  padding-left: 10px; border:none; border-radius: 6px;}
    
     #groupCon, .groupCon{width:100%; border:none; background:#F3F3F3; border-radius: 6px;}
    
    
    .noticeBoardTb > tr > td:nth-child(1) {
        color: #484848;
        text-align: left;
        font-weight: 600;
        font-size: 16px;
        width:40px;
    }
    
    .noticeText {
    	padding: 10px;
    	position: absolute;
	    top: 25px;
	    left: 95px;
	    height: 80px;
	    float: right;
	    margin: auto;
	    width: 88%;
	    border-radius: 0 10px 10px 10px;
	    background: #dee8ff;
	    border: 1px solid #bcd0ff;
    }
    
    .noticeIcon {
    	position: absolute;
	    left: -40px;
	    top: 1px;
	    padding:0;
	    font-size: 29px !important;
	    color: gray;
    }
    
	</style>
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
	 <!-- 공지사항  -->	
	 
	  
	   	<c:if test="${!empty noticeList}">
	  <div class="noticeText">
	  	<span class="material-icons noticeIcon">campaign</span>
        <table class="noticeTb">
          <tr>
	          <td><div class="noticeTitle">${noticeList[0].gnTitle }</div></td>
	          <td><div class="noticeWriter">${noticeList[0].name }</div></td>
          	  <td><div class="noticeDate">${noticeList[0].gnDate }</div></td>
          </tr>
          
          <tr><td><div class="noticeContent">${noticeList[0].gnCon }</div></td></tr>
        </table>
      </div>
        </c:if>
  
        <h1>Group Diary</h1>
        
        <div class="btnList">
            <button class="groupBtn noticeBtn" onclick="location.href='noticeMain.do'">Notice</button>
            <button class="groupBtn BoardBtn" onclick="location.href='boardMain.do'">Board</button>
            <button class="groupBtn PhotoBtn">Photo</button>
            <button class="groupBtn VideoBtn">Video</button>
    	</div> 
    	
      	<br>
      	<div id="groupWrite" ><span class="material-icons writeBtn" id="writeBtn">create</span></div>

        <br>
		<div class="groupListCount">Total : ${pi.listCount }</div>
		<div style="clear:both"></div>
		
            <div class="groupNotice">
	           
	            <br>
	           	
	           	<c:if test="${empty noticeList }">
	           		<div class="emptyNoticeList"> 작성한 공지가 없습니다.</div>
	           	</c:if>

            </div>
          
         </div>
         
         
         

	  <!-- 스크롤 게시판-->
	   <script>
	   		var gInfo = ${gInfo.gmNo};
	   		
	         let isEnd = false;

	         var pagePlus = 1;
	         $(function(){
	        	 
	        	    $(".groupNotice").scroll(function(){
	               	 console.log("ajax 전 page : " + ${pi.currentPage});
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
	                 url:"noticeMain2.do",
	                 type: "GET",
	                 dataType: "json",
	                 data:{page:pagePlus},
	                 success: function(data){
	                	 page = data.noticeList[0].page;
	                	 pagePlus = page + 1;
	                	 
	                     // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
	                     // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
	                	 let length =  data.noticeList.length;
	                	 console.log("length : " + length);
	                	 
	                     if( length < 5 ){
	                         isEnd = true;
	                     }

	                     
	                     for(i in data.noticeList){
	
	                    	var $groupNotice = $(".groupNotice");
	                    	var $noticeBoardTb = $("<table>").attr("class","noticeBoardTb");
	                    	var $tr1 = $("<tr>");
	                    	var $tr2 = $("<tr>");
	                    	var $tr3 = $("<tr>");
	                    	var $tr4 = $("<tr>");
	                   
	                    	var $td1 = $("<td>");
	                    	var $td2 = $("<td>");
	                    	var $td3 = $("<td>");
	                    	var $td4 = $("<td>");
	                    	var $td5 = $("<td>").attr("class","td5");
	                    	
	                    	var $emoticon = $("<div>").attr("class","MemberImgBox");
	                    	var $memberNoImg = $("<img>").attr("class","memberImg").attr("src","resources/images/icons/profile_default.png");
	                    	var $memberImg = $("<img>").attr("class","memberImg").attr("src","resources/muploadFiles/"+data.noticeList[i].renameFile);
	                    	
	                    	var $noticeBoardTitle = $("<div>").text(data.noticeList[i].gnTitle).attr("class","noticeBoardTitle");
	                    	var $titleInput = $("<input type='hidden' id='noticeTitle' value='"+ data.noticeList[i].gnTitle+"'>");
	                    	
	                    	var $noticeBoardWriter = $("<div>").text(data.noticeList[i].name).attr("class","noticeBoardWriter");
	                    	var $noticeBoardDate = $("<div>").text(data.noticeList[i].gnDate).attr("class","noticeBoardDate");
	                    	
	                    	var $noticeBoardContent = $("<div>").text(data.noticeList[i].gnCon).attr("class","noticeBoardContent td4");
	                    	var $conInput = $("<input type='hidden' id='noticeCon' value='"+ data.noticeList[i].gnCon +"'>")  
	                    		
	                    	var $aditBtn = $("<div>").text("Edit").attr("class","aditBtn");
	                    	var $gnNo = $("<input type='hidden' id='gnNo' value='"+data.noticeList[i].gnNo+"'>");
	                    	
	                    	if(gInfo != data.noticeList[i].gmNo){
	                    		
	                    		if(data.noticeList[i].renameFile == null){
	                         		$emoticon.append($memberNoImg);
	                         	}else{
	                         		$emoticon.append($memberImg);
	                         	}
	                    		
	                    		$td1.append($emoticon);
	                    		$td1.append($noticeBoardTitle);
	                    		$td1.append($titleInput);
		                    	$tr1.append($td1);
		                    	
		                    	$td2.append($noticeBoardWriter);
		                    	$tr2.append($td2);
		                    	
		                    	$td3.append($noticeBoardDate);
		                    	$tr3.append($td3);
		                    	
		                    	$td4.append($noticeBoardContent);
		                    	$td4.append($conInput);
		                    	$tr4.append($td4);
		                    	
		                    	
	                    	
	                    	} else{
	                    		if(data.noticeList[i].renameFile == null){
	                         		$emoticon.append($memberNoImg);
	                         	}else{
	                         		$emoticon.append($memberImg);
	                         	}
	                    		
	                    		$td1.append($emoticon);
	                    		$td1.append($noticeBoardTitle);
	                    		$td1.append($titleInput);
		                    	$tr1.append($td1);
		                    	$td5.append($aditBtn);
		                    	$td5.append($gnNo);
		                    	$tr1.append($td5);	
		                    	
		                    	$td2.append($noticeBoardWriter);
		                    	$tr2.append($td2);
		                    	
		                    	$td3.append($noticeBoardDate);
		                    	$tr3.append($td3);
		                    	
		                    	$td4.append($noticeBoardContent);
		                    	$td4.append($conInput);
		                    	$tr4.append($td4);
		                    		
	                    	}
	                    		
	                    	
	                    	
	                    	$noticeBoardTb.append($tr1);
	                    	$noticeBoardTb.append($tr2);
	                    	$noticeBoardTb.append($tr3);
	                    	$noticeBoardTb.append($tr4);
	                    	$groupNotice.append($noticeBoardTb); 
	
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
	      
	      
	 
	 		<!-- 공지사항 글쓰기 modal -->
		 	<div class="modal fade" id="modal">
		  				<div class="modal-dialog">
		  					  <div class="modal-content">
		  					  		<span class="ModalTitle">Group Diary</span>
		  					  		<br>
		  					  		<span>Notice Write</span>
		  					  		<br>

		  					  		 <form id="noticeWriteForm" action="gNoticeWrite.do" method="post">
					                    <table class="groupTb">
					                    	
					                        <tr>
					                            <td class="groupTbTd">Title&nbsp;</td>
					                            <td><input type="text" name="gnTitle" id="title" placeholder="  제목 작성" required></td>
					                        </tr>
					                       
					                 
					                        <tr>
					                            <td class="groupTbTd">Content&nbsp;</td>
					                            <td>
					                                <textarea id="groupCon" name="gnCon" required></textarea>
					                            </td> 
					                        </tr>

					                    </table>
					                </form>
		  					  		<button id="detailbtn" class="default-btn b-yell" type="button">Submit</button>
		       					 <!-- remote ajax call이 되는영역 -->
		   					 </div>
		  				</div>
					</div>

		 <script>
		 $("#writeBtn").click(function(){
			 
		 $("#modal").modal();
		 })
		 
		 $("#detailbtn").click(function(){
			 if($("#title").val() != "" && $("#groupCon").val() != ""){
				 
			 $("#noticeWriteForm").submit();
			 }else{
				 alert("공지 제목 혹은 공지 내용을 입력해주세요.");
			 }
		 })
		 </script>
		 <!-- 공지사항 글쓰기 modal end -->
	 
	 	<!-- 공지사항 수정하기 modal  -->
	 	<div class="modal fade" id="modalModi">
		  				<div class="modal-dialog">
		  					  <div class="modal-content">
		  					  		<span class="ModalTitle">Group Diary</span>
		  					  		<br>
		  					  		<span>Notice Modify</span>
		  					  		<br>

		  					  		 <form id="noticeModiForm" action="gNoticeUpdate.do" method="post">
					                    <table class="groupTb">
					                        <tr>
					                            <td class="groupTbTd">Title&nbsp;</td>
					                            <td><input type="text" name="gnTitle" id="titleModi" placeholder="  제목 작성" required></td>
					                        </tr>
					                        <tr>
					                            <td class="groupTbTd">Content&nbsp;</td>
					                            <td>
					                                <textarea id="conModi" class="groupCon" name="gnCon" required></textarea>
					                            </td> 
					                        </tr>
					                    </table>
					                </form>
					                <div class="btnBox">
			  					  		<button id="updateBtn" class="updateBtn default-btn b-yell" type="button">Update</button>
			  					  		<button id="deleteBtn" class="deleteBtn default-btn b-lightgray" type="button">Delete</button>
		  					  		</div>
		       					 <!-- remote ajax call이 되는영역 -->
		   					 </div>
		  				</div>
					</div>

		<!-- 공지사항 삭제 -->
		<script>
			$("#deleteBtn").click(function(){
				var gnNo = $("#gnNo").val();
				var deleteConfirm = confirm("공지사항을 삭제하시겠습니까? ");
		 		if(deleteConfirm){
		 			alert("공지사항이 삭제되었습니다.");
		 			location.href="deleteNotice.do?gnNo="+gnNo;
		 		}
			})
		</script>

		<!-- 공지사항 작성 modal -->
		 <script>
		 var gnNo;
		 
		 $(document).on("click",".aditBtn",function(){
			 $("#modalModi").modal();
			 
			 var title = $(this).closest(".td5").prev().children("#noticeTitle").val();
			 var con = $(this).parent().parent().next().next().next().children().children("#noticeCon").val();
			 gnNo = $(this).next().val();
			 
			 $("#titleModi").val(title);
			 $("#conModi").val(con);
			 $("#gnNo").val(gnNo);
			 
    	})
   
		 
		 <!-- 공지사항 수정하기 modal-->
		 $(".updateBtn").click(function(){
			 if($("#titleModi").val() == "" && $("#conModi").val() == ""){
				 alert("공지 제목 혹은 공지 내용을 입력해주세요.");
			 }else{
			var $gnNoInput = $("<input type='hidden' name='gnNoName' value='"+ gnNo +"'>")
			
			$("#noticeModiForm").append($gnNoInput);	 
			 $("#noticeModiForm").submit();
			 }
		 })
		 </script>
		 <!-- 공지사항 수정하기  modal end -->

	<jsp:include page="../common/footer.jsp"/>	
	
	
</body>
</html>
