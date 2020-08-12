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
            color: #484848;
            text-align: left;
            padding-left: 46px;
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
    	outline: none;
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

    </style>
    
    
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidenaviDaily.jsp"/>
    <div class="right-area">
        <div>
            <form action="addDailyRecord.do" name="record" method="post" enctype="multipart/form-data">
            	<span class="pSubject">My Record : No.${dr.dr_no }</span>
                <input type="hidden" name="dr_no" value="${dr.dr_no }">
                <table cellpadding="6px">
                    <tr>
                        <td>Date</td>
                        <td>${dr.dr_date }</td>
                    </tr>
                    <tr>
                        <td>Weather</td>
                        <td class="b-flex weather-area">
                                <!-- <input type="radio" id="sunny" name="weather" value="sunny" checked>
                                <label class="b-icons" for="sunny"><img src="resources/images/icons/sunny.png"></label>
                        
                                <input type="radio" id="rainy" name="weather" value="rainy">
                                <label class="b-icons" for="rainy"><img src="resources/images/icons/rainy.png"></label>
                          
                                <input type="radio" id="cloudy" for name="weather" value="cloudy">
                                <label class="b-icons" for="cloudy"><img src="resources/images/icons/cloudy.png"></label> -->
                                
                            <img class="icons_" src="resources/images/icons/${dr.dr_weather }.png">
                        </td>
                        <input type="hidden" name="dr_weather" id="dr_weather" value="sunny">
                    </tr>
                    <tr>
                        <td>Emotion</td>
                        <td class="b-flex emotion-area">
                           	<!-- <input type="radio" id="love" name="emotion" value="love" checked>
                            <label for="love" class="b-icons"><img src="resources/images/icons/love.png"></label>

                            <input type="radio" id="smile" name="emotion" value="smile">
                            <label for="smile" class="b-icons"><img src="resources/images/icons/smile.png"></label>

                            <input type="radio" id="soso" name="emotion" value="soso">
                            <label for="soso" class="b-icons"><img src="resources/images/icons/soso.png"></label>

                            <input type="radio" id="bad" name="emotion" value="bad">
                            <label for="bad" class="b-icons"><img src="resources/images/icons/bad.png"></label>

                            <input type="radio" id="sad" name="emotion" value="sad"> -->
                            <img class="icons_" src="resources/images/icons/${dr.dr_emotion }.png">
                        </td>
                        <input type="hidden" name="dr_emotion" id="dr_emotion" value="love">
                    </tr>
                    <tr>
                        <td>Title</td>
                        <td>${dr.dr_title }</td>
                    </tr>
                    <tr>
                        <td class="content">Content</td>
                        <td>
                        	<textarea class="b-content" name="dr_con" readonly>${dr.dr_con }</textarea>
                        </td>
                    </tr>
                    <tr>
                    	<td class="photos">Photos</td>
                    	<td>
                    		<c:if test = "${!empty drplist }">
		                    	<div class="photos-area">
		                       		<div class="photos-wrap">
			                        	<c:forEach var="drp" items="${drplist }">
					                       			<img src="resources/druploadFiles/${drp.drp_rename }">
			                        	</c:forEach>
		                       		</div>
	                       		</div>
                       		</c:if>
                    	</td>
                    </tr>
                </table>
                <div class="button-area">
                    <button type="button" onclick="history.go(-1)" >Back</button>
                    <button type="button">Edit</button>
                    <button type="button">Delete</button>
                </div>
            </form>
        </div>
    </div>

    <script>
    
	 // 라디오 버튼 히든 태그
		// 색상
		$(".weather-area > input").click(function(){
			var value = $(this).val();
			$("#dr_weather").val(value);
		});
		
		// 타입
		$(".emotion-area > input").click(function(){
			var value = $(this).val();
			$("#dr_emotion").val(value);
		});
        
        /* 파일 업로드 */
        $(document).ready(function(){
        	
        	var fileTarget = $('#file');
        	
        	fileTarget.on('change', function(){
        		
        		if(window.FileReader){
        			var filename = $(this)[0].files[0].name;
        		} else { 
        			var filename = $(this).val().split('/').pop().split('\\').pop();
        		}
        		
        		$(this).siblings('.upload-name').val(filename);
        		
        		$(".upload-file").attr("style", "display:inline-block");
        		
        	});
        	
        });
        
        $(document).ready(function(){
        
			$("#file").on("change", handleImgFileSelect);
        	
        });
        
        function handleImgFileSelect(e) {
        	
        	// 이미지 정보 초기화
    		sel_files = [];
        	
        	/* $(".preview-text").empty(); */
    		$(".preview-wrap").empty();
    		
    		var files = e.target.files;
    		var filesArr = Array.prototype.slice.call(files);
    		
    		var index = 0;
    		
    		filesArr.forEach(function(f) {
    			if(!f.type.match("image.*")) {
    				
    				alert("이미지 확장자만 업로드 가능합니다.");
    				return;
    				
    			}
    			
    			sel_files.push(f);
    			
    			var reader = new FileReader();
    			reader.onload = function(e) {
    				var html = "<a href='javascript:void(0);' onclick= 'deleteImageAction("+index+")' id='img_id_"+index+"'><img src='" + e.target.result + "' data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
    				$(".preview-wrap").append(html);
    				index++;
    			}
    			reader.readAsDataURL(f);
    			
    		});
        	
        }
        
        function deleteImageAction(index) {
        	
        	console.log("index : " + index);
        	sel_files.splice(index, 1);
        	
        	var img_id = "#img_id_" + index;
        	$(img_id).remove();
        	
        	console.log(sel_files);
        	
        }
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>













