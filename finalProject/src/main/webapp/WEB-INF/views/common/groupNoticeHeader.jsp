<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	    
    .noticeTb{margin-left:20px;}
    .noticeTitle{font-size: 18px; color:#484848;}
    .noticeWriter, .noticeDate {font-size:12px; margin: 0px 7px 0px 7px; color:gray;}
    .noticeContent{padding-top:5px; padding-bottom: 20px; font-size:14px; color:#484848; }
</style>
</head>
<body>
	<!-- 공지사항 -->
<c:if test="${!empty noticeList }">
	<div class="noticeText">
	<span class="material-icons noticeIcon">campaign</span>
        <table class="noticeTb">
          <tr>
	          
	          <td><div class="noticeTitle">${noticeList.gnTitle }</div></td>
	          <td><div class="noticeWriter">${noticeList.name }</div></td>
          	  <td><div class="noticeDate">${noticeList.gnDate }</div></td>
          </tr>
          
          <tr><td colspan="3"><div class="noticeContent">${noticeList.gnCon }</div></td></tr>
        </table>
      </div>
</c:if>      
</body>
</html>