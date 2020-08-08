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
    
    /* .searchName:hover{background:#2860E1; color:#F3F3F3;} */
    
    

    .searchNameAfter{background:white; border:none; border-radius: 6px;  height:100px; color:darkgray; height:150px; width:600px; overflow:scroll;  overflow-x:hidden;}
    
    
    .searchNameBox{margin-left:10px; margin-top:5px;width:95%; height:30px; background:#FBD14B;  border:none; border-radius: 6px; display: inline-flex; color:#484848;}
    
   
    
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
        <h4 class="pSubject">Account Write</h4><br>
            <div class="groupJoin">
               
                	<div class="typeForm">
                	<div class="typeBox">
                		<c:if test="${gaList.gaFee eq  'Y' }">
           					<input type="radio" class="type" name="type" value="fee" id="fee" checked readonly>
           				</c:if>
           				<c:if test="${gaList.gaFee eq  'N' }">
           					<input type="radio" class="type" name="type" value="fee" id="fee" readonly>
           				</c:if>
           				<label for="fee">Fee</label>
           			</div>
           			<div class="typeBox">
           				<c:if test="${gaList.gaPro eq  'Y' }">
           					<input type="radio" class="type" name="type"  value="profit" id="profit"  checked readonly>
          				</c:if>
          				<c:if test="${gaList.gaPro eq  'N' }">
          				<input type="radio" class="type" name="type"  value="profit" id="profit"  readonly>
          				</c:if>
           				<label for="profit">Profit</label>	
           			</div>	
           			<div class="typeBox">
           				<c:if test="${gaList.gaExp eq  'Y' }">
           					<input type="radio" class="type" name="type"  value="expense" id="expense"  checked readonly>
           				</c:if>
           				<c:if test="${gaList.gaExp eq  'N' }">
           					<input type="radio" class="type" name="type"  value="expense" id="expense"  readonly>
           				</c:if>
           				<label for="expense">Expense</label>
           			</div>
           			</div>
                    <table class="groupTb">
                        <tr>
                            <td class="groupTbTd">Title&nbsp;</td>
                            <td><input type="text" name="gaTitle" id="title" value="${gaList.gaTitle }" readonly></td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Date&nbsp;</td>
                            <td>
                                <input type="date" name="gaDate" class="date" value="${gaList.gaDate }" readonly> 
                            </td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Content&nbsp;</td>
                            <td>
                                <div class="textArea">
                                    <span class="material-icons">article</span> <div class="comment">내용 입력</div>
                                    <textarea id="groupCon" name="gaCon" readonly>${gaList.gaCon }</textarea>
                                </div>
                            </td> 
                        </tr>
                        <tr>
                            <td class="groupTbTd">Member</td>
                            <td style="height:100px;">
                                <div class="searchNameAfter">
                                    <c:forEach var="gam" items="${gamList }">
                                    <button type='button' class='searchNameBox'>
                                    	<div class='amountName'>${gam.name }</div>
                						<input type='text' class='amountBox' name='gamAmount' value="${gam.gamAmount }">
                					</button>
                					</c:forEach>
                
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="groupTbTd"><div class="amount">Total Amount&nbsp;</div></td>
                            <td>
                                <div class="backgroundWhite"><span class="material-icons">add</span><input type="text" name="gaAmount" class="amount" value="${totalAmount }"></div>
                            </td>
                        </tr>
                        <tr>
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
                    </table>
                <br><br>
                <div class="groubJoinBtn">
                <c:if test="${gInfo.loginUserId eq groupTable.id }">
                   <span><button  id="submit">Update</button>&nbsp;</span>
                
                </c:if>
                   <span id="reset" onclick="goBack();">Back</span>
                </div>
            </div>
         </div>
         </div>
        <!-- 뒤로가기 버튼 -->
		 <script>
		 	function goBack(){
		 		window.history.back();	
		 	}
		 	
		 </script>
             <jsp:include page="../common/footer.jsp"/>	
</body>
</html>