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

    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
    .groupJoin{width:900px;}

    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px; text-shadow: 1.5px 1.5px 1.5px gray; }
   
    /* 공지 */
    .noticeText{float: right;margin:auto; width: 81%; background:#c2c2c2; border-radius: 0 0 5px 5px;  }
    .noticeTb{margin-left:20px;}
    .noticeTitle{padding-top:20px; padding-left:10px;font-weight: 600; font-size: 20px;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeDate{padding-left:10px; font-size:12px; font-weight: 600;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeContent{padding-top:5px; padding-left:10px; padding-bottom: 20px; font-size:14px;  text-shadow: 1.5px 1.5px 1.5px gray; }

    /* 공지게시판 */
    .groupNotice{width:100%; height:400px;overflow:scroll; border-radius:10px; }
    .noticeBoardTb{width:100%; background:white;border:0.5px solid lightgray;}
    .noticeBoardTitle{padding-top:20px; padding-left:10px;font-weight: 600; font-size: 20px;}
    .noticeBoardDate{padding-left:10px; font-size:12px; font-weight: 600;}
    .noticeBoardContent{padding-top:5px; padding-left:10px; height:50px; overflow:scroll; overflow-x:hidden; font-size:13px;}
	</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

	<jsp:include page="../common/sidenaviGroup.jsp"/>

	  <div class="noticeText">
        <table class="noticeTb">
          <tr><td><span class="material-icons">campaign</span></td><td><div class="noticeTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
          <tr><td></td><td><div class="noticeDate">2020-06-12 오후 06:00</div></td></tr>
          <tr><td></td><td><div class="noticeContent">파이널 프로젝트는 8월 27일에 종료됩니다.</div></td></tr>
        </table>
      </div>
      <div class="join-form-area">
  
        <h1>Group Diary</h1>
        <div class="btnList">
          
            <button class="groupBtn noticeBtn">Notice</button>
            <button class="groupBtn BoardBtn">Board</button>
            <button class="groupBtn PhotoBtn">Photo</button>
            <button class="groupBtn VideoBtn">Video</button>
          
      </div>
        <br>

            <div class="groupNotice">
              <table class="noticeBoardTb">
                <tr><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              </table>
             
              <table class="noticeBoardTb">
                <tr><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              </table>
              <table class="noticeBoardTb">
                <tr><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              </table>
              <table class="noticeBoardTb">
                <tr><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              </table>
              <table class="noticeBoardTb">
                <tr><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              </table>
              <table class="noticeBoardTb">
                <tr><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              </table>
              <table class="noticeBoardTb">
                <tr><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              </table>
              <table class="noticeBoardTb">
                <tr><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              </table>
             
            </div>
          
         </div>

	<jsp:include page="../common/footer.jsp"/>	
	
	
</body>
</html>
