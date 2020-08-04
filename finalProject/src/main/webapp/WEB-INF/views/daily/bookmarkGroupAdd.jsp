<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Bookmark Group</title>
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
	
        /* radio select */

        /* input[type="radio"] {
            display: none;
        } */

        /* input[type="radio"]:checked + label{
        background-color: #FBD14B;
        
        } */
	    </style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDaily.jsp"/>
	    <div class="right-area">
	        <div>
	            <form action="insertBookmark.do" method="post" enctype="multipart/form-data">
	                <span class="pSubject">Add Bookmark Group</span>
	                <table cellpadding="6px">
	                    <tr>
	                        <td>Title</td>
	                        <td><input type="text" name="bl_title"></td>
	                    </tr>
	                    <tr>
	                        <td>Type</td>
	                        <td>
	                            <input type="radio" name="bl_type" id="map" value="map">
	                            <label for="map">&nbsp; Map</label> &nbsp;&nbsp;
	                            <input type="radio" name="bl_type" id="url" value="url">
	                            <label for="url">&nbsp; Url</label>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>Content</td>
	                        <td><textarea class="b-content" name="bl_con"></textarea></td>
	                    </tr>
	                    <tr>
	                        <td>Image</td>
	                        <td>
	                            <div class=profile-image-area>
	                                <img class="profile-image" src="resources/images/icons/profile_white.png">
	                            </div>
	                            <div class="file-box"> 
	                                <input type="file" id="file" name="file" onchange="uploadPhoto(this);"> 
	                                <input class="upload-name" value="Select file">
	                                <label class="b-yell" for="file">Upload</label> 
	                            </div>
	                        </td>
	                    </tr>
	                </table>
	                <div class="button-area">
	                    <button type="button">Back</button>
	                    <button type="submit">Save</button>
	                </div>
	            </form>
	        </div>
	    </div>
	
	    <script>
	        
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