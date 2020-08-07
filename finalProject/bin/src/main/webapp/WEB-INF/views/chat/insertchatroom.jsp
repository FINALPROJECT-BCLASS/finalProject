<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertchatroom</title>
</head>
<style>
  .insertopenchatroomtitle{
            font-size: 35px;
            margin-bottom: 30px;
        }
</style>
<body>
	<jsp:include page="../common/chatheader.jsp"/>
	<h1 class="insertopenchatroomtitle">오픈채팅방 개설하기</h1>
			<form action="openchatroominsert.do" method="post" >
				<table cellpadding="8px">
					<tr>
						<td>채팅방 이름</td>
						<td><input type="text" id="cm_title" name="cm_title"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" id="cm_pwd" name="cm_pwd"></td>
					</tr>
					<tr>
						<td>최대인원</td>
						<td><input type="text" id="cm_max" name="cm_max"></td>
					</tr>
					<tr>
						<td>소개</td>
						<td><textarea id="cm_con" name="cm_con"></textarea></td>
					</tr>
				</table>
				<button type="submit" class="default-btn b-yell">방만들기</button>
			</form>
</body>
</html>