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
            height: 100%;
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

        
        input[type=text] {
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
                        <td>Content</td>
                        <td><textarea class="b-content"></textarea></td>
                    </tr>
                    <tr>
                        <td>Url</td>
                        <td><input type="text"></td>
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