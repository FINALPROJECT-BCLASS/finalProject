<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        width: 200px;
        display: flex;
        align-items: center;
    }

    #listLogo{
        margin-left: -15px;
        padding-top: 7px;
        font-size: 16px;
        color: rgba(72, 72, 72, 1);;
    }
    
    #timeTable{
    	margin-top: 10px;
    }

    #timeTable td{
        border: 1px solid;
        border-color: rgba(72, 72, 72, 1);
    }

    .time{
        width: 100px;
        background-color: #F3F3F3;
    }

    .timeContent{
        width: 750px;
    }

    .col-md-8, .col-md-2 {
        position: inherit !important;
    }

    #listArea{
        display: inline-block;
        /* position: fixed; */
        z-index: 0;
    }

    .modal-content{
        width: 350px !important;
    }

    #addTable td{
        padding: 5px;
    }

    #addBtnArea{
        display: inline-block;
        width: 580px;
        text-align: right;
    }
    
    .listInput{
    	border: none;
    }
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <section>

		<jsp:include page="../common/sidenavi.jsp"/>
        
        <br><br>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <a href="#" style="font-size: 30px; text-decoration: none; color: #2860E1"><</a>&nbsp;
                <span style="font-size: 30px;">2020.07.05</span>&nbsp;
                <a href="#" style="font-size: 30px; text-decoration: none; color: #2860E1">></a>
                &nbsp;<button type="button" class="default-btn">Select</button>
                <div id="addBtnArea">
                    <button type="button" class="default-btn" data-toggle="modal" data-target="#addModal">Add</button>
                </div>
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
                                            <td>
                                            	<input type="text" name="planTitle" size="30">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Date</b></td>
                                            <td>
                                            	<input type="date" name="planDate" style="width: 250px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Time</b></td>
                                            <td>
                                                <input type="time" name="planStart"> - 
                                                <input type="time" name="planEnd">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>Memo</b></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <textarea cols="40" rows="5"></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                    <button type="submit" class="default-btn">Add</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <table id="timeTable">
                    <tr>
                        <td class="time">&nbsp;0:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;1:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;2:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;3:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;4:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;5:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;6:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;7:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;8:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;8:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;10:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;11:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;12:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;13:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;14:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;15:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;16:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;17:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;18:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;19:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;20:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;21:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;22:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;23:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;24:00</td>
                        <td class="timeContent"></td>
                    </tr>
                    <tr>
                        <td class="time">&nbsp;</td>
                        <td class="timeContent"></td>
                    </tr>
                </table>
            </div>
            <!-- <div id="listArea"> -->
                <div class="col-md-2 fixed-bottom">
                    <div id="circleArea">
                        <div id="circle"></div>
                        <b id="listLogo">To do List</b>&nbsp;&nbsp;&nbsp;
                        <button type="button" class="default-btn">Save</button>
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
                    </table>
                </div>
            <!-- </div> -->
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