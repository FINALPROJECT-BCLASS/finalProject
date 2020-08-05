<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    html, body { height:100%;}

    h1, h4{margin-top:20px; text-align:center;}

    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 65px; width: 100%; background: #F3F3F3; }

    .groupJoin{width:900px;}
    .groupTb{margin:auto; width:700px; border-spacing: 5px; border-collapse: separate;}
    .groupTbTd {text-align:end;}

    input{width:100%;height:40px; padding-left: 10px; border:none; border-radius: 6px;}
    .search{border:1px solid grey; background:white; border:none; border-radius: 6px;}
    .searchImg{width:20px; height:20px;}
    #search{width:85%; border:none; }
    .searchName{width:80px; cursor: pointer; padding-left: 20px;padding-bottom: 10px; padding-top: 10px; display:inline-block;}
    /* .searchName:hover{background:#FBD14B;} */
    .oneSearchBox:hover{width:100%; cursor: pointer; background:#FBD14B;}
    .oneSearchBox{width:100%; cursor: pointer; }
    .searchNameAfter{background:white; border:none; border-radius: 6px; height:100px; color:darkgray; height:150px; width:600px; overflow:scroll;  overflow-x:hidden;} /* width 다시보기*/
    .adminBtn{ background:#2860E1 !important; color:white !important; }
    .gmDeleteY{background:#dc3545 !important; color:white !important; }
    .searchNameBox{margin-bottom:20px; margin:5px; width:100px; height:30px; background:#FBD14B; border:none; border-radius: 5px; font-size:small;}
    .searchNameBox:hover{margin-bottom:20px; margin:5px; width:100px; height:30px; background:darkgray; border:none; border-radius: 5px; cursor:pointer;font-size:small;}
    .searchNameForm{display:none; height:100px; overflow:scroll;  overflow-x:hidden; }
    .deleteBtn{width:20px;height:30px; border-radius: 3px; background:red; border:none; text-align: center;}
	
    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px;}

    #groupCon{width:100%; border:none;  border-radius: 6px;}
    .groupPhoto{width:100px; height: 100px;}

    .groubJoinBtn{text-align: center;}
    #submit{background:none; border:none; color:#2860E1; font-weight: 600; font-size: 20px; }
    #reset{background:none; border:none; color:#484848; font-weight: 600; font-size: 20px; width:100px;}

    tr > td:nth-child(1) {
            color: #484848;
            text-align: left;
            font-weight: 600;
            font-size: 16px;
        }
      
     /* 샘이언니 파일업로드 */ 
     .filebox .upload-name {
	display: inline-block;
    vertical-align: middle;
    width: 164px;
    height: 40px;
    font-size: 13px;
    padding: 0 10px;
    border: 0;
    border-radius: 8px;
    margin-right: 5px;
    background-color: white;
	}
	
	.profile-image {
		border-radius:6px;
		width:35%;
	    height: 35%;
	}
     /* 업로드 버튼 */
    .filebox label {
       width:100px;
       height: 40px;
       padding:10px 10px 30px 24px;
       margin-top: 10px;
       display: inline-block;
       color: #484848;
       font-size: inherit;
       line-height: normal;
       vertical-align: middle;
       background-color: #FBD14B;
       cursor: pointer;
       border-radius: .25em;
       -webkit-transition: background-color 0.2s;
       transition: background-color 0.2s;
	}
	
	.filebox label:hover {
	  background-color: #f1bc0e;
	}
	
	.filebox label:active {
	  background-color: #f1bc0e;
	}
	
	.filebox input[type="file"] {
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  clip: rect(0, 0, 0, 0);
	  border: 0;
	}    
  </style>
</head>
<body>
 	<jsp:include page="../common/header.jsp"/>  
    <div class="join-form-area">
        <h1>Group Diary</h1>
        <h4 class="pSubject">Update</h4><br>
            <div class="groupJoin">
                <form action="groupUpdate.do" method="post" id="groupUpdateFrom" enctype="Multipart/form-data">
                    <table class="groupTb">
                    	<%-- <input type="hidden" name="id" value="${loginUser.id }"> --%>
                        <tr>
                            <td class="groupTbTd">Title&nbsp;</td>
                            <td><input type="text" id="title" name="gTitle" placeholder="  그룹명 작성" value="${groupTable.gTitle }" required></td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Member Search&nbsp;</td>
                            <td>
                                <div class="search">
                                    <span class="material-icons">face</span>
                                    <input type="text" id="search" placeholder="참여명 검색">
                                    <span class="material-icons">search</span>
                                    <div class="searchNameForm">
                                    	 <!-- <div class="searchName">&nbsp;김혜린</div>
                                   		 <div class="searchName">&nbsp;김경섭</div> -->
                                   		 <!-- ★★★ input으로 넘기는 값은 이름만 되도록? group_member는 어떻게 insert할지 생각 ★★★ -->
                                    </div>
                             
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="groupTbTd"></td>
                            <td style="height:100px;">
                                <div class="searchNameAfter">
                                    &nbsp;&nbsp;Click and remove it.<br>
                                    <div class="searchNameAfterIn">
                                    
	                                     <c:forEach var="m" items="${ memberList}">
	                                     	<c:if test="${ groupTable.id eq m.gmId}">
	                                   			<button type="button" class="searchNameBox adminBtn" value="${m.gmId }">
				                                    	${m.name }&nbsp;${m.gmId }
				                                    <input type="hidden" name="groupName" value="${m.name }">
				                                    <input type="hidden" class='groupId adminId' name="groupId" value="${m.gmId }">
				                                    <input type="hidden" class='groupId' name="gmNo" value="${m.gmNO }">
				                                    <input type="hidden" class='groupId' name="member" value="plus">
				                                    <input type="hidden" class='groupId' name="gmDelete" value="${m.gmDelete }">
			                                    </button>
	                                     	</c:if>
	                                     	
	                                     	<c:if test="${ groupTable.id ne m.gmId}">
	                                     	<c:if test="${ m.gmDelete eq 'Y'}">
		                                    <button type="button" class="searchNameBox gmDeleteY" value="${m.name }">
			                                    	${m.name }&nbsp;${m.gmId }
			                                    <input type="hidden" name="groupName" value="${m.name }">
			                                    <input type="hidden" class='groupId' name="groupId" value="${m.gmId }">
			                                    <input type="hidden" class='groupId' name="gmNo" value="${m.gmNO }">
			                                    <input type="hidden" class='groupId' name="member" value="plus">
			                                    <input type="hidden" class='groupId' name="gmDelete" value="${m.gmDelete }">
		                                    </button>
		                                    </c:if>
		                                    <c:if test="${ m.gmDelete eq 'N'}">
		                                    <button type="button" class="searchNameBox" value="${m.name }">
			                                    	${m.name }&nbsp;${m.gmId }
			                                    <input type="hidden" name="groupName" value="${m.name }">
			                                    <input type="hidden" class='groupId' name="groupId" value="${m.gmId }">
			                                    <input type="hidden" class='groupId' name="gmNo" value="${m.gmNO }">
			                                    <input type="hidden" class='groupId' name="member" value="plus">
			                                    <input type="hidden" class='groupId' name="gmDelete" value="${m.gmDelete }">
		                                    </button>
		                                    </c:if>
		                                    </c:if>
	                                    </c:forEach>
                                    
                                    </div>
                                </div>
                            </td>
                        </tr>
                    
                        <tr>
                            <td class="groupTbTd">Content&nbsp;</td>
                            <td>
                                <textarea id="groupCon" name='gCon'>${groupTable.gCon }</textarea>
                            </td> 
                        </tr>
                        
                        <tr>
                            <td class="groupTbTd">Profile Image&nbsp;</td>
                            <td>
                               <div class=profile-image-area>
                               		<c:if test="${!empty groupTable.gOrigin }">
                        				<img class="profile-image" src="resources/groupMainFiles/${groupTable.gOrigin }">
                        			</c:if>
                        			<c:if test="${empty groupTable.gOrigin }">
                        				<img class="profile-image" src="resources/images/icons/profile_default.png">
                        			</c:if>
                        			<input type="hidden" name="beforeImg" value="${groupTable.gOrigin }">
                        			<input type="hidden" name="gNo" value="${groupTable.gNo }"> 
                       			</div>
                              	<div class="filebox">
								  <input type="file" id="file" class="ex_file" name="uploadFile" onchange="uploadPhoto(this);">
								  <input class="upload-name" value="Select file">
								  <label for="file">Upload</label>
								</div>
                            </td>
                        </tr>
                    </table>
                </form>
                <br><br>
                <div class="groubJoinBtn">
                   <span><button id="submit">Submit</button>&nbsp;</span>
                   <span><button id="reset" onclick="goBack();">Back</button>&nbsp;</span>
                </div>
            </div>
         </div>
         
          <!-- 뒤로가기 버튼 -->
		 <script>
		 	function goBack(){
		 		window.history.back();	
		 	}
		 	
		 </script>
         <script>
         /* 파일 업로드 */
		 	    
		 	    function uploadPhoto(value) {
		 	    	
		 			if(value.files && value.files[0]) {
		 				
		 				var reader = new FileReader();
		 			
		 				reader.onload = function(e) {
		 					
		 					$(".profile-image").attr("src", e.target.result);
		 					
		 					var filename = $("#file").val().split('/').pop().split('\\').pop();
		 					
		 					$(".upload-name").val("");
		 					$(".upload-name").val(filename);
		 				}
		 				
		 				reader.readAsDataURL(value.files[0]);
		 			}
		 	    }
 	   
         </script>
         
         
         <script>
 
        	 
         
        
			// submit
			$("#submit").click(function(){
			
				if($("#title").val() == "" ){
					alert("제목을 입력해주세요.");
				}else if($(".searchNameAfterIn").html() == ""){
					alert("가입할 멤버를 등록해주세요");
					}else {
						var aminName = "<input type='hidden' name='groupName' value='${sessionScope.loginUser.id}'>";
						$("#groupUpdateFrom").submit();
					}
				})
			
            // 클릭한 이름 삽입 
              $(document).on("click", ".oneSearchBox", function(){
            	  $(this).css("display","none");
            	  var $searchNameAfter ="";
            	  var $searchNameBox ="";
            	  var $searchNameBoxValue ="";
	           	  var $searchName = $(this).children(".searchName").html();
	           	  var $searchId = $(this).children(".searchId").html();
	           	  
	                // 중복확인
	                $('.groupId').each(function(){
	                 	  text = $(this).val();
	                 	  if(text == $searchId){
	                 		  
	                 		  alert("그룹 가입자는 추가할 수 없습니다.");
	                 		  sameText = text;
	                 	  }else if(text != $searchId){
	                 		  sameText = text;
	                 	  }
	                 	  
	                 	  console.log(text);
	                 	  
	                 	  
	                 	});
		                if(sameText != $searchId){
		                	
	                		$searchNameAfter = $(".searchNameAfterIn");
	                        $searchNameBox = "<button type='button' class='searchNameBox' value='"+ $searchName + "'>"+ $searchName + "&nbsp;" + $searchId 
	                        +"<input type='hidden' name='groupName' value='" + $searchName + "'>" 
	                        +"<input type='hidden' class='groupId' name='groupId' value='" + $searchId + "'>"
	                        +"<input type='hidden' class='groupId' name='gmNo' value='x'>"
	                        +"<input type='hidden' class='groupId' name='member' value='plus'>"
	                        "</button>";
	                        $searchNameAfter.append($searchNameBox);
	                        
	                	  }
		                
	           	  
             
            })
            
            
            //  클릭된 이름 삭제
             $(document).on("click",".searchNameBox",function(){
            	 if($(this).hasClass("adminBtn") === true){
            		 alert("그룹 생성자는 탈퇴 시킬 수 없습니다.");
            	 }else if($(this).hasClass("adminBtn") === false){
            		 
            	 var deleteConfirm = confirm("참여자를 탈퇴 시키겠습니까? ");
 		 			if(deleteConfirm){
 		 				$(this).children().next().next().next().val("minus");
 		 				$(this).css("display","none");
 		 				
 					}
            	 }
            	 
            	 
                 
            })
  
         </script>
         
         <!-- 이름 검색  -->
         <script>
         	$(function(){

         		$("#search").keyup(function(){
         			$(".searchNameForm").css("display","block");
         			var searchName = $("#search").val();
         			
         			$.ajax({
         				url:"searchName.do",
         				data:{searchName:searchName},
         				dataType:"json",
         				success:function(data){
         					var $search = $(".searchNameForm");
         					$search.empty();
         					
         					for(i in data){
         						
	         					var $oneSearchBox = $("<div>").attr("class","oneSearchBox");
	         					var $searchName = $("<span>").text(data[i].name).attr("class","searchName");
	         					var $searchId = $("<span>").text(data[i].id).css({"display":"inline-block","color":"gray","font-size":"small"}).attr("class","searchId");
       						
	         					
	         					
	         					$search.append($oneSearchBox);

	         					$oneSearchBox.append($searchName);
	         					$oneSearchBox.append("&nbsp;");
	         					$oneSearchBox.append($searchId);
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
         
         </script>
         <jsp:include page="../common/footer.jsp"/>	
</body>
</html>