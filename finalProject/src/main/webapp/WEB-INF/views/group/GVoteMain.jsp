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
    .btnList{width:100%; text-align:right;}
    .groupBtn{border:none; font-weight: 600; background:none;}
    .voteBtn{color:#2860E1; font-size: 21px;}
    .join-form-area{padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
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
            <button class="groupBtn voteBtn" onclick="location.href='.do'">Voting</button>
            <button class="groupBtn FinishedBtn" onclick="location.href='.do'">Finished</button>
    	</div>
     	
     	<br>
      	<div id="groupWrite"  ><span class="material-icons writeBtn">create</span></div>
        <br>
        <br>
        
        <div class="groupListCount">총 투표 : ${pi.listCount }</div>
		<div style="clear:both"></div>
     	
		 <div class="groupNotice">
		 
		 	<br>
 
          </div>
		</div>
</body>
</html>