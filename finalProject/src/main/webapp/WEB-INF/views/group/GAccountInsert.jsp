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

    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 65px; width: 75%;background: #F3F3F3;}

    .groupJoin{width:900px;}
    .groupTb{margin:auto; width:700px; border-spacing: 5px; border-collapse: separate;}
    .groupTbTd {text-align:end;}

    .date{width:49%;} 

    .post{width:40%; margin-right: 10px; }
    .postBtn{width:15%; border:none; border-radius: 6px; background:#FBD14B; height: 40px;}
    .postBtn:hover{width:15%;background:#f8c10d; border:none; border-radius: 6px; height: 40px;}
    .location{margin-top:3px;}

    input{width:100%; height:40px; padding-left: 10px; border:none; border-radius: 6px;}
    .type{width:10px !important;height:10px !important;}
    .typeBox{display:inline-block; margin-right: 40px;}
    .typeForm{width:100%; text-align:center;}
    
    .profit{display:none;}
    .expense{display:none;}
    
    
    .searchList{display:none;}
    .search{border:none; border-radius: 6px;  background:white;}
    .searchImg{width:20px; height:20px;}
    #search{width:85%; border:none; }

    .searchName{display:inline-block;cursor: pointer; padding-left: 20px;padding-bottom: 10px; padding-top: 10px;}
    .searchClick:hover{background:darkgray; color:#F3F3F3; cursor:pointer;}
    /* .searchName:hover{background:#2860E1; color:#F3F3F3;} */
    
    

    .searchNameAfter{background:white; border:none; border-radius: 6px;  height:100px; color:darkgray; height:150px; width:600px; overflow:scroll;  overflow-x:hidden;}
    
    
    .searchNameBox{margin-left:10px; margin-top:5px;width:95%; height:30px; background:#2860E1;  border:none; border-radius: 6px; display: inline-flex; }
    .searchNameBox:hover{margin-left:10px;margin-top:5px; width:95%; height:30px; background:darkgray; border:none; border-radius: 6px; cursor:pointer; display: inline-flex;}
   
    
    .deleteBtn{width:20px;height:30px; border-radius: 3px; background:red; border:none; text-align: center;}

    .amountName{display: inline-block;width:50%; color:#F3F3F3;}
   
    
    .amountBox{display: inline-block; width:50%; border:none;height:20px; background:#4273e6; border-radius: 6px; margin-top:3px;}
   

    .amountBox::placeholder{color:darkgrey;}


    .accountAdmin{width:20px; height:20px; margin-top:10px; margin-right: 10px;}
    .accountMargin{margin-left:80px;}
    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px;}

    .backgroundWhite{background:white;border:none; border-radius: 6px; }
    .amount{display: inline-block; width:90%; border:none;}

    #groupCon{width:100%; border:none; padding-left:10px;}
    .textArea{border:none; border-radius: 6px;  background:white;}
    .comment{color:grey; display: inline-block; font-size: medium;}

    .groubJoinBtn{text-align: center;}
    #submit{background:none; border:none; color:#2860E1; font-weight: 600; font-size: 20px; }
    #reset{background:none; border:none; color:#484848; font-weight: 600; font-size: 20px; width:100px;}

    tr > td:nth-child(1) {
            color: #484848;
            text-align: left;
            font-weight: 600;
            font-size: 16px;
        }
  </style>

</head>
<body>

    <jsp:include page="../common/header.jsp"/>
   <div class="join-form-area">
   		<c:if test="${ groupTable.id eq gInfo.loginUserId}">
		<jsp:include page="../common/sidenaviGroupAdmin.jsp"/>
		</c:if>
		
		<c:if test="${ groupTable.id ne gInfo.loginUserId}">
		<jsp:include page="../common/sidenaviGroup.jsp"/>
		</c:if>
        <div class="join-form-area">
        <h1>Group Diary</h1>
        <h4 class="pSubject">Profit & Expense Manage Create</h4><br>
            <div class="groupJoin">
                <form action="#">
                	<div class="typeForm">
                	<div class="typeBox">
           				<input type="radio" class="type" name="type" value="fee" id="fee" checked>
           				<label for="fee">Fee</label>
           			</div>
           			<div class="typeBox">
           				<input type="radio" class="type" name="type"  value="profit" id="profit">
           				<label for="profit">Profit</label>	
           			</div>	
           			<div class="typeBox">
           				<input type="radio" class="type" name="type"  value="expense" id="expense">
           				<label for="expense">Expense</label>
           			</div>
           			</div>
                    <table class="groupTb">
                    	<tr>
                    		<td>
                    			
                    		</td>
                    	</tr>
                        <tr>
                            <td class="groupTbTd">Title&nbsp;</td>
                            <td><input type="text" id="title" placeholder="  제목 입력"></td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Date&nbsp;</td>
                            <td>
                                <input type="date" class="date" value="${clickDate }"> 
                                <input type="date" class="date" value="${clickDate }"> 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Content&nbsp;</td>
                            <td>
                                <div class="textArea">
                                    <span class="material-icons">article</span> <div class="comment">내용 입력</div>
                                    <textarea id="groupCon"></textarea>
                                </div>
                            </td> 
                        </tr>
                        <tr>
                            <td class="groupTbTd">Member Search&nbsp;</td>
                            <td>
                                <div class="search">
                                     <span class="material-icons">face</span>
                                    <input type="text" id="search" placeholder="참여명 검색">
                                    <span class="material-icons">search</span>
                                    <div class="searchList">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Member</td>
                            <td style="height:100px;">
                                <div class="searchNameAfter">
                                    &nbsp;&nbsp;Click and remove NameBox.<br>
                                    
                                </div>
                            </td>
                        </tr>
                        <!-- 수입 -->
                        <tr class="profit"><td></td><td align="center"><b>PROFIT</b></td></tr>
                        <tr class="profit">
                            <td class="groupTbTd">Profit Amount&nbsp;</td>
                            <td>
                                <div class="backgroundWhite"><span class="material-icons">add</span><input type="text" class="amount"></div>
                            </td>
                        </tr>
                        
                        <tr class="profit">
                            <td class="groupTbTd">Profit Content&nbsp;</td>
                            <td>
                               <input type="text" >
                            </td>
                        </tr>
                       <!-- 수입 end -->
                       <!-- 지출 -->
                        <tr class="expense"><td></td><td align="center"><b>EXPENSE</b></td></tr>
                        <tr class="expense">
	                        <td class="groupTbTd">Expense Amount&nbsp;</td>
	                        <td>
	                            <div class="backgroundWhite"><span class="material-icons">remove</span><input type="text" class="amount"></div>
	                        </td>
                  		</tr>
	                    <tr class="expense">
	                        <td class="groupTbTd">Expense Contnet&nbsp;</td>
	                        <td>
	                           <input type="text" >
	                        </td>
	                    </tr>
                       <!-- 지출 END --> 
                       <tr class="fee"><td></td><td align="center"><b>FEE</b></td></tr>
                        <tr class="fee">
                            <td class="groupTbTd">Fee Amount&nbsp;</td>
                            <td>
                                <div class="backgroundWhite"><span class="material-icons">add</span><input type="text" class="amount"></div>
                            </td>
                        </tr>
                        <tr class="fee">
                            <td class="groupTbTd">Fee Content&nbsp;</td>
                            <td>
                               <input type="text" >
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
         </div>
         
         <!-- 라디오 박스 선택 -->
         <script>
	         $(".type").change(function(){
	             if($("#fee").is(":checked")){
	                 alert("fee");
	                 $(".fee").css("display","block");
	                 $(".expense").css("display","none");
	                 $(".profit").css("display","none");
	             }else if($("#profit").is(":checked")){
	                 alert("profit");
	                 $(".fee").css("display","none");
	                 $(".expense").css("display","none");
	                 $(".profit").css("display","block");
	             }else if($("#expense").is(":checked")){
	            	 alert("expense");
	            	 $(".fee").css("display","none");
	                 $(".expense").css("display","block");
	                 $(".profit").css("display","none");
	             }
	         });
         </script>
         
         <!-- 멤버검색 script -->
         <script>

            // 클릭한 이름 삽입
            
           	 $(document).on("click",".searchClick",function(){
                var $searchName = $(this).children().html();
                var $searchNameAfter = $(".searchNameAfter");
                var $searchNameBox = " <button type='button' class='searchNameBox'><div class='amountName'>"+$searchName+"</div><input type='text' class='amountBox' placeholder='Enter the amount here'><input type='hidden' value='"+$searchName+"' ></button>";
                
                $searchNameAfter.append($searchNameBox);
				$(this).remove();
                
            })
            //  클릭된 이름 삭제
             $(document).on("click",".amountName",function(){
                var who = $(this).parent("button");
                console.log("who :" + who);
                who.remove();
                   })
         </script>
         
          <!-- 이름 검색  -->
         <script>
         	$(function(){

         		$("#search").keyup(function(){
         			$(".searchList").css("display","block");
         			var searchName = $("#search").val();
         			
         			$.ajax({
         				url:"searchNameAccount.do",
         				data:{searchName:searchName},
         				dataType:"json",
         				success:function(data){
         					 var $search = $(".searchList");
         					 $search.empty();
         					
         					
         					for(i in data){
         						
	         					var $searchList = $(".searchList");
	         					var $searchClick = $("<div>").attr("class","searchClick");
	         					var $searchName = $("<div>").text(data[i].name).attr("class","searchName");
	         					var $searchId = $("<span>").text(data[i].id).attr("class","searchId");
	         					var $gmNo = $(' <input type="hidden" class="gmNo" value="'+data[i].gmNo+'">');
       						
	         					
	         					$searchList.append($searchClick);
	         					$searchClick.append($searchName);
	         					$searchClick.append("&nbsp;");
	         					$searchClick.append($searchId);
	         					$searchClick.append($gmNo);

	         				
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