<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Bookmark Group</title>
</head>
	<style>
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
            height: 100%;
            width: 81%;
            background-color: #f7f7f7;
            color: #484848;
            text-align: center;
            padding: 50px;
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
            color: #484848;
            text-align: left;
            padding-left: 46px;
            width: 554px;
            display: flex;
   			align-items: center;
        }

        input[type="checkbox"] {
            position: absolute;
            /* opacity: 0; */
        }
        
        input[type=text],
        input[type="date"] {
            border-style: none;
            border-radius: 8px;
            background: white;
            color: #484848;
            height: 40px;
            width: 500px;
            padding: 10px;
        }

        .b-content {
            display: block;
            resize: none; 
            border-style: none;
            border-radius: 8px;
            background: white;
            height: 100px;
            width: 500px;
            padding: 10px;
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

        .b-icons > img {
            width: 35px;
            height: 35px;
        }

        .b-flex {
            display: flex;
        }

        .button-area {
            display: flex;
            justify-content: flex-end;
            margin-top: 30px;
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
        
        label {
        	margin: 0 !important;
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
	
        /* 이미지 업로드 */
	
		.profile-image-area {
		    width: 50px;
		    height: 50px;
		    border-radius: 50%;
		    overflow: hidden;
		    margin-right: 10px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		.profile-image {
		    height: 135%;
		}
		
		.filebox {
			display: inline-block;
		}
		
		.filebox input[type="file"] {
		    position: absolute;
		    width: 0;
		    height: 0;
		    padding: 0;
		    overflow: hidden;
		    border: 0;
		}
		
		.filebox label {
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
	
		/* named upload */
		.filebox .upload-name {
			display: inline-block;
		    vertical-align: middle;
		    width: 164px;
		    height: 40px;
		    font-size: 13px;
		    padding: 0 10px;
		    border: 0;
		    border-radius: 8px;
		    margin-right: 5px;
		    background-color: white;
		}
	
        label{
            margin:0 !important;
        }

                /* radio select */

        input[type="radio"] {
            display: none;
        }

        input[type="radio"]:checked + .b-icons>div{
            border: 3px solid #484848;
        }

        input[type="radio"]:checked + .b-check>div{
            border: 3px solid white;
            background-color: #2860E1;
        }
        

        .b-icons {
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            width: 25px;
            height: 25px;
            margin-bottom: 0;
            margin-right: 10px !important;
            cursor: pointer;
        }

        .b-icons > div {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            vertical-align: middle;
            text-align: center;
        }
        
        .b-check {
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin-bottom: 0;
            margin-right: 10px !important;
            cursor: pointer;
        }

        .b-check > div {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            vertical-align: middle;
            text-align: center;
        }

        .b-flex {
            display: flex;
            align-items: center;
        }
        
        /* color */
        .sky {
            background-color: #6B98FF;
        }

        .pink {
            background-color: #FFA3E5;
        }

        .light-purple {
            background-color: #C9A8FF;
        }

        .green {
            background-color: #50c6b0;
        }
        
        .t-icons {
        	margin: 0 !important;
        	
        }
        
        .t-icons > div {
        	width: 15px;
		    height: 15px;
        }
        
        tr {
        	height: 40px;
        }
        
        
	    </style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDaily.jsp"/>
	    <div class="right-area">
	        <div>
	            <form id="edit-bm" action="editBookmark.do" method="post" enctype="multipart/form-data">
	                <span class="pSubject">Edit Bookmark Group</span>
	                <input type="hidden" name="bl_type" value="${bm.bl_type }">
	                <input type="hidden" id="bl_no" name="bl_no" value="${bm.bl_no }">
	                <input type="hidden" name="bl_origin" value="${bm.bl_origin }">
	                <input type="hidden" name="bl_rename" value="${bm.bl_rename }">
	                <table cellpadding="6px">
	                    <tr>
	                        <td>Title</td>
	                        <td><input type="text" name="bl_title" value="${bm.bl_title }" required></td>
	                    </tr>
	                    <!-- <tr>
	                        <td>Type</td>
	                        <td class="color b-flex">
	                            <input type="radio" name="bl_type" id="map" value="map" checked>
	                            <label class="b-icons t-icons" for="map"><div class="b-blue"></div></label>
	                            <label for="map">MAP</label>
	                            <input type="radio" name="bl_type" id="url" value="url">
	                            <label class="b-icons t-icons" style="margin-left:8px !important;" for="url"><div class="b-blue"></div></label>
	                            <label for="url">URL</label>
	                        </td>
	                    </tr> -->
	                    <tr>
                        <td>Color</td>
                        <td class="color b-flex">
                            <input type="radio" name="bl_color" id="yellow" value="#FBD14B" checked>
                            <label class="b-icons" for="yellow"><div class="b-yell"></div></label>
                            <input type="radio" name="bl_color" id="pink" value="#FFA3E5" >
                            <label class="b-icons" for="pink" ><div class="pink"></div></label>
                            <input type="radio" name="bl_color" id="purple" value="#C9A8FF">
                            <label class="b-icons" for="purple"><div class="light-purple"></div></label>
                            <input type="radio" name="bl_color" id="blue" value="#6B98FF">
                            <label class="b-icons" for="blue" ><div class="sky"></div></label>
                            <input type="radio" name="bl_color" id="green" value="#50c6b0">
                            <label class="b-icons" for="green"><div class="green"></div></label>
                        </td>
                    </tr>
	                    <tr>
	                        <td>Content</td>
	                        <td><textarea class="b-content" name="bl_con" required>${bm.bl_con }</textarea></td>
	                    </tr>
	                    <tr>
	                        <td>Image</td>
	                        <td>
	                            <div class=profile-image-area>
	                            	<c:if test="${empty bm.bl_rename }">
	                                	<img class="profile-image" src="resources/images/icons/profile_default.png">
	                            	</c:if>
	                            	<c:if test="${!empty bm.bl_rename }">
	                                	<img class="profile-image" src="resources/bluploadFiles/${bm.bl_rename }">
	                            	</c:if>
	                            </div>
	                            <div class="file-box"> 
	                                <input type="file" id="file" name="file" onchange="uploadPhoto(this);"> 
	                                <c:if test="${empty bm.bl_origin }">
	                                	<input class="upload-name" value="Select file" readOnly>
	                                </c:if>
	                                <c:if test="${!empty bm.bl_origin }">
	                                	<input class="upload-name" value="${bm.bl_origin }" readOnly>
	                                </c:if>
	                                <label class="b-yell" for="file">Upload</label> 
	                            </div>
	                        </td>
	                    </tr>
	                </table>
	                <div class="button-area">
	                    <button type="button" onclick="history.go(-1)">Back</button>
	                    <button type="button" onclick="submit_bm()">Edit</button>
	                </div>
	            </form>
	        </div>
	    </div>
	
	    <script>
	    
	    function submit_bm() {
	    	
	    	$("#edit-bm").submit();
	    }
	    
	    $(document).ready(function() {
	    	
	    	var type = "${bm.bl_type}";
    		var color = "${bm.bl_color}";
    		
    		// type
    		if(type == "map") {
    			$("#url").removeAttr("checked",true);
    			$("#map").attr("checked",true);
    			
    		}else if(type == "url") {
    			$("#map").removeAttr("checked",true);
    			$("#url").attr("checked",true);
    		}
    		
    		// color
    		if(color == "#FBD14B"){
    			$("#yellow").attr("checked", true);
    		}else if(color == "#FFA3E5"){
    			$("#pink").attr("checked", true);
    		}else if(color == "#C9A8FF"){
    			$("#purple").attr("checked", true);
    		}else if(color == "#6B98FF"){
    			$("#blue").attr("checked", true);
    		}else if(color == "#50c6b0"){
    			$("#green").attr("checked", true);
    		}
	    	
	    	
	    	
	    })
	        
		/* 파일 업로드 */
	    
	    function uploadPhoto(value) {
	    	
			if(value.files && value.files[0]) {
				
				var reader = new FileReader();
			
				reader.onload = function(e) {
					
					$(".profile-image").attr("src", e.target.result);
					
					var filename = $("#file").val().split('/').pop().split('\\').pop();
					
					$(".upload-name").val("");
					$(".upload-name").val(filename);
				}
				
				reader.readAsDataURL(value.files[0]);
			}
	    }
	    </script>
	    <jsp:include page="../common/footer.jsp"/>
	</body>
	</html>