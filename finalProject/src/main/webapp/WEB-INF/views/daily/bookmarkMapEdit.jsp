<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Bookmark Map</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        
        form {
        	display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
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
        
        table {
       	    width: 80%;
        }

        tr > td:nth-child(1) {
        	width: 5%;
            color: #484848;
            text-align: left;
            font-weight: 600;
            font-size: 16px;
        }

        tr > td:nth-child(2) {
            color: #484848;
		    text-align: left;
		    padding-left: 46px;
	        width: 80%;
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
            width: 100%;
            padding: 10px;
        }

        .b-content-1 {
            display: block;
            resize: none; 
            border-style: none;
            border-radius: 8px;
            background: white;
            height: 100px;
            width: 100%;
            padding: 10px;
        }

        .b-content-2 {
            display: block;
            resize: none; 
            border-style: none;
            border-radius: 8px;
            background: white;
            height: 150px;
            width: 100%;
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
    		right: 0;
    		margin-right: -12px;
   		    margin-top: 10px;
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
        
        input::placeholder {
		  color: #cecece;
		  font-size: 13px;
		}
		
		textarea::placeholder {
		  color: #cecece;
		  font-size: 13px;
		}
		
		
		.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;width:100%;height:400px; margin-top: 25px;}
		#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
		.bg_white {background:#fff;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}  
		#menu_wrap .option button {margin-left:5px;}
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}
		
		.searchPlace {
		font-size:13px;
		display: block;
    	float: right;
		}
		
		.map-btn {
			width: 100% !important;
		    height: 34px;
		    margin-top: 5px;
		}
		
		
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidenaviDaily.jsp"/>
    <div class="right-area">
       <div style="width: 70%;">
            <form id="updateMap" action="editBookmarkMap.do">
                <span class="pSubject">Add Map</span>
               	<input type="hidden" id="mb_no" name="mb_no" value="${bmMap.mb_no }">
                <input type="hidden" id="bl_no" name="bl_no" value="${bmMap.bl_no }">
                <table cellpadding="6px">
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="mb_title" id="mb_title" maxlength="16" placeholder="저장할 장소의 이름을 입력해 주세요." required value="${bmMap.mb_title }"></td>
                    </tr>
                    <tr>
                        <td>Tell</td>
                        <td><input type="text" name="mb_phone" id="mb_phone" maxlength="16" placeholder="전화번호를 입력해 주세요." value="${bmMap.mb_phone }"></td>
                    </tr>
                    <tr>
                        <td>Time</td>
                        <td><textarea class="b-content-1" name="mb_time" id="mb_time" maxlength="160" placeholder="운영 시간을 입력해 주세요.">${bmMap.mb_time }</textarea></td>
                    </tr>
                    <tr>
                        <td>Memo</td>
                        <td><textarea class="b-content-2" name="mb_memo" maxlength="160" id="mb_memo">${bmMap.mb_memo}</textarea></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>
                        	<input type="hidden" name="postcode" id="postcode" style="margin-bottom: 13px;" >
                            <input type="text" name="mainAddress" id="mainAddress" style="margin-bottom: 13px;" required>
                            <input type="text" name="subAddress" id="subAddress" style="margin-right: 5px; width: 74%;" >
                            <button type="button" class="default-btn b-yell" onclick="searchAddress();">Search</button><br> 
                          
						</td>
                    </tr>
                    <tr class="map-area">
                    	<td colspan="2"><!-- <div id="map" style="width:100%;height:300px;"></div> -->
                    		
                    	</td>
                    </tr>
                </table>
            </form>
              <a class="searchPlace blue">* 위치 검색</a>
           	<div class="map_wrap">
	    		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	
	    		<div id="menu_wrap" class="bg_white">
		    		<div class="option">
		        		<div>
	                		<form onsubmit="searchPlaces(); return false;">
	                    		<input type="text" value="" id="keyword" size="15"> 
	                    		<button type="submit" class="default-btn map-btn">Search</button> 
	                		</form>
		        		</div>
		    		</div>
		        	<ul id="placesList"></ul>
		        	<div id="pagination"></div>
		    	</div>
			</div>
			<div class="button-area">
            <button type="button" onclick="history.go(-1)">Back</button>
            <button type="button" onclick="updateMap();">Edit</button>
        </div>
        </div>
        
	</div>
    						


<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5165e87a2b10b900ab474145bc13247&libraries=services"></script>

    <script>
   
    	
    	var add = "${bmMap.mb_address}";
		var address = add.split("_");
    	
		$("#mainAddress").val(address[0]);
		$("#subAddress").val(address[1]);
		
		$("#keyword").val(address[0]);
		
    
    	function updateMap() {
    		
    		$("#updateMap").submit();
    		
    	}
    
    
	    function searchAddress() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = '(' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("subAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("subAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("mainAddress").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("subAddress").focus();
	                
	                

	                
	            }
	        }).open();
	    }
	    
	    
	    // 장소 검색
	    var markers = [];

	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	        mapOption = {
	            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };  

	    // 지도를 생성합니다    
	    var map = new kakao.maps.Map(mapContainer, mapOption); 

	    // 장소 검색 객체를 생성합니다
	    var ps = new kakao.maps.services.Places();  

	    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	    // 키워드로 장소를 검색합니다
	    searchPlaces();

	    // 키워드 검색을 요청하는 함수입니다
	    function searchPlaces() {

	        var keyword = document.getElementById('keyword').value;

	        if (!keyword.replace(/^\s+|\s+$/g, '')) {
	            return false;
	        }

	        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	        ps.keywordSearch( keyword, placesSearchCB); 
	    }

	    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	    function placesSearchCB(data, status, pagination) {

	        if (status === kakao.maps.services.Status.OK) {
				
	            // 정상적으로 검색이 완료됐으면
	            // 검색 목록과 마커를 표출합니다
	            displayPlaces(data);

	            // 페이지 번호를 표출합니다
	            displayPagination(pagination);

	        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

	            alert('검색 결과가 존재하지 않습니다.');
	            return;

	        } else if (status === kakao.maps.services.Status.ERROR) {

	            alert('검색 결과 중 오류가 발생했습니다.');
	            return;

	        }
	    }

	    // 검색 결과 목록과 마커를 표출하는 함수입니다
	    function displayPlaces(places) {

	        var listEl = document.getElementById('placesList'), 
	        menuEl = document.getElementById('menu_wrap'),
	        fragment = document.createDocumentFragment(), 
	        bounds = new kakao.maps.LatLngBounds(), 
	        listStr = '';
	        
	        // 검색 결과 목록에 추가된 항목들을 제거합니다
	        removeAllChildNods(listEl);

	        // 지도에 표시되고 있는 마커를 제거합니다
	        removeMarker();
	        
	        for ( var i=0; i<places.length; i++ ) {
	            // 마커를 생성하고 지도에 표시합니다
	            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	                marker = addMarker(placePosition, i), 
	                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				/* console.log("places: " + places[i].address_name); */
	            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	            // LatLngBounds 객체에 좌표를 추가합니다
	            bounds.extend(placePosition);

	            // 마커와 검색결과 항목에 mouseover 했을때
	            // 해당 장소에 인포윈도우에 장소명을 표시합니다
	            // mouseout 했을 때는 인포윈도우를 닫습니다
	            (function(marker, title) {
	                kakao.maps.event.addListener(marker, 'click', function() {
	                    displayInfowindow(marker, title);
	                });

	                kakao.maps.event.addListener(marker, 'click', function() {
	                    infowindow.close();
	                });

	                itemEl.onclick =  function () {
	                    displayInfowindow(marker, title);
	                };

	                /* itemEl.onmouseout =  function () {
	                    infowindow.close();
	                }; */
	            })(marker, places[i]);//ㅗ

	            fragment.appendChild(itemEl);
	        }

	        // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	        listEl.appendChild(fragment);
	        menuEl.scrollTop = 0;

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    }

	    // 검색결과 항목을 Element로 반환하는 함수입니다
	    function getListItem(index, places) {

	        var el = document.createElement('li'),
	        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                    '<div class="info">' +
	                    '   <h5>' + places.place_name + '</h5>';

	        if (places.road_address_name) {
	            itemStr += '    <span>' + places.road_address_name + '</span>' +
	                        '   <span class="jibun gray">' +  places.address_name  + '</span>';
	        } else {
	            itemStr += '    <span>' +  places.address_name  + '</span>'; 
	        }
	                     
	          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                    '</div>';           

	        el.innerHTML = itemStr;
	        el.className = 'item';

	        return el;
	    }

	    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	    function addMarker(position, idx, title) {
	        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	            imgOptions =  {
	                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	            },
	            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	                marker = new kakao.maps.Marker({
	                position: position, // 마커의 위치
	                image: markerImage 
	            });

	        marker.setMap(map); // 지도 위에 마커를 표출합니다
	        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	        return marker;
	    }

	    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
	    function removeMarker() {
	        for ( var i = 0; i < markers.length; i++ ) {
	            markers[i].setMap(null);
	        }   
	        markers = [];
	    }

	    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	    function displayPagination(pagination) {
	        var paginationEl = document.getElementById('pagination'),
	            fragment = document.createDocumentFragment(),
	            i; 

	        // 기존에 추가된 페이지번호를 삭제합니다
	        while (paginationEl.hasChildNodes()) {
	            paginationEl.removeChild (paginationEl.lastChild);
	        }

	        for (i=1; i<=pagination.last; i++) {
	            var el = document.createElement('a');
	            el.href = "#";
	            el.innerHTML = i;

	            if (i===pagination.current) {
	                el.className = 'on';
	            } else {
	                el.onclick = (function(i) {
	                    return function() {
	                        pagination.gotoPage(i);
	                    }
	                })(i);
	            }

	            fragment.appendChild(el);
	        }
	        paginationEl.appendChild(fragment);
	    }

	    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	    // 인포윈도우에 장소명을 표시합니다
	    function displayInfowindow(marker, title) {
	        var content = '<div style="padding:5px;z-index:1;">' + title.place_name + '</div>';
			
	        $("#mainAddress").val(title.address_name);
	        $("#subAddress").val(title.place_name);
	        $("#mb_phone").val(title.phone);
	        
	        
	        infowindow.setContent(content);
	        infowindow.open(map, marker);
	    }

	     // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	    function removeAllChildNods(el) {   
	        while (el.hasChildNodes()) {
	            el.removeChild (el.lastChild);
	        }
	    }
	  
       
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>