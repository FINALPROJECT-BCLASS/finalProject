<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    
    
    .searchNameBox{margin-left:10px; margin-top:5px;width:95%; height:30px; background:#FBD14B;  border:none; border-radius: 6px; display: inline-flex; color:#484848;}
    .searchNameBox:hover{margin-left:10px;margin-top:5px; width:95%; height:30px; background:darkgray; border:none; border-radius: 6px; cursor:pointer; display: inline-flex;}
   
    
    .deleteBtn{width:20px;height:30px; border-radius: 3px; background:red; border:none; text-align: center;}

    .amountName{display: inline-block;width:50%; color:#484848;}
   
    
    .amountBox{display: inline-block; width:50%; border:none;height:20px; background:#ecba14; border-radius: 6px; margin-top:3px;}
   

    .amountBox::placeholder{color:white;}


    .accountAdmin{width:20px; height:20px; margin-top:10px; margin-right: 10px;}
    .accountMargin{margin-left:80px;}
    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px;}

    .backgroundWhite{background:white;border:none; border-radius: 6px; }
    .amount{display: inline-block; width:90%; border:none;}

    #groupCon{width:100%; border:none; padding-left:10px;}
    .textArea{border:none; border-radius: 6px;  background:white;}
    .comment{color:grey; display: inline-block; font-size: medium;}
	.textTitle{font-weight:800;}
    .groubJoinBtn{text-align: center;}
    .annoIcon{cursor:pointer;}
    
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
        <h4 class="pSubject">Account Update</h4><br>
            <div class="groupJoin">
                <form action="accountUpdate.do" method="post" id="accountForm">
                	<input type="hidden" id="gaNo" name="gaNo" value="${gaList.gaNo }">
                	<input type="hidden" id="gaNo" name="gaDelete" value="N">
                	<div class="typeForm">
                	<div class="typeBox">
                		<c:if test="${gaList.gaFee eq  'Y' }">
           					<input type="radio" class="type" name="updateType"  value="fee" id="fee" checked >
           					<input type="hidden" class="type" name="gaFee" value="Y" id="typeFee" >
           				</c:if>
           				<c:if test="${gaList.gaFee eq  'N' }">
           					<input type="radio" class="type"  name="updateType" value="fee" id="fee" >
           					<input type="hidden" class="type" name="gaFee" value="N" id="typeFee" >
           				</c:if>
           				<label for="fee">Fee</label>
           			</div>
           			<div class="typeBox">
           				<c:if test="${gaList.gaPro eq  'Y' }">
           					<input type="radio" class="type"  name="updateType"  value="profit" id="profit"  checked >
           					<input type="hidden" class="type" name="gaPro" value="Y" id="typePro" >
          				</c:if>
          				<c:if test="${gaList.gaPro eq  'N' }">
          				<input type="radio" class="type"   name="updateType"  value="profit" id="profit"  >
          				<input type="hidden" class="type" name="gaPro" value="N" id="typePro" >
          				</c:if>
           				<label for="profit">Profit</label>	
           			</div>	
           			<div class="typeBox">
           				<c:if test="${gaList.gaExp eq  'Y' }">
           					<input type="radio" class="type" name="updateType"  value="expense" id="expense"  checked >
           					<input type="hidden" class="type" name="gaExp" value="Y" id="typeExp" >
           				</c:if>
           				<c:if test="${gaList.gaExp eq  'N' }">
           					<input type="radio" class="type" name="updateType" value="expense" id="expense"  >
           					<input type="hidden" class="type" name="gaExp" value="N" id="typeExp" >
           				</c:if>
           				<label for="expense">Expense</label>
           			</div>
           			</div>
                    <table class="groupTb">
                    	<tr>
                            <td class="groupTbTd">Title&nbsp;</td>
                            <td><input type="text" name="gaTitle" id="title" value="${gaList.gaTitle }" placeholder="  제목 입력" required></td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Date&nbsp;</td>
                            <td>
                                <input type="date" name="gaDate" class="date" value="${gaList.gaDate }" required> 
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Content&nbsp;</td>
                            <td>
                                <div class="textArea">
                                    <span class="material-icons">article</span> <div class="comment">내용 입력</div>
                                    <textarea id="groupCon" name="gaCon">${gaList.gaCon }</textarea>
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
                                	<div class="amountMember">
	                                    <c:forEach var="gam" items="${gamList }">
	                                    <button type='button' class='searchNameBox'>
	                                    	<div class='amountName'>${gam.name }</div>
	                                    	<c:set var="amount" value="${gam.gamAmount }"/>
	                						<input type='text' class='amountBox' name='gamAmount'  name="gamAmount" value="${amount }">
	                						<input type="hidden" class="gamDelete"  value="${gam.gamDelete }">
	                						<input type="hidden" name="gmNo" value="${gam.gmNo }">
	                					</button>
	                					</c:forEach>
                					</div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="groupTbTd"><div class="amount">Total Amount&nbsp;</div></td>
                            <td>
                                <div class="backgroundWhite"><span class="material-icons">add</span><input type="text" name="gaAmount" class="amount" value="${totalAmount }"></div>
                            </td>
                        </tr>
                        <c:if test="${gaList.gaFee eq 'Y' }">
	                        <c:if test="${!empty gaList.gasYn }">
	                        <tr class="checkSharing">
	                        	<td>Sharing</td>
	                        	<td>
	                        		<c:if test="${gaList.gasYn eq  'Y'}">
	                        			<span class="material-icons annoIcon">check_box</span>
	                        		</c:if>
	                        		<c:if test="${gaList.gasYn eq  'N'}">
	                        			<span class="material-icons annoIcon">check_box_outline_blank</span>
	                        		</c:if>
	                        		<input type='hidden' class='annoIn' name='gasYn' value='N'>
	                        	</td>
	                        </tr>
	                        </c:if>
                        </c:if>
                    </table>
                </form>
                <br><br>
                <div class="groubJoinBtn">
                   <span><button  id="submit">Submit</button>&nbsp;</span>
                   <span><input type="reset" value="Reset" id="reset"></span>
                </div>
            </div>
         </div>
         </div>
         <!-- 합계 -->
         <script>
         	$(document).on("keyup",".amountBox",function(){
         		var sum = 0;
         		$('.amountBox').each(function(){
         		    sum += parseInt(this.value);
         		    
         		});
         		
         		$(".amount").val(sum);
         	})
         </script>
         
         <!-- Sharing -->
         <script>
	         // 공유 체크
	         $(".annoIcon").click(function(){
	          if($(this).text() == "check_box_outline_blank"){
	            $(this).text("check_box");
	            $(".annoIn").val("Y");
	          } else{
	            $(this).text("check_box_outline_blank");
	            $(".annoIn").val("N");
	          }
	
	         })
         </script>
         
         <!-- submit -->
         <script>
         	$("#submit").click(function(){
         		var amountYn = 'N';
         		$('.amountBox').each(function(){
         		    if($(this).val() == "" || $(this).val() == null){
         		    	amountYn = 'Y';
         		    }
         		    
         		});
         		
         		if(amountYn == 'Y'){
					alert("금액을 입력해주세요.");         			
         		}else {
         		
         			if($("#title").val() == ""){
         				alert("제목을 입력해주세요.");
         			}else if($("#grouopCon").val() == ""){
         				alert("내용을 입력해주세요.");
         				
         			}else if($(".gamDelete").val() == "N"){ 
         				if($(".amountMember").html() == ""){
         					alert("멤버를 입력해주세요.");
         				}
         			}else{
         				
		       			$("#accountForm").submit();
         			}
         			
         		}
         	})
         </script>

         
         <!-- 라디오 박스 선택 -->
         <script>
	         $(".type").change(function(){
	             if($("#fee").is(":checked")){
	                 
	                 $("#typeFee").attr("value","Y");
	                 $("#typePro").attr("value","N");
	                 $("#typeExp").attr("value","N");
	              	 $(".checkSharing").show();
	             }else if($("#profit").is(":checked")){

	                 $("#typeFee").attr("value","N");
	                 $("#typePro").attr("value","Y");
	                 $("#typeExp").attr("value","N");
	                 $(".checkSharing").hide();
	             }else if($("#expense").is(":checked")){

	                 $("#typeFee").attr("value","N");
	                 $("#typePro").attr("value","N");
	                 $("#typeExp").attr("value","Y");
	                 $(".checkSharing").hide();
	             }
	         });
         </script>
         
         <!-- 멤버검색 script -->
         <script>
            // 클릭한 이름 삽입
            
           	 $(document).on("click",".searchClick",function(){
                var $searchName = $(this).children().html();
                var $gmNo = $(this).children().next().next().val();
                var $searchNameAfter = $(".amountMember");
                var $searchNameBox = " <button type='button' class='searchNameBox'>" +
                "<div class='amountName'>"+$searchName+"</div>" +
                "<input type='text' class='amountBox' name='gamAmount' placeholder='Enter the amount here'>"+
                "<input type='hidden' name='gmNo' value='"+$gmNo+"' ></button>";
                
                $searchNameAfter.append($searchNameBox);
				$(this).remove();
                
            })
            //  클릭된 이름 삭제
             $(document).on("click",".amountName",function(){
	                var who = $(this).parent("button");
	                console.log("who :" + who);
	                if($(this).next().next().hasClass("gamDelete")){
	                	$(".gamDelete").val("Y");	   
	                	who.hide();
	                }else{
	                	who.remove();
	                }
                  })
         </script>
         
          <!-- 이름 검색  -->
         <script>
         	$(function(){

         		$("#search").keyup(function(){
         			$(".searchList").css("display","block");
         			var searchName = $("#search").val();
         			var gaNo = $("#gaNo").val();
         			$.ajax({
         				url:"searchNameAccountUpdate.do",
         				data:{searchName:searchName,gaNo:gaNo},
         				dataType:"json",
         				success:function(data){
         					 var $search = $(".searchList");
         					 $search.empty();
         					
         					
         					for(i in data){
         						
	         					var $searchList = $(".searchList");
	         					var $searchClick = $("<div>").attr("class","searchClick");
	         					var $searchName = $("<div>").text(data[i].name).attr("class","searchName");
	         					var $searchId = $("<span>").text(data[i].gmId).attr("class","searchId");
	         					var $gmNo = $(' <input type="hidden" class="gmNo" value="'+data[i].gmNO+'">');
       						
	         					
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