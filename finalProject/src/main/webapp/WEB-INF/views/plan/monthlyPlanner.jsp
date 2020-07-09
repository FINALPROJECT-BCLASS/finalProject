<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link href='resources/lib/main.css' rel='stylesheet' />
    <script src='resources/lib/main.js'></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
            initialDate: new Date,
            editable: true,
            selectable: true,
            businessHours: true,
            dayMaxEvents: true, // allow "more" link when too many events
            events: [
                {
                title: 'All Day Event',
                start: '2020-06-01'
                },
                {
                title: 'Long Event',
                start: '2020-06-07',
                end: '2020-06-10'
                },
                {
                groupId: 999,
                title: 'Repeating Event',
                start: '2020-06-09T16:00:00'
                },
                {
                groupId: 999,
                title: 'Repeating Event',
                start: '2020-06-16T16:00:00'
                },
                {
                title: 'Conference',
                start: '2020-06-11',
                end: '2020-06-13'
                },
                {
                title: 'Meeting',
                start: '2020-06-12T10:30:00',
                end: '2020-06-12T12:30:00'
                },
                {
                title: 'Lunch',
                start: '2020-06-12T12:00:00'
                },
                {
                title: 'Meeting',
                start: '2020-06-12T14:30:00'
                },
                {
                title: 'Happy Hour',
                start: '2020-06-12T17:30:00'
                },
                {
                title: 'Dinner',
                start: '2020-06-12T20:00:00'
                },
                {
                title: 'Birthday Party',
                start: '2020-06-13T07:00:00'
                },
                {
                title: 'Click for Google',
                url: 'http://google.com/',
                start: '2020-06-28'
                }
            ]
            });

            calendar.render();
        });
    </script> -->
    <title>Document</title>
    <script type="text/javascript" src="${contextPath }resources/js/jquery-3.4.1.min.js"></script>
    <style>
        #listTable{
            margin-top: 5px;
        }

        #listTable td{
            border: 1px solid;
            border-color: rgba(72, 72, 72, 1);
            text-align: center;
        }

        .listNo{
            width: 25px;
        }

        .listContent{
            width: 130px;
        }

        .listCheck{
            width: 20px;
        }

        .listInput{
            width: 100%;
        }

        #circle{
            width: 25px;
            height : 26px;
            background-color: #FBD14B;
            border-radius: 50%;
            display: inline-block;
        }

        #circleArea{
            width: 150px;
            display: flex;
            align-items: center;
        }

        #listLogo{
            margin-left: -15px;
            padding-top: 7px;
            font-size: 16px;
            color: rgba(72, 72, 72, 1);;
        }

        .col-md-8, .col-md-2 {
            position: inherit !important;
        }

        .modal-content{
            width: 400px;
        }

        #addTable td{
            padding: 5px;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
            /* z-index: 0; */
        }

        .fc-today-button{
            display: none !important;
        }
    </style>
</head>
<link rel="stylesheet" href="resources/css/navi.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/leftNavi.css">


<body>
    <jsp:include page="../common/header.jsp"/>

    <section>

		<jsp:include page="../common/sidenavi.jsp"/>
        
        <br><br>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <button class="default-btn" type="button" data-toggle="modal" data-target="#addModal">Add</button>
                <div class="modal fade" id="addModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                            </div>
                            <div class="modal-body" align="center">
                                <form>
                                    <table id="addTable">
                                        <tr>
                                            <td><b>Title</b></td>
                                            <td><input type="text" name="planTitle"></td>
                                        </tr>
                                        <tr>
                                            <td><b>Date</b></td>
                                            <td>
                                                <input type="date" name="planStart"> - 
                                                <input type="date" name="planEnd">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Time</b></td>
                                            <td><input type="time" name="planTime"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>Location</b>&nbsp;<button type="button">Search</button></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>Memo</b></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <textarea cols="30" rows="5"></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                    <button type="submit">Add</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div id='calendar'></div> -->
            </div>
            <div class="col-md-2">
                <div id="circleArea">
                    <div id="circle"></div>
                    <b id="listLogo">To do List</b>&nbsp;&nbsp;&nbsp;
                    <input type="button" value="Save">
                </div>
                <table id="listTable">
                    <tr>
                        <td class="listNo">1</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">2</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">3</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">4</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">5</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">6</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">7</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">8</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">9</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">10</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">11</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">12</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">13</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">14</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                    <tr>
                        <td class="listNo">15</td>
                        <td class="listContent"><input type="text" class="listInput" name="listContent"></td>
                        <td class="listCheck"><input type="checkbox"></td>
                    </tr>
                </table>
            </div>
        </div>
       <br><br><br><br><br>
    </section>

    <jsp:include page="../common/footer.jsp"/>	

    <script>
        // 로그인 서브 메뉴
        $(document).ready(function(){
        $(".l-login-area>div").click(function(){

            var submenu = $(this).children(".l-login-sub");
            var subdeco = $(this).children(".l-login-square");
            
             if(submenu.is(":visible")){
                submenu.slideUp();
                subdeco.toggleClass("l-hide");
            }else{
                submenu.slideDown();
                subdeco.toggleClass("l-hide");
            }

            });
        });
    </script>
    
</body>
</html>