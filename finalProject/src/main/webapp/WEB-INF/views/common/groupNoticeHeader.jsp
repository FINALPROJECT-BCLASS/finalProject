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
      /* background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif; */
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }
    
    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px; }
    .noticeIcon{color:#F3F3F3; font-size:30px !important;}
    
	 /* 공지 */
    .noticeText{ background: linear-gradient(#285fe1b3, #2860E1 ) fixed; box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.048); position:absolute; top:0; float: right; margin:auto; width: 100%; }
    .noticeTb{margin-left:20px;}
    .noticeTitle{padding-top:20px; padding-left:5px; font-size: 20px; color:#F3F3F3; }
    .noticeWriter, .noticeDate {padding-left:5px; font-size:12px; font-weight: 600;  color:#F3F3F3; }
    .noticeContent{padding-top:5px; padding-left:15px; padding-bottom: 20px; font-size:14px; color:#F3F3F3; }
</style>
</head>
<body>
	<!-- 공지사항 -->
	<div class="noticeText">
	   	<c:if test="${!empty noticeList }">
        <table class="noticeTb">
          <tr>
	          <td><span class="material-icons noticeIcon">campaign</span></td>
	          <td><div class="noticeTitle">${noticeList.gnTitle }</div></td>
          </tr>
          <tr><td></td><td><div class="noticeWriter">${noticeList.name }</div></td></tr>
          <tr><td></td><td><div class="noticeDate">${noticeList.gnDate }</div></td></tr>
          <tr><td></td><td><div class="noticeContent">${noticeList.gnCon }</div></td></tr>
        </table>
        </c:if>
      </div>
</body>
</html>