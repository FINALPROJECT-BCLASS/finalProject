<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Record</title>
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

        input[type="radio"]:checked + label{
        background-color: #FBD14B;
        
    }
    
    .preview-wrap {
    	width: 100%;
   	    max-width: 580px;
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
    
    .preview-wrap > img {
    	height: 130px;
    	margin: 5px;
    	
    }
    
    .preview-wrap > div {
    	width: 100%;
    	text-align:center;
    }
    
    .photos {
    	vertical-align: top;
   	    padding-top: 14px;
    }
    
    .photos-wrap {
    	position: relative;
    	min-height: 50px;
   	    max-width: 580px;
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
    
     .photos-wrap > img {
    	height: 130px;
    	margin: 5px;
    	
    }
    
    .photos-wrap > div {
    	width: 100%;
    	text-align:center;
    }
    
    .img-item {
    	cursor: pointer;
    }
    
    .remove-item {
    	display: none;
    }
    
    .photo-reset-btn {
    	position: absolute;
	    right: 0;
	    bottom: 0;
	    border-radius: 50%;
	    background: #ffffff8c;
	    width: 30px !important;
	    height: 30px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    cursor: pointer;
    }
    
    .photo-reset-btn > span {
    	color: #484848;
    }
	
    </style>
    
    
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidenaviDaily.jsp"/>
    <div class="right-area">
        <div>
            <form action="editDailyRecord.do" id="record" name="record" method="post" enctype="multipart/form-data">
                <span class="pSubject">Edit My Record</span>
                <input type="hidden" name="dr_no" value="${dr.dr_no }">
                <input type="hidden" name="dr_thumbnail" value="${dr.dr_thumbnail }">
                <table cellpadding="6px">
                    <tr>
                        <td>Title</td>
                        <td><input type="text" id="dr_title" name="dr_title" maxlength="16" value="${dr.dr_title }" required></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><input type="date" id="dr_date" name="dr_date" value="${dr.dr_date }" required></td>
                    </tr>
                    <tr>
                        <td>Weather</td>
                        <td class="b-flex weather-area">
                                <input type="radio" id="sunny" name="weather" value="sunny" checked>
                                <label class="b-icons" for="sunny"><img src="resources/images/icons/sunny.png"></label>
                        
                                <input type="radio" id="rainy" name="weather" value="rainy">
                                <label class="b-icons" for="rainy"><img src="resources/images/icons/rainy.png"></label>
                          
                                <input type="radio" id="cloudy" for name="weather" value="cloudy">
                                <label class="b-icons" for="cloudy"><img src="resources/images/icons/cloudy.png"></label>
                            
                                <input type="radio" id="snowy" name="weather" value="snowy">
                                <label class="b-icons" for="snowy"><img src="resources/images/icons/snowy.png"></label>
                        </td>
                        <input type="hidden" name="dr_weather" id="dr_weather" value="${dr.dr_weather }">
                    </tr>
                    <tr>
                        <td>Emotion</td>
                        <td class="b-flex emotion-area">
                            <input type="radio" id="love" name="emotion" value="love" checked>
                            <label for="love" class="b-icons"><img src="resources/images/icons/love.png"></label>

                            <input type="radio" id="smile" name="emotion" value="smile">
                            <label for="smile" class="b-icons"><img src="resources/images/icons/smile.png"></label>

                            <input type="radio" id="soso" name="emotion" value="soso">
                            <label for="soso" class="b-icons"><img src="resources/images/icons/soso.png"></label>

                            <input type="radio" id="bad" name="emotion" value="bad">
                            <label for="bad" class="b-icons"><img src="resources/images/icons/bad.png"></label>

                            <input type="radio" id="sad" name="emotion" value="sad">
                            <label for="sad" class="b-icons"><img src="resources/images/icons/sad.png"></label>
                        </td>
                        <input type="hidden" name="dr_emotion" id="dr_emotion" value="${dr.dr_emotion }">
                    </tr>
                    <tr>
                        <td>Content</td>
                        <td><textarea class="b-content" name="dr_con" maxlength="1300">${dr.dr_con }</textarea></td>
                    </tr>
                    <tr>
                        <td>Photos</td>
                        <td class="photos-area">
                    		<div class="photos-wrap">
                    			<div class="photo-reset-btn">
                    				<span class="material-icons">replay</span>
                    			</div>
                    		</div>
                    	</td>
                    </tr>
                    <tr>
                        <td>New Photos</td>
                        <td>
                          <div class="file-box"> 
                             <input type="file" id="file" name="file" multiple/> 
                             <input class="upload-name" value="Select file">
                             <label class="b-yell" for="file">Upload</label> 
                           </div>
                        </td>
                    </tr>
                    <tr>
                    	<td></td>
                    	<td class="preview-area">
                    		<div class="preview-wrap">
                    			<div>사진 미리보기</div>
                    		</div>
                    	</td>
                    </tr>
                </table>
                <div class="button-area">
                    <button type="button" onclick="history.go(-1)">Back</button>
                    <button type="button" onclick="submit_btn()">Save</button>
                </div>
                <input class="remove_no" type="hidden" name="remove_no">
                <input class="drp_left" type="hidden" name="drp_left">
            </form>
        </div>
    </div>

    <script>
    
    	$(document).ready(function(){
    		
	    	// 지우지 않은 파일들 번호 뽑아내기
	    	$('.left').each(function(){
	    		  var text = $(this).next().next().val();
	    		  console.log(text);
	    		  left_name.push(text);
	    		  
	  	  	});
	  	  	 
	  	    $(".drp_left").val(left_name); 
    		
    	});
    
    	/* 기존 이미지 추가 / 수정 / 삭제 작업 */
    
	    /* console.log("drp_rename : ${drp_rename}");
	    console.log("drp_no : ${drp_no}") */
    
	    var drpRenameSplit = "${drp_rename}".split(',');
	    var drpNoSplit = "${drp_no}".split(',');
	    
	    console.log("drpNoSplit : " + drpNoSplit);
	    
	    if(drpNoSplit != "") {
		    // 이미지 추가
		    for ( var i in drpRenameSplit ) {	
		     	$(".photos-wrap").append("<img class='img-item left' src='resources/druploadFiles/"+drpRenameSplit[i]+"'><input type='hidden' name='drp_no_all' value='"+drpNoSplit[i]+"'><input type='hidden' value='"+drpRenameSplit[i]+"'>");
		    }
		    
		}
	    
	    
	    var remove_no = new Array();
	    var left_name = new Array();
	    
	    // 이미지 클릭시 화면에서 삭제
	    $(".img-item").on("click", function(){
	    	
	    	left_name = []; // 배열 초기화
	    	
	    	$(this).addClass("remove-item");
	    	$(this).removeClass("left");
	    	
	    	var drp_no = $(this).next().val();
	    	remove_no.push(drp_no);
	    	
	    	$(".remove_no").val(remove_no);
	    	
	    	// 지우지 않은 파일들 번호 뽑아내기
	    	$('.left').each(function(){
	    		  var text = $(this).next().next().val();
	    		  console.log(text);
	    		  left_name.push(text);
	    		  
	  	  	});
	  	  	 
	  	    $(".drp_left").val(left_name); 
	    	
	    	
	    });
	 
	    
	    // 삭제된 이미지 되돌리기
	    $(".photo-reset-btn").on("click", function() {
	    	$(".img-item").addClass("left"); 
	    	$(".img-item").removeClass("remove-item");
	    	remove_no = [];
	    	$(".remove_no").val("");
	    	$(".drp_rename_b").val("");
	    });
	    
	    function submit_btn() {
	    	
	    	$(".remove_no").val(remove_no);
	    	
    		if($("#dr_title").val() == ""){
    			alert("제목을 입력해 주세요.");
    			$("#dr_title").focus();
    			return false;
    		}else if($("#dr_date").val() == ""){
    			alert("날짜를 등록해 주세요.");
    			$("#dr_date").focus();
    			return false;
    		}else{
	    	 	$("#record").submit();    			
    		}
	    }
	    
	    /* 저장된 데이터로 라디오 선택 */
	    
	    // 날씨
	    $("#${dr.dr_weather}").attr("checked", true);
	    
	    // 기분
	    $("#${dr.dr_emotion}").attr("checked", true);
	    
	    
	    /* 인풋 태그에 값 저장 */
    
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
        
        /* 파일 업로드 미리보기 / 삭제 */
        
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
    				var html = "<a href='javascript:void(0);' id='img_id_"+index+"'><img src='" + e.target.result + "' data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
    				$(".preview-wrap").append(html);
    				index++;
    			}
    			reader.readAsDataURL(f);
    			
    		});
        	
        }
        
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>













