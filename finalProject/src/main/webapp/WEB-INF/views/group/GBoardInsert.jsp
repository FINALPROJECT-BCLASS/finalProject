<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    html, body { height:100%;}

    h1, h4{margin-top:20px; text-align:center;}
    
    textarea, input:focus {outline:none;}

    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 65px; width: 81%; background: #F3F3F3; }

    .groupJoin{width:900px; margin-left:-150px;}
    .groupTb{margin:auto; width:1000px; border-spacing: 5px; border-collapse: separate;}
    .groupTbTd {text-align:end;}

    input{width:100%;height:40px; padding-left: 10px; border:none; border-radius: 6px;}
    /* .search{border:1px solid grey; background:white; border:none; border-radius: 6px;}
    .searchImg{width:20px; height:20px;}
    #search{width:85%; border:none; }
    .searchName{width:80px; cursor: pointer; padding-left: 20px;padding-bottom: 10px; padding-top: 10px; display:inline-block;}
    /* .searchName:hover{background:#FBD14B;} */
    .oneSearchBox:hover{width:100%; cursor: pointer; background:#FBD14B;}
    .oneSearchBox{width:100%; cursor: pointer; }
    .searchNameAfter{background:white; border:none; border-radius: 6px; height:100px; color:darkgray; height:150px; width:600px; overflow:scroll;  overflow-x:hidden;} /* width 다시보기*/
    .searchNameBox{margin-bottom:20px; margin:5px; width:100px; height:30px; background:#FBD14B; border:none; border-radius: 5px; font-size:small;}
    .searchNameBox:hover{margin-bottom:20px; margin:5px; width:100px; height:30px; background:darkgray; border:none; border-radius: 5px; cursor:pointer;font-size:small;}
    .searchNameForm{display:none; height:100px; overflow:scroll;  overflow-x:hidden; }
    .deleteBtn{width:20px;height:30px; border-radius: 3px; background:red; border:none; text-align: center;} */
	
    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px;}

    #groupCon{width:100%; height:300px; border:none;  border-radius: 6px; margin-bottom:-10px;}
    .groupPhoto{width:100px; height: 100px;}

    .groubJoinBtn{text-align: center;}
    #submit{background:none; border:none; color:#2860E1; font-weight: 600; font-size: 20px; }
    #reset{background:none; border:none; color:#484848; font-weight: 600; font-size: 20px; width:100px;}

    tr > td:nth-child(1) {
            color: #484848;
            text-align: center;
            font-weight: 600;
            font-size: 16px;
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

  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>  
	
	
	<c:if test="${ groupTable.id eq gInfo.loginUserId}">
	<jsp:include page="../common/sidenaviGroupAdmin.jsp"/>
	</c:if>
	
	<c:if test="${ groupTable.id ne gInfo.loginUserId}">
	<jsp:include page="../common/sidenaviGroup.jsp"/>
	</c:if>
	
	
    <div class="join-form-area">
        <h1>Group Diary</h1>
        <h4 class="pSubject">Board Write</h4><br>
            <div class="groupJoin">
                <form action="boardInsert.do" method="post" id="boardInsertFrom" enctype="Multipart/form-data">
                    <table class="groupTb">
                        <tr>
                            <td class="groupTbTd">Title&nbsp;</td>
                            <td><input type="text" id="title" name="gbTitle" placeholder="  제목을 입력해주세요." required></td>
                        </tr>
                        <tr>
                            <td class="groupTbTd">Content&nbsp;</td>
                            <td>
                                <textarea id="groupCon" name='gbCon'></textarea>
                               
                            </td>
                        </tr>
                        <tr>
                        	<td>Photos</td>
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
                    			<div class="preview-text">사진 미리보기</div>
                    		</div>
                    	</td>
                  	  </tr>
                    </table>
                </form>
                <br><br>
                <div class="groubJoinBtn">
                   <span><button id="submit">Submit</button>&nbsp;</span>
                   <span><input type="reset" value="Reset" id="reset"></span>
                </div>
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
         
         
         <script>
         	
			// submit
			$("#submit").click(function(){
			
				if($("#title").val() == "" ){
					alert("제목을 입력해주세요.");
				}else if($("#groupCon").val() == ""){
					alert("내용을 입력해주세요.");
					} else{
						$("#boardInsertFrom").submit();
					}
				})
         </script>
         
        
         <jsp:include page="../common/footer.jsp"/>	
</body>
</html>