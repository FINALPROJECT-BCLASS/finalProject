<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	.FriendList {
		height: 85px;
	    display: flex;
	    position: relative;
	    align-items: center;
	    padding: 15px;
	    border-bottom: 1px solid #ececec;
	}
	
	.FriendList:hover {
		background: #f3f3f3;
	}
	
	.FriendList:hover > div:nth-child(2) > div {
		opacity: 1;
		transition-duration: 0.3s;
	}
	
 	.FriendList > div:nth-child(1) {	
        width: 65px;
	    height: 65px;
	    border-radius: 35%;
	    background-color: aliceblue;
	    display: flex;
	    overflow: hidden;
	    align-items: center;
	    justify-content: center;

 	}
 	
 	.FriendList > div:nth-child(2) {
        height: 100%;
	    display: flex;
	    align-items: center;
	    padding-left: 5%;
	    font-size: 16px;
	    font-weight: 600;
	    color: gray;
 	}
 	
 	.Fl_btn {
 		position: absolute;
   		right: 5%;	
   		opacity: 0;
   		display:flex;
   		align-items:center;
 	}
 	
 	
 	.minus-btn {
 		width: 40px;
 		height: 40px;
 		display:flex;
 		justify-content: center;
 		align-items: center;
 		font-size: 60px;
 		border-radius: 50%;
 		border: 3px solid red;
 		color: red;
 
 		/* 위치지정 */
 		position:absolute;
 		right: 5%;
 	}
 	
 	.minus-btn > div {
 		margin-top: -15px;
 	}
 	
 	.hide{
 		display:none;
 	} 
 	
 	.FriendsSearch{
 		display:flex;
 		align-items:center;
 		justify-content:center;
 		height:20%;
 		width:100%;
 		position:absolute;
 		bottom:0;
 		background:#f3f3f3;
 		
 	}
 	input[type="text"]	{ 
	    height: 40px;
	    border: none;
	    border-radius: 9px;
	    width: 250px;
	    margin-right: 10px;
    }
    
    .List {
    	width: 100%;
	    height: 54.5%;
	    overflow: hidden;
	    overflow-y: scroll;
    }
    
    .List::-webkit-scrollbar {
    	display:none;
    
    }
    
    img{
 	   height: 150%;
	}
    <!-- 친구목록 -->
    
    .SearchMemberList {
  		background: aliceblue;
    	height: 20%;
	    display: flex;
	    position: relative;
	    align-items: center;
	    padding: 15px;
	    border-bottom: 1px solid #ececec;
    }
    
    .SearchMemberList > div:nth-child(1) {
   	        width: 65px;
		    height: 65px;
		    border-radius: 35%;
		    background-color: aliceblue;
		    display: flex;
		    overflow: hidden;
		    align-items: center;
		    justify-content: center;
    }
    
     .SearchMemberList > div:nth-child(2) {
   	    font-size: 18px;
	    display: flex;
	    padding-left: 15px;
	    font-weight: 600;
    }
    
    .plus-btn {
 		/* width: 40px;
 		height: 40px;
 		display:flex;
 		justify-content: center;
 		align-items: center;
 		font-size: 60px; */
 		/*border-radius: 50%;
 		border: 3px solid blue;
 		color: blue; */
 		
 		/* 위치지정 */
 		position:absolute;
 		right: 5%;
 	}
 	
 	.chatgobtn {
 		border:none;
 		background: none;
	    display: flex;
    	align-items: center;
 	}
     
    /* .SearchList{
    	width: 100%;
	    height: 69%;
	    overflow: hidden;
	    overflow-y: scroll;
    }
    .SearchList::-webkit-scrollbar {
    	display:none;
    }
    
    .SearchMemberList {
		height: 20%;
		display:flex;
		position: relative;
	}
	
	.SearchMemberList:hover > div:nth-child(2) > div {
		opacity: 1;
		transition-duration: 0.3s;
	}
	
 	.SearchMemberList > div:nth-child(1) {
 		
	    width: 10%;
	    height: 100%;
	    background-color: yellow;
	    display: flex;
	    align-items: center;
	    justify-content: center;

 	}
 	.plus-btn {
 		width: 40px;
 		height: 40px;
 		display:flex;
 		justify-content: center;
 		align-items: center;
 		font-size: 60px;
 		border-radius: 50%;
 		border: 3px solid blue;
 		color: blue; */
 
 		/* 위치지정 */
 		/* position:absolute;
 		right: 5%;
 	}
 	
 	.plus-btn > div {
 		margin-top: -15px;
 	}
    .SearchList > div:nth-child(2) {
	    display: flex;
	    align-items: center;
	    font-size: 20px;
	    font-weight: 500;
 	} */
    
    .material-icons {
    	font-size: 33px;
	    color: darkgray;
	    margin-bottom: -7px !important;
    }
    
    .message:hover {
    	color:#2860E1;
    }
    
    .minus {
    	font-size: 26px !important;
    }
    
    .minus:hover {
    	color:red;
    }
    .material-icons{
    	font-size: 35px;
    }
    .plus:hover{
   		 color:blue;
    }
   
    .myInformation{
	    background: #fffbdc;
	   	height: 15%;
	    display: flex;
	    position: relative;
	    align-items: center;
	    padding: 15px;
	    border-bottom: 1px solid #ececec;
    }
    

	
	.myInformation:hover > div:nth-child(2) > div {
		opacity: 1;
		transition-duration: 0.3s;
	}
	
 	.myInformation > div:nth-child(1) {	
        width: 65px;
	    height: 65px;
	    border-radius: 35%;
	    background-color: aliceblue;
	    display: flex;
	    overflow: hidden;
	    align-items: center;
	    justify-content: center;

 	}
 	
 	.myInformation > div:nth-child(2) {
          height: 100%;
	    display: flex;
	    justify-content: center !important;
	    flex-direction: column;
	    padding-left: 5%;
	    font-size: 16px;
	    font-weight: 600;
	    color: gray;
 	}
 	.plus {
 		cursor:poiter;
 	 }
 	 
	 .SearchList::-webkit-scrollbar {
  	 	display:none;
    
    }
    .recommendList::-webkit-scrollbar {
  	  	display:none;
    
    }
    .deletebtn{
    	border:none;
 		background: none;
	    display: flex;
    	align-items: center;
    	}
