<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Record</title>
    <style>
        .right-area {
            display: flex;
            align-items: center;
            justify-content: center;
            float: right;
            width: 81%;
            background-color: #f7f7f7;
            color: #484848;
            text-align: center;
            padding: 90px;
            
        }

        /* Table */

        .board-table {
        	width:100%;
            margin: 9px auto;
            border-top: 1px solid #484848;
            border-bottom: 1px solid #484848;

        }
        
        .board-table > tr:nth-child(1) {
        
        	background:white;
        }

        tr {
            border-top: 1px solid #484848;
            border-bottom: 1px solid #484848;
        }

        .pSubject {
            font-size: 30px;
            font-weight: 600;
            padding: 20px;
            padding-top: 0;
            color: #484848;
            display: inline-block;
        }

        th:nth-child(4) {
            width: 50%;
        }
        
        tr > td:nth-child(4) {
            text-align: left;
            width: 50%;
            height: 57px;
        }

        .board-image-area {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: white;
            margin: 0 auto;
			display: flex;
            justify-content : center;
            align-items : center;
            overflow : hidden;
        }
        
        .board-image-area > img {
 			 height:150%;
		}

        td > a {
            display: inline-block;
            vertical-align: middle;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            width: 80%;
        }

        /* pagination */

        .pagination-area {
            margin: 43px auto;
            text-decoration: none;
        }

        .pagination-area > button {
            background: none;
            border-style: none;
            font-weight: 700;
            margin:0 3px;
        }

        .page-bnf {
            margin: 0 6px;
            font-size: 19px;
            display: inline-block;
            font-weight: 600;
      	}

        .p-num {
            color: #484848;
        }

        /* pagination-end */

        input[type=text], input[type=date] {
            margin: 0 8px;
            border-style: none;
            border-radius: 8px;
            background: white;
            color: #484848;
            height: 40px;
            width: 220px;
            padding: 10px;
        }

        /* search */

        select {
            position: relative;
            border-style: none;
            border-radius: 8px;
            background: white;
            height: 40px;
            width: 100px;
            padding: 0px;
            padding-left: 15px;
            color: #cecece;
            -webkit-appearance: none;
        }

        .search-area {
            margin: 20px 0;
            display: flex;
            color: #484848;
            justify-content: center;
        }

        .select-arrow{
            position: absolute;
            top :16px;
            right: 15px;
            width :0;
            height :0;
            pointer-events: none;
            border-style :solid;
            border-width: 8px 5px 0 5px;
            border-color: #cecece transparent transparent transparent;
        }

        option {
            display: inline-block;
            vertical-align: middle;
        }
        
        .button-area {
        	position: relative;
            display: flex;
            justify-content: flex-end;
	    }
	    
	    .button-area > button {
            border: none;
            height: 40px;
            background: none;
            font-size: 23px;
            font-weight: 700;
            color: #484848;
        }
        
        .daily-record-area {
        	width: 77%;
        }
        
        .thead {
        	height: 45px;
        }
        
        #date_a {
        	display: none;
        }
        
        .allpost {
        	font-size: 15px !important;
        	color: gray !important;
        	position: absolute;
        	left:0;
        	
        }
        
        .allpost:hover {
        	color:#2860E1 !important;
        }
        


    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidenaviDaily.jsp"/>
    <div class="right-area">
        <div class="daily-record-area">
            <span class="pSubject">Daily Record</span>
                    
           	
            <div class="button-area">
            		<button class="allpost" type="button" onclick="allPost()">All Post</button>
                    <button type="button" onclick="dailyRecordAdd()">Add</button>
                    <button type="button" onclick="deleteDailyRecord()">Delete</button>
             </div>
             <input type="hidden" name="dr_thumbnail" value="${dr.dr_thumbnail }">
            <table class="board-table" cellpadding="3px">
                <thead>
                    <tr class="thead">
                        <th><input id="check_all" type="checkbox"></th>
                        <th>No.</th>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Date.</th>
                    </tr>
                </thead>
                <tbody class="table-body">
                	<c:forEach var="dr" items="${drlist }">
	                    <tr>
	                        <td><input class="check_sub" name=check type="checkbox" value="${dr.dr_no }"></td>
	                        <td>${dr.dr_num }</td>
	                        <td>
	                        	<c:if test="${empty dr.dr_thumbnail }">
	                        		<div class="board-image-area"></div>
	                        	</c:if>
	                        	<c:if test="${!empty dr.dr_thumbnail }">
	                        		<div class="board-image-area"><img class="image" src="resources/druploadFiles/${dr.dr_thumbnail }"></div>
	                        	</c:if>
	                        </td>
	                        <c:url var="drview" value="dailyRecordDetailView.do?dr_no=${dr.dr_no }" />
	                        <td><a href="${drview }">${dr.dr_title }</a></td>
	                        <td>${dr.dr_date }</td>
	                    </tr>
	                </c:forEach>
                </tbody>
                
            </table>
                 
            <div class="pagination-area">
            	<c:if test="${!empty drlist }">
	            <c:if test="${pi.currentPage eq 1 }">
	            	<p class="page-bnf gray">Prev</p>
	            </c:if>
	            </c:if>
	            <c:if test="${pi.currentPage gt 1 }">
	            	<c:url var="drlistBack" value="dailyRecordView.do">
	            		<c:param name="page" value="${pi.currentPage -1 }"/>
                	</c:url>
                		<button type="button" class="page-bnf blue" onclick="location.href='${drlistBack }'">Prev</button>
                </c:if>
                
                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                
	                <c:if test="${p eq pi.currentPage }">
						<button class="p-num" color="blue" size="4"><b>${p }</b></button>
					</c:if>
                	
                	<c:if test="${p ne pi.currentPage }">
                		<c:url var="drlistCheck" value="dailyRecordView.do">
                			<c:param name="page" value="${p }"/>
                		</c:url>
	                	<button type="button" class="p-num"  onclick="location.href='${drlistCheck }'">${p }</button>
                	</c:if>
                
                </c:forEach>
                
				 <c:if test="${pi.currentPage eq pi.maxPage }">
	            	<p class="page-bnf gray">Next</p>
	            </c:if>
	            <c:if test="${pi.currentPage lt pi.maxPage }">
	            	<c:url var="drlistNext" value="dailyRecordView.do">
	            		<c:param name="page" value="${pi.currentPage +1 }"/>
                	</c:url>
		                <button type="button" class="page-bnf blue" onclick="location.href='${drlistNext }'">Next</button>
                </c:if>

            </div>

            <div class="search-area">
                <div style="position:relative;">
                    <select id="select_" name="select_item">
                        <option id="title_" value="Title">Title</option>
                        <option id="date_" value="Date">Date</option>
                    </select>
                    <div class="select-arrow"></div>
                </div>
                    <input id="title_a" type="text" name="title">
                    <input id="date_a" type="date" name="date">
                <button class="default-btn b-yell" onclick="searchList()">Search</button>
            </div>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
