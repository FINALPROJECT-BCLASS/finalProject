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

    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 65px; width: 75%;background: #F3F3F3;}

    .groupJoin{width:900px;}
    .groupTb{margin:auto; width:700px; border-spacing: 5px; border-collapse: separate;}
    .groupTbTd {width:40px;}

    

    input{width:100%;height:40px; padding-left: 10px; border-radius: 5px; border:none;}
    

    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px;}

    /* 투표 생성 */
    .itemLinst{text-align:left; cursor: pointer;}
    .plusItem, .endTimePlus, .anonymousVote{font-weight: 600;}
    .endDate{display:none;}
    .endDateTitle{padding-top:6px;}
    .btnRemove{ height:40px; background:none; border:0; outline:0 !important; padding-left:0;}


    .groubJoinBtn{text-align: center;}
    #submit{background:none; border:none; color:#2860E1; font-weight: 600; font-size: 20px; }
    #reset{background:none; border:none; color:#484848; font-weight: 600; font-size: 20px; width:100px;}

    tr > td:nth-child(1) , .btnRemove{
            color: #484848;
            text-align: left;
            font-weight: 600;
            font-size: 16px;
            
        }
  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	
	<jsp:include page="../common/sidenaviGroup.jsp"/>

      
       <div class="join-form-area">
        <h1>Group Diary</h1>
        <h4 class="pSubject">Vote Create</h4><br>
            <div class="groupJoin">
                <form action="voteInsert.do" method="post" id="voteForm">
                    <table class="groupTb">
                     	<tr>
                            <td class="groupTbTd">Title&nbsp;</td>
                            <td><input type="text" id="content" name="gvTitle" placeholder="   투표 제목"></td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Content&nbsp;</td>
                            <td><input type="text" id="title" name="gvCon" placeholder="   투표 내용"></td>
                        </tr>
                        <tr>
                            <td class="groupTbTd endDate endDateTitle">END Date&nbsp;</td>
                            <td>
                                <input type="date" name="gvEnd" class="date endDate"> 
                            </td>
                        </tr>
                       <tr>
                           <td class="groupTbTd">ITEM&nbsp;</td>
                           <td><input type="text" class="voteList voteList1" name="itemList" placeholder="   항목 입력"></td>
                       </tr>
                       <tr>
                            <td class="groupTbTd">ITEM&nbsp;</td>
                            <td><input type="text" class="voteList voteList2" name="itemList"  placeholder="   항목 입력" ></td>
                      </tr>
                      <tr class="itemPlusTr">
                        <td></td>
                        <td class="groupTbTd itemLinst itemPlus">
                              <span class="material-icons">control_point</span>
                              <span class="plusItem">항목 추가</span>
                        </td>
                      </tr>
                      <tr class="itemPlusTr">
                        <td></td>
                        <td class="groupTbTd itemLinst endTime">
                              <span class="material-icons">timer</span>
                              <span class="endTimePlus">마감일ㄴ 설정</span>
                        </td>
                      </tr>
                      <tr class="itemPlusTr">
                        <td></td>
                        <td class="groupTbTd itemLinst anno">
                              <span class="material-icons annoIcon">check_box_outline_blank</span>
                              <span class="anonymousVote">익명투표 설정</span>
                              <input type="hidden" id="anno" name="anno" value="no">
                        </td>
                      </tr>
                    </table>
                </form>
                <br><br>
                <div class="groubJoinBtn">
                   <span><button id="submit">Submit</button>&nbsp;</span>
                   <span id="reset" onclick="goBack();">Back</span>	    
                </div>
            </div>
         </div>
         
          <!-- 뒤로가기 버튼 -->
		 <script>
		 	function goBack(){
		 		window.history.back();	
		 	}
		 	
		 </script>
         
         <!-- submit -->
         <script>
         	$("#submit").click(function(){         	
         		if($("#content").val() == ""){
         			alert("제목을 입력해주세요");
         			
         		}else if($(".voteList1").val() == ""){
         			alert("항목을 입력해주세요");
         			
         		} else if($(".voteList2").val() == ""){
         			alert("항목을 입력해주세요");
         			
         		}else if($(".voteList").val() == ""){
         			alert("항목을 입력해주세요");
         			
         		}else if($(".voteList2").val() != ""){
         			$("#voteForm").submit();
         		}         		
         			
         		
         	})
         	
         </script>
         
         
         <script>

          // 항목추가
          $(".itemPlus").click(function(){
              var $itemTr = $(this).parent("tr");
              var $tr = $("<tr>");
              var $td = $("<td class='groupTbTd'><button class='btnRemove'>ITEM</td></button>");
              var $inputtd = $("<td>");
              var $input = $("<input type='text' class='voteList' name='itemList' placeholder=' Click ‘ITEM‘ to delete it.'>");

              
              $tr.append($td);
              $tr.append($inputtd);
              $inputtd.append($input);
              $itemTr.before($tr);
            
          })

          //  클릭된 항목 삭제
            $(document).on("click",".btnRemove",function(){
                $(this).parent().parent().remove();
              })
          

          // 마감시간 설정
          $(".endTime").click(function(){
              
              if($(".endDate").css("display") === "none"){

                  $(".endDate").css("display","block");

              }else {
                $(".endDate").css("display","none");
              }

              })

           // 익명투표 체크
           $(".anno").click(function(){
            if($(".annoIcon").text() == "check_box_outline_blank"){
              $(this).children(".annoIcon").text("check_box");
              $("#anno").remove();
              $(this).append("<input type='hidden' class='annoIn' name='anno' value='anno'>");
            } else{
              $(this).children(".annoIcon").text("check_box_outline_blank");
              $(".annoIn").remove();
            }

           })
              
        
          

             
         </script>
</body>
</html>