</style>

</head>

    
<body>

	<jsp:include page="../common/chatheader.jsp"/>
    
     <div class="myInformation">
		    <div>
		   		<img src="resources/muploadFiles/${loginUser.rename_file}">
		    </div>
		    <div class="name-area" style="justify-content: center;">
			    <div>
			    	${loginUser.name}
			    </div>
			    <div style="font-weight:400; font-size:13px;" >
			    	${loginUser.nickname}
			    </div>
		    </div>
	    </div>	
	
   <!-- 친구목록 --> 
   <div class="List">
   	<c:forEach var="fl" items="${freindList }">
	    <div class="FriendList">
		    <div>
		    <c:if test="${empty fl.rename_file}">
		    		<img src='resources/images/icons/profile_white.png'>
		    </c:if>
		    <c:if test="${!empty fl.rename_file }">
		   		<img src="resources/muploadFiles/${fl.rename_file}">
		   	</c:if>
		    </div>
		    <div>
		    	${fl.name}
		    	<div class="Fl_btn">
			    	<button type="button" class="chatgobtn" style="outline:none;">
			    		<span class="material-icons message">
							question_answer
						</span>
					</button>
					<button type="button" class="deletebtn"style="outline:none;">
						<span class="material-icons minus">
							remove_circle_outline
						</span>
					</button>
			    	<input type="hidden" name="userid" value="${fl.id}" class="userid">
			    	<input type="hidden" name="username" value="${fl.name}" class="username">
		    	</div>
		    </div>
	    </div>
	</c:forEach>
	</div>
	
	<!-- 친구 검색 목록 -->
	<div class="SearchList hide">
	</div>
	
	<div class="recommendList hide">
	</div>
	  
	
	<div class="FriendsSearch">
		<input type="text" id="membername"> <button type="button" class="default-btn b-yell" id="memberListSearch">검색</button>
		&nbsp;&nbsp;<button type="button" class="default-btn b-yell recommendbtn">추천친구</button>
	</div>
	
</body>

