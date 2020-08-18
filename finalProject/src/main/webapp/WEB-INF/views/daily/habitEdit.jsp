<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Habit</title>
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
            padding: 70px;
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
            height: 52px;
        }
        
        input[type=text],
        input[type="date"] {
            border-style: none;
            border-radius: 8px;
            background: white;
            color: #484848;
            height: 40px;
            width: 350px;
            padding: 10px;
        }

        .b-content {
            display: block;
            resize: none; 
            border-style: none;
            border-radius: 8px;
            background: white;
            color: #484848;
            height: 100px;
            width: 350px;
            padding: 10px;
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

        /* period part */

        select {
            position: relative;
            border-style: none;
            border-radius: 8px;
            background: white;
            height: 40px;
            width: 350px;
            padding: 0px;
            padding-left: 10px;
            color: #484848;
            -webkit-appearance: none;
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
        
        input::placeholder {
		  color: #cecece;
		  font-size: 13px;
		}
       
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidenaviDaily.jsp"/>
    <div class="right-area">
        <div>
            <form action="updateHabit.do" method="post">
                <span class="pSubject">Edit Habit</span>
                <table cellpadding="6px">
                	<input type="hidden" id="ht_no" name="ht_no" value="${habit.ht_no }">
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="ht_title" maxlength="16" value="${habit.ht_title }" required></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td class="type b-flex">
                            <input type="radio" name="type" id="count" value="count">
                            <label class="b-check" for="count"><div class="b-white"></div>&nbsp;Count</label>
                            <input type="radio" name="type" id="check" value="check">
                            <label class="b-check" for="check"><div class="b-white"></div>&nbsp;Check</label>
                        </td>
                        <input type="hidden" id="h-type" name="ht_type" value="count">
                    </tr>
                    <tr>
                        <td>Goal</td>
                        <td><input type="text" name="ht_goal" placeholder="목표치를 숫자로 입력하세요. ex. 10, 20, 1000" value="${habit.ht_goal }" maxlength="16" required></td>
                    </tr>
                    <tr>
                        <td>Unit</td>
                        <td><input type="text" name="ht_unit" placeholder="단위를 입력하세요. ex. 권, 번, ml, L" value="${habit.ht_unit }" maxlength="16" required></td>
                    </tr>
                    <tr>
                        <td>Period</td>
                        <td>
                            <div style="position:relative; width:350px">
                                <select name="ht_cycle">
                                    <option class="Daily" value="Daily">Daily</option>
                                    <option class="Weekly" value="Weekly">Weekly</option>
                                    <option class="Monthly" value="Monthly">Monthly</option>
                                </select>
                                <div class="select-arrow"></div>
                            </div>
                        </td>
                    </tr>
                    <tr> 
                        <td>Default Count</td>
                        <td><input name="ht_amount" id="d-count" type="text" value="1" maxlength="16" value="${habit.ht_amount }"></td>
                    </tr>
                    <tr>
                        <td>Color</td>
                        <td class="color b-flex">
                            <input type="radio" name="color" id="yellow" value="#FBD14B" checked>
                            <label class="b-icons" for="yellow"><div class="b-yell"></div></label>
                            <input type="radio" name="color" id="pink" value="#FFA3E5" >
                            <label class="b-icons" for="pink" ><div class="pink"></div></label>
                            <input type="radio" name="color" id="purple" value="#C9A8FF">
                            <label class="b-icons" for="purple"><div class="light-purple"></div></label>
                            <input type="radio" name="color" id="blue" value="#6B98FF">
                            <label class="b-icons" for="blue" ><div class="sky"></div></label>
                            <input type="radio" name="color" id="green" value="#50c6b0">
                            <label class="b-icons" for="green"><div class="green"></div></label>
                        </td>
                        <input type="hidden" id="h-color" name="ht_color" value="${habit.ht_color }">
                    </tr>
                    <tr>
                        <td>Comment</td>
                        <td><textarea name="ht_con" class="b-content" maxlength="160">${habit.ht_con }</textarea></td>
                    </tr>

                </table>
                <div class="button-area">
                    <button type="button" onclick = "history.go(-1)">Back</button>
                    <button type="reset">Reset</button>
                    <button type="submit">Save</button>
                </div>
            </form>
        </div>
    </div>

    <script>
    	
    	$(document).ready(function() {
    		
  			/* var state = $('#select_ option:selected').val();
  			if ( state == 'Title' ) {
  				$("#title_a").show();
  				$("#date_a").hide();
  			} else {
  				$("#title_a").hide();
  				$("#date_a").show();
  			} */
  			
  			var cycle = "${habit.ht_cycle}";
  			console.log(cycle);
  			
  			if(cycle == "Daily") {
  				
  				$(".Daily").attr("selected", true);
  				
  			}else if(cycle == "Monthly") {
  				
  				$(".Monthly").attr("selected", true);
  			}else {
  				
  				$(".Weekly").attr("selected", true);
  			}
  			
    		
    		var type = "${habit.ht_type}";
    		var color = "${habit.ht_color}";
    		
    		// type
    		if(type == "count") {
    			$("#check").removeAttr("checked",true);
    			$("#count").attr("checked",true);
    			
    		}else if(type == "check") {
    			console.log("if조건");
    			$("#count").removeAttr("checked",true);
    			$("#check").attr("checked",true);
    		}
    		
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
    		
    		if($("#check").is(":checked")){
    			$("#d-count").attr("readonly", true);
    	    	$("#d-count").val(1);
    		}
    		
    		
    		// 타입 선택시 타이핑 막기
    		$("#check").click(function(){
    	    	$("#d-count").attr("readonly", true);
    	    	$("#d-count").val(1);
    		})
    		// 타입 선택시 타이핑 풀기
    		$("#count").click(function(){
    			$("#d-count").removeAttr("readonly", true);
    		})
    		
    		// 라디오 버튼 히든 태그
    		// 색상
    		$(".color > input").click(function(){
    			var value = $(this).val();
    			$("#h-color").val(value);
    		});
    		
    		// 타입
    		$(".type > input").click(function(){
    			var value = $(this).val();
    			$("#h-type").val(value);
    		});
    		
    		
    	})
    	
    	
    	
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>