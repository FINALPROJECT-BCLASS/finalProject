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
            margin: 9px auto;
            margin-bottom: 50px;
            width: 700px;
            border-top: 1px solid #484848;
            border-bottom: 1px solid #484848;

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
            width: 300px;
        }
        
        tr > td:nth-child(4) {
            text-align: left;
            width: 300px;
            height: 57px;
        }

        .board-image-area {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: white;
            margin: 0 auto;
        }

        td > a {
            display: inline-block;
            vertical-align: middle;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            width: 280px;
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
            /* width: 30px;
            height: 30px;
            border-style: none;
            border-radius: 50%; */
        }

        .p-num {
            color: #484848;
        }

        /* pagination-end */

        input[type=text] {
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

    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidenaviDaily.jsp"/>
    <div class="right-area">
        <div class="daily-record-area">
            <span class="pSubject">Daily Record</span>
            <div class="button-area">
                    <button>Add</button>
                    <button>Delete</button>
             </div>
            <table class="board-table" cellpadding="8px">
                <thead>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>No.</th>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Date.</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="dr" items="${drlist }">
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <td>${dr.dr_no }</td>
	                        <td>
	                        	<%-- <c:if test="${empty dr.drp_rename }">
	                        		<div class="board-image-area"></div>
	                        	</c:if>
	                        	<c:if test="${!empty dr.drp_rename }">
	                        		<div class="board-image-area"><img class="image" src="resources/bluploadFiles/${dr.drp_rename }"></div>
	                        	</c:if> --%>
	                        </td>
	                        <td><a href="#">${dr.dr_title }</a></td>
	                        <td></td>
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>
            <div class="pagination-area">
                <button type="button" class="page-bnf blue">Prev</button>
                <button type="button" class="p-num">1</button>
                <button type="button" class="p-num">2</button>
                <button type="button" class="p-num">3</button>
                <button type="button" class="page-bnf blue">Next</button>
            </div>

            <div class="search-area">
                <div style="position:relative;">
                    <select>
                        <option>Title</option>
                        <option>Date</option>
                    </select>
                    <div class="select-arrow"></div>
                </div>
                    <input type="text"></input>
                <button class="default-btn b-yell">Search</button>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>