<script>
	//1:1채팅하러 가기
	$(function(){
		$(".chatgobtn").click(function(){
			var id = $(this).siblings(".userid").val();
			var name = $(this).siblings(".username").val();
			
		 		$.ajax({
		 			url:"reportcheck.do",
		 			success:function(data){

		 				if(data == 'Y'){
		 					location.href="ChatOneToOneView.do?id="+id;
		 				}else{
		 					alert("신고된 아이디입니다. 채팅에 접속 할 수 없습니다.");
		 				}
		 			},
		            error:function(request, status, errorData){
		                alert("error code: " + request.status + "\n"
		                      +"message: " + request.responseText
		                      +"error: " + errorData);
		           } 
		 		})
			
		})
		
	})
	
	//친구 삭제하기
	$(function(){
		$(".deletebtn").click(function(){
			var id = $(this).siblings(".userid").val();
			
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href="deletefriend.do?id="+id;
			}else{
				
				return false;
			}
			
		})
	})

	//enter키로 친구검색하기
		$("#membername").keypress(function(event){
			if(event.which == 13){//13 은 enter키이다.
				$("#memberListSearch").click();
				return false;
			}
		});
		
	//추천친구 보여주기
		$(".recommendbtn").click(function(){

			$(".List").hide();	//친구목록 숨김..List	
			$(".recommendList").show();	//추천친구 리스트 보여줌.
			$(".SearchList").hide();
			
			$.ajax({
				url:"recommendList.do",
				dataType:"json",
				success:function(data){
					$recommendList = $(".recommendList");
					$recommendList.html("");
					
					var recommendListStr = '';
					
					for(var i in data.list){
						
						if(data.list[i].Rename_file == null){
							recommendListStr +="<div class='SearchMemberList' style='background: aliceblue; height: 20%;display: flex;position: relative;align-items: center;padding: 15px;border-bottom: 1px solid #ececec;'>"
								+"<div>" +
			                    "<img src='resources/images/icons/profile_white.png'>"+
			                    "</div>"
			                    +"<div>"
			                    		+ data.list[i].name
			                    		+"<div class='plus-btn'>"+
			                    			"<span class='material-icons plus' style=' font-size: 26px;' cursor:pointer;> add_circle_outline </span>"+
			                    		  "</div>"+
			                    		"<input type='hidden' value=" + data.list[i].id + " name=id>"+
			                    "</div>"+
			                    "</div>";
			                    
							
						}else{
					
							recommendListStr +="<div class='SearchMemberList' style='background: aliceblue; height: 20%;display: flex;position: relative;align-items: center;padding: 15px;border-bottom: 1px solid #ececec;'>"
											+"<div>" +
						                    "<img src='resources/muploadFiles/"+data.list[i].Rename_file+"'>"+
						                    "</div>"
						                    +"<div>"
						                    		+ data.list[i].name
						                    		+"<div class='plus-btn'>"+
						                    			"<span class='material-icons plus' style=' font-size: 26px; cursor:pointer;'> add_circle_outline </span>"+
						                    		  "</div>"+
						                    		"<input type='hidden' value=" + data.list[i].id + " name=id>"+
						                    "</div>"+
						                    "</div>";

						}
					}
					$recommendList.append(recommendListStr).attr("style","width: 100%; height: 69%; overflow: hidden; overflow-y: scroll; display:block;");		
					
				},
	            error:function(request, status, errorData){
	                alert("error code: " + request.status + "\n"
	                      +"message: " + request.responseText
	                      +"error: " + errorData);
	           } 
			})
			
		})
	//친구리스트 보여주기	
		$("#memberListSearch").click(function(){
			var name = $("#membername").val();
			$(".List").hide();	//친구목록 숨김..List	
			$(".SearchList").show();	//친구 리스트 보여줌.
			$(".recommendList").hide();
			//ajax			
			$.ajax({
				url:"selectMember.do",
				data:{name:name},
				dataType:"json",
				success:function(data){
					$SearchList = $(".SearchList");
					$SearchList.html("");
					
					var SearchListStr = '';

					for(var i in data.list){
					
						if(data.list[i].Rename_file == null){
							SearchListStr +="<div class='SearchMemberList' style='background: aliceblue; height: 20%;display: flex;position: relative;align-items: center;padding: 15px;border-bottom: 1px solid #ececec;'>"
								+"<div>" +
			                    "<img src='resources/images/icons/profile_white.png'>"+
			                    "</div>"
			                    +"<div>"
			                    		+ data.list[i].name
			                    		+"<div class='plus-btn'>"+
			                    			"<span class='material-icons plus' style=' font-size: 26px; cursor:pointer;'> add_circle_outline </span>"+
			                    		  "</div>"+
			                    		"<input type='hidden' value=" + data.list[i].id + " name=id>"+
			                    "</div>"+
			                    "</div>";
			                    
							
						}else{
					
							SearchListStr +="<div class='SearchMemberList' style='background: aliceblue; height: 20%;display: flex;position: relative;align-items: center;padding: 15px;border-bottom: 1px solid #ececec;'>"
											+"<div>" +
						                    "<img src='resources/muploadFiles/"+data.list[i].Rename_file+"'>"+
						                    "</div>"
						                    +"<div>"
						                    		+ data.list[i].name
						                    		+"<div class='plus-btn'>"+
						                    			"<span class='material-icons plus' style=' font-size: 26px; cursor:pointer;'> add_circle_outline </span>"+
						                    		  "</div>"+
						                    		"<input type='hidden' value=" + data.list[i].id + " name=id>"+
						                    "</div>"+
						                    "</div>";

						}
					}
					$SearchList.append(SearchListStr).attr("style","width: 100%; height: 69%; overflow: hidden; overflow-y: scroll; display:block;");			
					
				},
	            error:function(request, status, errorData){
	                alert("error code: " + request.status + "\n"
	                      +"message: " + request.responseText
	                      +"error: " + errorData);
	           } 
			})
			
		});
		
		

		

	
	//친구 추가
	$(document).on("click",".plus-btn",function(){
		var id = $(this).next().val();

		location.href="insertFriendList.do?id=" + id;
		
	})
	

	
</script>

</html>