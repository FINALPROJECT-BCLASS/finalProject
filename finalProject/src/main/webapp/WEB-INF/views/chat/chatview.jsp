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
		height: 20%;
		display:flex;
		position: relative;
	}
	
	.FriendList:hover > div:nth-child(2) > div {
		opacity: 1;
		transition-duration: 0.3s;
	}
	
 	.FriendList > div:nth-child(1) {
 		
	    width: 10%;
	    height: 100%;
	    background-color: yellow;
	    display: flex;
	    align-items: center;
	    justify-content: center;

 	}
 	
 	.FriendList > div:nth-child(2) {
		width: 100%;
	    height: 100%;
	    display: flex;
	    align-items: center;
	    padding-left: 5%;
	    font-size: 20px;
	    font-weight: 500;
 	}
 	
 	.Fl_btn {
 		position: absolute;
   		right: 5%;	
   		opacity: 0;
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
	    height: 69%;
	    overflow: hidden;
	    overflow-y: scroll;
    }
    
    .List::-webkit-scrollbar {
    	display:none;
    
    }
    
    <!-- 친구목록 -->
     
    .SearchList{
    	display:none;
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
 		color: blue;
 
 		/* 위치지정 */
 		position:absolute;
 		right: 5%;
 	}
 	
 	.plus-btn > div {
 		margin-top: -15px;
 	}
    .SearchList > div:nth-child(2) {
		width: 100%;
	    height: 100%;
	    display: flex;
	    align-items: center;
	    padding-left: 5%;
	    font-size: 20px;
	    font-weight: 500;
 	}
    
</style>

</head>

    
<body>

	<jsp:include page="../common/chatheader.jsp"/>
    
   <!-- 친구목록 --> 
   <div class="List">
   	
	    <div class="FriendList">
		    <div>
		   		<img src="#">
		    </div>
		    <div>
		    	홍샘이
		    	<div class="Fl_btn">
			    	<button type="button" class="default-btn">대화하기</button>
			    	<button type="button" class="default-btn">다이어리</button>
		    	</div>
		    	<div class="minus-btn hide">
		    		<div>-</div>
		    	</div>
		    </div>
		    
	    </div>
	</div>
	
	<!-- 친구 검색 목록 -->
	<div class="SearchList hide">
	</div>
	  
	
	<div class="FriendsSearch">
		<input type="text" class="b-lightgray" id="membername"> <button type="button" class="default-btn b-yell" id="memberListSearch">검색</button>
	</div>
	
</body>

<script>


	$(function(){
		$("#memberListSearch").click(function(){
			var name = $("#membername").val();
			console.log("name : " +name);
			$(".List").hide();	//친구목록 숨김..List	
			$(".SearchList").show();	//친구 리스트 보여줌.
			
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
						
					
					SearchListStr +="<div class='SearchMemberList'>" +
				                    "<div>" +
				                    	"<img src=resources/muploadFiles/"+data.list[i].Rename_file+" width='50px;' height='50px;'>"+
				                    "</div>"
				                    +"<div>"
				                    		+ data.list[i].name
				                    		+"<div class='plus-btn'>"+
				                    			"<div>"+ "+" + "</div>"+
				                    		  "</div>"+
				                    		"<input type='hidden' value=" + data.list[i].id + " name=id>"+
				                    "</div>"+
				                    "</div>";

					}
					$SearchList.append(SearchListStr);
					
					
				},
	            error:function(request, status, errorData){
	                alert("error code: " + request.status + "\n"
	                      +"message: " + request.responseText
	                      +"error: " + errorData);
	           } 
			})
			
		});
		
	})
		

		
	$(function(){
		$(".FriendList").click(function(){
			if($(".minus-btn").is(":visible")){
				$(".minus-btn").toggleClass("hide");
				$(".Fl_btn").toggleClass("hide");
			}else{
				$(".minus-btn").toggleClass("hide");
				$(".Fl_btn").toggleClass("hide");
			}

			});
		
		
	});
	
	//친구 추가
	$(document).on("click",".plus-btn",function(){
		var id = $(this).next().val();
		console.log("id : " + id);
		location.href="insertFriendList.do?id=" + id;
		
	})
	
</script>
</html>