<script>
	
	window.onkeydown = function(){
		
		var kcode = event.keyCode;
		
		if(kcode == 116) {
			
			/* history.replaceState({}, null, location.pathname); */
			window.location = window.location.href.split("?")[0];
			window.location = window.location.pathname;
			
		}
		
	}
	
	 
	function allPost() {
		
		location.href="dailyRecordView.do";
		
	}

	function searchList() {
		
		var select_item = $("#select_").val();
		var title = $("#title_a").val();
		var date = $("#date_a").val();
		
		location.href= "searchDailyRecordView.do?select_item=" + select_item + "&title=" + title + "&date=" + date;
		
	}


	/* 검색 옵션 */
	$('#select_').change(function() {
		var state = $('#select_ option:selected').val();
		if ( state == 'Title' ) {
			$("#title_a").show();
			$("#date_a").hide();
		} else {
			$("#title_a").hide();
			$("#date_a").show();
		}
	});

	
	// 전체 선택
	$(function(){
		// 전체 선택 체크박스를 클릭하면,
	   $("#check_all").click(function(){
		   
	       var chk = $(this).is(":checked");//.attr('checked');
	        // 하위 체크박스의 상태를 checked로 변경
	       if(chk){
	    	   $(".check_sub").prop('checked', true);
	       } else{
	    	   $(".check_sub").prop('checked', false);
	       }
	    });
	});
	
	
	var arrayList = '';
	
	
	function deleteDailyRecord(){
	
	var checkboxList = $("input[name=check]:checked");
	
	arrayList = '';
	
	for(var i=0; i<checkboxList.length; i++){
	
		// checkbox가 체크 되어있을 때만 실행
		if($(checkboxList[i]).is(":checked")){
			
			if(i != checkboxList.length-1){
				arrayList += $(checkboxList[i]).val() + ",";
			} else{
				arrayList += $(checkboxList[i]).val();
			}
		}
	}	
	
	
	// 하나도 체크 안했을 시 
	if(arrayList == ''){
		alert("하나 이상을 선택해주세요.");
	}else{
			if(!confirm('삭제하시겠습니까?')){
			return false;}
	
			// post ajax
	
			$.ajax({
				type: "POST",
				url: "deleteDailyRecordC.do",
				data: {dr_no : arrayList},
				success: function(data){
					if(data == "success") {
						// 현재 페이지 새로고침
						history.go(0);
					}else {
						alert("오류 발생, 다시 시도해 주세요.");
						
					}
				}		
			});
		}
	}


	function dailyRecordAdd() {
		
		var dr_no = $(".table-body > tr:nth-child(1) > td:nth-child(2)").html();
		
		location.href='addDailyRecordView.do?dr_no='+ dr_no;
	}

</script>
</html>













