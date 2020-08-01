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
    
    textarea, input:focus {outline:none;}

    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 65px; width: 81%; background: #F3F3F3; }

    .groupJoin{width:900px; margin-left:-150px;}
    .groupTb{margin:auto; width:1000px; border-spacing: 5px; border-collapse: separate;}
    .groupTbTd {text-align:end;}

    input{width:100%;height:40px; padding-left: 10px; border:none; border-radius: 6px;}
    /* .search{border:1px solid grey; background:white; border:none; border-radius: 6px;}
    .searchImg{width:20px; height:20px;}
    #search{width:85%; border:none; }
    .searchName{width:80px; cursor: pointer; padding-left: 20px;padding-bottom: 10px; padding-top: 10px; display:inline-block;}
    /* .searchName:hover{background:#FBD14B;} */
    .oneSearchBox:hover{width:100%; cursor: pointer; background:#FBD14B;}
    .oneSearchBox{width:100%; cursor: pointer; }
    .searchNameAfter{background:white; border:none; border-radius: 6px; height:100px; color:darkgray; height:150px; width:600px; overflow:scroll;  overflow-x:hidden;} /* width 다시보기*/
    .searchNameBox{margin-bottom:20px; margin:5px; width:100px; height:30px; background:#FBD14B; border:none; border-radius: 5px; font-size:small;}
    .searchNameBox:hover{margin-bottom:20px; margin:5px; width:100px; height:30px; background:darkgray; border:none; border-radius: 5px; cursor:pointer;font-size:small;}
    .searchNameForm{display:none; height:100px; overflow:scroll;  overflow-x:hidden; }
    .deleteBtn{width:20px;height:30px; border-radius: 3px; background:red; border:none; text-align: center;} */
	
    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px;}

    #groupCon{width:100%; height:300px; border:none;  border-radius: 6px; margin-bottom:-10px;}
    .groupPhoto{width:100px; height: 100px;}

    .groubJoinBtn{width:1100px; text-align: center;}
    #submit{background:none; border:none; color:#2860E1; font-weight: 600; font-size: 20px; }
    #reset{background:none; border:none; color:#484848; font-weight: 600; font-size: 20px; width:100px;}

    tr > td:nth-child(1) {
            color: #484848;
            text-align: center;
            font-weight: 600;
            font-size: 16px;
        }
      
     /* 샘이언니 파일업로드 */ 
     .filebox .upload-name {
	display: inline-block;
    vertical-align: middle;
    width: 70%;
    height: 40px;
    font-size: 13px;
    padding: 0 10px;
    border: 0;
    border-radius: 8px;
    margin-right: 5px;
    background-color: white;
	}
	
	.profile-image-area{
		text-align:center;
		width:100%;
		background:white;
		padding-bottom:15px;
	}
	
	.profile-image {
		border-radius:6px;
		width:80%;
	    height: 35%;
	    display:none;
	    margin: 0 auto;
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
	<jsp:include page="../common/sidenaviGroup.jsp"/>
	
    <div class="join-form-area">
        <h1>Group Diary</h1>
        <h4 class="pSubject">Board Update</h4><br>
            <div class="groupJoin">
                <form action="updateBoard.do" method="post" id="boardUpdateFrom" enctype="Multipart/form-data">
                   	<input type="hidden" name="gbNo" value="${boardList.gbNo }">
                    <table class="groupTb">
                        <tr>
                            <td class="groupTbTd">Title&nbsp;</td>
                            <td><input type="text" id="title" name="gbTitle" placeholder="  제목을 입력해주세요." value="${boardList.gbTitle }" required></td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Content&nbsp;</td>
                            <td>
                                <textarea id="groupCon" name='gbCon'>${boardList.gbCon }</textarea>
                                <div class=profile-image-area>
                        			<img class="profile-image profile-image1" src="">
                       			</div>
                       			 <div class=profile-image-area>
                        			<img class="profile-image profile-image2" src="">
                       			</div>
                       			 <div class=profile-image-area>
                        			<img class="profile-image profile-image3" src="">
                       			</div>
                       			 <div class=profile-image-area>
                        			<img class="profile-image profile-image4" src="">
                       			</div>
                       			 <div class=profile-image-area>
                        			<img class="profile-image profile-image5" src="">
                       			</div>
                       			
                   				<div class="filebox">
								  <input type="file" id="file1" class="ex_file" name="uploadFile1" onchange="uploadPhoto1(this);">
								  <input class="upload-name upload-name1" value="${photoList[0].gbpOrigin }">
								  <label for="file1">Upload</label><!-- &nabsp;<label class="ex_file reset1">Reset</label> -->
								</div>
								<div class="filebox">
								  <input type="file" id="file2" class="ex_file" name="uploadFile2" onchange="uploadPhoto2(this);">
								  <input class="upload-name upload-name2" value="${photoList[1].gbpOrigin }">
								  <label for="file2">Upload</label>
								</div>
								<div class="filebox">
								  <input type="file" id="file3" class="ex_file" name="uploadFile3" onchange="uploadPhoto3(this);">
								  <input class="upload-name upload-name3" value="${photoList[2].gbpOrigin }">
								  <label for="file3">Upload</label>
								</div>
								<div class="filebox">
								  <input type="file" id="file4" class="ex_file" name="uploadFile4" onchange="uploadPhoto4(this);">
								  <input class="upload-name upload-name4" value="${photoList[3].gbpOrigin }">
								  <label for="file4">Upload</label>
								</div>
								<div class="filebox">
								  <input type="file" id="file5" class="ex_file" name="uploadFile5" onchange="uploadPhoto5(this);">
								  <input class="upload-name upload-name5" value="${photoList[4].gbpOrigin }">
								  <label for="file5">Upload</label>
								</div>	
                            </td> 
                        </tr>
                       <%--  <c:if test="${empty photoList }">
						</c:if>
						<c:if test="${!empty photoList }">
							<c:forEach var="p" items="${photoList }">
								<tr>
									<td>
									${p.gbpOrigin }
										<img class="boardImg" src="resources/groupBoardFiles/${p.gbpOrigin }">
									</td>
								<tr>
							</c:forEach>
						</c:if> --%>
                    </table>
                </form>
                <br><br>
                <div class="groubJoinBtn">
                   <span><button id="submit">Submit</button>&nbsp;</span>
                   <span><input type="reset" value="Reset" id="reset"></span>
                </div>
            </div>
         </div>
         
         <!-- file reset -->
        <!--  <script>
         	$(".reset1").click(function(){
         				$(".upload-name1").val("");
         	})
			$(".reset2").click(function(){		
         				$(".upload-name2").val("");
			})
			$(".reset3").click(function(){		
         				$(".upload-name3").val("");
			})
         	$(".reset4").click(function(){
         				$(".upload-name4").val("");
         	})
         	$(".reset5").click(function(){
         				$(".upload-name5").val("");
         	})
         </script> -->
         <!-- submit -->
         <script>
         	$("#submit").click(function(){
         		$("#boardUpdateFrom").submit();
         	})
         </script>
         
         <script>
         /* 파일 업로드 */
		 	    
		 	    function uploadPhoto1(value) {
		 	    	
		 			if(value.files && value.files[0]) {
		 				
		 				var reader = new FileReader();
		 			
		 				reader.onload = function(e) {
		 					
		 					$(".profile-image1").attr("src", e.target.result).css("display","block");
		 					
		 					var filename = $("#file1").val().split('/').pop().split('\\').pop();
		 					
		 					$(".upload-name1").val("");
		 					$(".upload-name1").val(filename);
		 				}
		 				
		 				reader.readAsDataURL(value.files[0]);
		 			}
		 	    }
         
		 	   function uploadPhoto2(value) {
		 		  
		 			if(value.files && value.files[0]) {
		 				
		 				var reader = new FileReader();
		 			
		 				reader.onload = function(e) {
		 					
		 					$(".profile-image2").attr("src", e.target.result).css("display","block");
		 					
		 					var filename = $("#file2").val().split('/').pop().split('\\').pop();
		 					
		 					$(".upload-name2").val("");
		 					$(".upload-name2").val(filename);
		 				}
		 				
		 				reader.readAsDataURL(value.files[0]);
		 			}
		 	    }
		 	   
		 	  function uploadPhoto3(value) {
		 		 
		 			if(value.files && value.files[0]) {
		 				
		 				var reader = new FileReader();
		 			
		 				reader.onload = function(e) {
		 					
		 					$(".profile-image3").attr("src", e.target.result).css("display","block");
		 					
		 					var filename = $("#file3").val().split('/').pop().split('\\').pop();
		 					
		 					$(".upload-name3").val("");
		 					$(".upload-name3").val(filename);
		 				}
		 				
		 				reader.readAsDataURL(value.files[0]);
		 			}
		 	    }
		 	  
		 	 function uploadPhoto4(value) {
		 		
		 			if(value.files && value.files[0]) {
		 				
		 				var reader = new FileReader();
		 			
		 				reader.onload = function(e) {
		 					
		 					$(".profile-image4").attr("src", e.target.result).css("display","block");
		 					
		 					var filename = $("#file4").val().split('/').pop().split('\\').pop();
		 					
		 					$(".upload-name4").val("");
		 					$(".upload-name4").val(filename);
		 				}
		 				
		 				reader.readAsDataURL(value.files[0]);
		 			}
		 	    }
		 	 
		 	function uploadPhoto5(value) {
		 		
	 			if(value.files && value.files[0]) {
	 				
	 				var reader = new FileReader();
	 			
	 				reader.onload = function(e) {
	 					
	 					$(".profile-image5").attr("src", e.target.result);
	 					$(".profile-image ").css("display","block");
	 					var filename = $("#file5").val().split('/').pop().split('\\').pop();
	 					
	 					$(".upload-name5").val("");
	 					$(".upload-name5").val(filename);
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
				}else if($("#groupCon").val() == ""){
					alert("내용을 입력해주세요.");
					} else{
						$("#boardInsertFrom").submit();
					}
				})
         </script>
         
        
         <jsp:include page="../common/footer.jsp"/>	
</body>
</html>