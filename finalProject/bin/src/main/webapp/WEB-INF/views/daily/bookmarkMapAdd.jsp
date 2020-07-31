<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Bookmark</title>
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
            padding: 90px;
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

        .b-content-1 {
            display: block;
            resize: none; 
            border-style: none;
            border-radius: 8px;
            background: white;
            height: 100px;
            width: 500px;
            padding: 10px;
        }

        .b-content-2 {
            display: block;
            resize: none; 
            border-style: none;
            border-radius: 8px;
            background: white;
            height: 150px;
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
    	
    	.map-area {
            display: none;
        }

    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidenaviDaily.jsp"/>
    <div class="right-area">
        <div>
            <form action="#">
                <span class="pSubject">Add Bookmark</span>
                <table cellpadding="6px">
                    <tr>
                        <td>Title</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>Tell</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>Time</td>
                        <td><textarea class="b-content-1"></textarea></td>
                    </tr>
                    <tr>
                        <td>Content</td>
                        <td><textarea class="b-content-2"></textarea></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>
                            <input style="margin-bottom: 13px;" type="text">
                            <input style="width: 411px; margin-right: 5px;" type="text">
                            <button class="default-btn b-yell">Upload</button> 
						</td>
                    </tr>
                    <tr class="map-area">
                    	<td></td>
                    	<td></td>
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