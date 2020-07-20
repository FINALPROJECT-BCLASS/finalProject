<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookmark List</title>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/flickity/flickity.css">
<!-- JavaScript -->
<script src="resources/js/flickity/flickity.pkgd.min.js"></script>
<style>

        body {
            font-size: 14px;
            color: #484848;
            margin: 0;
            padding: 0;
        }

        .right-area {
        	display: flex;
            flex-direction: column;
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

        .group-img {
            width: 30px;
            height: 30px;
        }
        
        .clicked {
            border : 3px solid #c4c4c4;
        }


        /* content */

        .content {
        	margin: 0 auto;
            width: 100%;
            border-radius: 10px;
            background: white;
            display: block;
            margin-top: 30px;
            padding: 15px;
        }

        .content-area {
            float: left;
            display: flex;
            flex-direction: column;
        }

        .content-item {
            display: flex;
            vertical-align: center;
            padding:10px;
            height: 40px;
            margin-bottom: 10px;
            width: 260px;
            background-color: #f3f3f3;
            border-radius: 5px;
        }

        .time {
            height: 60px;
        }

        .comment {
            height: 130px;
            margin-bottom: 0;
        }

        textarea {
            border: 0px;
            resize: none !important;
            cursor: initial;
        }

        textarea:focus {
            outline: none;
        }
        
        /* color */
        .sky {
            background-color: #6B98FF !important;
        }

        .pink {
            background-color: #FFA3E5 !important;
        }

        .light-purple {
            background-color: #C9A8FF !important;
        }

        .green {
            background-color: #50c6b0 !important;
        }

        /* button */

        .button-area {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
            width: 100%;
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
        
        /* external css: flickity.css */

		* { box-sizing: border-box; }
		
		
		.carousel-cell {
		  width: 230px;
		  height: 100px !important;
		  margin-right: 10px;
		  background: #e9ecef;
		  border-radius: 8px !important;
		  counter-increment: carousel-cell;
		  cursor: pointer;
		}
		
		.flickity-page-dots {
			display: none;
		}


		.bar-info {
			width: 100%;
		    height: 100%;
		    padding: 18px;
		    position: absolute;
		    display: flex;
		    align-items: flex-start;
		    justify-content: center;
		    flex-direction: column;
		}
	 
		.bar-info > div:nth-child(1) {
			color: #484848;
			font-weight: 600;
			font-size: 20px;
			height: 20px;
		}
		
		.progress > div:nth-child(3) {
			position: absolute;
		    right: 0;
		    width: 50px;
		    height: 50px;
		    background: white;
		    border-radius: 50%;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    color: gray;
		    font-size: 17px;
		    font-weight: 700;
		    margin: 25px 20px;
		}
	       


    </style>
    </head>

    <body>
    	<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDaily.jsp"/>
        <div class="right-area">
            <span class="pSubject">Habit Tracker</span>
            <div class="carousel" data-flickity='{ "draggable": false }'>
	            <div class="progress carousel-cell clicked">
			  		<div class="progress-bar sky" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:70%;"></div>
		    		<div class="bar-info">
						<div>Drink Water</div>
						<div>1050 / 1500 ml</div>
					</div>
					<div>70%</div>
				</div>
				<div class="progress carousel-cell">
			  		<div class="progress-bar pink" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:70%;"></div>
		    		<div class="bar-info">
						<div>Drink Water</div>
						<div>1050 / 1500 ml</div>
					</div>
					<div>70%</div>
				</div>
				<div class="progress carousel-cell">
			  		<div class="progress-bar b-yell" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:70%;"></div>
		    		<div class="bar-info">
						<div>Drink Water</div>
						<div>1050 / 1500 ml</div>
					</div>
					<div>70%</div>
				</div>
				<div class="carousel-cell"></div>
				<div class="carousel-cell"></div>
				<div class="carousel-cell"></div>
			</div>
       
            
            <!-- Button Start-->
            <div class="button-area">
                <button>Edit</button>
                <button>Delete</button>
                <button>Add</button>
            </div>
            <!-- Button End-->

    
            <div class="content">
                <div class="content-area">
                    
                </div>
            </div>
            <!-- Button Start-->
            <div class="button-area">
                <button class="blue">Graph >></button>
            </div>
            <!-- Button End-->
            
            

        </div>
		
		<script>



        </script>
        <jsp:include page="../common/footer.jsp"/>
    </body>
</html> 