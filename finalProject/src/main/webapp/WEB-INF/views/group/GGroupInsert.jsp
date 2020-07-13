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

    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 65px; width: 100%; background: #F3F3F3; }

    .groupJoin{width:900px;}
    .groupTb{margin:auto; width:700px; border-spacing: 5px; border-collapse: separate;}
    .groupTbTd {text-align:end;}

    input{width:100%;height:40px; padding-left: 10px; border:none; border-radius: 6px;}
    .search{border:1px solid grey; background:white; border:none; border-radius: 6px;}
    .searchImg{width:20px; height:20px;}
    #search{width:85%; border:none; }
    .searchName{width:100%; cursor: pointer; padding-left: 20px;padding-bottom: 10px; padding-top: 10px; display:inline-block;}
    .searchName:hover{background:#FBD14B;}
    .searchNameAfter{background:white; border:none; border-radius: 6px; height:100px; color:darkgray; height:150px; width:600px; overflow:scroll;  overflow-x:hidden;} /* width 다시보기*/
    .searchNameBox{margin-bottom:20px; margin:5px; width:70px; height:30px; background:#FBD14B; border:none; border-radius: 5px;}
    .searchNameBox:hover{margin-bottom:20px; margin:5px; width:70px; height:30px; background:darkgray; border:none; border-radius: 5px; cursor:pointer;}
    .searchNameForm{display:none; height:200px; overflow:scroll;  overflow-x:hidden; }
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
	  background-color: #367c36;
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
        <h4 class="pSubject">Join</h4><br>
            <div class="groupJoin">
                <form action="#">
                    <table class="groupTb">
                        <tr>
                            <td class="groupTbTd">Title&nbsp;</td>
                            <td><input type="text" id="title" placeholder="  그룹명 작성"></td>
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
                                    </div>
                             
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="groupTbTd"></td>
                            <td style="height:100px;">
                                <div class="searchNameAfter">
                                    &nbsp;&nbsp;Click and remove it.<br>
                                   <!--  <button type="button" class="searchNameBox">김혜린<input type="hidden" value="김혜린"></button>
                                    <button type="button" class="searchNameBox">김혜린<input type="hidden" value="김혜린"></button>
                                    <button type="button" class="searchNameBox">김혜린<input type="hidden" value="김혜린"></button>
                                    <button type="button" class="searchNameBox">김혜린<input type="hidden" value="김혜린"></button> -->
                                </div>
                            </td>
                        </tr>
                    
                        <tr>
                            <td class="groupTbTd">Content&nbsp;</td>
                            <td>
                                <textarea id="groupCon"></textarea>
                            </td> 
                        </tr>
                        
                        <tr>
                            <td class="groupTbTd">Profile Image&nbsp;</td>
                            <td>
                                <div><img src="image/히지.png" class="groupPhoto"></div>
                               <div class="filebox">
								  <label for="ex_file">Upload</label>
								  <input type="file" id="ex_file">
								</div>
                            </td>
                        </tr>
                    </table>
                </form>
                <br><br>
                <div class="groubJoinBtn">
                   <span><button id="submit">Submit</button>&nbsp;</span>
                   <span><input type="reset" value="Reset" id="reset"></span>
                </div>
            </div>
         </div>
         <script>

            // 클릭한 이름 삽입
            $(".searchName").click(function(){
                var $searchName = $(this).html();
                var $searchNameAfter = $(".searchNameAfter");
                var $searchNameBox = "<button type='button' class='searchNameBox'>"+ $searchName +"<input type='hidden' value='" + $searchName + "'></button>";
                
                $searchNameAfter.append($searchNameBox);

                
            })
            
             $(document).on("click", ".searchName", function(){
                var $searchName = $(this).html();
                var $searchNameAfter = $(".searchNameAfter");
                var $searchNameBox = "<button type='button' class='searchNameBox'>"+ $searchName +"<input type='hidden' value='" + $searchName + "'></button>";
                
                $searchNameAfter.append($searchNameBox);

                
            })
            
            
            //  클릭된 이름 삭제
             $(".searchNameBox").click(function(){
                 $(this).remove();
            })

             $(document).on("click",".searchNameBox",function(){
               		$(this).remove();
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
         					var $searchName = $("<div>").text(data[i].name).attr("class","searchName");
         					var $searchId = $("<div>").text(data[i].id).css({"display":"inline-block","color":"gray","font-size":"small"});
         					$search.append($searchName);
         					$searchName.append("&nbsp;");
         					$searchName.append($searchId);
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