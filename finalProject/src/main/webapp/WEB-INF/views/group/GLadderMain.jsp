<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="import" href="http://www.polymer-project.org/components/paper-ripple/paper-ripple.html">
    <link rel="stylesheet" type="text/css" href="resources/css/ladder/style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/ladder/meterial.css">
    <script src="resources/js/ladder/jquery-2.1.3.min.js"></script>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<script language="javascript" type="text/javascript">
var Yl = {
 getEl : function(strId){
  if (document.getElementById) return document.getElementById(strId);
  if (document.all) return document.all[strId];
 }
 //div 리턴
 ,getDiv : function(sWidth, sHeight, sBgColor){
  var d = document.createElement("div");
  if(sWidth) d.style.width = sWidth;
  if(sHeight) d.style.height = sHeight;
  if(sBgColor) d.style.backgroundColor = sBgColor;
  d.style.position = "absolute";
  d.style.overflow = "hidden";  
  return d;
 }
 ,arrColor : [
  '#ffd571','#838383','#cee397','#d291bc','#c7b198'
  ,'#ffb6b6','#d8b9c3','#8f0197','#ffd3b6','#93b5e1'
  ,'#f7e7bd','#dddddd','#d9adad','#c3aed6','#848ccf'
  ,'#e0b800','#93b5e1','#0021b0','#92b7d7','#827397'
  ]  
 ,arrVerDiv : [] //수직 선 div
 ,arrHorDiv : [] //수평 선 div
 ,arrMovDiv : [] //이동 선 div
 
 ,arrIng : [] //진행여부 체크용
 ,arrMDiv : [] //이동선 배열 번호값 저장, 이동후 확인용
  
 ,nMaxWidth : 1000 //최고 넓이
 ,nWidth : 0 //사다리 넓이
 ,nHeight : 300 //사다리 높이
 
 ,nNum : 0
 
 ,arrTopDiv : [] //탑 div
 ,arrBotDiv : [] //아래 div
 ,arrGoDiv : [] //go 버튼 div
 
 ,init : function(){
  
  //갯수
  this.nNum = parseInt(this.getEl("sel_num").value);
  
  //넓이
  this.nWidth = parseInt(this.nMaxWidth/this.nNum);
        
  for(var i=0; i<this.nNum; i++){
 
   this.arrTopDiv[i] = this.getDiv(this.nWidth+"px", "50px", "");
   this.arrBotDiv[i] = this.getDiv(this.nWidth+"px", "50px", "");
   this.arrGoDiv[i] = this.getDiv(this.nWidth+"px", "50px", "");
                     
   this.arrTopDiv[i].style.left = (i*this.nWidth)+"px";
   this.arrTopDiv[i].style.top = "50px";
   
   
   this.arrBotDiv[i].style.left = (i*this.nWidth)+"px";
   this.arrBotDiv[i].style.top = "410px";
   
   this.arrGoDiv[i].style.left = (i*this.nWidth)+"px";
   this.arrGoDiv[i].style.top = "50px";
   
   this.arrTopDiv[i].style.fontSize="12px";
   this.arrBotDiv[i].style.fontSize="12px";
   
   //this.arrTopDiv[i].style.border = "1px solid #CCCCCC";
   //this.arrBotDiv[i].style.border = "1px solid #CCCCCC";
   
   this.arrTopDiv[i].align = "center";
   this.arrBotDiv[i].align = "center";
   this.arrGoDiv[i].align = "center";
   this.arrTopDiv[i].innerHTML = (i+1)+'<br><input type="text" id="inp_top_'+i+'" class="noBottom" value="" style="width:90%" tabindex="'+(i+1)+'" />';
   this.arrBotDiv[i].innerHTML = '<input type="text" id="inp_bot_'+i+'" class="inp_bot" value="" style="width:90%" tabindex="'+((i+1)+50)+'" />';
   this.getEl("div_body").appendChild(this.arrTopDiv[i]);  
   this.getEl("div_body").appendChild(this.arrBotDiv[i]);
   this.getEl("div_body").appendChild(this.arrGoDiv[i]);  
   
     
   this.arrVerDiv[i] = this.getDiv("1px", this.nHeight+"px", "#bbbbbb");
        
   this.arrVerDiv[i].style.left = ( (i*this.nWidth)+parseInt(this.nWidth/2) )+"px";
   this.arrVerDiv[i].style.top = "100px";
        
   this.getEl("div_body").appendChild(this.arrVerDiv[i]); 
        
  }
  
  this.getEl("div_step1").style.display = "none";
  this.getEl("div_step2").style.display = "";  
  
 }
 ,create : function(){ //사다리 생성
    
  for(var i=0; i<this.nNum; i++){
   
   this.arrTopDiv[i].innerHTML = (i+1)+"<br>"+this.getEl("inp_top_"+i).value;
   this.arrBotDiv[i].innerHTML = this.getEl("inp_bot_"+i).value;
   this.arrGoDiv[i].innerHTML = '<input type="button" class="goBtn" value="Start" onClick="Yl.start('+i+')">';
      
   this.arrTopDiv[i].style.overflow = "auto";
   this.arrBotDiv[i].style.overflow = "auto";
        
   this.arrIng[i] = false;
           
   this.arrMDiv[i] = [];   
  }
      
  for(var i=0; i<(this.nNum*7); i++){
   
   var nLen = this.arrHorDiv.length;
   
   this.arrHorDiv[nLen] = this.getDiv(this.nWidth+"px","1px", "#aaaaaa");
   var nRndLeft = (parseInt(Math.random()*(this.nNum-1))*this.nWidth)+parseInt(this.nWidth/2);
   var nRndTop = this.getRndTop();
            
   this.arrHorDiv[nLen].style.left = nRndLeft+"px";
   this.arrHorDiv[nLen].style.top = nRndTop+"px";
       
   this.getEl("div_body").appendChild(this.arrHorDiv[nLen]);    
  }
  
  this.getEl("div_step2").innerHTML = "Start 버튼을 눌러 주세요.";
  
 }
 ,sRndTop : ""
 ,getRndTop : function(){
  var nRnd = parseInt(Math.random()*(this.nHeight-100))+150; 
  
  if( this.sRndTop.indexOf( "["+nRnd+"]" ) < 0 ){
   this.sRndTop += "["+nRnd+"]";
   return nRnd;
  }else{
   return this.getRndTop();   
  }
 } 
 ,start : function( no ){
  
  if( this.arrIng[no] ){
   for(var i=0; i<this.arrMDiv.length; i++){
    for(var j=0; j<this.arrMDiv[i].length; j++){
     this.arrMovDiv[this.arrMDiv[i][j]].style.backgroundColor = "#CCCCCC"; 
     this.arrMovDiv[this.arrMDiv[i][j]].style.zIndex = 1;
    }
    
   }
   for(var i=0; i<this.arrMDiv[no].length; i++){
    this.arrMovDiv[this.arrMDiv[no][i]].style.backgroundColor = "#2860E1";
    this.arrMovDiv[this.arrMDiv[no][i]].style.zIndex = 2;
   }
  }else{
               
   var nSx = parseInt(this.arrVerDiv[no].style.left);
   var nSy = parseInt(this.arrVerDiv[no].style.top);
   
   this.moveStart("y", no, nSx, nSy);
   
   this.arrIng[no] = true; //진행
  }
 
 }
 ,moveStart : function(sXy, pno, nSx, nSy){
    
  var nLen = this.arrMovDiv.length;
  
  this.arrMovDiv[nLen] = this.getDiv("2px","2px", this.arrColor[pno]);
  
  this.arrMDiv[pno].push(nLen);
    
  this.getEl("div_body").appendChild(this.arrMovDiv[nLen]);  
  
  this.arrMovDiv[nLen].style.left = nSx+"px";
  this.arrMovDiv[nLen].style.top = nSy+"px";
  
  this.arrMovDiv[nLen].style.zIndex = 3;
  
  
  var nEx = nSx;
  var nEy = nSy;
  if(sXy=="y") nEy = this.nHeight+100;
        
  var bCk = false;
  
  for(var i=0; i<this.arrHorDiv.length; i++){
   
   var nx = parseInt(this.arrHorDiv[i].style.left);
   var ny = parseInt(this.arrHorDiv[i].style.top);  
   var nw = parseInt(this.arrHorDiv[i].style.width);
   var nh = parseInt(this.arrHorDiv[i].style.height);
   
   if(sXy=="x"){
    if( ny == nSy ){
     if( nx==nSx ){
      nEx = nx+nw;
      break;
     }else if( (nx+nw)==nSx ){
      nEx = nx;
      break;
     }     
    }
   }else{
    
    //반복하면서 큰것중에서 제일 작은것으로        
    if( ny>nSy ){
     if( nx==nEx || (nx+nw)==nEx ){
            
      if(bCk){
       if(ny<nEy) nEy = ny;
      }else
       nEy = ny; 
       
      bCk = true; 
     } 
    }
   }
  }
  
  this.move(nLen, pno, nSx, nSy, nEx, nEy);     
 }
 ,nSpeed : 10
 ,move : function(no, pno, nSx, nSy, nEx, nEy){
  var nx = parseInt(this.arrMovDiv[no].style.left);
  var ny = parseInt(this.arrMovDiv[no].style.top);  
  var nw = parseInt(this.arrMovDiv[no].style.width);
  var nh = parseInt(this.arrMovDiv[no].style.height);
  
  var np;
  var bIng = true;
  
  var sXy = "";
  
  if( nSx != nEx ){
   np = nw+this.nSpeed;
   if(nEx<nSx){
    if( (nSx-np) <= nEx ){
     bIng = false;
     np = nSx-nEx;
    }   
    this.arrMovDiv[no].style.left = (nSx-np)+"px"; 
   }else{
    if( (nSx+np) >= nEx ){
     bIng = false;
     np = nEx-nSx;
    }       
   }
   
   this.arrMovDiv[no].style.height = "4px";
   this.arrMovDiv[no].style.width = np+"px"; 
   
   sXy = "x";
  }else{
    
   np = nh+this.nSpeed;
   if( (nSy+np) >= nEy ){
    bIng = false;
    np = nEy-nSy;
   }
  
   this.arrMovDiv[no].style.width = "4px";   
   this.arrMovDiv[no].style.height = np+"px";   
   
   sXy = "y";
  }
    
  if(bIng){
        
   setTimeout("Yl.move("+no+","+pno+","+nSx+","+nSy+","+nEx+","+nEy+")", 1);
   
  }else{
   
   if((sXy=="x")) this.arrMovDiv[no].style.height = "2px";
   else this.arrMovDiv[no].style.width = "2px";
   
   if( nEy<this.nHeight+100 ){
    this.moveStart((sXy=="x")?"y":"x", pno, nEx, nEy);
   }else{
    
    for(var i=0; i<this.arrVerDiv.length; i++){
     if(nEx==parseInt(this.arrVerDiv[i].style.left)){      
      
      this.arrBotDiv[i].innerHTML = "<b>"+(pno+1)+"</b><br>"+this.arrBotDiv[i].innerHTML;
            
      this.arrGoDiv[pno].innerHTML = '<input type="button" value="Check" class="goBtn" onClick="Yl.start('+pno+')">';
      
      break;
     }
    }  
   }
  }
 }
};
//F5 새로고침 막기
 document.onkeydown = function(e){
 if(!e) e = window.event;
 if (e.keyCode == 116){
  if( confirm("새로 고침 하시겠습니까?") ){
  }else{
   e.keyCode = 0;
   return false;
  }
 }
} 
</script>
<style>
	.join-form-area{padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
	.inp_bot{background: #F3F3F3; border-radius:6px; height:35px;  border-bottom:none !important;}
	.goBtn{width:100px; border-radius:6px; padding:0px !important;  height:35px; color:gray;  border-bottom:none !important;}
	.goBtn:hover{width:100px; border-radius:6px; background:#FBD14B; padding:0px !important;  height:35px; color:gray;  border-bottom:none !important;}
	.game-area{	}
	.startBtn{ display:inline-block; border-radius:6px; margin:10px 0px 10px 0px; background:#FBD14B; border:none; color:white; font-size:15px;}
	#div_step2{margin-bottom:10px; color:gray;}
	#div_step1{color:gray;}
	#sel_num{width:50px; height:35px; border-radius:6px; color:gray;}
	.noBottom{border:none !important;}
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
			<jsp:include page="../common/groupNoticeHeader.jsp"/>
		<div class="game-area">
	  <div id="div_step1" style="font-size:12px;">
 
인원 &nbsp;
<select id="sel_num">
 <option value="2">2</option>
 <option value="3">3</option>
 <option value="4">4</option>
 <option value="5" selected >5</option>
 <option value="6">6</option>
 <option value="7">7</option>
 <option value="8">8</option>
 <option value="9">9</option>
 <option value="10">10</option>
 <option value="11">11</option>
 <option value="12">12</option>
 <option value="13">13</option>
 <option value="14">14</option>
 <option value="15">15</option>
 <option value="16">16</option>
 <option value="17">17</option>
 <option value="18">18</option>
 <option value="19">19</option>
 <option value="20">20</option>
</select>
<br> 
<input type="button" value="Create" class="startBtn" onclick="Yl.init();">
</div>

<div id="div_step2" style="font-size:12px;display:none;">
 입력 후 'Start'을 눌러주세요 <br>
<input type="button" class="startBtn" value="Start" onclick="Yl.create();">

</div>
 
<div id="div_body" style="width:1000px;height:450px; background:white; border-radius:6px;position:relative;"></div>
    </div>
   </div>
   
     <jsp:include page="../common/footer.jsp"/>	 
</body>
</html>