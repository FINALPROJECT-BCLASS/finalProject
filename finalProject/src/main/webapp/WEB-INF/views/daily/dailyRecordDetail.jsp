<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Record</title>
<style>

		*{
			color:#484848;
		}

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .right-area {
            display: flex;
            align-items: center;
            justify-content: center;
            float: right;
            width: 81%;
            background-color: #f7f7f7;
            color: #484848;
            text-align: center;
            padding: 80px 50px;
        }

        .pSubject {
            font-size: 30px;
            font-weight: 600;
            padding: 30px;
            padding-top: 0;
            color: #484848;
            display: inline-block;
        }

        tr > td:nth-child(1) {
            color: #484848;
            text-align: left;
            font-weight: 600;
            font-size: 16px;
        }

        tr > td:nth-child(2) {
            color: #848484;
		    text-align: left;
		    padding-left: 46px;
		    font-weight: 600;
		    font-size: 16px;
        }

        input[type="checkbox"] {
            position: absolute;
            /* opacity: 0; */
        }
        
        input[type=text],
        input[type="date"] {
            border-style: none;
            border-radius: 8px;
            background: none;
            color: #484848;
            height: 40px;
            width: 580px;
            padding: 10px;
        }

        .b-content {
            resize: none; 
            border-style: none;
            border-radius: 8px;
            background: white;
            height: 300px;
            width: 580px;
            padding: 10px;
            color: #484848;
            margin-left: -9px;
            font-size: 15px;
        }

        .b-icons {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            border-radius: 50%;
            width: 45px;
            height: 45px;
            margin-bottom: 0;
            cursor: pointer;
        }

        .icons_ {
            width: 35px;
            height: 35px;
        }

        .b-flex {
            display: flex;
        }

        .button-area {
            display: flex;
            justify-content: flex-end;
            margin: 10px 0;
	    }
	
        .button-area > button {
            border: none;
            height: 40px;
            margin: 0 5px;
            background: none;
            font-size: 23px;
            font-weight: 700;
            color: #484848;
        }

        /* File */

        /* named upload */
	    .file-box .upload-name {
            display: inline-block;
            vertical-align: middle;
            width: 164px;
            height: 40px;
            font-size: 14px;
            padding: 0 10px;
            border: 0;
            border-radius: 8px;
            margin-right: 5px;
            background-color: white;
            color: #cecece;
        }

        .file-box {
            display: inline-block;
        }
        
        .file-box input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }

        .file-box label {
            display: inline-block;
            height: 40px;
            padding: 7px 20px;
            color: #484848;
            font-size: 15px;
            font-weight: 600;
            vertical-align: middle;
            background-color: #FBD14B;
            cursor: pointer;
            border-radius: 8px;
            margin: 0;
        }

        /* radio select */

        input[type="radio"] {
            display: none;
        }

  /*       input[type="radio"]:checked + label{
        background-color: #FBD14B;
        
    } */
    
    .photos-wrap {
    	width: 101.5%;
	    background: white;
	    border-radius: 8px;
        max-width: 580px;
	    display: flex;
	    align-items: center;
	    color: #cecece;
	    font-size: 14px;
	    border: 10px solid white;
	    overflow: hidden;
	    flex-wrap: wrap;
	    margin-left: -9px;
    }
    
     .photos-wrap > img {
    	height: 130px;
    	margin: 5px;
    	
    }
    
    .photos-wrap > div {
    	width: 100%;
    	text-align:center;
    }
    
    
    
    .preview-wrap {
    	width: 100%;
	    background: white;
        max-width: 580px;
	    border-radius: 8px;
	    display: flex;
	    align-items: center;
	    color: #cecece;
	    font-size: 14px;
	    border: 10px solid white;
	    overflow: hidden;
	    flex-wrap: wrap;
    }
    
    
    .preview-wrap > a > img {
    	height: 130px;
    	margin: 5px;
    	
    }
    
    .preview-wrap > div {
    	width: 100%;
    	text-align:center;
    }
    
    input, button, textarea {
    	outline: none !important;
    }
    
    td {
    	height: 50px;
    }
    
    .content {
    	vertical-align: top;
   	    padding-top: 14px;
    }
    
    .photos {
    	vertical-align: top;
   	    padding-top: 14px;
    }
    
    .origin-photo {
    	height: 700px;
    }
    
    .modal-dialog {
   	    display: flex;
	    width: 100%;
	    align-items: center;
	    justify-content: center;
    }
    
    .modal {
    	position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 1050;
	    display: none;
	    width: 100%;
	    overflow: hidden;
	    outline: 0;
    }
    
    div#myModal, .modal-body {
    	padding: 0 !important;
    }
    
    .modal-content {
    	width: initial !important;
    }
    
    .close {
   	    position: absolute;
	    right: 10px;
	    top: 4px;
    	
    }

    </style>
    
    
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidenaviDaily.jsp"/>
    <div class="right-area">
        <div>
            <form action="editDailyRecordView.do" id="record" name="record" method="post" enctype="multipart/form-data">
            	<span class="pSubject">My Record</span>
                <input type="hidden" name="dr_no" id="dr_no" value="${dr.dr_no }">
                <input type="hidden" name="dr_thumbnail" value="${dr.dr_thumbnail }">
                <table cellpadding="6px"> 
                    <tr>
                        <td>Date</td>
                        <td>
                        	${dr.dr_date }
                        	<input type="hidden" name="dr_date" value="${dr.dr_date }">
                        </td>
                    </tr>
                    <tr>
                        <td>Weather</td>
                        <td class="b-flex weather-area">
                            <img class="icons_" src="resources/images/icons/${dr.dr_weather }.png">
                        </td>
                        <input type="hidden" name="dr_weather" id="dr_weather" value="${dr.dr_weather }">
                    </tr>
                    <tr>
                        <td>Emotion</td>
                        <td class="b-flex emotion-area">
                            <img class="icons_" src="resources/images/icons/${dr.dr_emotion }.png">
                        </td>
                        <input type="hidden" name="dr_emotion" id="dr_emotion" value="${dr.dr_emotion }">
                    </tr>
                    <tr>
                        <td>Title</td>
                        <td>${dr.dr_title }
                        	<input type="hidden" name="dr_title" value="${dr.dr_title }">
                        </td>
                    </tr>
                    <tr>
                        <td class="content">Content</td>
                        <td>
                        	<textarea class="b-content" name="dr_con" readonly>${dr.dr_con }</textarea>
                        </td>
                    </tr>
                   	<c:if test= "${!empty drplist }">
	                    <tr>
	                    	<td class="photos">Photos</td>
	                    	<td>
	                    		<c:if test = "${!empty drplist }">
			                    	<div class="photos-area">
			                       		<div class="photos-wrap">
				                        	<c:forEach var="drp" items="${drplist }">
				                       			<img class="drp_item" data-toggle="modal" data-target="#myModal" src="resources/druploadFiles/${drp.drp_rename }">
				                       			<input type="hidden" name="drp_no" value="${drp.drp_no }">
				                       			<input type="hidden" name="drp_rename" value="${drp.drp_rename }">
				                        	</c:forEach>
			                       		</div>
		                       		</div>
	                       		</c:if>
	                    	</td>
	                    </tr>
                    </c:if>
                </table>
                <div class="button-area">
                    <button type="button" onclick="location.href='dailyRecordView.do'">Back</button>
                    <button type="button" onclick="editDailyRecordView()">Edit</button>
                    <button type="button" onclick="deleteDailyRecord()">Delete</button>
                </div>
            </form>
        </div>
    </div>
    
    <!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-body">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <div><img class="origin-photo"></img></div>
	      </div>
	    </div>
	  </div>
  	</div>


    <script>
    
    	$(".drp_item").on("click", function(){
    		
    		// get the src of the image
    	       var image_src = $(this).attr('src');

    			console.log("image_src : " + image_src);
    	       // assign it to the modal's body
    	      $(".origin-photo").attr('src',image_src);
    	      
    	      
    		
    	})
    
    	function editDailyRecordView() {
    		
    		$("#record").submit();
    		
    	}
    	
    	function deleteDailyRecord() {
    		
    		var dr_no = $("#dr_no").val();
    		
    		if(!confirm('삭제하시겠습니까?')){
				return false;
			}else {
    			location.href='deleteDailyRecord.do?dr_no='+ dr_no;
			}
    	}
    
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>













