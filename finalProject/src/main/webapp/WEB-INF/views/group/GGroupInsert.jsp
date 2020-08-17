<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    html, body { height:100%;}

    h1, h4{margin-top:20px; text-align:center;}

    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 100px 0; width: 100%; background: #F3F3F3; }

    .groupJoin{}
    .groupTb{margin:auto; border-spacing: 5px; border-collapse: separate;}
    
    .groupTb  tr td:nth-child(2) {
    	padding-left:25px;
    }
    
    .groupTbTd {text-align:end;}

    input{width:100%;height:40px; padding-left: 10px; border:none; border-radius: 6px;}
    .search{border:1px solid grey; background:white; border:none; border-radius: 6px;}
    .searchImg{width:20px; height:20px;}
    #search{width:85%; border:none; }
    .searchName{cursor: pointer; padding-left: 20px;padding-bottom: 10px; padding-top: 10px; display:inline-block;}
    /* .searchName:hover{background:#FBD14B;} */
    .oneSearchBox:hover{width:100%; cursor: pointer; background:#FBD14B;}
    .oneSearchBox{width:100%; cursor: pointer; }
    .searchNameAfter{background:white; padding: 10px; border:none; border-radius: 6px; height:100px; color:darkgray; height:150px; width:600px; overflow:scroll;  overflow-x:hidden;} /* width 다시보기*/
     .adminBtn{ background:#2860E1 !important; color:white !important; }
    .searchNameBox{margin-bottom:20px; margin:5px; height:30px; background:#FBD14B; border:none; border-radius: 5px; font-size:small;}
    .searchNameBox:hover{margin-bottom:20px; margin:5px; height:30px; background:darkgray; border:none; border-radius: 5px; cursor:pointer;font-size:small;}
    .searchNameForm{display:none; height:100px; overflow:scroll;  overflow-x:hidden; }
    .deleteBtn{width:20px;height:30px; border-radius: 3px; background:red; border:none; text-align: center;}
	
    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px;}

    #groupCon{width:100%; height:200px; padding:10px; border:none;  border-radius: 6px; resize: none;}
    .groupPhoto{width:100px; height: 100px;}

    .groubJoinBtn{text-align: right;}
    #submit{background:none; border:none; color:#2860E1; font-weight: 700; font-size: 20px; }
    #reset{cursor:pointer; margin-left:10px; background:none; border:none; color:#484848; font-weight: 700; font-size: 20px; width:100px;}

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
		display:none;
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
	
	.bigTitle {
		margin-bottom: 50px;
   		font-size: 35px;
	}
	
	
  </style>
</head>
<body>
 	<jsp:include page="../common/header.jsp"/>  
    <div class="join-form-area">
        <h1 class="bigTitle">New Group Diary</h1>
<!--         <h4 class="pSubject">Join</h4><br> -->
            <div class="groupJoin">
                <form action="groupInsert.do" method="post" id="groupInsertFrom" enctype="Multipart/form-data">
                    <table class="groupTb" cellpadding="5px">
                    
                    	<%-- <input type="hidden" name="id" value="${loginUser.id }"> --%>
                        <tr>
                            <td class="groupTbTd">Title&nbsp;</td>
                            <td><input type="text" id="title" name="gTitle" placeholder="  그룹명 작성" required></td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Member Search&nbsp;</td>
                            <td>
                                <div class="search">
                                    <span class="material-icons">face</span>
                                    <input type="text" id="search" placeholder="참여명 검색">
                                    <span class="material-icons">search</span>
                                    <div class="searchNameForm">
                                    	 
                                    </div>
                             
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="groupTbTd"></td>
                            <td style="height:100px;">
                                <div class="searchNameAfter">
                                    &nbsp;&nbsp;Click and remove it.<br>
                                    <button type="button" class="searchNameBox adminBtn" value="${m.id }">
		                                    	${m.name }&nbsp;${m.id }
		                                    <input type="hidden" name="groupName" value="${m.name }">
		                                    <input type="hidden" class='groupId adminId' name="groupId" value="${m.id }">
	                                    </button>
                                    <div class="searchNameAfterIn"></div>
                                </div>
                            </td>
                        </tr>
                    
                        <tr>
                            <td class="groupTbTd">Content&nbsp;</td>
                            <td>
                                <textarea id="groupCon" name='gCon'></textarea>
                            </td> 
                        </tr>
                        
                        <tr>
                            <td class="groupTbTd">Profile Image&nbsp;</td>
                            <td>
                               <div class=profile-image-area>
                        			<img class="profile-image" src="resources/groupMainFiles/group1.png">
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
                <div class="groubJoinBtn">
                   <span><button id="submit">Submit</button>&nbsp;</span>
                   <span id="reset" onclick="goBack();">Back</span>
                </div>
            </div>
         </div>
         
         
         <script>
         /* 파일 업로드 */
		 	    
		 	    function uploadPhoto(value) {
		 	    	
		 			if(value.files && value.files[0]) {
		 				
		 				var reader = new FileReader();
		 			
		 				reader.onload = function(e) {
		 					
		 					$(".profile-image").show();
		 					$(".profile-image").attr("src", e.target.result);
		 					
		 					var filename = $("#file").val().split('/').pop().split('\\').pop();
		 					
		 					$(".upload-name").val("");
		 					$(".upload-name").val(filename);
		 				}
		 				
		 				reader.readAsDataURL(value.files[0]);
		 			}
		 	    }
 	   
         </script>
         
         <!-- 뒤로가기 버튼 -->
		 <script>
		 	function goBack(){
		 		window.history.back();	
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
						$("#groupInsertFrom").submit();
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

                $searchNameAfter = $(".searchNameAfterIn");
                $searchNameBox = "<button type='button' class='searchNameBox' value='"+ $searchName + "'>"+ $searchName + "&nbsp;" + $searchId 
                +"<input type='hidden' name='groupName' value='" + $searchName + "'>" +"<input type='hidden' name='groupId' value='" + $searchId + "'></button>";
                $searchNameAfter.append($searchNameBox);

                
            })
            
            
            //  클릭된 이름 삭제
             $(document).on("click",".searchNameBox",function(){
            	 if($(this).hasClass("adminBtn") === true){
            		 alert("그룹 생성자는 삭제 할  수 없습니다.");
            	 }else if($(this).hasClass("adminBtn") === false){
            		 
            	 var deleteConfirm = confirm("삭제하시겠습니까? ");
 		 			if(deleteConfirm){
 		 				$(this).remove();
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