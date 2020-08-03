<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body { height:100%;}

    h1, h4{margin-top:20px; text-align:center;}
	
	input:focus, button:focus {outline:none;}
	
	 /* 구글 아이콘 */
    .material-icons{font-size:30px !important; padding-top:12px; padding-left: 10px; padding-right: 10px;  }
	.like{color:#f3487b;}
    .reply{color:#2860E1;}

    .join-form-area{padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
    .material-icons{font-size:30px;}

	
	/* 게시판 양식 */
    .detailBox{width:1000px; background:white; border-radius:10px 10px 0px 0px;}
    .MemberImgBox{text-align:center; padding:10px 0px 0px 10px;}
    .MemberImg{width:60px; height:60px; border-radius:40%;}
    .BoardTitle, .BoardName, .BoardDate, .BoardCount{display:inline-block; color:#484848;margin-right:10px;}
    .BoardTitle, .BoardName{padding:10px 0px 0px 10px;}
    .BoardName{font-size:15px; font-weight:600; }
    .BoardCon{background: #F3F3F3;  border-radius: 6px;   margin: 20px; text-align:left; padding:20px 0px 20px 20px;}
    .done{font-weight:600 !important; font-size:14px !important; padding-right:2px !important;}
    
    .groubJoinBtn{text-align: center;}
	
	/* 게시판 내용 칸  */
    .contentBox{width:1000px; text-align:center;}
    .contentBox tr{background:white;}
	.boardImg{width:50%; height: 40%;}
	
	.dateView{font-weight:600; margin-left: 35px; color: #2860E1;font-size: 13px;display:inline-block; }
	 #sample04{display: inline-block;font-size: 13px;    color: #2860E1;}
	
	  /* 투표 내용 시작 */
    .voteBox{ margin-bottom: 10px; margin-left:17px; width:950px !important; border-radius:10px; border:1px solid #F3F3F3; display: flex; align-items: center;}
    .voteTitle{width:80%; height:50px; cursor: pointer !important; border:0; outline:0 !important; background:none; }
    .anno{display: inline-block;color: gray;font-size: 11px;}
    .voteSubmit{font-weight: 600;font-size: 17px;color:white; margin-left: 3px; margin-top:20px; margin-bottom:10px; width:45%; height:50px; border:none; background:#2860E1; border-radius: 5px; }
    .voteEnd{background:#FBD14B;}
    .voteUpdate{background:#2860E1 ;}
    .voteDelete{background:#dc3545 ;}
    .checkName{display:inline-block; margin-bottom:10px; font-weight: 600; font-size: 16px; color:#434343;}
    .checkClick{display:inline-block; font-size:14px; color:gray; padding-left:5px;}
 	.checkView{width:100px;padding: 10px 30px !important;}
  	.etcBox{text-align:center !important;}	
	
	.yellowBox{    background:#FBD14B !important;}
	
	.memberList{display:none; color:gray; font-size:13px; }
	.re{font-size:21px !important; color:darkgray;margin-left: 30px;padding: 0 !important;}
	.howVote{color:#2860E1; cursor:pointer;}
	
	
    #submit{background:none; border:none; color:#2860E1; font-weight: 700; font-size: 20px; border-radius:6px; width:60px; height:35px;margin-right: 20px; cursor:pointer;}
    #reset{background:none; border:none; color:#484848; font-weight: 700; font-size: 20px; width:100px; cursor:pointer;    margin-right: 20px;}
	#delete{background:none; border:none; color:#ee1212d0; font-weight: 700; font-size: 20px; width:100px; cursor:pointer;    


	 /* tooltip 색상 변경 css */
    .tooltip .bs-tooltip-bottom .tooltip-inner { background:#2860E1 !important;}
    .tooltip .arrow:before { border-bottom-color:#2860E1 !important; border-top-color:#2860E1 !important; }



</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<jsp:include page="../common/sidenaviGroup.jsp"/>
	
	
    <div class="join-form-area">
    
    <jsp:include page="../common/groupNoticeHeader.jsp"/>
    
        <h1>Group Diary</h1>
        <h4 class="pSubject">Vote Detail</h4><br>
            <div class="groupJoin">
                <table class="detailBox">
                    <tr>
                        <td rowspan="2" style="width:20px">
                        	<div class="MemberImgBox">
                        		<c:if test="${empty voteList.renameFile}">
                        			 <img src="resources/images/icons/profile_default.png" class="MemberImg">
                        		</c:if>
                        		<c:if test="${!empty voteList.renameFile}">
                        			<img src="resources/muploadFiles/${voteList.renameFile }" class="MemberImg">
                        		</c:if>
                        	</div>
                        </td>
                        <td>
                        	<div class="BoardTitle">
                        		${voteList.gvTitle }
                        	</div>
                        </td>
                       
                      
                    </tr>
                    <tr>
                        <td colspan="2">
                        	<div class="BoardName">${voteList.name }</div>
                        	
                        	<div class="BoardCount">
                        	<span class="material-icons done">done</span> 3
                        	</div>
                        	<c:if test="${voteList.gvAno eq 'Y' }">
                        		<div class="anno">익명 투표 입니다.</div>
                        	</c:if>
                        </td>
                    </tr>
                     <tr>
                    	<td colspan="2">
                    		<div class="BoardDate dateView">Start : </div>
                    		<div class="BoardDate" style="margin-left: -6px;">${voteList.gvStart }</div>
                    		<br>
                    		
                    		<c:if test="${!empty voteList.gvEnd}">
	                    		<div class="BoardDate dateView">End : </div>
	                    		<div class="BoardDate">${voteList.gvEnd }</div>
	                    		<div class="BoardDate" align="right" id="sample04"></div>
                    		</c:if>
                    	</td>
                    </tr>	
                    <tr>
                    	<td colspan="2">
                    		<div class="BoardCon">${voteList.gvCon }</div>
                    	</td>
                    </tr>	
                    
	                    <c:forEach var="i" items="${ itemList}">
	                   	 <c:if test="${i.gviNo  eq voteTotalList.gviNo}">
	                   	 	
	                    	<tr>
	                    		<td colspan="2">
		                    		<div class="voteBox first yellowBox">
					                    <span class="material-icons checkView">check</span>
					                    <button class="voteTitle " value="${i.gviNo }">${i.gviItem }</button>
					                    <input type="hidden" class="voteTitle" value="${i.gvNo }">
					                    <span class="material-icons voteUser">person</span>
					                    <span>${i.totalGviNo }</span>
					                    <br>
					                </div>
					                	<c:if test="${voteList.gvAno eq 'N' }">
					                   <div class="memberList">
				                    		<span class="material-icons re">subdirectory_arrow_right</span> 
					                    	<c:forEach var="m" items="${memberList }">
						                    	<c:if test="${i.gviNo eq m.gviNo }">
						                    		 ${m.name }
						                    	</c:if>		
					                    	</c:forEach>
					                    </div>
					                    </c:if>
	                    		</td>
	                    	</tr>
                 	  		</c:if>
                 	  		
                    		 <c:if test="${i.gviNo  ne voteTotalList.gviNo}">
		                    	<tr>
		                    		<td colspan="2">
			                    		<div class="voteBox">
						                    <span class="material-icons checkView"></span>
						                    <button class="voteTitle" value="${i.gviNo }">${i.gviItem }</button>
						                    <input type="hidden" class="voteTitle"  value="${i.gvNo }">
						                    <span class="material-icons voteUser">person</span>
						                    <span>${i.totalGviNo }</span>
						                </div>
						                <c:if test="${voteList.gvAno eq 'N' }">
						                  <div class="memberList">
						                  	<span class="material-icons re">subdirectory_arrow_right</span>
					                    	<c:forEach var="m" items="${memberList }">
					                    		<c:if test="${!empty m.name }">
						                    		투표에 참여한 인원이 없습니다. 
						                    	</c:if>		
						                    	<c:if test="${i.gviNo eq m.gviNo }">
						                    		${m.name } 
						                    	</c:if>		
					                    	</c:forEach>
					                    </div>
					                    </c:if>
		                    		</td>
		                    	</tr>
	                    	</c:if>
	                    </c:forEach>
                    
                    <c:if test="${voteList.gvAno eq 'N' }">
                    <tr>
                    	<td colspan="2">
                    		<span class="material-icons howVote">how_to_vote</span><span class="click" style="color:gray">Click!</span>
                    		
                    	</td>
                    </tr>
                    </c:if>
                </table>


               <br><br>
               
                <div class="groubJoinBtn">
                    <span id="reset" onclick="goBack();">Back</span>
                    <span id="submit">To Vote</span>
                </div>
               
            </div>
         </div>
		 
		 <!-- 투표 클릭 -->
		 <script>
		 	$(".howVote").click(function(){
		 		
		 	$(".memberList").css("display","block");
		 		})
		 	
		 	
		 </script>
		 
		 <!-- 뒤로가기 버튼 -->
		 <script>
		 	function goBack(){
		 		window.history.back();	
		 	}
		 	
		 </script>
		
           <!-- 투표 체크하기 -->
	     <script>
           $(function(){
        	$(document).on("click",".voteTitle", function(){
        		// 투표항목 색 바꾸기
				$(".yellowBox").removeClass("yellowBox");
        		
                $(".voteTitle").css("background","none");
                $(".voteBox").css("background","none");
                $(this).css("background","#FBD14B");
                $(this).closest(".voteBox").css("background","#FBD14B");
				$(this).parent().attr("class","voteBox yellowBox");

                // 클릭한거 체크 표시
                $(".voteTitle").prev("span").text("");
                $(this).prev("span").text("check");
                
                
                 gviNo = $(this).val();
                 gvNo = $(this).next().val();
                 
        	  })
       	})   
			</script>
			
		<!-- 투표하기 -->
		<script>               
               $("#submit").click(function(){
               	location.href="toVote.do?gvNo="+gvNo+"&gviNo="+gviNo;
               			
               	})
       	</script>
        
          <!-- 타이머 script -->
			<script>
			  
            const countDownTimer = function (id, date) {
                var _vDate = new Date(date); // 전달 받은 일자
                var _second = 1000;
                var _minute = _second * 60;
                var _hour = _minute * 60;
                var _day = _hour * 24;
                var timer;
        
                function showRemaining() {
                    var now = new Date();
                    var distDt = _vDate - now;
        		
                    if (distDt < 0) {
                        clearInterval(timer);	// setInterval()과 함께 사용(시간을 끝내주는 함수)
                        document.getElementById(id).textContent = '해당 투표는 종료된 투표입니다.';
                        return;
                    }
        
                    var days = Math.floor(distDt / _day);
                    var hours = Math.floor((distDt % _day) / _hour);
                    var minutes = Math.floor((distDt % _hour) / _minute);
                    var seconds = Math.floor((distDt % _minute) / _second);
        
                    document.getElementById(id).textContent = days + ' 일 ';
                    document.getElementById(id).textContent += hours + ' 시간 ';
                    document.getElementById(id).textContent += minutes + ' 분 ';
                    document.getElementById(id).textContent += seconds + ' 초 후 종료됩니다. ';
                }
                timer = setInterval(showRemaining, 1000);	// 시간 설정 값을 담은 함수
            }
       
              /* countDownTimer('sample04', '2020/10/28'); // 2024년 4월 1일까지 */ 
             
              countDownTimer('sample04', '${voteList.gvEnd }');
   			   </script>
         
         
         
        
          <jsp:include page="../common/footer.jsp"/>	 
</body>
</html>