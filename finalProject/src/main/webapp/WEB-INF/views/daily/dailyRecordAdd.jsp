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
            height: 125%;
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

    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidenaviDaily.jsp"/>
    <div class="right-area">
        <div>
            <form action="#">
                <span class="pSubject">New Record</span>
                <table cellpadding="6px">
                    <tr>
                        <td>Title</td>
                        <td><input type="text" id="id"></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><input type="date" id="name"></td>
                    </tr>
                    <tr>
                        <td>Weather</td>
                        <td class="b-flex">
                                <input type="radio" id="sunny" name="weather" checked>
                                <label class="b-icons" for="sunny"><img src="resources/images/icons/sunny.png"></label>
                        
                                <input type="radio" id="rainy" name="weather">
                                <label class="b-icons" for="rainy"><img src="resources/images/icons/rainy.png"></label>
                          
                                <input type="radio" id="cloudy" for name="weather">
                                <label class="b-icons" for="cloudy"><img src="resources/images/icons/cloudy.png"></label>
                            
                                <input type="radio" id="snowy" name="weather">
                                <label class="b-icons" for="snowy"><img src="resources/images/icons/snowy.png"></label>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>Emotion</td>
                        <td class="b-flex">
                            <input type="radio" id="love" name="emotion" checked>
                            <label for="love" class="b-icons"><img src="resources/images/icons/love.png"></label>

                            <input type="radio" id="smile" name="emotion">
                            <label for="smile" class="b-icons"><img src="resources/images/icons/smile.png"></label>

                            <input type="radio" id="soso" name="emotion">
                            <label for="soso" class="b-icons"><img src="resources/images/icons/soso.png"></label>

                            <input type="radio" id="bad" name="emotion">
                            <label for="bad" class="b-icons"><img src="resources/images/icons/bad.png"></label>

                            <input type="radio" id="sad" name="emotion">
                            <label for="sad" class="b-icons"><img src="resources/images/icons/sad.png"></label>

                        </td>
                    </tr>
                    <tr>
                        <td>Content</td>
                        <td><textarea class="b-content"></textarea></td>
                    </tr>
                    <tr>
                        <td>Photos</td>
                        <td>
                          <div class="file-box"> 
                             <input type="file" id="file"> 
                             <input class="upload-name" value="Select file">
                             <label class="b-yell" for="file">Upload</label> 
                           </div></td>
                    </tr>
                </table>
                <div class="button-area">
                    <button>Back</button>
                    <button>Save</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        
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
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>